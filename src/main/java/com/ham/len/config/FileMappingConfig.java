package com.ham.len.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

//***-context.xml과 같은 역할
@Configuration
public class FileMappingConfig implements WebMvcConfigurer {

	@Value("${app.upload.mapping}")
	private String filePath;
	
	@Value("${app.url.path}")
	private String urlPath;
	
	@Value("${pdf.upload.mapping}")
    private String pdfUploadPath;
	
	@Value("${pdf.url.path}")
	private String pdfUrlPath;
	
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		
//		요청 URL
		registry.addResourceHandler(urlPath)
//		local파일 위치
		.addResourceLocations(filePath);
	
		registry.addResourceHandler(pdfUrlPath)
		.addResourceLocations(pdfUploadPath);
	}
	



}
