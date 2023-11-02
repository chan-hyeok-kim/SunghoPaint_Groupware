package com.ham.len.workorder;

import java.sql.Date;

import com.ham.len.commons.CodeVO;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter
@ToString
public class WorkOrderVO extends CodeVO {
	
	private Long workOrderNo;
	private String employeeId;
	private Long materalProductNo;
	private Long factoryNo;
	private Date workDeliveryDate;
	private Long orderQuantity;
	private Long productionQuantity;
	private String workStatusCd;

}
