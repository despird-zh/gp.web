package com.gp.core;

import com.gp.audit.AccessPoint;
import com.gp.common.*;
import com.gp.dao.info.PostInfo;
import com.gp.exception.CoreException;
import com.gp.exception.ServiceException;
import com.gp.info.CombineInfo;
import com.gp.info.InfoId;
import com.gp.svc.CommonService;
import com.gp.svc.PostService;
import com.gp.svc.info.PostExt;
import com.gp.validate.ValidateMessage;
import com.gp.validate.ValidateUtils;
import org.apache.commons.collections.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

/**
 * Created by garydiao on 7/22/16.
 */
@Component
public class PostFacade {

    private static PostService postservice;

    private static CommonService idservice;

    @Autowired
    public PostFacade(PostService postservice, CommonService idservice){

        PostFacade.postservice = postservice;
        PostFacade.idservice = idservice;
    }

    /**
     * Find the personal post
     **/
    public static List<CombineInfo<PostInfo, PostExt>>  findPersonalPosts(AccessPoint accesspoint,
                                                                          Principal principal,
                                                                          String state, String type, String scope)throws CoreException{

        List<CombineInfo<PostInfo, PostExt>> result = new ArrayList<CombineInfo<PostInfo, PostExt>>();

        try(ServiceContext svcctx = ContextHelper.beginServiceContext(principal, accesspoint,
                Operations.FIND_POSTS)){

            result = postservice.getPersonalPosts(svcctx, principal.getAccount(), state, type, scope);

        } catch (ServiceException e)  {

            ContextHelper.stampContext(e,"excp.find.personal.posts");

        }finally{

            ContextHelper.handleContext();
        }
        return result;
    }

    /**
     * find the work group posts
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
     */
    public static boolean newPost(AccessPoint accesspoint,
                                  Principal principal,
                                  PostInfo postinfo, String ... attendees) throws CoreException{
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

        }catch (ServiceException e)  {

            ContextHelper.stampContext(e,"excp.save.post");

        }finally{

            ContextHelper.handleContext();
        }

        return result;
    }


}
