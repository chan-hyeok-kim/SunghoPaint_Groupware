package com.ham.len.approval.pdf;


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
import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;

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
public class HtmlToPdf {


    /*
     * PDF 유무를 체크한 후
     * PDF 파일이 없을 경우 PDF 파일 생성 메소드 실행
     */
    public File checkPDF (PdfVO pdfVO,String html) {
        File file = new File(pdfVO.getPdfFilePath(),pdfVO.getPdfFileName());
        int fileSize = (int) file.length();
        if (fileSize == 0) {
            createPDF(pdfVO,html);
            file = new File(pdfVO.getPdfFilePath(),pdfVO.getPdfFileName());
        }
        return file;
    }

    /*
     * iText 라이브러리를 사용한 PDF 파일 생성
     * CSS , Font 설정 기능 포함
     * */
    public void createPDF(PdfVO pdfVO,String html) {

        // 최초 문서 사이즈 설정
        Document document = new Document(PageSize.B4, 30, 30, 30, 30);

        try {
            // PDF 파일 생성
            PdfWriter pdfWriter = PdfWriter.getInstance(document, new FileOutputStream(pdfVO.getPdfFilePath()+pdfVO.getPdfFileName()));
            // PDF 파일에 사용할 폰트 크기 설정
            pdfWriter.setInitialLeading(12.5f);
            // PDF 파일 열기
            document.open();

            // XMLWorkerHelper xmlWorkerHelper = XMLWorkerHelper.getInstance();

            // CSS 설정 변수 세팅
            CSSResolver cssResolver = new StyleAttrCSSResolver();
            CssFile cssFile = null;

            try {
                /*
                 * CSS 파일 설정
                 * 기존 방식은 FileInputStream을 사용했으나, jar 파일로 빌드 시 파일을 찾을 수 없는 문제가 발생
                 * 따라서, ClassLoader를 사용하여 파일을 읽어오는 방식으로 변경
                 */
                InputStream cssStream = getClass().getClassLoader().getResourceAsStream("static/css/style.css");

                // CSS 파일 담기
                cssFile = XMLWorkerHelper.getCSS(cssStream);
//                cssFile = XMLWorkerHelper.getCSS(new FileInputStream("src/main/resources/static/css/test.css"));
            } catch (Exception e) {
                throw new IllegalArgumentException("PDF CSS 파일을 찾을 수 없습니다.");
            }

            if(cssFile == null) {
                throw new IllegalArgumentException("PDF CSS 파일을 찾을 수 없습니다.");
            }

            // CSS 파일 적용
            cssResolver.addCss(cssFile);

            // PDF 파일에 HTML 내용 삽입
            XMLWorkerFontProvider fontProvider = new XMLWorkerFontProvider(XMLWorkerFontProvider.DONTLOOKFORFONTS);

            /*
             * 폰트 설정
             * CSS 와 다르게, fontProvider.register() 메소드를 사용하여 폰트를 등록해야 함
             * 해당 메소드 내부에서 경로처리를 하여 개발, 배포 시 폰트 파일을 찾을 수 있도록 함
             * */
            try {
                fontProvider.register("static/fonts/Ubuntu/Ubuntu-Medium.ttf", "Gothic");
                //Gothic은 alias
            } catch (Exception e) {
                throw new IllegalArgumentException("PDF 폰트 파일을 찾을 수 없습니다.");
            }

            if(fontProvider.getRegisteredFonts() == null) {
                throw new IllegalArgumentException("PDF 폰트 파일을 찾을 수 없습니다.");
            }

            // 사용할 폰트를 담아두었던 내용을
            // CSSAppliersImpl에 담아 적용
            CssAppliers cssAppliers = new CssAppliersImpl(fontProvider);

            // HTML Pipeline 생성
            HtmlPipelineContext htmlPipelineContext = new HtmlPipelineContext(cssAppliers);
            htmlPipelineContext.setTagFactory(Tags.getHtmlTagProcessorFactory());

            // ========================================================================================
            // Pipelines
            PdfWriterPipeline pdfWriterPipeline = new PdfWriterPipeline(document, pdfWriter);
            HtmlPipeline htmlPipeline = new HtmlPipeline(htmlPipelineContext, pdfWriterPipeline);
            CssResolverPipeline cssResolverPipeline = new CssResolverPipeline(cssResolver, htmlPipeline);
            // ========================================================================================


            // ========================================================================================
            // XMLWorker
            XMLWorker xmlWorker = new XMLWorker(cssResolverPipeline, true);
          //  XMLParser xmlParser = new XMLParser(true, xmlWorker, StandardCharsets.UTF_8);
            XMLParser xmlParser = new XMLParser(xmlWorker, Charset.forName("UTF-8"));
            // ========================================================================================


            /* HTML 내용을 담은 String 변수
            주의점
            1. HTML 태그는 반드시 닫아야 함
            2. xml 기준 html 태그 확인( ex : <p> </p> , <img/> , <col/> )
            위 조건을 지키지 않을 경우 DocumentException 발생
            */
            

            // HTML 내용을 PDF 파일에 삽입
            StringReader stringReader = new StringReader(html);
            // XML 파싱
            xmlParser.parse(stringReader);
            // PDF 문서 닫기
            document.close();
            // PDF Writer 닫기
            pdfWriter.close();

        } catch (DocumentException e1) {
            throw new IllegalArgumentException("PDF 라이브러리 설정 에러");
        } catch (FileNotFoundException e2) {
            e2.printStackTrace();
            throw new IllegalArgumentException("PDF 파일 생성중 에러");
        } catch (IOException e3) {
            e3.printStackTrace();
            throw new IllegalArgumentException("PDF 파일 생성중 에러2");
        } catch (Exception e4) {
            e4.printStackTrace();
            throw new IllegalArgumentException("PDF 파일 생성중 에러3");
        }
        finally {
            try {
                document.close();
            } catch (Exception e) {
                System.out.println("PDF 파일 닫기 에러");
                e.printStackTrace();
            }
        }

    }

    // 사용할 html 코드를 가져오는 메소드
    public String getHtml(String code) {

        String return_html = "<html><head><body style='font-family: MalgunGothic;'>"
                + "<p>PDF 안에 들어갈 내용입니다.</p>"
                + "<h3>한글, English, 漢字.</h3>"
            + "</body></head></html>";

 

        return return_html;
    }
}