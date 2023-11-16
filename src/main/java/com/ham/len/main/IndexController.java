package com.ham.len.main;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
		
		List<MaterialProductVO> ml=mainService.getMaterial("제품");
		
		model.addAttribute("materList", ml);
		
		
//		결재 리스트 세팅
		List<ApprovalVO> al=approvalService.getMyList(pager);
	
		//내가 올린 결재리스트
		List<ApprovalVO> myList=new ArrayList<>();
	    for(ApprovalVO a: al) {
			if(!a.getApprovalStatusCd().equals("R031") &&
			    a.getEmployeeID().equals(humanResourceVO.getEmployeeID())) {
		        
		        myList.add(a);
			}
		}
	    
	    //다른 사람들이 올린 결재 리스트(내가 결재해줘야 되는)
	    //조건 추가해야됨
	    List<ApprovalVO> approvalList=new ArrayList<>();
	    for(ApprovalVO ap: al) {
			if(ap.getApprovalStatusCd().equals("R032") &&
			    !(ap.getEmployeeID().equals(humanResourceVO.getEmployeeID()))) {
		        
		        approvalList.add(ap);
			}
		}
	   
	    log.warn("마이리스트{}",al.size());
	    model.addAttribute("list", myList);
		model.addAttribute("approvalList", approvalList);
		
		
		
		
		return "index";
	}
	
	@GetMapping("/home/getMaterial")
	@ResponseBody
	public List<MaterialProductVO> getMaterial() throws Exception{
		List<MaterialProductVO> ml2=mainService.getMaterial("원료");
		
		return ml2;
	}
	
	
	@RequestMapping("/todolist")
	public void getToDoList(Model model,@AuthenticationPrincipal HumanResourceVO humanResourceVO) throws Exception{
		List<ToDoListVO> tl=mainService.getToDoList(humanResourceVO.getEmployeeID());
		model.addAttribute("toDoList", tl);
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
