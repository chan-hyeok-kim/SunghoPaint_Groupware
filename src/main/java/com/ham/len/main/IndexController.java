package com.ham.len.main;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ham.len.commons.MakeColumn;
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
	private MakeColumn makeColumn;		
	
	@GetMapping("/")
	public String getIndex(HttpServletRequest request,Model model)throws Exception{
		
		String path = request.getRequestURI();
		request.getRequestURI();
		
		List<MaterialProductVO> mr=mainService.getMaterial();
		List<ToDoListVO> ar=mainService.getList();
		
		model.addAttribute("materList", mr);
		model.addAttribute("list", ar);
		log.warn("============{}==============",path);
		
		return "index";
	}
	
	@PostMapping("/toDo/add")
	public String setAdd(ToDoListVO toDoListVO,HttpServletRequest request,@AuthenticationPrincipal HumanResourceVO humanResourceVO)throws Exception{
	    toDoListVO.setEmployeeID(humanResourceVO.getEmployeeID());
	    String path=request.getRequestURI();
		
	    toDoListVO=(ToDoListVO)makeColumn.getColumn(toDoListVO, path, humanResourceVO.getEmployeeID());
	    
		int result=mainService.setAdd(toDoListVO);
		
		return "commons/ajaxResult";
	}
	
	@PostMapping("/toDo/delete")
	public String setDelete(ToDoListVO toDoListVO) throws Exception{
		int result=mainService.setDelete(toDoListVO);
		
		return "commons/ajaxResult";
	}
	
	@PostMapping("/toDo/update")
	public String setUpdate(ToDoListVO toDoListVO,HttpServletRequest request,@AuthenticationPrincipal HumanResourceVO humanResourceVO) throws Exception{
		String path=request.getRequestURI();
		String id=humanResourceVO.getEmployeeID();
		
		toDoListVO=(ToDoListVO)makeColumn.getModColumn(toDoListVO, path, id);
	    
		int result=mainService.setUpdate(toDoListVO);
		
		return "commons/ajaxResult";
	}
	
	
}
