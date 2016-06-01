package com.gp.web.cabinet;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.gp.web.BaseController;

@Controller("cab-file-ext-ctrl")
@RequestMapping("/cabinet")
public class CabFileExtController extends BaseController{
	
	@RequestMapping("tag-search")
	public ModelAndView doTagSearch(HttpServletRequest request){
		return null;
		
	}
	
	@RequestMapping("tag-attach")
	public ModelAndView doTagAttach(HttpServletRequest request){
		return null;
		
	}
	
	@RequestMapping("tag-detach")
	public ModelAndView doTagDetach(HttpServletRequest request){
		return null;
		
	}
	
	@RequestMapping("file-version")
	public ModelAndView doVersionSearch(HttpServletRequest request){
		
		
		return null;
		
	}
}
