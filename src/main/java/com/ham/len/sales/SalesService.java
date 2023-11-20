package com.ham.len.sales;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ham.len.humanresource.HumanResourceVO;

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
	
	public List<CarListVO> getMyReservation(CarReservationVO carReservationVO) throws Exception{
		return salesDAO.getMyReservation(carReservationVO);
	}
	
	public List<CarListVO> getCarSort() throws Exception{
		return salesDAO.getCarSort();
	}
	
	public int setCarAdd(CarListVO carListVO) throws Exception{
		return salesDAO.setCarAdd(carListVO);
	}
	
	public CarListVO getCarDetail(CarListVO carListVO) throws Exception{
		return salesDAO.getCarDetail(carListVO);
	}
	
	public int setCarUpdate(CarListVO carListVO) throws Exception{
		return salesDAO.setCarUpdate(carListVO);
	}
	
	public int setCarDelete(CarListVO carListVO) throws Exception{
		return salesDAO.setCarDelete(carListVO);
	}
	
	public List<SalesClientVO> getClientList() throws Exception{
		return salesDAO.getClientList();
	}
	
	public List<SalesClientVO> getClientDivision() throws Exception{
		return salesDAO.getClientDivision();
	}
	
	public int setAddClient(SalesClientVO salesClientVO) throws Exception{
		return salesDAO.setAddClient(salesClientVO);
	}
	
	public SalesClientVO getClientDetail(SalesClientVO salesClientVO) throws Exception{
		return salesDAO.getClientDetail(salesClientVO);
	}
	
	public int setClientUpdate(SalesClientVO salesClientVO) throws Exception{
		return salesDAO.setClientUpdate(salesClientVO);
	}
	
	public int setClientDelete(SalesClientVO salesClientVO) throws Exception{
		return salesDAO.setClientDelete(salesClientVO);
	}
	
	public List<SalesPurchaseVO> getPurchaseList() throws Exception{
		return salesDAO.getPurchaseList();
	}
	
	public HumanResourceVO getPosition(HumanResourceVO humanResourceVO) throws Exception{
		return salesDAO.getPosition(humanResourceVO);
	}
	
	public int setCarListUpdateAvailable(CarListVO carListVO) throws Exception{
		return salesDAO.setCarListUpdateAvailable(carListVO);
	}
	
	public List<HumanResourceVO> getManagerList() throws Exception{
		return salesDAO.getManagerList();
	}
	
	public List<HumanResourceVO> getManagerPhone() throws Exception{
		return salesDAO.getManagerPhone();
	}
	
	public int setAddAnnual(AnnualAddVO annualAddVO) throws Exception{
		return salesDAO.setAddAnnual(annualAddVO);
	}
	
	public List<AnnualAddVO> getAnnualList(AnnualAddVO annualAddVO) throws Exception{
		return salesDAO.getAnnualList(annualAddVO);
	}
	
	public List<AnnualAddVO> getTeamAnnualList(AnnualAddVO annualAddVO) throws Exception{
		return salesDAO.getTeamAnnualList(annualAddVO);
	}
	
	public int setUpdateAnnual(AnnualAddVO annualAddVO) throws Exception{
		return salesDAO.setUpdateAnnual(annualAddVO);
	}
	
	public int setDeleteAnnual(AnnualAddVO annualAddVO) throws Exception{
		return salesDAO.setDeleteAnnual(annualAddVO);
	}
}
