package com.ham.len.admin.notice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ham.len.commons.Pager;

@Service
public class NoticeService {

	@Autowired
	private NoticeDAO noticeDAO;
	
	public NoticeVO getDetail(NoticeVO noticeVO) throws Exception{
		return noticeDAO.getDetail(noticeVO);
	}
	
	public List<NoticeVO> getList(Pager pager) throws Exception{
		return noticeDAO.getList(pager);
	}
	
	public int setAdd(NoticeVO noticeVO) throws Exception{
		return noticeDAO.setAdd(noticeVO);
	}
	
	public int setUpdate(NoticeVO noticeVO) throws Exception{
		return noticeDAO.setUpdate(noticeVO);
	}
	
	public int setDelete(NoticeVO noticeVO) throws Exception{
		return noticeDAO.setDelete(noticeVO);
	}
}
