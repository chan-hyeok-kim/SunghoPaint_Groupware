package com.ham.len.annual;

import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ham.len.humanresource.HumanResourcePager;
import com.ham.len.humanresource.HumanResourceService;
import com.ham.len.humanresource.HumanResourceVO;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/annual/*")
public class AnnualController {
	@Autowired
	private AnnualService annualService;
	
	@Autowired
	private HumanResourceService humanResourceService;
	
	@GetMapping("myAnnual")
	public String getMyAnnual(@AuthenticationPrincipal HumanResourceVO humanResourceVO, @RequestParam(value = "year", defaultValue = "0")int year, Model model) {
		if(year == 0) year = Calendar.getInstance(Locale.KOREA).get(Calendar.YEAR);
		
		Map<String, Object> params = new HashMap<>();
		params.put("employeeID", humanResourceVO.getEmployeeID());
		params.put("year", year);
		
		AnnualVO annualVO = annualService.getMyAnnual(params);
		model.addAttribute("annualVO", annualVO);
		return "annual/myAnnual";
	}
	
	@GetMapping("status")
	public String getStatus(HumanResourcePager pager, Model model) {
		model.addAttribute("annualList", annualService.getAnnualList(pager));
		model.addAttribute("departmentList", humanResourceService.getDepartmentList());
		model.addAttribute("pager", pager);
		return "annual/status";
	}
	
	@GetMapping("status/excelDownload")
	public void excelDownload() {
		annualService.excelDownload();
	}
	
	@PostMapping("update")
	@ResponseBody
	public int setUpdate(@RequestBody List<AnnualVO> annuals) {
		return annualService.setUpdate(annuals);
	}
}