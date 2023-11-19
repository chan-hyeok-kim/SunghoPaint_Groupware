package com.ham.len.admin.notice;

import java.util.List;

import com.ham.len.commons.CodeVO;
import com.ham.len.humanresource.HumanResourceVO;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class NoticeVO extends CodeVO {

	private Long noticeNo;
	private String employeeID;
	private String noticeTitle;
	private String noticeContents;
	private Long noticeHit;
	private String noticePriorityCd;
	
	private String priorCdName;
	private HumanResourceVO humanResourceVO;
	private List<AttachmentVO> attachmentVOs;
}
