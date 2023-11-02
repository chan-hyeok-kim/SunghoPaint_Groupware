package com.ham.len.admin.document;



import com.ham.len.commons.CodeVO;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ApprovalUpTypeVO extends CodeVO{

	private Long approvalUpTypeNo;
	private String employeeID;
	private String approvalUpTypeCd;
}
