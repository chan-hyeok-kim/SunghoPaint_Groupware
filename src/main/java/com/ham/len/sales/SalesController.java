package com.ham.len.sales;


import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/sales/*")
public class SalesController {

	@Autowired
	private SalesService salesService;
	
	@GetMapping("reservationStatus")
	public String getList() throws Exception{
		 
		 return "sales/reservationStatus";
	}
	
	@PostMapping("add")
	public String setCarReservationAdd(HttpServletRequest request, CarReservationVO carReservationVO, 
			@RequestParam("rental_Date") String rental_Date, 
			@RequestParam("rental_DateTime") String rental_DateTime, 
			@RequestParam("return_Date") String return_Date, 
			@RequestParam("return_DateTime") String return_DateTime) throws Exception{
		

		 String startTime = rental_Date + " " + rental_DateTime + ":00";
		 carReservationVO.setRentalDate(Timestamp.valueOf(startTime));
		 String endTime = return_Date + " " + return_DateTime + ":00";
		 carReservationVO.setReturnDate(Timestamp.valueOf(endTime));
	        
		 int result = salesService.setCarReservationAdd(carReservationVO);
		
		 return "redirect:./reservationStatus";
	}
	
	@GetMapping("getlist")
	@ResponseBody
	public List<CarReservationVO> getEvents(CarReservationVO carReservationVO) throws Exception{
	    List<CarReservationVO> events = salesService.getReservationList(carReservationVO);
	    
	    return events;
	}
	
	
	@PostMapping("update")
	public String setReservationUpdate(CarReservationVO carReservationVO, 
			@RequestParam("rental_Date") String rental_Date, 
			@RequestParam("rental_DateTime") String rental_DateTime, 
			@RequestParam("return_Date") String return_Date, 
			@RequestParam("return_DateTime") String return_DateTime) throws Exception{
		
		String startTime = rental_Date + " " + rental_DateTime + ":00";
		carReservationVO.setRentalDate(Timestamp.valueOf(startTime));
		String endTime = return_Date + " " + return_DateTime + ":00";
		carReservationVO.setReturnDate(Timestamp.valueOf(endTime));
		 
		log.info("========={}=======", carReservationVO.getRentalNo());
		int result = salesService.setReservationUpdate(carReservationVO);
		return "redirect:./reservationStatus";
	}
	
	@PostMapping("delete")
	public String setReservationDelete(CarReservationVO carReservationVO) throws Exception{
		log.info("========={}=======", carReservationVO.getRentalNo());
		int result = salesService.setReservationDelete(carReservationVO);
		return "redirect:./reservationStatus";
	}
	
	@GetMapping("carReservation")
	public String carReservation(CarListVO carListVO, Model model) throws Exception{
		List<CarListVO> arr = salesService.getCarList(carListVO); 
		model.addAttribute("list", arr);
		
		 return "sales/carReservation";
	}
	
	
}
