package com.ham.len.transfer;

import java.sql.Date;

import javax.validation.constraints.NotBlank;

import com.ham.len.commons.CodeVO;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class TransferVO extends CodeVO {
	private String transferNo;
	@NotBlank(message = "'사번'은 필수입니다.")
	private String employeeID;
	@NotBlank(message = "'이름'은 필수입니다.")
	private String name;
	private Date transferDate;
	@NotBlank(message = "'발령 구분'은 필수입니다.")
	private String transferTypeCd;
	private String transferTypeCdName;
	@NotBlank(message = "'이전 직급'은 필수입니다.")
	private String beforePositionCd;
	private String beforePositionCdName;
	@NotBlank(message = "'발령 직급'은 필수입니다.")
	private String transferPositionCd;
	private String transferPositionCdName;
	@NotBlank(message = "'이전 부서'는 필수입니다.")
	private String beforeDepartmentCd;
	private String beforeDepartmentCdName;
	@NotBlank(message = "'발령 부서'는 필수입니다.")
	private String transferDepartmentCd;
	private String transferDepartmentCdName;
}