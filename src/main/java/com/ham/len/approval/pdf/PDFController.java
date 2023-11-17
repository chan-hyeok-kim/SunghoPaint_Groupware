package com.ham.len.approval.pdf;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.StringReader;
import java.net.URLEncoder;
import java.nio.charset.Charset;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;

import com.ham.len.approval.ApprovalVO;
import com.ham.len.commons.FileDownView;
import com.itextpdf.html2pdf.ConverterProperties;
import com.itextpdf.html2pdf.HtmlConverter;
import com.itextpdf.html2pdf.resolver.font.DefaultFontProvider;
import com.itextpdf.io.font.FontProgram;
import com.itextpdf.io.font.FontProgramFactory;
import com.itextpdf.io.source.ByteArrayOutputStream;
import com.itextpdf.kernel.geom.PageSize;
import com.itextpdf.kernel.pdf.PdfDocument;
import com.itextpdf.kernel.pdf.PdfWriter;
import com.itextpdf.layout.Document;
import com.itextpdf.layout.element.IBlockElement;
import com.itextpdf.layout.element.IElement;
import com.itextpdf.layout.font.FontProvider;




import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

import org.apache.tomcat.util.http.fileupload.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletResponse;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.util.List;
import java.util.Objects;
import java.util.Random;
import java.util.UUID;

@Controller
@RequiredArgsConstructor
@Slf4j
@RequestMapping("/pdf/*")
public class PDFController {
	

    
    @RequestMapping("down")
    public ResponseEntity<Resource> getPdf(ApprovalVO approvalVO,Model model)throws Exception{
    	    
    	    String fileNm= UUID.randomUUID().toString()+'_'+"sample.pdf";
    	    String path="D:/static/pdf/";
    	    String path2="D:/static/pdf/"+fileNm;
    	    
    	  //  ByteArrayOutputStream baos = new ByteArrayOutputStream();
    	    
    	  //  String path="/static/pdf/"+fileNm;
    	    File file = new File(path); 
    	   
    	    if(!file.exists()) {
    	    	file.mkdirs();
    	    }
    	    file = new File(path,fileNm); 
    	    
    		String BODY=approvalVO.getApprovalContents();    		
    		
//    	    String FONT = "D:\\malgun.ttf";
    	    String FONT="static/fonts/malgun.ttf";
    	    //ConverterProperties : htmlconverter의 property를 지정하는 메소드인듯
    	    ConverterProperties properties = new ConverterProperties();
    	    FontProvider fontProvider = new DefaultFontProvider(false, false, false);
    	    FontProgram fontProgram = FontProgramFactory.createFont(FONT);
    	    fontProvider.addFont(fontProgram);
    	    properties.setFontProvider(fontProvider);

    	    
    	    
    	    //pdf 페이지 크기를 조정
    	    List<IElement> elements = HtmlConverter.convertToElements(BODY, properties);
    
    	 //   PdfWriter writer= new PdfWriter(baos);
    	    PdfWriter writer= new PdfWriter(new FileOutputStream(file));
    	    PdfDocument pdf = new PdfDocument(writer);
    	    Document document = new Document(pdf);
    	    
    	    pdf.setDefaultPageSize(PageSize.A4.rotate());
    	    //setMargins 매개변수순서 : 상, 우, 하, 좌
    	    document.setMargins(50, 50, 50, 50);
    	    
    	    for (IElement element : elements) {
    	      document.add((IBlockElement) element);
    	    }
    	    document.close();
    	  //  byte[] bytes = baos.toByteArray();
    	    
    	    model.addAttribute("file", file);
    	    model.addAttribute("oriName", fileNm);
    	    log.warn("여긴오나");
    	    
    	    
    	    
    	    
    	    //전송
    	    // 파일을 Resource 객체로 읽기
    	    Resource resource = new FileSystemResource(file);

    	    if (resource.exists() && resource.isReadable()) {
    	        HttpHeaders headers = new HttpHeaders();
    	        headers.add(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=" + fileNm);
    	        headers.add(HttpHeaders.CONTENT_TYPE, "application/pdf");
    	        return ResponseEntity.ok()
    	                .headers(headers)
    	                .body(resource);
    	    } else {
    	        // 파일을 찾을 수 없거나 읽을 수 없는 경우에 대한 예외 처리
    	        return ResponseEntity.status(HttpStatus.NOT_FOUND).body(null);
    	    }
    	  
    
    	  
    	   
    }
    
   
}