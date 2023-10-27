package com.ham.len.sales;


import java.util.List;

import org.apache.ibatis.annotations.Mapper;


@Mapper
public interface SalesDAO {
	
	public int setCarReservationAdd(CarReservationVO carReservationVO) throws Exception;
	
	public List<CarReservationVO> getReservationList(CarReservationVO carReservationVO) throws Exception;
	
	public int setReservationUpdate(CarReservationVO carReservationVO) throws Exception;
	
	public int setReservationDelete(CarReservationVO carReservationVO) throws Exception;
	
	public List<CarListVO> getCarList(CarListVO carListVO) throws Exception;
	
}
