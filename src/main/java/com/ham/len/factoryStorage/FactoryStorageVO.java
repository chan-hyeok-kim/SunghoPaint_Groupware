package com.ham.len.factoryStorage;

import com.ham.len.commons.CodeVO;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class FactoryStorageVO extends CodeVO{
	
	private Long factoryStorageNo;
	private String employeeId;
	private String factoryStorageCd;
	private String factoryStorageUse;
	private String factoryStorageCategory;
	

}
