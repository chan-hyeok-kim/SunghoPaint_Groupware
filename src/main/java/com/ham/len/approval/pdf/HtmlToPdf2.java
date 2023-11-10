package com.ham.len.approval.pdf;


import com.ham.len.approval.ApprovalVO;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.pdf.PdfWriter;
import com.itextpdf.tool.xml.XMLWorker;
import com.itextpdf.tool.xml.XMLWorkerFontProvider;
import com.itextpdf.tool.xml.XMLWorkerHelper;
import com.itextpdf.tool.xml.css.CssFile;
import com.itextpdf.tool.xml.css.StyleAttrCSSResolver;
import com.itextpdf.tool.xml.html.CssAppliers;
import com.itextpdf.tool.xml.html.CssAppliersImpl;
import com.itextpdf.tool.xml.html.Tags;
import com.itextpdf.tool.xml.parser.XMLParser;
import com.itextpdf.tool.xml.pipeline.css.CSSResolver;
import com.itextpdf.tool.xml.pipeline.css.CssResolverPipeline;
import com.itextpdf.tool.xml.pipeline.end.PdfWriterPipeline;
import com.itextpdf.tool.xml.pipeline.html.HtmlPipeline;
import com.itextpdf.tool.xml.pipeline.html.HtmlPipelineContext;
import org.springframework.stereotype.Component;

import java.io.*;
import java.net.URLEncoder;
import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/*
* Created By NAMHYEOK JEON
* 2023.02.13 Initial Version
* HTML TO PDF FILE CONVERTER USING ITEXT

* Using Library
* iText 5.5.13.3
* iText-xmlworker 5.5.13.3
* itext.pdfa 7.2.3
    Gradle
    implementation 'com.itextpdf:itextpdf:5.5.13.3'
    implementation 'com.itextpdf.tool:xmlworker:5.5.13.3'
    implementation 'com.itextpdf:pdfa:7.2.3'

*/
@Component
public class HtmlToPdf2 {
 
	public void down(HttpServletResponse response, ApprovalVO approvalVO)throws Exception{
	Document document = new Document(PageSize.A4, 50, 50, 50, 50); // 용지 및 여백 설정
  
	// PdfWriter 생성
	PdfWriter writer = PdfWriter.getInstance(document, new FileOutputStream("d:/note/test2.pdf")); // 바로 다운로드.
//PdfWriter writer = PdfWriter.getInstance(document, response.getOutputStream());
	writer.setInitialLeading(12.5f);
	 
	// 파일 다운로드 설정
	response.setContentType("application/pdf");
	String fileName = URLEncoder.encode("한글파일명", "UTF-8"); // 파일명이 한글일 땐 인코딩 필요
	response.setHeader("Content-Transper-Encoding", "binary");
	response.setHeader("Content-Disposition", "inline; filename=" + fileName + ".pdf");
	 
	// Document 오픈
	document.open();
	XMLWorkerHelper helper = XMLWorkerHelper.getInstance();
	     
	// CSS
	CSSResolver cssResolver = new StyleAttrCSSResolver();
	CssFile cssFile = helper.getCSS(new FileInputStream("D:\\note\\cording-study\\FinalProject\\pdf.css"));
	cssResolver.addCss(cssFile);
	     
	// HTML, 폰트 설정
	XMLWorkerFontProvider fontProvider = new XMLWorkerFontProvider(XMLWorkerFontProvider.DONTLOOKFORFONTS);
	fontProvider.register("static/fonts/malgun.ttf", "MalgunGothic"); // MalgunGothic은 alias,
	CssAppliers cssAppliers = new CssAppliersImpl(fontProvider);
	 
	HtmlPipelineContext htmlContext = new HtmlPipelineContext(cssAppliers);
	htmlContext.setTagFactory(Tags.getHtmlTagProcessorFactory());
	 
	// Pipelines
	PdfWriterPipeline pdf = new PdfWriterPipeline(document, writer);
	HtmlPipeline html = new HtmlPipeline(htmlContext, pdf);
	CssResolverPipeline css = new CssResolverPipeline(cssResolver, html);
	 
	XMLWorker worker = new XMLWorker(css, true);
	XMLParser xmlParser = new XMLParser(worker, Charset.forName("UTF-8"));
	 
	// 폰트 설정에서 별칭으로 줬던 "MalgunGothic"을 html 안에 폰트로 지정한다.
	String htmlStr=approvalVO.getApprovalContents();
			/*"<html><head><body style='font-family: MalgunGothic;'>"
	            + "<p>PDF 안에 들어갈 내용입니다.</p>"
	            + "<h3>한글, English, 漢字.</h3>"
	        + "</body></head></html>";*/
	htmlStr=htmlStr.replace("<br>", "<br/>");
	htmlStr=htmlStr.replace("<col", "</");
	StringReader strReader = new StringReader(htmlStr);
	xmlParser.parse(strReader);
	 
	document.close();
	writer.close();
	}

}