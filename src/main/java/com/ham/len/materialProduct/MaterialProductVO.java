package com.ham.len.materialProduct;

import com.ham.len.commons.CodeVO;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class MaterialProductVO extends CodeVO {

	private Long materialProductNo;
	private String employeeId;
	private String materialProductCd;
	private Long materialProductPrice;
	private String materialProductUse;
	private Long materialProductStock;
	private String materialProductCategory;
	private String codeName;
    
	private String materialProductName;
}
