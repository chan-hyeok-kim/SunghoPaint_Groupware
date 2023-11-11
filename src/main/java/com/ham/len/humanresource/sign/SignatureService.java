package com.ham.len.humanresource.sign;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.ham.len.commons.FileManager;
import com.ham.len.humanresource.HumanResourceVO;

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
	
    public HumanResourceVO getDetail(HumanResourceVO humanResourceVO) throws Exception{
    	return signDAO.getDetail(humanResourceVO);
    }
	    
	public int setSignUpdate(HumanResourceVO humanResourceVO) throws Exception{
//		session.get이나 security에서 아이디꺼내주면됨
	
		int result=signDAO.setSignUpdate(humanResourceVO);

		return result; 
	}
	
	
	
}
