package com.ham.len.order;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ham.len.approval.ApprovalVO;
import com.ham.len.commons.Pager;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/order/*")
public class OrderController {
	
	@Autowired
	private OrderService orderService;
	
	@GetMapping("list")
	public String getList(Pager pager,Model model) throws Exception{
		 List<OrderVO> ar = orderService.getList(pager);
		 log.warn("========{}========",ar);
		 model.addAttribute("list", ar);
		 return "order/list";
	}
	
	@GetMapping("add")
	public String add()throws Exception{
		
		return "order/add";
	}
	
	@PostMapping("add")
	public String add(OrderVO orderVO)throws Exception{
		
		int result = orderService.setAdd(orderVO);
		
		return "redirect:./list";
	}
	
	
}
