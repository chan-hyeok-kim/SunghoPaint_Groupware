package com.ham.len.attendance;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface AttendanceDAO {
	public List<AttendanceVO> getStatus();
}