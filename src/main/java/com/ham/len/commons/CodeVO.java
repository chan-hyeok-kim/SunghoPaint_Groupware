package com.ham.len.commons;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class CodeVO extends CommonsVO {
	private String code;
	private String upCode;
	private String codeName;
	private String originCode;
}