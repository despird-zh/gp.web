package com.gp.core;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.gp.audit.AccessPoint;
import com.gp.common.GroupUsers;
import com.gp.common.IdKey;
import com.gp.common.Operations;
import com.gp.common.Principal;
import com.gp.common.ServiceContext;
import com.gp.exception.CoreException;
import com.gp.exception.ServiceException;
import com.gp.info.GroupMemberInfo;
import com.gp.info.InfoId;
import com.gp.info.MessageInfo;
import com.gp.info.OrgHierInfo;
import com.gp.info.TaskInfo;
import com.gp.info.UserInfo;
import com.gp.info.UserSumInfo;
import com.gp.info.WorkgroupInfo;
import com.gp.pagination.PageWrapper;
import com.gp.svc.PersonalService;
import com.gp.svc.SecurityService;
import com.gp.svc.TaskService;

@Component
public class PersonalFacade {

	private static TaskService taskservice;
	
	private static SecurityService securityservice;
	
	private static PersonalService personalservice;
	
	@Autowired
	public PersonalFacade(SecurityService securityservice, 
			TaskService taskservice,
			PersonalService personalservice){
		
		PersonalFacade.taskservice = taskservice;
		PersonalFacade.securityservice = securityservice;
		PersonalFacade.personalservice = personalservice;
	}
	
	/**
	 * find the messages sent to account
	 * 
	 * @param account the account to receive the messages
	 * 
	 **/
	public PageWrapper<MessageInfo> findMessages(ServiceContext svcctx, String account){
		return null;
	}
	
	/**
	 * find the notifications sent to account
	 * 
	 * @param account the account to receive the notifications
	 * 
	 **/
	public PageWrapper<MessageInfo> findNotifications(ServiceContext svcctx, String account){
		return null;
		
	}
	
	/**
	 * find the tasks sent to account
	 * 
	 * @param account the account to receive the tasks
	 * 
	 **/
	public PageWrapper<TaskInfo> findTasks(ServiceContext svcctx, String account){
		return null;
		
	}
	
	/**
	 * find the account basic setting
	 * @param userId the user id 
	 **/
	public static UserInfo findAccountBasic(AccessPoint accesspoint, 
			Principal principal,
			InfoId<Long> userId) throws CoreException{
		
		UserInfo uinfo = null;
		try (ServiceContext svcctx = ContextHelper.beginServiceContext(principal, accesspoint,
				Operations.FIND_ACCOUNT)){
			
			svcctx.setAuditObject(userId);
			
			uinfo = securityservice.getAccountLite(svcctx, userId, null, null);
			
		} catch (ServiceException e) {
			
			ContextHelper.stampContext(e, "excp.find.account");
		}finally{
			
			ContextHelper.handleContext();
		}
		return uinfo;
	}
	
	/**
	 * find all the workgroups that the user joins
	 * 
	 * @param account the account of user
	 **/
	public static List<WorkgroupInfo> findAccountWorkgroups(AccessPoint accesspoint, 
			Principal principal,
			String account)throws CoreException{
		
		List<WorkgroupInfo> result = null;
		 
		try (ServiceContext svcctx = ContextHelper.beginServiceContext(principal, accesspoint,
				Operations.FIND_WORKGROUPS)){
			
			List<GroupMemberInfo> mbrs = personalservice.getGroupMembers(svcctx, account, GroupUsers.GroupType.WORKGROUP_MBR.toString());
			InfoId<?>[] ids = new InfoId[mbrs.size()];
			int count = 0;
			for(GroupMemberInfo mbr : mbrs){
				
				ids[count] = IdKey.WORKGROUP.getInfoId(mbr.getManageId());
				count++;
			}
			
			if(ids.length > 0){
				result = personalservice.getWorkgroups(svcctx, ids);
			}else{
				result = new ArrayList<WorkgroupInfo>();
			}
		}catch (ServiceException e) {
			
			ContextHelper.stampContext(e, "excp.find.belongs");
		}finally{
			
			ContextHelper.handleContext();
		}
		
		return result;
	}
	
	/**
	 * find all the organization hierarchy that account join
	 * 
	 * @param account the account information 
	 **/
	public static List<OrgHierInfo> findUserOrgHierNodes(AccessPoint accesspoint, 
			Principal principal,
			String account)throws CoreException{
		
		List<OrgHierInfo> result = null;
		
		try (ServiceContext svcctx = ContextHelper.beginServiceContext(principal, accesspoint,
				Operations.FIND_ORGHIERS)){
			
			List<GroupMemberInfo> mbrs = personalservice.getGroupMembers(svcctx, account, GroupUsers.GroupType.ORG_HIER_MBR.toString());
			InfoId<?>[] ids = new InfoId[mbrs.size()];
			int count = 0;
			for(GroupMemberInfo mbr : mbrs){
				
				ids[count] = IdKey.ORG_HIER.getInfoId(mbr.getManageId());
				
				count++;
			}
			if(ids.length > 0){
				result = personalservice.getOrgHierNodes(svcctx, ids);
			}else{
				result = new ArrayList<OrgHierInfo>();
			}
		}catch (ServiceException e) {
			
			ContextHelper.stampContext(e, "excp.find.belongs");
		}finally{
			
			ContextHelper.handleContext();
		}
		
		return result;
	}
	
}
