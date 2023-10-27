package com.ham.len.commons;


import java.io.Console;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

import org.apache.tomcat.util.codec.binary.Base64;
import org.apache.tomcat.util.http.fileupload.ByteArrayOutputStream;
import org.springframework.stereotype.Component;

import lombok.extern.slf4j.Slf4j;

@Component
@Slf4j
public class ImgToBase64 {

	public String imageToBase64(File f) throws Exception{
	    String base64Img = "";
	    
	    //File f = new File(filePath + fileName);
	    log.warn("======={}=========",f);
	    if (f.exists() && f.isFile() && f.length() > 0) {
	        byte[] bt = new byte[(int) f.length()];
	        FileInputStream fis = null;
	        try {
	            fis = new FileInputStream(f);
	            fis.read(bt);
	            base64Img = new String(Base64.encodeBase64(bt));
	            log.warn("======={}=========",base64Img);
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
	
	
	
	
	@SuppressWarnings("null")
	public String fileToString(File file) {
        String fileString = new String();
        FileInputStream inputStream = null;
        ByteArrayOutputStream byteOutStream = null;
        try {
            inputStream = new FileInputStream(file);
            int len = 0;
            byte[] buf = new byte[1024];
            while ((len = inputStream.read(buf)) != -1) {
                byteOutStream.write(buf, 0, len);
            }
            byte[] fileArray = byteOutStream.toByteArray();
            fileString = new String(Base64.encodeBase64(fileArray));
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            try {
                inputStream.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
            try {
                byteOutStream.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

        return fileString;
        
    }

}
