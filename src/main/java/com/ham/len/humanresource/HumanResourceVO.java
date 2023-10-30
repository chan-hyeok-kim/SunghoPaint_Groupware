package com.ham.len.humanresource;

import java.sql.Date;

import com.ham.len.admin.CodeVO;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class HumanResourceVO extends CodeVO{

	private String employeeId;
	private Date joinDate;
	private Boolean joinType;
	private String name;
	private String birth;
	private String departmentCd;
	private String positionCd;
	private String phone;
	private String email;
	private String zipCode;
	private String address;
	private String addressDetail;
	private String bank;
	private String accountNumber;
	private String accountHolder;
	private String signature;
	private Date quitDate;
	private String quitReason;
	private String regId;
	private java.util.Date regDate;
	private String regMenu;
	private String modId;
	private java.util.Date modDate;
	private String modMenu;
}
