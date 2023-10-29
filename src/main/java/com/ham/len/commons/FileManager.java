package com.ham.len.commons;


import java.io.File;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.slf4j.Slf4j;

@Component
@Slf4j
public class FileManager {

	@Autowired
	private ImgToBase64 imgToBase64;
	
	@Value("${data.img.path}")
	private String basePath;
	
	public String save(String path, MultipartFile multipartFile) throws Exception{
		File file = new File(path);
		
		if(!file.exists()) {
			file.mkdirs();
		}
		
		String fileName= UUID.randomUUID().toString()+'_'+multipartFile.getOriginalFilename();
		file = new File(file,fileName);
		
		log.warn("===={}=======",fileName);
		
//	    확장자 알아내기
		String extension=fileName.substring(fileName.lastIndexOf(".")+1);
		log.warn("====={}=====",extension);
	    
		multipartFile.transferTo(file);
		String base64=imgToBase64.imageToBase64(file);
		log.warn("===={}=======",base64);
		
		base64=basePath+extension+";base64,"+base64;
		log.warn("===={}=======",base64);
		//return fileName;
		
		return base64;
	}
}
