package com.gp.core;

import com.gp.audit.AccessPoint;
import com.gp.common.*;
import com.gp.dao.info.ImageInfo;
import com.gp.dao.info.PostCommentInfo;
import com.gp.dao.info.PostInfo;
import com.gp.dao.info.TagInfo;
import com.gp.exception.CoreException;
import com.gp.exception.ServiceException;
import com.gp.info.CombineInfo;
import com.gp.info.InfoId;
import com.gp.pagination.PageQuery;
import com.gp.pagination.PageWrapper;
import com.gp.svc.CommonService;
import com.gp.svc.ImageService;
import com.gp.svc.PostService;
import com.gp.svc.QuickFlowService;
import com.gp.svc.info.PostExt;
import com.gp.svc.info.UserLite;
import com.gp.util.ConfigSettingUtils;
import com.gp.validate.ValidateMessage;
import com.gp.validate.ValidateUtils;
import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.io.File;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Set;

/**
 * Created by garydiao on 7/22/16.
 */
@Component
public class PostFacade {

    static String CachePath = ConfigSettingUtils.getSystemOption(SystemOptions.FILE_CACHE_PATH);
    static String ImagePath = ConfigSettingUtils.getSystemOption(SystemOptions.IMAGE_CACHE_PATH);

    private static PostService postservice;

    private static CommonService idservice;

    private static ImageService imageservice;

    private static QuickFlowService quickflowservice;
    
    @Autowired
    public PostFacade(PostService postservice,
                      CommonService idservice,
                      ImageService imageservice,
                      QuickFlowService quickflowservice){

        PostFacade.postservice = postservice;
        PostFacade.idservice = idservice;
        PostFacade.imageservice = imageservice;
        PostFacade.quickflowservice = quickflowservice;
    }

    /**
     * Find the personal post
     *
     * @param state the state of search condition
     * @param type the type of search condition
     * @param scope the scope of search condition
     * @param pageQuery the page query condition
     **/
    public static PageWrapper<CombineInfo<PostInfo, PostExt>> findPersonalPosts(AccessPoint accesspoint,
                                                                                Principal principal,
                                                                                String state,
                                                                                String type,
                                                                                String scope,
                                                                                PageQuery pageQuery)throws CoreException{

        PageWrapper<CombineInfo<PostInfo, PostExt>> result = null;

        try(ServiceContext svcctx = ContextHelper.beginServiceContext(principal, accesspoint,
                Operations.FIND_POSTS)){

            result = postservice.getPersonalPosts(svcctx, principal.getAccount(), state, type, scope, pageQuery);

        } catch (ServiceException e)  {

            ContextHelper.stampContext(e,"excp.find.personal.posts");

        }finally{

            ContextHelper.handleContext();
        }
        return result;
    }

    
    /**
     * find the work group posts
     *
     * @param state the state of search condition
     * @param type the type of search condition
     * @param scope the scope of search condition
     **/
    public static List<CombineInfo<PostInfo, PostExt>> findWorkgroupPosts(AccessPoint accesspoint,
                                                    Principal principal,
                                                    InfoId<Long> wid,
                                                    String state, String type, String scope)throws CoreException{

        List<CombineInfo<PostInfo, PostExt>> result = new ArrayList<CombineInfo<PostInfo, PostExt>>();

        try(ServiceContext svcctx = ContextHelper.beginServiceContext(principal, accesspoint,
                Operations.FIND_POSTS)){

            result = postservice.getWorkgroupPosts(svcctx, wid, state, type, scope);

        } catch (ServiceException e)  {

            ContextHelper.stampContext(e,"excp.find.wgroup.posts");

        }finally{

            ContextHelper.handleContext();
        }

        return result;
    }

    /**
     * Find the square post
     *
     * @param state the state of search condition
     * @param type the type of search condition
     * @param scope the scope of search condition
     **/
    public static List<CombineInfo<PostInfo, PostExt>> findSquarePosts(AccessPoint accesspoint,
                                                    Principal principal,
                                                    String state, String type, String scope)throws CoreException{

        List<CombineInfo<PostInfo, PostExt>> result = new ArrayList<CombineInfo<PostInfo, PostExt>>();

        try(ServiceContext svcctx = ContextHelper.beginServiceContext(principal, accesspoint,
                Operations.FIND_POSTS)){

            result = postservice.getSquarePosts(svcctx, state, type, scope);

        } catch (ServiceException e)  {

            ContextHelper.stampContext(e,"excp.find.square.posts");

        }finally{

            ContextHelper.handleContext();
        }

        return result;
    }

