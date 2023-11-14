package com.ham.len.main;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ham.len.approval.ApprovalService;
import com.ham.len.approval.ApprovalVO;
import com.ham.len.commons.Pager;
import com.ham.len.humanresource.HumanResourceVO;
import com.ham.len.humanresource.todolist.ToDoListVO;
import com.ham.len.materialProduct.MaterialProductVO;

import lombok.extern.slf4j.Slf4j;


@Controller
@Slf4j
public class IndexController {

	@Autowired
	private MainService mainService;
	
	@Autowired
	private ApprovalService approvalService;
	
	@GetMapping("/")
	public String getIndex(Model model,Pager pager,@AuthenticationPrincipal HumanResourceVO humanResourceVO)throws Exception{
		
		List<MaterialProductVO> ml=mainService.getMaterial();
		List<ToDoListVO> tl=mainService.getList();
		
		model.addAttribute("materList", ml);
		model.addAttribute("toDoList", tl);
		
//		결재 리스트 세팅
		List<ApprovalVO> al=approvalService.getMyList(pager);
		approvalService.getMyList(al, model, humanResourceVO);
	    List<ApprovalVO> myList=(List<ApprovalVO>)model.getAttribute("list");
		
	    for(ApprovalVO m: myList) {
			if(!m.getApprovalStatusCd().equals("R031")) {
		        al=new ArrayList<>();
		        al.add(m);
			}
		}
	    log.warn("마이리스트{}",myList.size());
	    log.warn("마이리스트{}",al.size());
	    model.addAttribute("list", al);
		
		
		
		
		
		return "index";
	}
	
	@PostMapping("/toDo/add")
	public String setAdd(ToDoListVO toDoListVO,@AuthenticationPrincipal HumanResourceVO humanResourceVO)throws Exception{
	    toDoListVO.setEmployeeID(humanResourceVO.getEmployeeID());
	  
	 
		int result=mainService.setAdd(toDoListVO);
		
		return "commons/ajaxResult";
	}
	
	@PostMapping("/toDo/delete")
	public String setDelete(ToDoListVO toDoListVO) throws Exception{
		int result=mainService.setDelete(toDoListVO);
		
		return "commons/ajaxResult";
	}
	
	@PostMapping("/toDo/update")
	public String setUpdate(ToDoListVO toDoListVO,@AuthenticationPrincipal HumanResourceVO humanResourceVO) throws Exception{
		toDoListVO.setEmployeeID(humanResourceVO.getEmployeeID());
		int result=mainService.setUpdate(toDoListVO);
		
		return "commons/ajaxResult";
	}
	
	
	
	@RequestMapping("/commons/result")
	public void goResult() throws Exception{
		
	}
	
	
}
