package com.ham.len.humanresource;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class HumanResourceExcelVO {
	private String employeeID;
	private String joinDate;
	private String joinType;
	private String name;
	private String birth;
	private String departmentCdName;
	private String positionCdName;
	private Integer yearsOfService;
	private String extensionNumber;
	private String phone;
	private String mainNumber;
	private String email;
	private String address;
	private String bank;
	private String accountNumber;
	private String accountHolder;
	private String quitDate;
	private String quitReason;
}