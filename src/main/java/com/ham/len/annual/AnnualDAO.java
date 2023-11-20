package com.ham.len.annual;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.ham.len.humanresource.HumanResourcePager;

@Mapper
public interface AnnualDAO {
	public AnnualVO getMyAnnual(Map<String, Object> params);
	public int setAnnual(AnnualVO annualVO);
	public Long getTotal(HumanResourcePager pager);
	public List<AnnualVO> getAnnualList(HumanResourcePager pager);
	public List<AnnualExcelVO> getDepartmentalAnnualList(String department);
	public int setUpdate(AnnualVO annualVO);
	public int setAnnualLeaveOccurredHistory(AnnualLeaveOccurredHistoryVO annualLeaveOccurredHistoryVO);
	public int setUpdateByUseAnnualLeave(AnnualLeaveUsedHistoryVO annualLeaveUsedHistoryVO);
	public int setAnnualLeaveUsedHistory(AnnualLeaveUsedHistoryVO annualLeaveUsedHistoryVO);
}