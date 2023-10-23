package com.ham.len.sales;


import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/sales/*")
public class SalesController {

	@Autowired
	private SalesService salesService;
	
	@GetMapping("list")
	public String getList() throws Exception{
		 
		 return "sales/list";
	}
	
	@PostMapping("list2")
	public String setAdd(HttpServletRequest request,CarReservationVO carReservationVO, @RequestParam("rental_Date") String rental_Date, @RequestParam("rental_DateTime") String rental_DateTime, @RequestParam("return_Date") String return_Date, @RequestParam("return_DateTime") String return_DateTime) throws Exception{
		 // String path = request.getRequestURI()+".jsp";
		
		 String s = rental_Date + " " + rental_DateTime + ":00";
		 carReservationVO.setRentalDate(Timestamp.valueOf(s));
		 String e = return_Date + " " + return_DateTime + ":00";
		 carReservationVO.setReturnDate(Timestamp.valueOf(e));
	        
		 int result = salesService.setCarReservation(carReservationVO);
		
		 return "redirect:./list";
		 
		 
		 
	}
}
