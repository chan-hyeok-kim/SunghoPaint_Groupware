package com.ham.len.workorder;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ham.len.commons.Pager;

@Service
public class WorkOrderService {
	
	@Autowired
	private WorkOrderDAO workOrderDAO;
	
	public List<WorkOrderVO> getList(Pager pager) throws Exception{
		pager.makePageNum(1L);
		return workOrderDAO.getList(pager);
	}

}
