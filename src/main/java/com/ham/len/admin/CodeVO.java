package com.ham.len.admin;

import java.util.Date;


import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class CodeVO {

	private String code;
	private String upCode;
	private String codeName;
	private String regId;
    private Date regDate;
    private String regMenu;
    private String modId;
    private Date modDate;
    private String modMenu;
	
}
