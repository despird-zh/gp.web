package com.gp.web;

import java.text.MessageFormat;
import java.util.Locale;

import org.apache.commons.lang.StringUtils;
import org.springframework.context.ResourceLoaderAware;
import org.springframework.context.support.AbstractMessageSource;
import org.springframework.core.io.DefaultResourceLoader;
import org.springframework.core.io.ResourceLoader;

import com.gp.common.SpringContextUtil;
import com.gp.svc.DictionaryService;

public class DatabaseMessageSource extends AbstractMessageSource implements ResourceLoaderAware{

	@SuppressWarnings("unused")
	private ResourceLoader resourceLoader;
	// hold the dictionary service 
	private static DictionaryService dictservice;
	
	@Override
	public void setResourceLoader(ResourceLoader resourceLoader) {
		this.resourceLoader = (resourceLoader != null ? resourceLoader : new DefaultResourceLoader());
	}

	@Override
	protected MessageFormat resolveCode(String code, Locale locale) {

		if(dictservice == null){
			// Fetch the spring dictionary service bean
			dictservice = SpringContextUtil.getSpringBean(DictionaryService.class);
		}
		String messagePattern = dictservice.getMessagePattern(locale, code);
		messagePattern = StringUtils.isBlank(messagePattern) ? code : messagePattern;
		
		MessageFormat result = createMessageFormat(messagePattern, locale);
		return result;
	}

}
