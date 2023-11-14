package com.ham.len.admin;

import com.ham.len.commons.CommonsVO;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class UpCodeVO extends CommonsVO{

	private String upCode;
	private String upCodeName;
	
	private String originUpCode;
	
}
