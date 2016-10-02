<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@include file="../common/taglibs.jsp" %>
<div gpid="meta-sum" class="clearfix">
    <input id="meta-wgroup-id" type="hidden" value="${wgroup_id}" />
    <div class="pull-left">
        <img alt="user image" src="${path_image}/user4-128x128.jpg" style="
        border-radius: 4px;cursor: pointer;height: 50px;width: 50px;padding: 5;">
    </div>     
    <div style="margin-left:60px;">
        <ul class="list-unstyled">
            <li>
                <h5 class="m-t-none m-b-xs">
                Nicole Pearson <label style="vertical-align:middle;font-size:60%;" class="label label-warning margin-r-5">项目经理</label>
                </h5>
            </li>
          <li class="text-muted" style="font-size:12px;">
             <div style="overflow: hidden;white-space: nowrap;text-overflow: ellipsis;">
                <strong><i class="fa fa-fw fa-home"></i></strong>康辉中国软件开发责任有限公司天涯
            </div>
          </li>
          <li class="text-muted" style="font-size:12px;">
            <div style="overflow: hidden;white-space: nowrap;text-overflow: ellipsis;">
                <strong><i class="fa fa-fw fa-plug"></i></strong>2016-1-2 12:23
            </div>
            </li>
        </ul>
    </div>
    <div>
        <hr class="m-t-xs m-b-xs">
        <ul class="list-inline text-center m-b-none">
            <li>
                <h5 class="m-t-none m-b-xs"><strong> 20,7K </strong></h5>                    
                <p class="m-b-none"><small>Documents</small></p>
            </li>
            <li>
                <h5 class="m-t-none m-b-xs"><strong> 300 </strong></h5>                    
                <p class="m-b-none"><small>Posts</small></p>
            </li>
            <li>
                <h5 class="m-t-none m-b-xs"><strong> 20 </strong></h5>                    
                <p class="m-b-none"><small>Groups</small></p>
            </li>
            <li>
                <h5 class="m-t-none m-b-xs"><strong> 123,4 </strong></h5>                    
                <p class="m-b-none"><small>Followers</small></p>
            </li>
        </ul>
    </div>
</div>
<hr class="m-b-xs m-t-xs">
<div gpid="meta-info">
    <ul class="list-inline m-b-none">
        <li>
            <a role="button" href="javascript:void(0);" gpid="wspace-follow" class="text-muted">
                <i class="fa fa-plug"></i> 加入
            </a>
        </li>
        <li>
            <a role="button" href="javascript:void(0);" gpid="wspace-follow" class="text-muted">
                <i class="fa fa-eye"></i> 关注
            </a>
        </li>
        <li>
            <a role="button" href="javascript:void(0);" gpid="wspace-show-more" class="text-muted">
                <i class="fa fa-angle-double-down"></i> 更多
            </a>
        </li>
    </ul>
    <div>
        <hr class="m-b-xs m-t-xs">
        <div>
            <i class="fa fa-book"></i>
            <span class="m-l-xs">描述信息</span>
        </div>
        <p gpid="wgroup-descr" class="text-muted">
            不走寻常路
        </p>
        <hr class="m-b-xs m-t-xs">
        <div>
            <i class="fa fa-map-marker"></i>
            <span class="m-l-xs">隶属组织</span>
        </div>
        <p gpid="wgroup-org-route" class="text-muted">信息部/开发组</p>
        <hr class="m-b-xs m-t-xs">
        <div>
            <i class="fa fa-tags"></i>
            <span class="m-l-xs">标签</span>
        </div>
        <p gpid="wgroup-tags" class="tags tag-xs m-b-none">
            <a title="" href="" class="tag-default tag-point-red">工具</a>
            <a title="" href="" class="tag-default tag-point-yellow ">专业</a>
            <a title="" href="" class="tag-default tag-point-green">电气</a>
            <a title="" href="" class="tag-default tag-point-blue">评分</a>
            <a title="" href="" class="tag-default  ">投票</a>
        </p>
    </div>
</div>