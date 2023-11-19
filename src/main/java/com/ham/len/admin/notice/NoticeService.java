package com.ham.len.admin.notice;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.ham.len.commons.FileManager;
import com.ham.len.commons.Pager;
import com.ham.len.humanresource.HumanResourceVO;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
@Transactional(rollbackFor = Exception.class)
public class NoticeService {

	@Autowired
	private NoticeDAO noticeDAO;
	
	@Autowired
	private FileManager fileManager;
	
	@Value("${app.upload}")
	private String filePath;
	
	public NoticeVO getDetail(NoticeVO noticeVO) throws Exception{
		noticeVO=noticeDAO.getDetail(noticeVO);
		
		noticeDAO.setHitUpdate(noticeVO);
		
		return noticeVO;
	}
	
	public List<NoticeVO> getList(Pager pager) throws Exception{
		pager.makeRowNum();
		Long total=noticeDAO.getTotal(pager);
		pager.makePageNum(total);
		
		
		log.warn("몇개나오는데{}",total);
		return noticeDAO.getList(pager);
	}
	
	public int setAdd(NoticeVO noticeVO,MultipartFile[] multipartFiles) throws Exception{
		HumanResourceVO humanResourceVO=(HumanResourceVO)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		
		String id=humanResourceVO.getEmployeeID();
		noticeVO.setEmployeeID(id);
		
		int result=noticeDAO.setAdd(noticeVO);
		log.warn("BoardNo: {}", noticeVO.getNoticeNo());
		for(MultipartFile file: multipartFiles) {
			if(file.isEmpty()) {
 			   continue;
			}
			
			AttachmentVO attachmentVO=new AttachmentVO();
			String fileName=fileManager.save(filePath, file);
			attachmentVO.setFileName(fileName);
			attachmentVO.setFilePath(filePath);
			attachmentVO.setNoticeNo(noticeVO.getNoticeNo());
			attachmentVO.setOriginalName(file.getOriginalFilename());
			
			result=noticeDAO.setFileAdd(attachmentVO);
		}
		
		return result;
	}
	
	public int setUpdate(NoticeVO noticeVO) throws Exception{
		return noticeDAO.setUpdate(noticeVO);
	}
	
	public int setDelete(NoticeVO noticeVO) throws Exception{
		return noticeDAO.setDelete(noticeVO);
	}
	
	public AttachmentVO getFileDetail(AttachmentVO attachmentVO) throws Exception{
		return noticeDAO.getFileDetail(attachmentVO);
	}
	
	
	
	
}
