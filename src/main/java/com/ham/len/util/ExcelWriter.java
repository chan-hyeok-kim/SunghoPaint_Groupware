package com.ham.len.util;

import java.io.BufferedInputStream;
import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import net.sf.jxls.transformer.XLSTransformer;

@Component
public class ExcelWriter {
	public void write(Object data, String template, String downloadName) {
		Workbook workbook = null;
		InputStream is = null;
		OutputStream os = null;
		
		try {
			Map<String, Object> beans = new HashMap<>();
			beans.put("data", data);
			
			Resource resource = new ClassPathResource("static/excel_template/" + template);
			is = new BufferedInputStream(resource.getInputStream());
			
			/*
				File desktop = new File(System.getProperty("user.home"), "Desktop");
				File excelFile = new File(desktop, "전사 연차 현황.xlsx");
				os = new BufferedOutputStream(new FileOutputStream(excelFile));
				
				XLSTransformer xlsTransformer = new XLSTransformer();
				workbook = xlsTransformer.transformXLS(is, beans);
				workbook.write(os);
			*/
			
			XLSTransformer xlsTransformer = new XLSTransformer();
			ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
			workbook = xlsTransformer.transformXLS(is, beans);
			workbook.write(byteArrayOutputStream);
			
			HttpServletResponse response = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getResponse();
			response.setHeader("Content-Disposition", "attachment; filename=" +  new String(URLEncoder.encode(downloadName, "UTF-8")).replaceAll("\\+", " "));
			
			try(ServletOutputStream outputStream = response.getOutputStream()) { // try-with-resources 문법
				byteArrayOutputStream.writeTo(outputStream);
				outputStream.flush();
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(workbook != null) workbook.close();
				if(is != null) is.close();
				if(os != null) os.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
	}
}