package com.ham.len.commons;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.servlet.view.AbstractView;

import com.ham.len.admin.notice.AttachmentVO;
import com.itextpdf.html2pdf.ConverterProperties;
import com.itextpdf.html2pdf.HtmlConverter;
import com.itextpdf.io.font.FontProgram;
import com.itextpdf.io.font.FontProgramFactory;
import com.itextpdf.layout.font.FontProvider;
import com.itextpdf.text.Document;
import com.itextpdf.text.pdf.PdfWriter;
import com.itextpdf.tool.xml.XMLWorkerHelper;

import lombok.extern.slf4j.Slf4j;

@Component
@Slf4j
public class PdfDownView extends AbstractView{

	@Value("${app.upload}")
	private String filePath;
	
	@Override
	protected void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		
		this.buildPdfDocument(model, new Document(),request, response);
		
	}

	
	protected void buildPdfDocument(Map<String, Object> model, Document document,
            HttpServletRequest request, HttpServletResponse response) throws Exception {
		//서버에서 파일을 찾아서 클라이언트로 전송
		
		
		 // version 7        
        PdfWriter writer2 = PdfWriter.getInstance(document, response.getOutputStream());
        String fileName = String.valueOf(model.get("fileName"));
         
        // 파일 다운로드 설정
        response.setHeader("Content-Disposition", "attachment; filename=\"" + fileName + "\";");
        response.setHeader("Content-Transfer-Encoding", "binary");
        response.setContentType("application/pdf");
        
        document.open();
        XMLWorkerHelper helper = XMLWorkerHelper.getInstance();
        
        ConverterProperties props = new ConverterProperties();
        FontProvider dfp = new FontProvider();    
        String fontPath = "static/fonts/malgun.ttf";
        FontProgram fontProgram = FontProgramFactory.createFont(fontPath);
        dfp.addFont(fontProgram);
        props.setFontProvider(dfp);        

        String htmlStr = String.valueOf(model.get("content"));
                
        HtmlConverter.convertToPdf(htmlStr, response.getOutputStream(), props);
        
        log.warn("진행되었는가");
        document.close();
        writer2.close();
		
		
	}
	
	
}
