package com.ham.len.humanResource.sign;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.ham.len.commons.ImgToBase64;
import com.ham.len.commons.MakeColumn;
import com.ham.len.humanResource.HumanResourceVO;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/sign/*")
public class SignatureController {

	@Autowired
	private SignatureService signatureService;

	@Autowired
	private MakeColumn makeColumn;
	
	
	
	@GetMapping("detail")
	public HumanResourceVO getDetail(HumanResourceVO humanResourceVO) throws Exception {
		return signatureService.getDetail(humanResourceVO);
	}

	@PostMapping("signUpdate")
	public String setSignUpdate(MultipartFile file, HttpServletRequest request, Model model) throws Exception {
		log.warn("*******{}*******",file);
		
//		원래 세션에서 꺼내서 조회해야됨.여기선 리퀘스트에서 조회할 예정
		HumanResourceVO humanResourceVO=new HumanResourceVO();
		String id="2023001";
		humanResourceVO.setEmployeeID(id);
		humanResourceVO=signatureService.getDetail(humanResourceVO);
		
		String path=request.getRequestURI();
		humanResourceVO=(HumanResourceVO)makeColumn.getModColumn(humanResourceVO, path, id);
		
		int result = signatureService.setSignUpdate(file, request.getSession(),humanResourceVO);
		model.addAttribute("result", result);
		return "commons/ajaxResult";
	}

	/*
	 * @GetMapping("update") public int setUpdate(SignatureVO signVO) throws
	 * Exception { return signService.setUpdate(signVO); }
	 */


}
