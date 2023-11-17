package com.ham.len.instrument;



import java.sql.Date;

import com.ham.len.commons.CodeVO;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class InstrumentVO extends CodeVO {
	
	private Long instrumentNo;
	private String employeeId;
	private String instrumentCd;
	private String instrumentCondition;
	private Long instrumentPrice;
	private Date instrumentBuyYear;
	private String instrumentMaker;
    
}
