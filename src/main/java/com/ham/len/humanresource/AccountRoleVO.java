package com.ham.len.humanresource;

import com.ham.len.commons.CodeVO;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class AccountRoleVO extends CodeVO {
	private Integer roleNum;
	private String employeeID;
}