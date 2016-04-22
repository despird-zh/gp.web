package gp.core;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.AbstractJUnit4SpringContextTests;

import com.gp.audit.AccessPoint;
import com.gp.common.Principal;
import com.gp.common.Users;
import com.gp.core.SecurityFacade;
import com.gp.info.UserInfo;
import com.gp.svc.SystemService;

@ContextConfiguration(locations = "/mysql-test.xml")
public class SecurityFacadeTest  extends AbstractJUnit4SpringContextTests{
	
	@Autowired
	SystemService systemservice;
	
	@Test
	public void createAdmin(){
		systemservice.hashCode();
		AccessPoint ap = new AccessPoint(
				"pc",
				"127.0.0.1",
				"web",
				"0.1");
		Principal principal = Users.PESUOD_USER;
		
		UserInfo admin = new UserInfo();
		admin.setAccount("admin");
		admin.setEmail("admin@cnet.com");
		admin.setFullName("Administrator");
		admin.setLanguage("en_US");
		admin.setTimeZone("GMT+08:00");
		admin.setPassword("1");
		admin.setMobile("18601253554");
		admin.setPhone("52436454");
		admin.setType(Users.UserType.INLINE.name());
		admin.setState(Users.UserState.ACTIVE.name());
		
		SecurityFacade.newAccount(ap, principal, admin, null, null);
		
	}
}
