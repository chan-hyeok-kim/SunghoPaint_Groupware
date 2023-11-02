package com.ham.len.sales;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class SalesService {

	@Autowired
	private SalesDAO salesDAO;
	
	public int setCarReservationAdd(CarReservationVO carReservationVO) throws Exception {
		CarListVO carListVO = new CarListVO();
		carListVO.setCarNo(carReservationVO.getCarNo());
		
		salesDAO.setCarListUpdateUnavailable(carListVO);
		
		return salesDAO.setCarReservationAdd(carReservationVO);
	}
	
	public List<CarReservationVO> getReservationList(CarReservationVO carReservationVO) throws Exception{
		return salesDAO.getReservationList(carReservationVO);
	}
	
	public int setReservationUpdate(CarReservationVO carReservationVO) throws Exception{
		CarListVO carListVO = new CarListVO();
		carListVO.setCarNo(carReservationVO.getCarNo());
		
		CarReservationVO oldCarReservationVO = salesDAO.getTargetCar(carReservationVO);
		
		CarListVO oldCarListVO = new CarListVO();
		oldCarListVO.setCarNo(oldCarReservationVO.getCarNo());
		
		salesDAO.setCarListUpdateAvailable(oldCarListVO);
		salesDAO.setCarListUpdateUnavailable(carListVO);
		
		return salesDAO.setReservationUpdate(carReservationVO);
	}
	
	public int setReservationDelete(CarReservationVO carReservationVO) throws Exception{
		CarListVO carListVO = new CarListVO();
		carListVO.setCarNo(carReservationVO.getCarNo());
		
		salesDAO.setCarListUpdateAvailable(carListVO);
		
		return salesDAO.setReservationDelete(carReservationVO);
	}
	
	public List<CarListVO> getCarList(CarListVO carListVO) throws Exception{
		return salesDAO.getCarList(carListVO);
	}
	
	public List<CarListVO> getAllReservation(CarListVO carListVO) throws Exception{
		return salesDAO.getAllReservation(carListVO);
	}
	
	public List<CarListVO> getMyReservation(CarListVO carListVO) throws Exception{
		return salesDAO.getMyReservation(carListVO);
	}
}