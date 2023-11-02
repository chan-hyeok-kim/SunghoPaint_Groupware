package com.ham.len.order;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ham.len.commons.Pager;

@Mapper
public interface OrderDAO {
	
	public List<OrderVO> getList(Pager pager) throws Exception;

}
