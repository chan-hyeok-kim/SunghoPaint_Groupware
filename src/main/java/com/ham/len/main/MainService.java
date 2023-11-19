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
	
    public List<MaterialProductVO> getMaterial(String category) throws Exception{
    	return mainDAO.getMaterial(category);
    }
	
	public List<ToDoListVO> getToDoList(String id) throws Exception{
		return mainDAO.getToDoList(id);
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
	
	public int setAlarmAdd(NotificationVO notificationVO) throws Exception{
		return mainDAO.setAlarmAdd(notificationVO);
	}
	
	public int setAlarmUpdate(NotificationVO notificationVO) throws Exception{
		return mainDAO.setAlarmUpdate(notificationVO);
	}
	
	public List<NotificationVO> getAlarmList(String id) throws Exception{
		return mainDAO.getAlarmList(id);
	}
	
	public Long getLastDetail(ToDoListVO toDoListVO) throws Exception{
		return mainDAO.getLastDetail(toDoListVO);
	}
	
	public List<NotificationVO> getAjaxAlarmList(String id) throws Exception{
		return mainDAO.getAjaxAlarmList(id);
	}
	
	
	
	
	
}
