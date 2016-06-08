package com.gp.exception;

import java.text.MessageFormat;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;
import java.util.ResourceBundle;

import org.apache.commons.lang.StringUtils;
import com.gp.exception.BaseException;

public class CoreException extends BaseException{

	private static final long serialVersionUID = 1L;

	private static Map<Locale, ResourceBundle> core_bundles = new HashMap<Locale, ResourceBundle>();
	
	public CoreException(String errorcode,Object ...param){
		this(Locale.getDefault(),errorcode, param);
	}
	
    public CoreException(String errorcode, Throwable cause,Object ...param) {
        this(Locale.getDefault(), errorcode, cause, param);
    }
    
	public CoreException(Locale locale, String errorcode, Object... param) {
		super(errorcode, param);
		this.message = findMessage(locale,errorcode, param);
	}
	
    public CoreException(Locale locale, String errorcode, Throwable cause,Object ...param) {
        super(errorcode, cause);
        this.message = findMessage(locale,errorcode, param);
    }
    
    public CoreException(Throwable cause) {
        super(cause);
    }
    	
    @Override
	protected String findMessage(Locale locale, String errorcode,Object ... param){
		
		ResourceBundle rb = core_bundles.get(locale);
		if(rb == null){
			rb = loadResourceBundle(locale, CoreException.class);
			core_bundles.put(locale, rb);
		}
		String messagePattern =  (rb == null) ? errorcode : rb.getString(errorcode);
		if(StringUtils.isBlank(messagePattern)){
			return super.findMessage(locale, errorcode, param);
		}
		return MessageFormat.format(messagePattern, param);
	}

}
