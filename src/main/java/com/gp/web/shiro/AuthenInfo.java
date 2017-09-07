
package com.gp.web.shiro;

import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.gp.common.GPrincipal;
/**
 * @author despird 2014-02-01
 * @version V0.1
 * */
public class AuthenInfo extends SimpleAuthenticationInfo {
    
	public static Logger logger = LoggerFactory.getLogger(AuthenInfo.class);

	private static final long serialVersionUID = -7397719890579595466L;

	public AuthenInfo(GPrincipal principal,String credential, String realmName){
				
		super(principal,credential,realmName);
		
		logger.debug("Entering autheninfo constructor...");
	}

}