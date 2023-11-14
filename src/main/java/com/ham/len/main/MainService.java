package com.ham.len.main;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ham.len.humanresource.todolist.ToDoListVO;
import com.ham.len.materialProduct.MaterialProductVO;

@Service
public class MainService {

	@Autowired 
	private MainDAO mainDAO;
	
    public List<MaterialProductVO> getMaterial() throws Exception{
    	return mainDAO.getMaterial();
    }
	
	public List<ToDoListVO> getList() throws Exception{
		return mainDAO.getList();
	}
	
	public int setAdd(ToDoListVO toDoListVO) throws Exception{
		return mainDAO.setAdd(toDoListVO);
	}
	
    public int setUpdate(ToDoListVO toDoListVO) throws Exception{
    	return mainDAO.setUpdate(toDoListVO);
    }
	
	public int setDelete(ToDoListVO toDoListVO) throws Exception{
		return mainDAO.setDelete(toDoListVO);
	}
}
