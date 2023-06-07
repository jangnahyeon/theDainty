package dlink.admin.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.egovframe.rte.fdl.property.EgovPropertyService;
import org.egovframe.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;



import dlink.admin.service.TCodeService;
import dlink.admin.vo.SearchVO;
import dlink.admin.vo.TCodeVO;
import dlink.admin.vo.TMemAccptVO;

/**
 * @Class Name : TCodeController.java
 * @Description : TCode Controller class
 * @Modification Information
 *
 * @author 안성찬
 * @since 2022-03-30
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */

@Controller
@RequestMapping("/admin/code")
public class AdminCodeController {

    @Resource(name = "TCodeService")
    private TCodeService TCodeService;
    
    /** EgovPropertyService */
    @Resource(name = "propertiesService")
    protected EgovPropertyService propertiesService;
	
    /**
	 * t_code 목록을 조회한다. (pageing)
	 * @param searchVO - 조회할 정보가 담긴 SerchVo
	 * @return "/TCode/TCodeList"
	 * @exception Exception
	 */
    @RequestMapping(value="/codeMagmtList.do")
    public String codeMagmtList(@ModelAttribute("searchVO") TCodeVO searchVO, 
    		ModelMap model, HttpSession session)
            throws Exception {
    	//사용자 로그인 확인 Start
		TMemAccptVO loginVO = (TMemAccptVO) session.getAttribute("DlinkLogin");
		if(loginVO == null) {
			model.addAttribute("msg", "fail");
			return "redirect:/admin/login.do";
		}
		//사용자 로그인 확인 End
		
		try {
			
			/** EgovPropertyService.sample */
			searchVO.setPageUnit(propertiesService.getInt("pageUnit"));
			searchVO.setPageSize(propertiesService.getInt("pageSize"));
			
			/** pageing */
			PaginationInfo paginationInfo = new PaginationInfo();
			paginationInfo.setCurrentPageNo(searchVO.getPageIndex());
			paginationInfo.setRecordCountPerPage(searchVO.getPageUnit());
			paginationInfo.setPageSize(searchVO.getPageSize());
			
			searchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
			searchVO.setLastIndex(paginationInfo.getLastRecordIndex());
			searchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
			
			searchVO.setUseYn(null);
			List<?> TCodeList = TCodeService.selectTCodeList(searchVO);
			model.addAttribute("resultList", TCodeList);
			
			int totCnt = TCodeService.selectTCodeListTotCnt(searchVO);
			paginationInfo.setTotalRecordCount(totCnt);
			model.addAttribute("paginationInfo", paginationInfo);
  		  
  		} catch (Exception e) {
  			
  			e.printStackTrace();
  			
  		}
        
        return "/admin/code/codeMagmtList";
    } 
    
    @RequestMapping("/codeMagmtDetail.do")
    public String codeMagmtDetail(
            @ModelAttribute("searchVO") TCodeVO searchVO, Model model)
            throws Exception {
    	try {
    		  
    		TCodeVO TCodeVO = new TCodeVO();
    		TCodeVO.setCode(searchVO.getCode());
    		
    		model.addAttribute("searchVO",searchVO);
    		model.addAttribute("result",TCodeService.selectTCode(TCodeVO));
  		} catch (Exception e) {
  			
  			e.printStackTrace();
  			
  		}
    	
        return "/admin/code/codeMagmtDetail";
    }
    
    @RequestMapping("/codeMagmtInsertView.do")
    public String codeMagmtInsertView(
            @ModelAttribute("searchVO") SearchVO searchVO, Model model)
            throws Exception {
        TCodeVO TCodeVO = new TCodeVO();
        
        model.addAttribute("searchVO",searchVO);
        model.addAttribute("result",TCodeVO);
        return "/admin/code/codeMagmtWrite";
    }
    
    @RequestMapping("/codeMagmtUpdateView.do")
    public String codeMagmtUpdateView(
            @ModelAttribute("searchVO") TCodeVO searchVO, Model model)
            throws Exception {
    	
    	try {
    		  
    		TCodeVO TCodeVO = new TCodeVO();
    		TCodeVO.setCode(searchVO.getCode());
    		// 변수명은 CoC 에 따라 TCodeVO
    		
    		model.addAttribute("searchVO",searchVO);
    		model.addAttribute("result",TCodeService.selectTCode(TCodeVO));
  		} catch (Exception e) {
  			
  			e.printStackTrace();
  			
  		}
        return "/admin/code/codeMagmtWrite";
    }
    
    
    @RequestMapping("/codeMagmtInsert.do")
    public String codeMagmtInsert(
            TCodeVO TCodeVO,
            @ModelAttribute("searchVO") SearchVO searchVO, SessionStatus status, Model model, HttpSession session)
            throws Exception {
    	//사용자 로그인 확인 Start
		TMemAccptVO loginVO = (TMemAccptVO) session.getAttribute("DlinkLogin");
		if(loginVO == null) {
			model.addAttribute("msg", "fail");
			return "redirect:/admin/login.do";
		}
		//사용자 로그인 확인 End
    	
		try {
	  		  
			TCodeVO.setRegister(loginVO.getLoginId());
			TCodeVO.setUpdater(loginVO.getLoginId());
			TCodeService.insertTCode(TCodeVO);
			status.setComplete();
  		} catch (Exception e) {
  			
  			e.printStackTrace();
  			
  		}
		
        
        return "redirect:/admin/code/codeMagmtList.do";
    }
    

    @RequestMapping("/codeMagmtUpdate.do")
    public String codeMagmtUpdate(
            TCodeVO TCodeVO,
            @ModelAttribute("searchVO") SearchVO searchVO, SessionStatus status, Model model, HttpSession session)
            throws Exception {
    	//사용자 로그인 확인 Start
		TMemAccptVO loginVO = (TMemAccptVO) session.getAttribute("DlinkLogin");
		if(loginVO == null) {
			model.addAttribute("msg", "fail");
			return "redirect:/admin/login.do";
		}
		//사용자 로그인 확인 End
    	
		try {
	  		  
			TCodeVO.setUpdater(loginVO.getLoginId());
			
			TCodeService.updateTCode(TCodeVO);
			status.setComplete();
  		} catch (Exception e) {
  			
  			e.printStackTrace();
  			
  		}
		
        
        return "redirect:/admin/code/codeMagmtList.do";
    }
    
    @RequestMapping("/codeMagmtDelete.do")
    public String codeMagmtDelete(
            TCodeVO TCodeVO,
            @ModelAttribute("searchVO") SearchVO searchVO, SessionStatus status, Model model, HttpSession session)
            throws Exception {
    	//사용자 로그인 확인 Start
		TMemAccptVO loginVO = (TMemAccptVO) session.getAttribute("DlinkLogin");
		if(loginVO == null) {
			model.addAttribute("msg", "fail");
			return "redirect:/admin/login.do";
		}
		//사용자 로그인 확인 End
		
		try {
	  		  
			TCodeService.deleteTCode(TCodeVO);
			status.setComplete();
			
			model.addAttribute("searchVO",searchVO);
  		} catch (Exception e) {
  			
  			e.printStackTrace();
  			
  		}
        return "redirect:/admin/code/codeMagmtList.do";
    }

}
