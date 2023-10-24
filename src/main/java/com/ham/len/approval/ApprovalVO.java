package com.ham.len.approval;

import java.util.Date;

import com.ham.len.CommonsVO;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ApprovalVO extends CommonsVO{
	
	private Long approvalNo;
	private String employeeId;
	private String approvalTitle;
	private String approvalContents;
	private String approvalStatusCd;
	private Date approvalStartDate;
	private Date approvalEndDate;
    private String drafter;
    private String midApprover;
    private String addApprover;
    private String lastApprover;
    private String admonition;
    
}
