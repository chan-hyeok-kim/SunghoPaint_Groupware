package com.ham.len.main;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ham.len.humanresource.todolist.ToDoListVO;
import com.ham.len.materialProduct.MaterialProductVO;

@Mapper
public interface MainDAO {

	public List<MaterialProductVO> getMaterial() throws Exception;
	
	public List<ToDoListVO> getList() throws Exception;
	
	public int setAdd(ToDoListVO toDoListVO) throws Exception;
	
	public int setUpdate(ToDoListVO toDoListVO) throws Exception;
	
	public int setDelete(ToDoListVO toDoListVO) throws Exception;
	
	public List<NotificationVO> getAlarmList(String id) throws Exception;
	
}
