package com.gp.web.workgroup;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.collections.keyvalue.DefaultKeyValue;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.gp.util.DateTimeUtils;
import com.gp.web.ActionResult;
import com.gp.web.BaseController;
import com.gp.web.model.CabinetItem;
import com.gp.web.model.ItemStat;
import com.gp.web.model.Tag;
import com.gp.web.model.Version;
/**
 * This controller wrap the operation on cabinet and repository 
 **/
@Controller("wg-cabinet-ctrl")
@RequestMapping("/workgroup")
public class CabinetController extends BaseController{
	
	@RequestMapping("publishes")
	public ModelAndView doPubInitial(){
		
		return getJspModelView("workgroup/publishes");
	}
	
	@RequestMapping("netdisks")
	public ModelAndView doPriInitial(){
		
		return getJspModelView("workgroup/netdisks");
	}	
	
	@RequestMapping("netdisk-pub-content")
	public ModelAndView doPubContent(){
		
		String cabinetId = super.readRequestParam("cabinet_id");
		String folderId = super.readRequestParam("folder_id");
		
		ModelAndView jmav = super.getJsonModelView();
		List<CabinetItem> clist = new ArrayList<CabinetItem>();
		
		for(int i =0; i<3; i++){
			CabinetItem item = new CabinetItem();
			Long daytime = 24*60*60*1000l;
			Long currtime =(long)((1- Math.random())*daytime);
			
			item.setTimeElapse(DateTimeUtils.toDuration(currtime));
			
			item.setAccount("account1");
			item.setDescription("this is a demo description");
			item.setExternalOwned(false);
			item.setItemId(23456);
			item.setItemName("this demo ");
			item.setItemType("folder");
			
			ItemStat substat = new ItemStat();
			substat.setStatTooltip("15 files, 60M");
			substat.setStatText("15");			
			item.setChildStat(substat);
			
			ItemStat favstat = new ItemStat();
			favstat.setStatTooltip("3 People favorite this ");
			favstat.setStatText("2");			
			item.setFavoriteStat(favstat);
			
			ItemStat verstat = new ItemStat();
			verstat.setStatTooltip("Current version is 1.3");
			verstat.setStatText("1.3");			
			item.setVersionStat(verstat);
			List<Version> vlist = new ArrayList<Version> ();
			for(int v = 1; v<4; v++){
				Version ver = new Version();
				ver.setAuthor("demo"+v);
				ver.setDescription("description demo string");
				ver.setVersion(v+".0");
				vlist.add(ver);
			}
			verstat.setStatData(vlist);
			
			ItemStat propstat = new ItemStat();
			propstat.setStatTooltip("Property Detail");		
			item.setPropStat(propstat);
			List<DefaultKeyValue> plist = new ArrayList<DefaultKeyValue> ();
			for(int p = 0; p < 4; p++){
				
				DefaultKeyValue dkv = new DefaultKeyValue();
				dkv.setKey("key"+p);
				dkv.setValue("value"+p);
				plist.add(dkv);
			}
			propstat.setStatData(plist);
			
			List<Tag> tlist = new ArrayList<Tag>();
			for(int t=0; t<4; t++){
				Tag tag = new Tag();
				tag.setTagName("文化"+t);
				tag.setTagColor("blue");
				tlist.add(tag);
			}
			item.setTaglist(tlist);
			item.setHasTag(true);
			clist.add(item);
		}
		
		for(int i =0; i<3; i++){
			CabinetItem item = new CabinetItem();
			Long daytime = 24*60*60*1000l;
			Long currtime =(long)((1- Math.random())*daytime);
			
			item.setTimeElapse(DateTimeUtils.toDuration(currtime));
			
			item.setAccount("account1");
			item.setDescription("this is a demo description");
			item.setExternalOwned(false);
			item.setItemId(23456);
			item.setItemName("this demo ");
			item.setItemType("file");
			
			clist.add(item);
		}
		
		jmav.addObject(MODEL_KEY_ROWS, clist);
		jmav.addObject(MODEL_KEY_MESSAGE, "success load");
		jmav.addObject(MODEL_KEY_STATE, ActionResult.SUCCESS);
		return jmav;
	}
}
