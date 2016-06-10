package com.gp.core;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.gp.common.ServiceContext;
import com.gp.info.MessageInfo;
import com.gp.info.TaskInfo;
import com.gp.pagination.PageWrapper;
import com.gp.svc.TaskService;

@Component
public class PersonalFacade {

	private static TaskService taskservice;
	
	@Autowired
	public PersonalFacade(TaskService taskservice){
		
		PersonalFacade.taskservice = taskservice;
		
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
}
