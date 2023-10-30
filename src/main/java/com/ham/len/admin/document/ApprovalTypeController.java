package com.ham.len.admin.document;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.ham.len.admin.CodeService;
import com.ham.len.admin.CodeVO;
import com.ham.len.approval.ApprovalService;
import com.ham.len.commons.MakeColumn;
import com.ham.len.commons.Pager;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/document/*")
@Transactional(rollbackFor = Exception.class)
public class ApprovalTypeController {

	@Autowired
	private ApprovalTypeService approvalTypeService;
	
	@Autowired
	private CodeService codeService;
	
	@Autowired
	private MakeColumn makeColumn;
	
	private String id="2023001";
	
	@GetMapping("list")
	public void getList(Pager pager,Model model) throws Exception{
		
		List<ApprovalTypeVO> total=approvalTypeService.getTotalList(pager);
		
		log.warn("======={}========",total);
		
		model.addAttribute("list", total);
		
		
	}
	
	@GetMapping("upList")
	@ResponseBody
	public List<ApprovalUpTypeVO> getUplist(Pager pager) throws Exception{
		List<ApprovalUpTypeVO> aur=approvalTypeService.getUpList(pager);
		
		return aur;
	}
	
	@GetMapping("add")
	public void setAdd(ApprovalUpTypeVO approvalUpTypeVO,Model model) throws Exception{
		approvalUpTypeVO=approvalTypeService.getUpDetail(approvalUpTypeVO);
		log.warn("====={}========",approvalUpTypeVO);
		model.addAttribute("vo", approvalUpTypeVO);
	}
	
	@PostMapping("add")
	public void setAdd(ApprovalTypeVO approvalTypeVO, HttpServletRequest request) throws Exception{
		
		
		approvalTypeVO.setEmployeeId(id);
		String path=request.getRequestURI();
		log.warn("====={}======",path);
		approvalTypeVO=(ApprovalTypeVO)makeColumn.getColumn(approvalTypeVO, path, id);
		
		//현재approvalUpTypeVO에 담긴값
		//코드네임, 해당 테이블의 코드
		//채워야될값: 코드, 업코드
		//이제 해당 VO에는 코드가 담기지 않게 하는 거지.
		
		CodeVO codeVO=makeColumn.setUpCode(approvalTypeVO, request);
	    String code=codeService.getLastId(approvalTypeVO);
	    //이 codeVO에는 코드만 있다. 최신 코드에 +1된 값
	    approvalTypeVO.setApprovalTypeCd(code);
	    approvalTypeVO.setCode(code);
	    approvalTypeVO.setUpCode(code.substring(0,3));
	    
	    approvalTypeVO=(ApprovalTypeVO)makeColumn.getColumn(approvalTypeVO, path, id);
	    
	    log.warn("====={}======",approvalTypeVO);
	    
	    int result=codeService.setAdd(approvalTypeVO);
		result=approvalTypeService.setAdd(approvalTypeVO);
	}
	
	@PostMapping("setImg")
	public void setImg(MultipartFile[] files) throws Exception{
		
	}
	
	@GetMapping("ajaxList")
	@ResponseBody
	public Map<String, Object> getAjaxList(Pager pager) throws Exception{
		List<ApprovalTypeVO> ar=approvalTypeService.getList(pager);
		List<ApprovalTypeVO> total=approvalTypeService.getTotalList(pager);
		
		Map<String, Object> map = new HashMap<>();
		map.put("list", ar);
		map.put("total", total);
		return map;
	}
	
	/*
	 * @GetMapping("ajaxTotalList")
	 * 
	 * @ResponseBody public List<ApprovalUpTypeVO> getAjaxTotalList(Pager pager)
	 * throws Exception{ List<ApprovalUpTypeVO>
	 * ar=approvalTypeService.getTotalList(pager); return ar; }
	 */
	
	
	
    @PostMapping("upAdd")
    public String setUpAdd(ApprovalUpTypeVO approvalUpTypeVO,HttpServletRequest request) throws Exception{
    	
    	approvalUpTypeVO.setEmployeeId(id);
    	String path=request.getRequestURI();
    	approvalUpTypeVO=(ApprovalUpTypeVO)makeColumn.getColumn(approvalUpTypeVO, path, id);
    	
    	String code=approvalUpTypeVO.getApprovalUpTypeCd();
    	approvalUpTypeVO.setCode(code);
	    approvalUpTypeVO.setUpCode(code.substring(0,3));
	    
	    approvalUpTypeVO=(ApprovalUpTypeVO)makeColumn.getColumn(approvalUpTypeVO, path, id);
	    
	    
	    int result=codeService.setAdd(approvalUpTypeVO);
		result=approvalTypeService.setUpAdd(approvalUpTypeVO);
	
    	return "redirect:./list";
    }
	
    
	
}
