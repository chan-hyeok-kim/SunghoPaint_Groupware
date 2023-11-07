package com.ham.len.approval.pdf;

import java.io.FileOutputStream;

import org.springframework.stereotype.Controller;

import com.ham.len.approval.ApprovalVO;
import com.itextpdf.text.Document;
import com.itextpdf.text.Font;
import com.itextpdf.text.pdf.BaseFont;
import com.itextpdf.text.pdf.PdfWriter;


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
          
    	String html=approvalVO.getApprovalContents();
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
}