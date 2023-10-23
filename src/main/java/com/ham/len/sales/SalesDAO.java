package com.ham.len.sales;


import org.apache.ibatis.annotations.Mapper;


@Mapper
public interface SalesDAO {
	
	public int setCarReservation(CarReservationVO carReservationVO) throws Exception;
}
