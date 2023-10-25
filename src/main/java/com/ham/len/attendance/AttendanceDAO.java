package com.ham.len.attendance;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface AttendanceDAO {
	public List<AttendanceVO> getStatus(Map<String, String> params);
}