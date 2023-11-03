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
	
	@Value("${base.img.prefix}")
	private String basePrefix;
	
	@Value("${base.img.suffix}")
	private String baseSuffix;
	
	public String save(String path, MultipartFile multipartFile) throws Exception{
		File file = new File(path);
		
		if(!file.exists()) {
			file.mkdirs();
		}
		
		String fileName= UUID.randomUUID().toString()+'_'+multipartFile.getOriginalFilename();
		file = new File(file,fileName);
		
	
//	    확장자 알아내기
//		여기서 확장자 조건 걸어줘야 함
		String extension=fileName.substring(fileName.lastIndexOf(".")+1);
		log.warn("====={}=====",extension);
		log.warn("====={}=====",fileName.lastIndexOf(".")+1);
		String base64=null;
		if(extension.equalsIgnoreCase("JPG") || extension.equalsIgnoreCase("JPEG") || extension.equalsIgnoreCase("PNG") || extension.equalsIgnoreCase("JPG")
				|| extension.equalsIgnoreCase("GIF") || extension.equalsIgnoreCase("PDF") || extension.equalsIgnoreCase("PSD") 
				|| extension.equalsIgnoreCase("Al") || extension.equalsIgnoreCase("TIFF") || extension.equalsIgnoreCase("BMP")
				|| extension.equalsIgnoreCase("EPS") || extension.equalsIgnoreCase("SVG")) {
		log.warn("====={}=====",extension);
	    
		multipartFile.transferTo(file);
		       base64=imgToBase64.imageToBase64(file);
		
		base64=basePrefix+extension+baseSuffix+base64;
		
		//return fileName;
		}
		
		return base64;
	}
}
