package com.gp.core;

import com.gp.audit.AccessPoint;
import com.gp.common.Operations;
import com.gp.common.Principal;
import com.gp.common.ServiceContext;
import com.gp.dao.info.PostInfo;
import com.gp.exception.ServiceException;
import com.gp.info.CombineInfo;
import com.gp.info.InfoId;
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

    @Autowired
    public PostFacade(PostService postservice){

        PostFacade.postservice = postservice;
    }

    /**
     * Find the personal post
     **/
    public static List<CombineInfo<PostInfo, PostExt>>  findPersonalPosts(AccessPoint accesspoint,
                                                                          Principal principal,
                                                                          String state, String type, String scope){

        List<CombineInfo<PostInfo, PostExt>> result = new ArrayList<CombineInfo<PostInfo, PostExt>>();

        try(ServiceContext svcctx = ContextHelper.beginServiceContext(principal, accesspoint,
                Operations.FIND_TAGS)){

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
    public static List<PostInfo> findWorkgroupPosts(AccessPoint accesspoint,
                                                    Principal principal,
                                                    InfoId<Long> wid,
                                                    String state, String type, String scope){

        List<CombineInfo<PostInfo, PostExt>> result = new ArrayList<CombineInfo<PostInfo, PostExt>>();

        try(ServiceContext svcctx = ContextHelper.beginServiceContext(principal, accesspoint,
                Operations.FIND_TAGS)){

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
    public static List<PostInfo> findSquarePosts(AccessPoint accesspoint,
                                                    Principal principal,
                                                    String state, String type, String scope){

        List<CombineInfo<PostInfo, PostExt>> result = new ArrayList<CombineInfo<PostInfo, PostExt>>();

        try(ServiceContext svcctx = ContextHelper.beginServiceContext(principal, accesspoint,
                Operations.FIND_TAGS)){

            result = postservice.getSquarePosts(svcctx, state, type, scope);

        } catch (ServiceException e)  {

            ContextHelper.stampContext(e,"excp.find.square.posts");

        }finally{

            ContextHelper.handleContext();
        }

        return result;
    }
}
