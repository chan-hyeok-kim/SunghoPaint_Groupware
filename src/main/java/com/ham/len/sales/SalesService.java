package com.ham.len.sales;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SalesService {

	@Autowired
	private SalesDAO salesDAO;
	
	public int setCarReservation(CarReservationVO carReservationVO) throws Exception {
		return salesDAO.setCarReservation(carReservationVO);
	}
}
