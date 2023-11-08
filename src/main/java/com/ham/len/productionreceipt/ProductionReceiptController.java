package com.ham.len.productionreceipt;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ham.len.commons.Pager;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/productionreceipt/*")
public class ProductionReceiptController {
	
	@Autowired
	private ProductionReceiptService productionReceiptService;
	
	@GetMapping("list")
	public String getList(Pager pager, Model model)throws Exception{
		List<ProductionReceiptVO> ar = productionReceiptService.getList(pager);
		model.addAttribute("list", ar);
		return "productionreceipt/list";
	}

}
