package com.ham.len.commons;


import java.io.Console;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

import org.apache.tomcat.util.codec.binary.Base64;
import org.apache.tomcat.util.http.fileupload.ByteArrayOutputStream;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import lombok.extern.slf4j.Slf4j;

@Component
@Slf4j
public class ImgToBase64 {
	
	public String imageToBase64(File f) throws Exception{
	    String base64Img = "";
	    
	    
	    
	    if (f.exists() && f.isFile() && f.length() > 0) {
	        byte[] bt = new byte[(int) f.length()];
	        FileInputStream fis = null;
	        try {
	            fis = new FileInputStream(f);
	            fis.read(bt);
	            base64Img = new String(Base64.encodeBase64(bt));
	          
	        } catch (Exception e) {
	            throw e;
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
