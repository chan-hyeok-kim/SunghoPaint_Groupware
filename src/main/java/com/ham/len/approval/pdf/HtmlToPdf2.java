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
import java.net.URLEncoder;
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
public class HtmlToPdf2 {

     
	

}