package com.ham.len.humanresource;

import java.sql.Date;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import com.ham.len.commons.CodeVO;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import lombok.extern.slf4j.Slf4j;

@Getter
@Setter
@ToString
@Slf4j
public class HumanResourceVO extends CodeVO implements UserDetails {
	private String employeeID;
	private String password;
	private Date joinDate;
	private Byte joinType;
	@Pattern(regexp = "^[가-힣]{2,5}$", message = "올바르지 않은 '이름'입니다.")
	private String name;
	private Date birth;
	@NotEmpty(message = "'부서'를 선택해주세요.")
	private String departmentCd;
	private String departmentCdName;
	@NotEmpty(message = "'직급'을 선택해주세요.")
	private String positionCd;
	private String positionCdName;
	@NotNull(message = "'근속연수'를 선택해주세요.")
	private Integer yearsOfService;
	private String extensionNumber;
	@Pattern(regexp = "^01([0|1|6|7|8|9])([0-9]{3,4})([0-9]{4})$", message = "올바르지 않은 '휴대폰 번호'입니다.")
	private String phone;
	private String mainNumber;
	@Pattern(regexp = "^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,4}$", message = "올바르지 않은 '이메일'입니다.")
	private String email;
	@NotEmpty(message = "주소를 입력해주세요.")
	private String address;
	@Pattern(regexp = "^[가-힣]{2,10}$", message = "올바르지 않은 '은행'입니다.")
	private String bank;
	@Pattern(regexp = "^[0-9]{1,30}$", message = "올바르지 않은 '계좌번호'입니다.")
	private String accountNumber;
	@Pattern(regexp = "^[가-힣]{2,5}$", message = "올바르지 않은 '예금주'입니다.")
	private String accountHolder;
	private Byte approvalAuthority = 0;
	private String signature;
	private Date quitDate;
	private String quitReason;
	private String profile;
	private List<RoleVO> roles = new ArrayList<>(); // NullPointerException 방지
	private Date appDate;
	
	public Date getQuitDate() {
		if(Date.valueOf("1995-07-28").equals(quitDate)) {
			return null;
		}
		
		return quitDate;
	}
	
	@Override
	public String getUsername() {
		return employeeID;
	}
	
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities(){
		List<GrantedAuthority> authorities = new ArrayList<>();
		
		for(RoleVO roleVO : roles) {
			authorities.add(new SimpleGrantedAuthority(roleVO.getRoleName()));
		}
		
		return authorities;
	}
	
	@Override
	public boolean isAccountNonExpired() {
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		return true;
	}

	@Override
	public boolean isEnabled() {
		return true;
	}
}