package com.ham.len.humanresource.sign;

import java.util.Base64;
import java.util.Base64.Encoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.ham.len.commons.ImgToBase64;

import com.ham.len.humanresource.HumanResourceVO;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/sign/*")
public class SignatureController {

	@Autowired
	private SignatureService signatureService;

	@Autowired
	private ImgToBase64 imgToBase64;
	
	@Value("${base.img.prefix}")
	private String basePrefix;
	
	@Value("${base.img.suffix}")
	private String baseSuffix;
	
	@GetMapping("detail")
	@ResponseBody
	public HumanResourceVO getDetail(@AuthenticationPrincipal HumanResourceVO humanResourceVO) throws Exception {
		return signatureService.getDetail(humanResourceVO);
	}

	@PostMapping("signUpdate")
	@ResponseBody
	public HumanResourceVO setSignUpdate(HumanResourceVO humanResourceVO,MultipartFile file) throws Exception {
		
		if(file!=null && !file.isEmpty()) {
			// &쓰면 오류나고, 순서바꿔도 오류남.
			// &&나 ||는 앞의 결과가 나오면 뒤를 처리하지 않기 때문임
			  Encoder encoder = Base64.getEncoder();
	          byte[] photoEncode = encoder.encode(file.getBytes());
	          String photoImg = new String(photoEncode, "UTF8");
	      
	          String fileName = file.getOriginalFilename();
		      String extension = fileName.substring(fileName.lastIndexOf(".") + 1);
		      
		      String src=basePrefix+extension+baseSuffix+photoImg;
		      
		      humanResourceVO.setSignature(src);
		}
//		원래 세션에서 꺼내서 조회해야됨.여기선 리퀘스트에서 조회할 예정
	
		HumanResourceVO humanResourceVO1=(HumanResourceVO)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		
		humanResourceVO.setEmployeeID(humanResourceVO1.getEmployeeID());
		
	
		int result = signatureService.setSignUpdate(humanResourceVO);
	//	model.addAttribute("result", result);
		
		humanResourceVO=signatureService.getDetail(humanResourceVO);
		
		return humanResourceVO;
	}

	/*
	 * @GetMapping("update") public int setUpdate(SignatureVO signVO) throws
	 * Exception { return signService.setUpdate(signVO); }
	 */


}
