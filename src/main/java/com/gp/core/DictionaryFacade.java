package com.gp.core;

import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.gp.info.DictionaryInfo;
import com.gp.svc.DictionaryService;

@Component
public class DictionaryFacade {

	static DictionaryService dictservice;
	
	@Autowired
	private DictionaryFacade(DictionaryService dictservice){

		MasterFacade.dictservice = dictservice;
	}
	
	public static String findDictEntry(String key, Locale locale){
		return key;
		
		
	}
}
