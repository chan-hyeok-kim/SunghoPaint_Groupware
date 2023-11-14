package com.ham.len.humanresource.todolist;

import com.ham.len.commons.CodeVO;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ToDoListVO extends CodeVO {

	private Long toDoListNo;
	private String employeeID;
	private String toDoListContents;
	private Boolean toDoListCheck;
}
