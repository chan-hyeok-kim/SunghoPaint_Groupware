package com.ham.len.humanresource.sign;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.ham.len.humanresource.HumanResourceVO;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/sign/*")
public class SignatureController {

	@Autowired
	private SignatureService signService;

	@GetMapping("detail")
	public SignatureVO getDetail(SignatureVO signVO) throws Exception {
		return signService.getDetail(signVO);
	}

	@PostMapping("ajaxAdd")
	public String setAdd(MultipartFile formData, HttpSession session, Model model) throws Exception {
		log.warn("*******{}*******",formData);
		int result = signService.setAdd(formData, session);
		model.addAttribute("result", result);
		return "commons/ajaxResult";
	}

	@GetMapping("update")
	public int setUpdate(SignatureVO signVO) throws Exception {
		return signService.setUpdate(signVO);
	}

	// update할때만 삭제하면되서 나중에 지울예정
	@GetMapping("delete")
	public int setDelete(SignatureVO signVO) throws Exception {
		return signService.setDelete(signVO);
	}
}
