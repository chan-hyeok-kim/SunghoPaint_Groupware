package com.ham.len.workorder;

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
@RequestMapping("/workorder/*")
public class WorkOrderController {
	
	@Autowired
	private WorkOrderService workOrderService;
	
	@GetMapping("list")
	public String getList(Pager pager, Model model)throws Exception{
		List<WorkOrderVO> ar = workOrderService.getList(pager);
		log.warn("========{}========",ar);
		model.addAttribute("list", ar);
		return "workorder/list";
	}

}
