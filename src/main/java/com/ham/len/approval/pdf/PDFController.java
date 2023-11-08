package com.ham.len.approval.pdf;

import java.io.FileOutputStream;
import java.io.StringReader;
import java.net.URLEncoder;
import java.nio.charset.Charset;

import org.springframework.stereotype.Controller;

import com.ham.len.approval.ApprovalVO;
import com.itextpdf.text.Document;
import com.itextpdf.text.Font;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.pdf.BaseFont;
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

import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletResponse;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.util.Objects;
import java.util.Random;

@Controller
@RequiredArgsConstructor
@RequestMapping("/pdf/*")
public class PDFController {
	
    @Autowired
    private final HtmlToPdf htmlToPdf;

    @RequestMapping("download")
    public void pdfDownload(HttpServletResponse response,ApprovalVO approvalVO) {
          //approvalVO.getApprovalContents();
    	String html=htmlToPdf.getHtml("");
        // 미리 준비한 DTO 선언
        PdfVO pdfVO = new PdfVO();
        // pdf 파일이 저장될 경로 ( Mac 기준 )
        //pdfVO.setPdfFilePath("/Users/jeon/Documents/JavaProject/Blog/pdf/");

        // pdf 파일이 저장될 경로 ( Windows 기준 )
         pdfVO.setPdfFilePath("D:\\note\\pdf");

        // pdf 파일명 ( 테스트를 위해 랜덤으로 생성 )
        pdfVO.setPdfFileName(new Random().nextInt() + ".pdf");
        // itextPdfDto.setPdfFileName("test.pdf");

        // getHtml 에서 호출될 코드명
        pdfVO.setPdfCode("hyeok");

        // ======================= PDF 존재 유무 체크 =======================
        // 없다면 PDF 파일 만들기
        File file = htmlToPdf.checkPDF(pdfVO,html);
        int fileSize = (int) file.length();
        // ===============================================================


        // ===============================================================
        // 파일 다운로드를 위한 header 설정
        response.setContentType("application/octet-stream");
        response.setHeader("Content-Disposition", "attachment; filename="+pdfVO.getPdfFileName()+";");
        response.setContentLengthLong(fileSize);
        response.setStatus(HttpServletResponse.SC_OK);
        // ===============================================================

        // 파일 다운로드
        BufferedInputStream in = null;
        BufferedOutputStream out = null;

        // PDF 파일을 버퍼에 담은 후 다운로드
        try{
            in = new BufferedInputStream(new FileInputStream(file));
            out = new BufferedOutputStream(response.getOutputStream());
        } catch (Exception e) {
            e.printStackTrace();
        }

        try {
            byte[] buffer = new byte[4096];
            int read = 0;
            while ((read = in.read(buffer)) != -1) {
                out.write(buffer, 0, read);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                in.close();
                Objects.requireNonNull(out).flush();
                out.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
    
    @RequestMapping("down")
    public void pdf(HttpServletResponse response,ApprovalVO approvalVO) throws Exception{
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
    
    @RequestMapping("down2")
    public void getPdf()throws Exception{
    	
    }
}