package com.ham.len.approval;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;


import com.ham.len.admin.document.ApprovalTypeVO;
import com.ham.len.commons.CodeVO;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ApprovalVO extends CodeVO{
	
	private Long approvalNo;
	private String employeeID;
	private Long approvalTypeNo;
	private String approvalTitle;
	private String approvalContents;
	private String approvalStatusCd;
	private String approvalCheckCd;
	//@DateTimeFormat(pattern = "yyyy-MM-dd")
	private java.sql.Date approvalStartDate;
	private java.sql.Date approvalEndDate;
    private String drafter;
    private String midApprover;
    private String addApprover;
    private String lastApprover;
    private String admonition;
    private ApprovalTypeVO approvalTypeVO;
    private String apCodeName;
    private String aptCodeName;
    private Long aptApprovalTypeNo;
    
    private String midApproverName;
    private String addApproverName;
    private String lastApproverName;
    
    private java.sql.Date signTime;
    private String deptName;  
}
