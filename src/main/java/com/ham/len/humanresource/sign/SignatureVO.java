package com.ham.len.humanresource.sign;

import com.ham.len.admin.CodeVO;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class SignatureVO extends CodeVO{

	private Long signNo;
	private String employeeId;
	private String signPath;
	private String signName;
	private String signOriginalName;
}
