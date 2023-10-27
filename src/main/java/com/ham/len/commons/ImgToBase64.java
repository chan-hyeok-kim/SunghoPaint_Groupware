package com.ham.len.commons;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

import org.apache.tomcat.util.codec.binary.Base64;
import org.springframework.stereotype.Component;

@Component
public class ImgToBase64 {

	public String imageToBase64(String filePath, String fileName){
	    String base64Img = "";
	    
	    File f = new File(filePath + fileName);
	    if (f.exists() && f.isFile() && f.length() > 0) {
	        byte[] bt = new byte[(int) f.length()];
	        FileInputStream fis = null;
	        try {
	            fis = new FileInputStream(f);
	            fis.read(bt);
	            base64Img = new String(Base64.encodeBase64(bt));
	        } catch (Exception e) {
	            
	        } finally {
	            try {
	                if (fis != null) {
	                    fis.close();
	                }
	            } catch (IOException e) {
	            } catch (Exception e) {
	            }
	        }
	    }
	    
	    return base64Img;
	}
}