    /**
     * create a new post
     *
     * @param postinfo the post information bean
     * @param images the images in post content
     * @param attendees the attendees who join post
     */
    public static boolean newPost(AccessPoint accesspoint,
                                  Principal principal,
                                  PostInfo postinfo,
                                  List<String> images,
                                  String ... attendees) throws CoreException{
        boolean result = false;

        // check the validation of user information
        Set<ValidateMessage> vmsg = ValidateUtils.validate(principal.getLocale(), postinfo);
        if(CollectionUtils.isNotEmpty(vmsg)){ // fail pass validation
            CoreException cexcp = new CoreException(principal.getLocale(), "excp.validate");
            cexcp.addValidateMessages(vmsg);
            throw cexcp;
        }

        if(GeneralConstants.PERSONAL_WORKGROUP == postinfo.getWorkgroupId()
          && Posts.Scope.WGROUP.name().equals(postinfo.getScope())){
            CoreException cexcp = new CoreException(principal.getLocale(), "excp.unsupport");
            cexcp.addValidateMessages(vmsg);
            throw cexcp;
        }

        try(ServiceContext svcctx = ContextHelper.beginServiceContext(principal, accesspoint,
                Operations.NEW_POST)){
            if(!InfoId.isValid(postinfo.getInfoId())){

                InfoId<Long> pid = idservice.generateId(IdKey.POST, Long.class);
                postinfo.setInfoId(pid);
            }

            svcctx.setTraceInfo(postinfo);
            result = postservice.newPost(svcctx, postinfo, attendees);
            // if exist images in post, here persist them into database.
            if(CollectionUtils.isNotEmpty(images)) {
                for (String imagename : images){

                    String imagePath = CachePath + File.separator + ImagePath + File.separator + imagename;
                    Long imgid = Images.parseImageId(imagename);
                    Date touchdate = Images.parseTouchDate(imagename);

                    ImageInfo image = new ImageInfo();

                    image.setInfoId(IdKey.IMAGE.getInfoId(imgid));
                    image.setDataFile(new File(imagePath));
                    image.setFormat(FilenameUtils.getExtension(imagename));
                    image.setModifyDate(touchdate);
                    image.setImageName(imagename);
                    image.setCategory(Images.Category.POST_IMAGE.name());
                    image.setPersist(Images.Persist.DATABASE.name());
                    image.setLink(imagename);

                    imageservice.newImage(svcctx, image);
                }
            }
        }catch (ServiceException e)  {

            ContextHelper.stampContext(e,"excp.save.post");

        }finally{

            ContextHelper.handleContext();
        }

        return result;
    }

    /**
     * Find the post comments according to the post id
     *
     * @param postid the id of post
     * @param owner the owner of post
     * @param state the state of post
     **/
    public static List<PostCommentInfo> findPostComments(AccessPoint accesspoint,
                                                         Principal principal,
                                                         InfoId<Long> postid,
                                                         String owner,
                                                         String state) throws CoreException{

        List<PostCommentInfo> result = new ArrayList<>();

        try(ServiceContext svcctx = ContextHelper.beginServiceContext(principal, accesspoint,
                Operations.FIND_COMMENTS)){

            result = postservice.getPostComments(svcctx, postid, owner, state);

        } catch (ServiceException e)  {

            ContextHelper.stampContext(e,"excp.find.comments");

        }finally{

            ContextHelper.handleContext();
        }

        return result;
    }

    /**
     * Add comment to post
     **/
    public static boolean addPostComment(AccessPoint accesspoint,
                                         Principal principal, PostCommentInfo comment) throws CoreException{

        // check the validation of user information
        Set<ValidateMessage> vmsg = ValidateUtils.validate(principal.getLocale(), comment);
        if(CollectionUtils.isNotEmpty(vmsg)){ // fail pass validation
            CoreException cexcp = new CoreException(principal.getLocale(), "excp.validate");
            cexcp.addValidateMessages(vmsg);
            throw cexcp;
        }
        
        
        try(ServiceContext svcctx = ContextHelper.beginServiceContext(principal, accesspoint,
                Operations.NEW_COMMENT)){
        	
        	if(!InfoId.isValid(comment.getInfoId())){
        		InfoId<Long> cid = idservice.generateId(IdKey.POST_COMMENT, Long.class);
        		comment.setInfoId(cid);
        	}
        	
            return postservice.newComment(svcctx, comment);

        } catch (ServiceException e)  {

            ContextHelper.stampContext(e,"excp.add.comment");

        }finally{

            ContextHelper.handleContext();
        }

        return false;
    }

    /**
     * Find the post attendee list
     **/
    public static List<UserLite> findPostAttendees(AccessPoint accesspoint,
                                                   Principal principal,
                                                   InfoId<Long> postid) throws CoreException{

        List<UserLite> result = null;

        try(ServiceContext svcctx = ContextHelper.beginServiceContext(principal, accesspoint,
                Operations.NEW_COMMENT)){

            result = postservice.getPostAttendees(svcctx, postid);

        } catch (ServiceException e)  {

            ContextHelper.stampContext(e,"excp.add.comment");

        }finally{

            ContextHelper.handleContext();
        }

        return result;
    }

    /**
     * like post
     **/
    public static boolean likePost(AccessPoint accesspoint,
                                   Principal principal,
                                   InfoId<Long> postid, String voter) throws CoreException{

        boolean result = false;
        try(ServiceContext svcctx = ContextHelper.beginServiceContext(principal, accesspoint,
                Operations.LIKE_POST)){

            result = postservice.addPostLike(svcctx, postid, voter);

        } catch (ServiceException e)  {

            ContextHelper.stampContext(e,"excp.like.post");

        }finally{

            ContextHelper.handleContext();
        }

        return result;

    }

    /**
     * dislike post
     **/
    public static boolean dislikePost(AccessPoint accesspoint,
                                   Principal principal,
                                   InfoId<Long> postid, String voter) throws CoreException{

        boolean result = false;
        try(ServiceContext svcctx = ContextHelper.beginServiceContext(principal, accesspoint,
                Operations.DISLIKE_POST)){

            result = postservice.addPostDislike(svcctx, postid, voter);

        } catch (ServiceException e)  {

            ContextHelper.stampContext(e,"excp.like.post");

        }finally{

            ContextHelper.handleContext();
        }

        return result;
    }
    
    public static void sendWorkgroupPostPublic(AccessPoint accesspoint,
            				Principal principal,
            				String descr, InfoId<Long> postId){
    	
    }
    
    public static void sendPersonalPostPublic(AccessPoint accesspoint,
			Principal principal,
			String descr, InfoId<Long> postId){

    }
}
