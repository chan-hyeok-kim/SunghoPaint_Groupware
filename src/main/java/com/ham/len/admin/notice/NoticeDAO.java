package com.ham.len.admin.notice;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ham.len.commons.Pager;

@Mapper
public interface NoticeDAO {

	public NoticeVO getDetail(NoticeVO noticeVO) throws Exception;
	
	public Long getTotal(Pager pager) throws Exception;
	
	public List<NoticeVO> getList(Pager pager) throws Exception;
	
	public int setAdd(NoticeVO noticeVO) throws Exception;
	
	public int setUpdate(NoticeVO noticeVO) throws Exception;
	
	public int setDelete(NoticeVO noticeVO) throws Exception;
	
	public int setFileAdd(AttachmentVO attachmentVO) throws Exception;
	
	public AttachmentVO getFileDetail(AttachmentVO attachmentVO) throws Exception;
	
	public int setHitUpdate(NoticeVO noticeVO) throws Exception;
	
}
