package com.ham.len.humanresource.sign;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.ham.len.commons.FileManager;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class SignatureService {

	@Autowired
	private SignatureDAO signDAO;
	
	@Value("${app.upload}")
	private String uploadPath;

	@Value("${app.sign}")
	private String sign;
	
	@Autowired
	private FileManager fileManager;
	
    public SignatureVO getDetail(SignatureVO signVO) throws Exception{
    	return signDAO.getDetail(signVO);
    }
	    
	public String setAdd(MultipartFile file, HttpSession session) throws Exception{
//		session.get이나 security에서 아이디꺼내주면됨
		String id="2023001";
		String path=uploadPath+sign;
		String fileName=fileManager.save(path, file);
		
		log.warn("********{}*******",fileName);
		
		
		SignatureVO signVO=new SignatureVO();
		
		
		 
		return fileName; //signDAO.setAdd(signVO);
	}
	
    public int setUpdate(SignatureVO signVO) throws Exception{
    	return signDAO.setUpdate(signVO);
    }
	
	public int setDelete(SignatureVO signVO) throws Exception{
		return signDAO.setDelete(signVO);
	}
	
}
