package com.gp.core;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.gp.audit.AccessPoint;
import com.gp.common.Operations;
import com.gp.common.Principal;
import com.gp.common.ServiceContext;
import com.gp.exception.CoreException;
import com.gp.exception.ServiceException;
import com.gp.info.InfoId;
import com.gp.info.KVPair;
import com.gp.info.MessageInfo;
import com.gp.info.TaskInfo;
import com.gp.info.UserInfo;
import com.gp.pagination.PageWrapper;
import com.gp.svc.SecurityService;
import com.gp.svc.TaskService;

@Component
public class PersonalFacade {

	private static TaskService taskservice;
	private static SecurityService securityservice;
	
	@Autowired
	public PersonalFacade(SecurityService securityservice, TaskService taskservice){
		
		PersonalFacade.taskservice = taskservice;
		PersonalFacade.securityservice = securityservice;
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
}
