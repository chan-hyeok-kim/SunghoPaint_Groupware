package com.ham.len.admin.notice;

import com.ham.len.commons.CodeVO;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class AttachmentVO extends CodeVO {

	private Long fileNo;
	private Long noticeNo;
	private String filePath;
	private String fileName;
	private String originalName;
	
}
