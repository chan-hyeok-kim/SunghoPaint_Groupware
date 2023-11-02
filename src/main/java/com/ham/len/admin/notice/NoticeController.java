package com.ham.len.admin.notice;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/notice/*")
public class NoticeController {

	@GetMapping("detail")
	public void getDetail() throws Exception{
		
	}
}
