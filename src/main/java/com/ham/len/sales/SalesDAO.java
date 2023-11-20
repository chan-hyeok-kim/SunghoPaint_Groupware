package com.ham.len.sales;


import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ham.len.humanresource.HumanResourceVO;



@Mapper
public interface SalesDAO {
	
	public int setCarReservationAdd(CarReservationVO carReservationVO) throws Exception;
	
	public List<CarReservationVO> getReservationList(CarReservationVO carReservationVO) throws Exception;
	
	public int setReservationUpdate(CarReservationVO carReservationVO) throws Exception;
	
	public int setReservationDelete(CarReservationVO carReservationVO) throws Exception;
	
	public List<CarListVO> getCarList(CarListVO carListVO) throws Exception;
	
	public int setCarListUpdateUnavailable(CarListVO carListVO) throws Exception;
	
	public int setCarListUpdateAvailable(CarListVO carListVO) throws Exception;
	
	public CarReservationVO getTargetCar(CarReservationVO carReservationVO) throws Exception;
	
	public List<CarListVO> getAllReservation(CarListVO carListVO) throws Exception;
	
	public List<CarListVO> getMyReservation(CarReservationVO carReservationVO) throws Exception;
	
	public List<CarListVO> getCarSort() throws Exception;
	
	public int setCarAdd(CarListVO carListVO) throws Exception;
	
	public CarListVO getCarDetail(CarListVO carListVO) throws Exception;
	
	public int setCarUpdate(CarListVO carListVO) throws Exception;
	
	public int setCarDelete(CarListVO carListVO) throws Exception;
	
	public List<SalesClientVO> getClientList() throws Exception;
	
	public List<SalesClientVO> getClientDivision() throws Exception;
	
	public int setAddClient(SalesClientVO salesClientVO) throws Exception;
	
	public SalesClientVO getClientDetail(SalesClientVO salesClientVO) throws Exception;
	
	public int setClientUpdate(SalesClientVO salesClientVO) throws Exception;
	
	public int setClientDelete(SalesClientVO salesClientVO) throws Exception;
	
	public List<SalesPurchaseVO> getPurchaseList() throws Exception;
	
	public HumanResourceVO getPosition(HumanResourceVO humanResourceVO) throws Exception;
	
	public List<HumanResourceVO> getManagerList() throws Exception;
	
	public List<HumanResourceVO> getManagerPhone() throws Exception;
	
	public int setAddAnnual(AnnualAddVO annualAddVO) throws Exception;
	
	public List<AnnualAddVO> getAnnualList(AnnualAddVO annualAddVO) throws Exception;
	
	public List<AnnualAddVO> getTeamAnnualList(AnnualAddVO annualAddVO) throws Exception;
	
	public int setUpdateAnnual(AnnualAddVO annualAddVO) throws Exception;
	
	public int setDeleteAnnual(AnnualAddVO annualAddVO) throws Exception;
}
