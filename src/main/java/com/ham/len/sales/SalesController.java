package com.ham.len.sales;


import java.security.Principal;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ham.len.humanresource.HumanResourceVO;
import com.ham.len.util.ExcelWriter;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/sales/*")
public class SalesController {

	@Autowired
	private SalesService salesService;
	
	@GetMapping("calendarReservation")
	public String getList(CarListVO carListVO, Model model, @AuthenticationPrincipal HumanResourceVO humanResourceVO) throws Exception{
		List<CarListVO> arr = salesService.getCarList(carListVO);
		model.addAttribute("carList", arr);
		model.addAttribute("empId", humanResourceVO.getEmployeeID());
		
		HumanResourceVO humanResourceVO2 = new HumanResourceVO();

		humanResourceVO2 = salesService.getPosition(humanResourceVO);
		model.addAttribute("name", humanResourceVO.getName() + "　" + humanResourceVO2.getCodeName());
		model.addAttribute("name1", humanResourceVO.getName());
		
		return "sales/calendarReservation";
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
		
		 return "redirect:./calendarReservation";
	}
	
	@PostMapping("addCar")
	public String setCarReservationAdd2(HttpServletRequest request, CarReservationVO carReservationVO, 
			@RequestParam("rental_Date") String rental_Date, 
			@RequestParam("rental_DateTime") String rental_DateTime, 
			@RequestParam("return_Date") String return_Date, 
			@RequestParam("return_DateTime") String return_DateTime) throws Exception{
		

		 String startTime = rental_Date + " " + rental_DateTime + ":00";
		 carReservationVO.setRentalDate(Timestamp.valueOf(startTime));
		 String endTime = return_Date + " " + return_DateTime + ":00";
		 carReservationVO.setReturnDate(Timestamp.valueOf(endTime));
	        
		 int result = salesService.setCarReservationAdd(carReservationVO);
		
		 return "redirect:./carReservation";
	}
	
	@GetMapping("getList")
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
		 
		int result = salesService.setReservationUpdate(carReservationVO);
		return "redirect:./calendarReservation";
	}
	
	@PostMapping("delete")
	public String setReservationDelete(CarReservationVO carReservationVO) throws Exception{
		int result = salesService.setReservationDelete(carReservationVO);
		return "redirect:./calendarReservation";
	}
	
	@GetMapping("carReservation")
	public String carReservation(CarListVO carListVO, Model model, @AuthenticationPrincipal HumanResourceVO humanResourceVO) throws Exception{
		List<CarListVO> arr = salesService.getCarList(carListVO);
		model.addAttribute("list", arr);
		
		HumanResourceVO humanResourceVO2 = new HumanResourceVO();

		humanResourceVO2 = salesService.getPosition(humanResourceVO);
		
		model.addAttribute("name", humanResourceVO.getName() + "　" + humanResourceVO2.getCodeName());
		model.addAttribute("empId", humanResourceVO.getEmployeeID());
		return "sales/carReservation";
	}
	
	@GetMapping("getCarList")
	@ResponseBody
	public List<CarListVO> getCarList(CarListVO carListVO) throws Exception{
	    List<CarListVO> events = salesService.getCarList(carListVO);
	    
	    return events;
	}
	
	@GetMapping("reservationStatus")
	public String reservationStatus(CarListVO carListVO, Model model) throws Exception{
		List<CarListVO> arr = salesService.getAllReservation(carListVO);
		model.addAttribute("list", arr);

		return "sales/reservationStatus";
	}
	
	@GetMapping("myReservation")
	public String getMyReservation(CarListVO carListVO, Model model, CarReservationVO carReservationVO, @AuthenticationPrincipal HumanResourceVO humanResourceVO) throws Exception{
		carReservationVO.setEmployeeId(humanResourceVO.getEmployeeID());
		List<CarListVO> arr = salesService.getMyReservation(carReservationVO);
		model.addAttribute("list", arr);
		
		return "sales/ajaxMyList";
	}
	
	@GetMapping("reservationList")
	public String getReservationList(CarListVO carListVO, Model model) throws Exception{
		List<CarListVO> arr = salesService.getAllReservation(carListVO);
		model.addAttribute("list", arr);
		
		return "sales/ajaxAllList";
	}
	
	@PostMapping("deleteMyStatus")
	public String setMyReservationDelete(CarReservationVO carReservationVO) throws Exception{
		log.info("========={}=======", carReservationVO.getRentalNo());
		//int result = salesService.setReservationDelete(carReservationVO); 삭제말고 카리스트 업데이트해야됨
		log.info("========={}=======", carReservationVO.getCarNo());
		
		CarListVO carListVO = new CarListVO();
		carListVO.setCarNo(carReservationVO.getCarNo());
		int result = salesService.setCarListUpdateAvailable(carListVO);
		
		return "redirect:./reservationStatus";
	}
	
	@GetMapping("assetManagement")
	public String assetManagement(CarListVO carListVO, Model model) throws Exception{
		List<CarListVO> arr = salesService.getCarList(carListVO);
		model.addAttribute("carList", arr);
		
		List<CarListVO> carSort = salesService.getCarSort();
		model.addAttribute("carSort", carSort);
		return "sales/assetManagement";
	}
	
	@PostMapping("addCarList")
	public String setCarAdd(CarListVO carListVO) throws Exception{
		int result = salesService.setCarAdd(carListVO);
		
		return "redirect:./assetManagement";
	}
	
	@GetMapping("assetManagementDetail")
	public String assetManagementDetail(CarListVO carListVO, Model model) throws Exception{
		carListVO = salesService.getCarDetail(carListVO);
		model.addAttribute("detail", carListVO);
		return "sales/assetManagementDetail";
	}
	
	@PostMapping("carUpdate")
	public String setCarUpdate(CarListVO carListVO) throws Exception{
		int result = salesService.setCarUpdate(carListVO);
		log.info("--------------{}--------zz", result);
		return "redirect:assetManagement";
	}
	
	@PostMapping("carDelete")
	public String setCarDelete(CarListVO carListVO) throws Exception{
		int result = salesService.setCarDelete(carListVO);
		
		return "redirect:assetManagement";
	}

	/*======== 영업 관리 ========*/
	
	@GetMapping("clientList")
	public String getAccountList(Model model) throws Exception{
		List<SalesClientVO> arr = salesService.getClientList();
		model.addAttribute("getClientList", arr);
		
		List<SalesClientVO> arr2 = salesService.getClientDivision();
		model.addAttribute("getDivision", arr2);
		
		return "sales/clientList";
	}
	
	@PostMapping("addClient")
	public String addClient(SalesClientVO salesClientVO) throws Exception{
		int result = salesService.setAddClient(salesClientVO);
		
		return "redirect:clientList";
	}
	
	@GetMapping("clientDetail")
	public String getClientDetail(SalesClientVO salesClientVO, Model model) throws Exception{
		salesClientVO = salesService.getClientDetail(salesClientVO);
		model.addAttribute("getClientDetail", salesClientVO);
		return "sales/clientDetail";
	}
	
	@GetMapping("clientUpdate")
	public String setClientUpdate(SalesClientVO salesClientVO, Model model) throws Exception{
		salesClientVO = salesService.getClientDetail(salesClientVO);
		model.addAttribute("getClientDetail", salesClientVO);
		
		return "sales/clientUpdate";
	}
	
	@PostMapping("clientUpdate")
	public String setClientUpdate(SalesClientVO salesClientVO) throws Exception{
		int result = salesService.setClientUpdate(salesClientVO);
		
		return "redirect:clientDetail?clientNo="+salesClientVO.getClientNo();
	}
	
	@PostMapping("clientDelete")
	public String setClientDelete(SalesClientVO salesClientVO) throws Exception{
		int result = salesService.setClientDelete(salesClientVO);
		
		return "redirect:clientList";
	}
	
	@GetMapping("dealList")
	public String getDealList(Model model) throws Exception{
		List<SalesPurchaseVO> arr = salesService.getPurchaseList();
		model.addAttribute("dealList", arr);

		return "sales/dealList";
	}
	
	@GetMapping("dealPopup")
	public String dealPopup() throws Exception{
		
		return "sales/dealPopup";
	}
	
	@GetMapping("excelDownload")
	public void excelDownload(HttpServletRequest request, HttpServletResponse response, ExcelVO excelVO, ModelMap modelMap) throws Exception{
		log.info("=-=={}===", excelVO.getA());
		log.info("=-=={}===", excelVO.getResult());
		
		ExcelWriter writer = new ExcelWriter();
		writer.write(excelVO, "test.xlsx", "거래 명세서.xlsx");
	}
	
	@GetMapping("scheduleManagement")
	public String scheduleManagement() throws Exception{
		
		return "sales/scheduleManagement";
	}
}
