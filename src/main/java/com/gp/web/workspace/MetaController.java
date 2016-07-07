package com.gp.web.workspace;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.gp.audit.AccessPoint;
import com.gp.common.GeneralConfig;
import com.gp.common.Principal;
import com.gp.common.SystemOptions;
import com.gp.core.MeasureFacade;
import com.gp.core.OrgHierFacade;
import com.gp.core.PersonalFacade;
import com.gp.core.SecurityFacade;
import com.gp.exception.CoreException;
import com.gp.info.CombineInfo;
import com.gp.info.OrgHierInfo;
import com.gp.info.UserInfo;
import com.gp.info.UserSumInfo;
import com.gp.svc.info.UserExt;
import com.gp.web.ActionResult;
import com.gp.web.BaseController;
import com.gp.web.model.TreeNode;
import com.gp.web.model.UserMetaSummary;

@Controller("ws-meta-ctrl")
@RequestMapping("/workspace")
public class MetaController extends BaseController{

	static Logger LOGGER = LoggerFactory.getLogger(MetaController.class);
	
	static String imagePath = GeneralConfig.getString(SystemOptions.IMAGE_CACHE_PATH);
	
	
	@RequestMapping("meta-sum")
	public ModelAndView doMetaSummarySearch(HttpServletRequest request){
		
		ModelAndView mav = super.getJsonModelView();
		ActionResult result = new ActionResult();
		
		Principal principal = super.getPrincipalFromShiro();
		AccessPoint accesspoint = super.getAccessPoint(request);
		
		try{
			UserMetaSummary meta = new UserMetaSummary();
			// find user summary information
			UserSumInfo usum = MeasureFacade.findPersonalSummary(accesspoint, principal, principal.getAccount());
			if(null != usum){
				
				meta.setFileSum(usum.getFileSummary());
				meta.setPostSum(usum.getPostSummary());
				meta.setShareSum(usum.getShareSummary());
				meta.setTaskSum(usum.getTaskSummary());
				
			}
			// find user information and extension data
			CombineInfo<UserInfo, UserExt> cmbinfo = SecurityFacade.findAccount(accesspoint, principal, null, principal.getAccount(), null);
			meta.setName(cmbinfo.getPrimary().getFullName());
			meta.setSourceId(cmbinfo.getPrimary().getSourceId());
			meta.setSourceName(cmbinfo.getExtended().getSourceName());
			meta.setSourceShort(cmbinfo.getExtended().getShortName());
			
			List<OrgHierInfo> belongs = PersonalFacade.findUserOrgHierNodes(accesspoint, principal, principal.getAccount());
			
			TreeNode[][] routes = new TreeNode[belongs.size()][];
			int cnt = 0;
			for(OrgHierInfo belong: belongs){
				
				List<OrgHierInfo> orglist = OrgHierFacade.findRouteOrgHiers(accesspoint, principal, belong.getInfoId());
				TreeNode[] nodes = new TreeNode[orglist.size()];
				for(int i = 0 ; i<orglist.size(); i ++){
					OrgHierInfo oinfo = orglist.get(i);
					TreeNode node = new TreeNode();
					node.setId(String.valueOf(oinfo.getInfoId().getId()));
					node.setPid(String.valueOf(oinfo.getParentOrg()));
					node.setName(oinfo.getOrgName());
					nodes[i] = node;
				}
				routes[cnt] = nodes;
				cnt ++;
			}
			
			meta.setTreeNodes(routes);
			
			result.setData(meta);
			result.setState(ActionResult.SUCCESS);
			result.setMessage(getMessage("mesg.find.personal.meta"));
			
		}catch(CoreException ce){
			
			result.setState(ActionResult.FAIL);
			result.setMessage(ce.getMessage());
		}
		
		mav.addAllObjects(result.asMap());
		return mav;
		
	}
}