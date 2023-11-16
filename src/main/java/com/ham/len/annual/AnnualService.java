package com.ham.len.annual;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ham.len.commons.CodeVO;
import com.ham.len.humanresource.HumanResourceDAO;
import com.ham.len.humanresource.HumanResourcePager;
import com.ham.len.util.ExcelWriter;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class AnnualService {
	@Autowired
	private AnnualDAO annualDAO;
	
	@Autowired
	private HumanResourceDAO humanResourceDAO;
	
	@Autowired
	private ExcelWriter excelWriter;
	
	public List<AnnualVO> getAnnualList(HumanResourcePager pager){
		pager.makeRowNum();
		pager.makePageNum(annualDAO.getTotal(pager));
		return annualDAO.getAnnualList(pager);
	}
	
	public void excelDownload() {
		Map<String, List<AnnualExcelVO>> data = new HashMap<>();
		
		List<CodeVO> departmentList = humanResourceDAO.getDepartmentList();
		for(CodeVO department : departmentList) {
			List<AnnualExcelVO> departmentalAnnualList = annualDAO.getDepartmentalAnnualList(department.getCode());
			data.put(department.getCode(), departmentalAnnualList);
		}
		
		excelWriter.write(data, "annual.xlsx", "전사 연차 현황.xlsx");
	}
	
	public int setUpdate(List<AnnualVO> annuals) {
		int result = 0;
		for(AnnualVO annualVO : annuals) {
			result = annualDAO.setUpdate(annualVO);
		}
		
		return result;
	}
}