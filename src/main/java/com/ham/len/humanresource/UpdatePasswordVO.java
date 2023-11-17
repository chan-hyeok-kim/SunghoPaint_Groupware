package com.ham.len.humanresource;

import javax.validation.constraints.Pattern;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class UpdatePasswordVO {
	private String curPassword;
	
	@Pattern(regexp = "^(?=.*[0-9])(?=.*[a-zA-Z])(?=.*[!@#$%^&*()_+\\-=\\[\\]{};':\",.<>?]).{8,16}$", message = "형식에 맞지 않는 비밀번호입니다.")
	private String newPassword;
	
	@Pattern(regexp = "^(?=.*[0-9])(?=.*[a-zA-Z])(?=.*[!@#$%^&*()_+\\-=\\[\\]{};':\",.<>?]).{8,16}$", message = "형식에 맞지 않는 비밀번호입니다.")
	private String checkNewPassword;
}