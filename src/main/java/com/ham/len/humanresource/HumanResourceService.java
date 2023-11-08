package com.ham.len.humanresource;

import java.io.Console;
import java.util.Random;

import org.apache.tomcat.util.codec.binary.Base64;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.ham.len.util.SMTP;

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
		HumanResourceVO humanResourceVO = humanResourceDAO.getHumanResource(employeeID);
		return humanResourceVO;
	}
	
	public int setRegistration(HumanResourceVO humanResourceVO, MultipartFile file) throws Exception {
		humanResourceVO.setProfile(encodeImageToBase64(file));
		String temporaryPassword = generateTemporaryPassword();
		humanResourceVO.setPassword(passwordEncoder.encode("1234"));
		
		int result = humanResourceDAO.setRegistration(humanResourceVO);
		humanResourceVO.setEmployeeID(humanResourceDAO.getLatestEmployeeID());
		humanResourceVO.setPassword(temporaryPassword);
		
		new SMTP().send_mail(humanResourceVO);
		
		return result;
	}
	
	private String generateTemporaryPassword() {
		String temporaryPassword = "";
		
		Random rand = new Random();
		for(int i = 0; i < 8; i++) {
			if(rand.nextInt(2) == 0) {
				temporaryPassword += rand.nextInt(10); // 0 ~ 9
			}else {
				temporaryPassword += (char)(rand.nextInt(26) + 97); // 97(a) ~ 122(z)
			}
		}
		
		return temporaryPassword;
	}
	
	private String encodeImageToBase64(MultipartFile file) throws Exception {
		byte[] fileContent = file.getBytes();
		byte[] encodedBytes = Base64.encodeBase64(fileContent);
		String base64String = new String(encodedBytes);
		return base64String;
	}
}