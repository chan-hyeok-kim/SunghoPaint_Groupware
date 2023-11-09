package com.ham.len.admin.notice;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class AttachmentVO {

	private Long fileNo;
	private Long noticeNo;
	private String fileName;
	private String originalName;
}
