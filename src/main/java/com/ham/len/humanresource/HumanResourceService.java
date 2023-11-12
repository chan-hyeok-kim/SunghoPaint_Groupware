package com.ham.len.humanresource;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import org.apache.tomcat.util.codec.binary.Base64;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.validation.BindingResult;
import org.springframework.web.multipart.MultipartFile;

import com.ham.len.annual.AnnualDAO;
import com.ham.len.annual.AnnualVO;
import com.ham.len.commons.CodeVO;
import com.ham.len.util.ExcelWriter;
import com.ham.len.util.SMTP;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class HumanResourceService implements UserDetailsService {
	@Autowired
	private HumanResourceDAO humanResourceDAO;
	
	@Autowired
	private AnnualDAO annualDAO;
	
	public static final int ROLE_USER = 3;
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	@Autowired
	private ExcelWriter excelWriter;

	@Override
	public UserDetails loadUserByUsername(String employeeID) throws UsernameNotFoundException {
		HumanResourceVO humanResourceVO = humanResourceDAO.getHumanResource(employeeID);
		return humanResourceVO;
	}
	
	@Transactional
	public int setRegistration(HumanResourceVO humanResourceVO, MultipartFile file) throws Exception {
		humanResourceVO.setProfile(encodeImageToBase64(file));
		String temporaryPassword = generateTemporaryPassword();
		humanResourceVO.setPassword(passwordEncoder.encode(generateTemporaryPassword()));
		
		int result = humanResourceDAO.setRegistration(humanResourceVO);
		String employeeID = humanResourceDAO.getLatestEmployeeID();
		humanResourceVO.setEmployeeID(employeeID);
		humanResourceVO.setPassword(temporaryPassword);
		
		AnnualVO annualVO = new AnnualVO();
		annualVO.setEmployeeID(employeeID);
		annualDAO.setAnnual(annualVO);
		
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
		if(file != null && !file.isEmpty()) {
			byte[] fileContent = file.getBytes();
			byte[] encodedBytes = Base64.encodeBase64(fileContent);
			String base64String = new String(encodedBytes);
			
			String fileName = file.getOriginalFilename();
			String extension = fileName.substring(fileName.lastIndexOf(".") + 1);
			
			base64String = "data:image/" + extension + ";base64," + base64String;
			
			return base64String;
		}
		
		return null;
	}
	
	public List<HumanResourceVO> getHumanResourceList(HumanResourcePager pager){
		pager.makeRowNum();
		pager.makePageNum(humanResourceDAO.getTotal(pager));
		return humanResourceDAO.getHumanResourceList(pager);
	}
	
	public List<CodeVO> getDepartmentList(){
		return humanResourceDAO.getDepartmentList();
	}
	
	public HumanResourceVO getHumanResource(String employeeID){
		return humanResourceDAO.getHumanResource(employeeID);
	}
	
	public void excelDownload() {
		Map<String, List<HumanResourceExcelVO>> data = new HashMap<>();
		
		List<CodeVO> departmentList = humanResourceDAO.getDepartmentList();
		for(CodeVO department : departmentList) {
			List<HumanResourceExcelVO> departmentalHumanResourceList = humanResourceDAO.getDepartmentalHumanResourceList(department.getCode());
			data.put(department.getCode(), departmentalHumanResourceList);
		}
		
		excelWriter.write(data, "humanresource.xlsx", "전사 인사 정보.xlsx");
	}
	
	public int setUpdate(HumanResourceVO humanResourceVO, MultipartFile file) throws Exception {
		humanResourceVO.setProfile(encodeImageToBase64(file));
		return humanResourceDAO.setUpdate(humanResourceVO);
	}
	
	public int setDelete(String employeeID) {
		return humanResourceDAO.setDelete(employeeID);
	}
	
	public boolean getUpdatePasswordError(UpdatePasswordVO updatePasswordVO, BindingResult bindingResult, HumanResourceVO humanResourceVO) {
		boolean hasErrors = false;
		if(!passwordEncoder.matches(updatePasswordVO.getCurPassword(), humanResourceVO.getPassword())) {
			hasErrors = true;
			bindingResult.rejectValue("curPassword", "updatePasswordVO.password.equalCheck");
		}
		
		if(bindingResult.getFieldError("checkNewPassword") == null && !updatePasswordVO.getNewPassword().equals(updatePasswordVO.getCheckNewPassword())) {
			hasErrors = true;
			bindingResult.rejectValue("checkNewPassword", "updatePasswordVO.password.equalCheck");
		}
		
		return hasErrors;
	}
	
	@Transactional
	public int setUpdatePassword(HumanResourceVO humanResourceVO) {
		String password = humanResourceVO.getPassword();
		humanResourceVO.setPassword(passwordEncoder.encode(password));
		int result = humanResourceDAO.setUpdatePassword(humanResourceVO);
		
		AccountRoleVO accountRoleVO = new AccountRoleVO();
		accountRoleVO.setRoleNum(ROLE_USER);
		accountRoleVO.setEmployeeID(humanResourceVO.getEmployeeID());
		humanResourceDAO.setAccountRole(accountRoleVO);
		
		return result;
	}
}