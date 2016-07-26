package com.gp.core;

import com.gp.audit.AccessPoint;
import com.gp.common.Principal;
import com.gp.dao.info.PostInfo;
import com.gp.info.InfoId;
import com.gp.svc.PostService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * Created by garydiao on 7/22/16.
 */
@Component
public class PostFacade {

    private static PostService postService;

    @Autowired
    public PostFacade(PostService postsvc){

        PostFacade.postService = postsvc;
    }

    public static List<PostInfo> findPersonalPosts(AccessPoint accesspoint,
                                                   Principal principal,
                                                   String state){

        return null;
    }

    public static List<PostInfo> findWorkgroupPosts(AccessPoint accesspoint,
                                                    Principal principal,
                                                    InfoId<Long> wid,
                                                    String state){
        return null;
    }
}
