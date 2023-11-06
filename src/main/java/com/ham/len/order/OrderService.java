package com.ham.len.order;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ham.len.commons.Pager;

@Service
public class OrderService {
	
	@Autowired
	private OrderDAO orderDAO;
	
	public List<OrderVO> getList(Pager pager) throws Exception{
		pager.makePageNum(1L);
		return orderDAO.getList(pager);
	}

}
