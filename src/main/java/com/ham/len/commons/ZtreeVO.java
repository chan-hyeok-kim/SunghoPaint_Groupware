package com.ham.len.commons;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ZtreeVO {

	private String name;
	private String id;
	private String pId;
	private String content;
	private String dept;
	private String rank;
	private String empId;
	
	//for UpDocumentTree
	private String upCodeName;
	private String codeName;
	private String cd;
	private Long num;
	private Long no;
	private Long refNo;
	private String approvalForm;
	
	private String icon;
	
	
}
