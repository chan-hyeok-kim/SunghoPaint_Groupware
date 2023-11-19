package com.ham.len.admin.document;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.ham.len.admin.CodeService;
import com.ham.len.commons.CodeVO;
import com.ham.len.approval.ApprovalService;

import com.ham.len.commons.Pager;
import com.ham.len.commons.ZtreeVO;
import com.ham.len.humanresource.HumanResourceVO;

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
	
	
	
	@Value("${approval.typeup.cd}")
	private String typeUpCd;
	
	@GetMapping("list")
	public void getList(Pager pager,Model model) throws Exception{
		
		List<ApprovalTypeVO> total=approvalTypeService.getTotalList(pager);
		
		log.warn("======={}========",total);
		
		model.addAttribute("list", total);
		
		
	}
	
	@GetMapping("ajaxFullList")
	@ResponseBody
	public List<ZtreeVO> getList(Pager pager) throws Exception{
		
		List<ApprovalTypeVO> total=approvalTypeService.getTotalList(pager);
		
		log.warn("======={}========",total);
		List<ZtreeVO> zl=new ArrayList<>();
		for(ApprovalTypeVO t : total) {
			ZtreeVO ztreeVO=new ZtreeVO();
			
			ztreeVO.setUpCodeName(t.getApprovalUpTypeVO().getCodeName());
			ztreeVO.setCodeName(t.getCodeName());
			ztreeVO.setCd(t.getApprovalUpTypeVO().getApprovalUpTypeCd());
			ztreeVO.setNum(t.getApprovalTypeNo());
			ztreeVO.setNo(t.getApprovalUpTypeVO().getApprovalUpTypeNo());
			ztreeVO.setRefNo(t.getApprovalUpTypeNo());
			ztreeVO.setApprovalForm(t.getApprovalForm());
			ztreeVO.setIcon("/css/zTreeStyle/img/diy/2.png");
			
			zl.add(ztreeVO);
		}
		
		return zl;
	}
	
	
	
	@GetMapping("upList")
	@ResponseBody
	public List<ApprovalUpTypeVO> getUplist(Pager pager) throws Exception{
		List<ApprovalUpTypeVO> aur=approvalTypeService.getUpList();
		
		return aur;
	}
	
	@GetMapping("add")
	public void setAdd(ApprovalUpTypeVO approvalUpTypeVO,Model model) throws Exception{
		approvalUpTypeVO=approvalTypeService.getUpDetail(approvalUpTypeVO);
		log.warn("====={}========",approvalUpTypeVO);
		model.addAttribute("vo", approvalUpTypeVO);
	}
	
	@PostMapping("add")
	public String setAdd(ApprovalTypeVO approvalTypeVO) throws Exception{
		HumanResourceVO humanResourceVO=(HumanResourceVO)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String id=humanResourceVO.getEmployeeID();
		
		approvalTypeVO.setEmployeeID(id);

		
		//현재approvalTypeVO에 담긴값
		//코드네임, 해당 테이블의 코드
		//채워야될값: 코드, 업코드
		//이제 해당 VO에는 코드가 담기지 않게 하는 거지.
		CodeVO codeVO = new CodeVO();
		codeVO.setUpCode(typeUpCd);
	    String code=codeService.getLastId(codeVO);
	    
	    if(code==null) {
	    	code="R011";
	    }
	    log.warn("&&&&&&&{}&&&&&&&",code);
	    //이 codeVO에는 코드만 있다. 최신 코드에 +1된 값
	    approvalTypeVO.setApprovalTypeCd(code);
	    approvalTypeVO.setCode(code);
	    approvalTypeVO.setUpCode(code.substring(0,3));
	    
	   
	    log.warn("====={}======",approvalTypeVO);
	    
	    int result=codeService.setAdd(approvalTypeVO);
		result=approvalTypeService.setAdd(approvalTypeVO);
		
		return "redirect:/document/list";
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
    public String setUpAdd(ApprovalUpTypeVO approvalUpTypeVO) throws Exception{
    	HumanResourceVO humanResourceVO=(HumanResourceVO)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String id=humanResourceVO.getEmployeeID();
		
    	approvalUpTypeVO.setEmployeeID(id);
    
    	String code=approvalUpTypeVO.getApprovalUpTypeCd();
    	approvalUpTypeVO.setCode(code);
	    approvalUpTypeVO.setUpCode(code.substring(0,3));
	    
	
	    
	    int result=codeService.setAdd(approvalUpTypeVO);
		result=approvalTypeService.setUpAdd(approvalUpTypeVO);
	
    	return "redirect:./list";
    }
	
    @GetMapping("update")
    public void setUpdate(ApprovalTypeVO approvalTypeVO,Model model) throws Exception{
    	approvalTypeVO=approvalTypeService.getDetail(approvalTypeVO);
    	List<ApprovalUpTypeVO> ar=approvalTypeService.getUpList();
    	
    	
    	model.addAttribute("list", ar);
    	model.addAttribute("vo", approvalTypeVO);
    }
    
    @PostMapping("update")
    public String setUpdate(ApprovalTypeVO approvalTypeVO, String upTypeCodeName) throws Exception{
    	
    
    	HumanResourceVO humanResourceVO=(HumanResourceVO)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String id=humanResourceVO.getEmployeeID();
		
    	
    	ApprovalUpTypeVO approvalUpTypeVO=approvalTypeService.getDetailByName(upTypeCodeName);
    	Long upTypeNo=approvalUpTypeVO.getApprovalUpTypeNo();
    	log.warn("*******{}**********",approvalTypeVO);
    	approvalTypeVO.setApprovalUpTypeNo(upTypeNo);
    	//해야하는게뭔데
    	//수정용 코드테이블 만들어서 보내줘야함
    	
    	String code=approvalTypeVO.getApprovalTypeCd();
    	approvalTypeVO.setCode(code);
    	approvalTypeVO.setOriginCode(code);
    	approvalTypeVO.setUpCode(code.substring(0,3));
    	
    	log.warn("*******{}**********",approvalTypeVO);
    	int result=approvalTypeService.setUpdate(approvalTypeVO);
    	log.warn("코드네임{}",approvalTypeVO.getCodeName());
    	result=codeService.setUpdate(approvalTypeVO);
    	
    	return "redirect:/document/list";
    }
    
    @PostMapping("delete")
    public String setDelete(@RequestParam(value = "typeNoArr[]", required = false) List<String> typeNoArr,Model model) throws Exception{
    	log.warn("**********{}********",typeNoArr);
    	int result=0;
    	if(typeNoArr!=null) {
    	for(String t: typeNoArr) {
    	    ApprovalTypeVO approvalTypeVO=new ApprovalTypeVO();
    	    approvalTypeVO.setApprovalTypeNo(Long.parseLong(t));
    	    
    	    result=approvalTypeService.setDelete(approvalTypeVO);
    	    }
    	}
    	model.addAttribute("result", result);
    	return "commons/ajaxResult";
    }
    
    @PostMapping("upCheck")
    public String setUpCheck(String approvalUpTypeCd,Model model) throws Exception{
    	Long result=approvalTypeService.checkByCd(approvalUpTypeCd);
    	
    	model.addAttribute("result", result);
    	return "commons/ajaxResult";
    	
    }
    
   
    
    
	
}
