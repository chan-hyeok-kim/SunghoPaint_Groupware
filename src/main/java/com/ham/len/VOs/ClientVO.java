package com.ham.len.VOs;

import com.ham.len.commons.CodeVO;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter
@ToString
public class ClientVO extends CodeVO{
	
	private Long clientNo;
	private String clientName;

}
