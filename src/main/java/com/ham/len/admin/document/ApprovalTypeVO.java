package com.ham.len.admin.document;

import java.util.Date;

import com.ham.len.commons.CodeVO;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ApprovalTypeVO extends CodeVO {

	private Long approvalTypeNo;
	private String employeeID;
	private Long approvalUpTypeNo;
	private String approvalForm;
	private String approvalTypeCd;
	private ApprovalUpTypeVO approvalUpTypeVO;
	
	
}
