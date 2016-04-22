package com.gp.web.model;

import java.util.List;

public class CabinetItem {
	
	private String itemName;
	
	private String timeElapse;
	
	private String itemType;
	
	private int itemId;
	
	private boolean externalOwned;
	
	private String account;
	
	private String description;
	
	private ItemStat childStat;
	
	private ItemStat favoriteStat;
	
	private ItemStat versionStat;
	
	private ItemStat detailStat;
	
	private ItemStat propStat;
	
	private List<Tag> taglist;
	
	private Boolean hasTag;
	
	public String getItemName() {
		return itemName;
	}

	public void setItemName(String itemName) {
		this.itemName = itemName;
	}

	public String getItemType() {
		return itemType;
	}

	public void setItemType(String itemType) {
		this.itemType = itemType;
	}

	public int getItemId() {
		return itemId;
	}

	public void setItemId(int itemId) {
		this.itemId = itemId;
	}

	public boolean isExternalOwned() {
		return externalOwned;
	}

	public void setExternalOwned(boolean externalOwned) {
		this.externalOwned = externalOwned;
	}

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getTimeElapse() {
		return timeElapse;
	}

	public void setTimeElapse(String timeElapse) {
		this.timeElapse = timeElapse;
	}

	public ItemStat getChildStat() {
		return childStat;
	}

	public void setChildStat(ItemStat childStat) {
		this.childStat = childStat;
	}

	public ItemStat getFavoriteStat() {
		return favoriteStat;
	}

	public void setFavoriteStat(ItemStat favoriteStat) {
		this.favoriteStat = favoriteStat;
	}

	public ItemStat getVersionStat() {
		return versionStat;
	}

	public void setVersionStat(ItemStat versionStat) {
		this.versionStat = versionStat;
	}

	public ItemStat getDetailStat() {
		return detailStat;
	}

	public void setDetailStat(ItemStat detailStat) {
		this.detailStat = detailStat;
	}

	public ItemStat getPropStat() {
		return propStat;
	}

	public void setPropStat(ItemStat propStat) {
		this.propStat = propStat;
	}

	public List<Tag> getTaglist() {
		return taglist;
	}

	public void setTaglist(List<Tag> taglist) {
		this.taglist = taglist;
	}

	public Boolean getHasTag() {
		return hasTag;
	}

	public void setHasTag(Boolean hasTag) {
		this.hasTag = hasTag;
	}

}
