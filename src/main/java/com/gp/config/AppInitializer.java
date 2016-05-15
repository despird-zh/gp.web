package com.gp.config;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.core.LoggerContext;
import org.springframework.web.WebApplicationInitializer;
import org.springframework.web.context.ContextLoaderListener;
import org.springframework.web.context.request.RequestContextListener;
import org.springframework.web.context.support.AnnotationConfigWebApplicationContext;
import org.springframework.web.filter.CharacterEncodingFilter;
import org.springframework.web.filter.DelegatingFilterProxy;
import org.springframework.web.servlet.DispatcherServlet;
import com.gp.web.CoreStarter;
import com.gp.web.servlet.AvatarServlet;
import com.gp.web.servlet.ImageFilter;
import com.gp.web.servlet.TransferServlet;

import java.io.File;

import javax.servlet.FilterRegistration;
import javax.servlet.MultipartConfigElement;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRegistration;


public class AppInitializer implements WebApplicationInitializer {

    @Override
    public void onStartup(ServletContext servletContext) throws ServletException {

        System.out.println("Initializing Application for " + servletContext.getServerInfo());
         
        String prefix =  servletContext.getRealPath("/");     
        String filepath = "WEB-INF"
        		+ System.getProperty("file.separator")
        		+ "classes"+System.getProperty("file.separator")
        		+ "log4j2.xml";
        
        final LoggerContext loggerCtx = (LoggerContext) LogManager.getContext(false);
        File file = new File(prefix + filepath);
        loggerCtx.setConfigLocation(file.toURI());
        
        AnnotationConfigWebApplicationContext rootContext = new AnnotationConfigWebApplicationContext();
        rootContext.register(RootConfigurator.class);
        rootContext.register(ServiceConfigurator.class);
        // since we registered RootConfig instead of passing it to the constructor
        rootContext.refresh(); 
        // Manage the lifecycle of the root appcontext
        servletContext.addListener(new ContextLoaderListener(rootContext));
        
        servletContext.addListener(new CoreStarter());        
        servletContext.addListener(new RequestContextListener());

        FilterRegistration.Dynamic fr = servletContext.addFilter("encodingFilter",  
        	      new CharacterEncodingFilter());
        	   fr.setInitParameter("encoding", "UTF-8");
        	   fr.setInitParameter("forceEncoding", "true");
        	   fr.addMappingForUrlPatterns(null, true, "/*");
        	   
        FilterRegistration.Dynamic fr1 = servletContext.addFilter("shiroFilter",  
         	      new DelegatingFilterProxy());
         	   fr1.setInitParameter("targetFilterLifecycle", "true");
         	   fr1.addMappingForUrlPatterns(null, true, "/*"); 
        
        FilterRegistration.Dynamic fr2 = servletContext.addFilter("GroupressImageFilter",  
              	      new ImageFilter());
              	   fr2.addMappingForUrlPatterns(null, true, "/img_cache/*"); 
              	   
        // Create ApplicationContext
        AnnotationConfigWebApplicationContext webMvcContext = new AnnotationConfigWebApplicationContext();
        webMvcContext.register(WebMvcConfigurator.class);
               
        // Add the servlet mapping manually and make it initialize automatically
        DispatcherServlet dispatcherServlet = new DispatcherServlet(webMvcContext);
        ServletRegistration.Dynamic servlet = servletContext.addServlet("Groupress", dispatcherServlet);
        servlet.setInitParameter("throwExceptionIfNoHandlerFound", "true");
        servlet.addMapping("*.do");
        servlet.setAsyncSupported(true);
        servlet.setLoadOnStartup(1);
        
        // Add the servlet mapping manually and make it initialize automatically
        TransferServlet transferServlet = new TransferServlet();
        ServletRegistration.Dynamic servlet1 = servletContext.addServlet("TransferServlet", transferServlet);
        
        servlet1.setInitParameter("upload_path", "d:\\");
        servlet1.addMapping("/transfer");
        servlet1.setAsyncSupported(true);
        servlet1.setMultipartConfig( getMultiPartConfig() );
        servlet1.setLoadOnStartup(2);
        
        AvatarServlet avatarServlet = new AvatarServlet();
        ServletRegistration.Dynamic servlet2 = servletContext.addServlet("AvatarServlet", avatarServlet);
        servlet2.addMapping("/avatar");
        servlet2.setAsyncSupported(true);
        servlet2.setLoadOnStartup(3);
        
    }
    
    private MultipartConfigElement getMultiPartConfig() {
        String location = "";
        long maxFileSize = -1;
        long maxRequestSize = -1;
        int fileSizeThreshold = 0;
        return new MultipartConfigElement(
            location,
            maxFileSize,
            maxRequestSize,
            fileSizeThreshold
        );
    }
}