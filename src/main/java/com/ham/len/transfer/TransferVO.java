package com.ham.len.transfer;

import java.sql.Date;

import com.ham.len.commons.CodeVO;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class TransferVO extends CodeVO {
	private String transferNo;
	private String employeeId;
	private String name;
	private Date transferDate;
	private String transferTypeCd;
	private String transferTypeCdName;
	private String beforePositionCd;
	private String beforePositionCdName;
	private String transferPositionCd;
	private String transferPositionCdName;
	private String beforeDepartmentCd;
	private String beforeDepartmentCdName;
	private String transferDepartmentCd;
	private String transferDepartmentCdName;
}