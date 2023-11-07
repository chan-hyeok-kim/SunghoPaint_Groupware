package com.ham.len.humanresource;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class HumanResourceService implements UserDetailsService {
	@Autowired
	private HumanResourceDAO humanResourceDAO;
	
	@Autowired
	PasswordEncoder passwordEncoder;

	@Override
	public UserDetails loadUserByUsername(String employeeID) throws UsernameNotFoundException {
		log.warn("========== 김민진{} ==========", employeeID);
		List<HumanResourceVO> humanResourceVO = humanResourceDAO.getHumanResource(employeeID);
		log.warn("========== {} ==========",humanResourceVO);
		log.warn("{}", humanResourceVO);
		return (UserDetails) humanResourceVO;
	}
}