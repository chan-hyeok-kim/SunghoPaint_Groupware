package com.ham.len.sales;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SalesService {

	@Autowired
	private SalesDAO salesDAO;
	
	public int setCarReservationAdd(CarReservationVO carReservationVO) throws Exception {
		return salesDAO.setCarReservationAdd(carReservationVO);
	}
	
	public List<CarReservationVO> getReservationList(CarReservationVO carReservationVO) throws Exception{
		return salesDAO.getReservationList(carReservationVO);
	}
	
	public int setReservationUpdate(CarReservationVO carReservationVO) throws Exception{
		return salesDAO.setReservationUpdate(carReservationVO);
	}
	
	public int setReservationDelete(CarReservationVO carReservationVO) throws Exception{
		return salesDAO.setReservationDelete(carReservationVO);
	}
	
	public List<CarListVO> getCarList(CarListVO carListVO) throws Exception{
		return salesDAO.getCarList(carListVO);
	}
}
