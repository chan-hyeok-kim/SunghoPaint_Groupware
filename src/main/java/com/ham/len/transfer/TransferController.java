package com.ham.len.transfer;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ham.len.commons.CodeVO;
import com.ham.len.humanresource.HumanResourceService;
import com.ham.len.humanresource.HumanResourceVO;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/transfer/*")
public class TransferController {
	@Autowired
	private TransferService transferService;
	
	@GetMapping("registration")
	public String setRegistration(Model model) {
		model.addAttribute("isTransferForm", true);
		return "transfer/registration";
	}
	
	@PostMapping("registration")
	public String setRegistration(TransferVO transferVO) {
		int result = transferService.setTransfer(transferVO);
		return "redirect:/transfer/view";
	}
	
	@GetMapping("list")
	public String getView(TransferPager pager, Model model) {
		model.addAttribute("transferList", transferService.getTransferList(pager));
		model.addAttribute("pager", pager);
		return "transfer/list";
	}
	
	@ResponseBody
	@GetMapping("getHumanResourceList")
	public List<HumanResourceVO> getHumanResourceList(){
		return transferService.getHumanResourceList();
	}
	
	@ResponseBody
	@GetMapping("getCodeList")
	public List<CodeVO> getCodeList(@RequestParam String upCode){
		return transferService.getCodeList(upCode);
	}
}