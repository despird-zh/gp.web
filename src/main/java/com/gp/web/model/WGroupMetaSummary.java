package com.gp.web.model;

public class WGroupMetaSummary {
	
	
	private Long workgroupId;
	
	private String workgroupName;
	
	private String state;
	
	private String admin;
	
	private String manager;
	
	private String managerName;
	
	private String adminName;
	
	private Long orgId;
	
	private String orgName;
	
	private String description;
	
	private Integer storageId;
	
	private String storageName;
	
	private boolean publishOn;
	
	private boolean netdiskOn;
	
	private Integer publishCapacity;
	
	private Integer netdiskCapacity;
	
	private boolean topicOn;
	
	private boolean shareOn;
	
	private boolean linkOn;
	
	private boolean taskOn;
	
	private float taskWeight;

	private String sinceDate;

	private String imagePath;
	
	private int fileSum ;
	
	private int subGroupSum;
	
	private int postSum;
	
	private int memberSum;
	
	private int extMemberSum;

	public int getFileSum() {
		return fileSum;
	}

	public void setFileSum(int fileSum) {
		this.fileSum = fileSum;
	}

	public int getSubGroupSum() {
		return subGroupSum;
	}

	public void setSubGroupSum(int subGroupSum) {
		this.subGroupSum = subGroupSum;
	}

	public int getPostSum() {
		return postSum;
	}

	public void setPostSum(int postSum) {
		this.postSum = postSum;
	}

	public int getMemberSum() {
		return memberSum;
	}

	public void setMemberSum(int memberSum) {
		this.memberSum = memberSum;
	}

	public int getExtMemberSum() {
		return extMemberSum;
	}

	public void setExtMemberSum(int extMemberSum) {
		this.extMemberSum = extMemberSum;
	}

	
}
