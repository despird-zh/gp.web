package com.gp.core;

import com.gp.audit.AccessPoint;
import com.gp.common.IdKey;
import com.gp.common.Operations;
import com.gp.common.Principal;
import com.gp.common.ServiceContext;
import com.gp.dao.info.PostInfo;
import com.gp.exception.CoreException;
import com.gp.exception.ServiceException;
import com.gp.info.CombineInfo;
import com.gp.info.InfoId;
import com.gp.svc.CommonService;
import com.gp.svc.PostService;
import com.gp.svc.info.PostExt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

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
                                                                          String state, String type, String scope){

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
                                                    String state, String type, String scope){

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
                                                    String state, String type, String scope){

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
    */
    public static boolean newPost(AccessPoint accesspoint,
                                  Principal principal,
                                  PostInfo postinfo, String ... attendees) throws CoreException{
        boolean result = false;

        if(!InfoId.isValid(postinfo.getInfoId())){

            InfoId<Long> pid = idservice.generateId(IdKey.POST, Long.class);
            postinfo.setInfoId(pid);
        }

        try(ServiceContext svcctx = ContextHelper.beginServiceContext(principal, accesspoint,
                Operations.NEW_POST)){

            svcctx.setTraceInfo(postinfo);
            result = postservice.newPost(svcctx, postinfo, attendees);

        }catch (ServiceException e)  {

            ContextHelper.stampContext(e,"excp.find.square.posts");

        }finally{

            ContextHelper.handleContext();
        }

        return result;
    }
}
