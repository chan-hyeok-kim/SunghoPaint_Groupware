package com.ham.len.admin;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ham.len.admin.document.ApprovalTypeVO;
import com.ham.len.commons.CodeVO;

import com.ham.len.commons.Pager;
import com.ham.len.commons.ZtreeVO;
import com.ham.len.humanresource.HumanResourceVO;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/code/*")
public class CodeController {

	@Autowired
	private CodeService codeService;


	
	@GetMapping("list")
	public void getList(Pager pager,Model model) throws Exception{
		log.warn("페이저체크{}",pager);
		
		List<CodeVO> ar=codeService.getList();
		List<UpCodeVO> upList=codeService.getUpList(pager);
		model.addAttribute("list", ar);
		model.addAttribute("upList", upList);
	}
	
	@GetMapping("listByUpCode")
	public String getListByUpCode(CodeVO codeVO,Model model) throws Exception{
		List<CodeVO> cl=codeService.getListByUpCode(codeVO);
		
		model.addAttribute("ajaxList", cl);
		
		return "code/ajaxList";
	}
	
	
	
	@PostMapping("add")
    public String setAdd(CodeVO codeVO,Model model,HttpServletRequest request) throws Exception{
		
		String code=codeVO.getCode();
		codeVO.setCode(codeVO.getUpCode()+code);
	    //뒷자리만 들어온거랑 더하기
		
	
		int result=codeService.setAdd(codeVO);
    	 
    	 if(result>0) {
    		 model.addAttribute("message", "코드가 성공적으로 등록되었습니다.");
    	 }else {
    		 model.addAttribute("message", "에러. 코드 등록 실패");	
    	 }
    	 model.addAttribute("result", result);
    	 model.addAttribute("url", "/code/list");
    	 return "commons/result";
    }
	
	@PostMapping("update")
	public String setUpdate(CodeVO codeVO) throws Exception{
	
		String code=codeVO.getCode().toUpperCase();
		codeVO.setCode(code);
		//혹시 소문자 들어오면 대문자로 변환
		
		String Upcode=code.substring(0,3);
		codeVO.setUpCode(Upcode);
		//업코드 세팅
		
		
		 int result=codeService.setUpdate(codeVO);
		 
		 log.warn("수정됐는지확인{}",codeVO);
		 log.warn("수정됐는지확인{}",result);
		 return "redirect:./list";
	}
	
	@PostMapping("delete")
	public String setDelete(CodeVO codeVO,Model model) throws Exception{
	    	int result=codeService.setDelete(codeVO);
	 
	    	model.addAttribute("result", result);
	    	
	    	 return "commons/ajaxResult";
	}
	
	@PostMapping("upDelete")
	public String setDelete(@RequestParam(value = "deleteCdArr[]") List<String> deleteCdArr,Model model) throws Exception{
		int result=0;
		if(deleteCdArr!=null) {
	    	for(String d: deleteCdArr) {
	    	    UpCodeVO upCodeVO=new UpCodeVO();
	    	    upCodeVO.setUpCode(d);
	    	    
	    	    result=codeService.setUpDelete(upCodeVO);
	    	    }
	    	}
	    	
	    
	    	 model.addAttribute("result", result);
	    
	    	 return "commons/ajaxResult";
	}
	
	@PostMapping("codeCheck")
	public String getCodeCheck(CodeVO codeVO,Model model) throws Exception{
		Long result=codeService.getCodeCheck(codeVO);
		model.addAttribute("result", result);
		
		return "commons/ajaxResult";
	}
	
	@GetMapping("test")
	public void test(Model model,Pager pager) throws Exception {
		List<UpCodeVO> ar=codeService.getUpList(pager);
		model.addAttribute("upList", ar);
	}
	
	@PostMapping("upAdd")
    public String setUpAdd(UpCodeVO upCodeVO,Model model) throws Exception{
		HumanResourceVO humanResourceVO=(HumanResourceVO)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		
		int result=codeService.setUpAdd(upCodeVO);
    	 
    	 if(result>0) {
    		 model.addAttribute("message", "코드가 성공적으로 등록되었습니다.");
    	 }else {
    		 model.addAttribute("message", "에러. 코드 등록 실패");	
    	 }
    	 model.addAttribute("result", result);
    	 model.addAttribute("url", "/code/list");
    	 return "commons/result";
    }
	
	@PostMapping("upUpdate")
	public String setUpUpdate(UpCodeVO upCodeVO,HttpServletRequest request) throws Exception{
		HumanResourceVO humanResourceVO=(HumanResourceVO)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String id=humanResourceVO.getEmployeeID();
		
		String upCode=upCodeVO.getUpCode().toUpperCase();
		upCodeVO.setUpCode(upCode);
		//혹시 소문자 들어오면 대문자로 변환
		
		
		 int result=codeService.setUpUpdate(upCodeVO);
		
		 return "redirect:./list";
	}
	
	@GetMapping("upCodeCheck")
	public String getUpCodeCheck(UpCodeVO upCodeVO,Model model) throws Exception{
		Long result=codeService.getUpCodeCheck(upCodeVO);
		model.addAttribute("result", result);
		
		return "commons/ajaxResult";
	}
	
	
	@GetMapping("approvalLineDept")
	@ResponseBody
	public List<ZtreeVO> getApprovalLineDept() throws Exception{
		List<CodeVO> cl=codeService.getApprovalLineDept();
		
		List<ZtreeVO> zl=new ArrayList<>();
		for(CodeVO c: cl) {
			ZtreeVO ztreeVO=new ZtreeVO();
			ztreeVO.setId("1");
			ztreeVO.setName(c.getCodeName());
			ztreeVO.setPId("0");
			if(ztreeVO.getName().equals("인사부")) {
			  ztreeVO.setIcon("/css/zTreeStyle/img/diy/human.png");
			}else if(ztreeVO.getName().equals("총무부")) {
			  ztreeVO.setIcon("/css/zTreeStyle/img/diy/money.png");
			}else if(ztreeVO.getName().equals("생산부")) {
			  ztreeVO.setIcon("/css/zTreeStyle/img/diy/product2.png");	
			}else if(ztreeVO.getName().equals("구매부")) {
			  ztreeVO.setIcon("/css/zTreeStyle/img/diy/buy3.png");
			}else if(ztreeVO.getName().equals("영업부")) {
			  ztreeVO.setIcon("/css/zTreeStyle/img/diy/sale.png");				
			}
			
			
			zl.add(ztreeVO);
		}
		
		
		return zl;
	}
	
	
}
