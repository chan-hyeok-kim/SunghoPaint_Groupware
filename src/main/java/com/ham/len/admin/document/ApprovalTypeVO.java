package com.ham.len.admin.document;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ApprovalTypeVO {

	private Long approvalTypeNo;
	private Long employeeId;
	private String approvalForm;
	private String approvalTypeCd;
	private String regId;
    private Date regDate;
    private String regMenu;
    private String modId;
    private Date modDate;
    private String modMenu;
	
}
