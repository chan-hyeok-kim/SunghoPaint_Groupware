package com.ham.len.admin.document;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ham.len.admin.CodeVO;
import com.ham.len.commons.Pager;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class ApprovalTypeService {

	@Autowired
	private ApprovalTypeDAO approvalTypeDAO;

	public int setAdd(ApprovalTypeVO approvalTypeVO) throws Exception {
		return approvalTypeDAO.setAdd(approvalTypeVO);
	}

	public List<ApprovalTypeVO> getList(Pager pager) throws Exception {
		return approvalTypeDAO.getList(pager);
	}

	public int setUpAdd(ApprovalUpTypeVO approvalUpTypeVO) throws Exception {
		return approvalTypeDAO.setUpAdd(approvalUpTypeVO);
	}

	public List<ApprovalUpTypeVO> getUpList() throws Exception {
		return approvalTypeDAO.getUpList();
	}

	public List<ApprovalTypeVO> getTotalList(Pager pager) throws Exception {
		return approvalTypeDAO.getTotalList(pager);
	}

	public ApprovalUpTypeVO getUpDetail(ApprovalUpTypeVO approvalUpTypeVO) throws Exception {
		return approvalTypeDAO.getUpDetail(approvalUpTypeVO);
	}

	public ApprovalTypeVO getDetail(ApprovalTypeVO approvalTypeVO) throws Exception {
		return approvalTypeDAO.getDetail(approvalTypeVO);
	}

	public int setUpdate(ApprovalTypeVO approvalTypeVO) throws Exception {
		log.warn("*******{}**********",approvalTypeVO);
		return approvalTypeDAO.setUpdate(approvalTypeVO);
	}

	public int setDelete(ApprovalTypeVO approvalTypeVO) throws Exception {
		return approvalTypeDAO.setDelete(approvalTypeVO);
	}

	public int setUpDelete(ApprovalTypeVO approvalTypeVO) throws Exception {
		return approvalTypeDAO.setUpDelete(approvalTypeVO);
	}

	public ApprovalUpTypeVO getDetailByName(String codeName) throws Exception{
		return approvalTypeDAO.getDetailByName(codeName);
	}

}
