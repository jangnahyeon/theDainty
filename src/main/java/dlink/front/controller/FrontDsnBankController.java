package dlink.front.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.egovframe.rte.fdl.property.EgovPropertyService;
import org.egovframe.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;

import dlink.admin.service.TCodeService;
import dlink.admin.service.TDsnBankService;
import dlink.admin.vo.TCodeVO;
import dlink.admin.vo.TDsnBankVO;
import dlink.admin.vo.TMemAccptVO;
import dlink.common.service.TAttfileService;
import dlink.front.service.FrontDsnBankService;
import dlink.front.vo.FrontDsnBankVO;


/**
 * @Class Name : TDsnBankController.java
 * @Description : TDsnBank Controller class
 * @Modification Information
 *
 * @author 장나현
 * @since 2022-04-11
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */

@Controller
@RequestMapping("/front/dsn")
public class FrontDsnBankController {

    @Resource(name = "TDsnBankService")
    private TDsnBankService TDsnBankService;
    
    @Resource(name = "FrontDsnBankService")
    private FrontDsnBankService FrontDsnBankService;
    
    /** EgovPropertyService */
    @Resource(name = "propertiesService")
    protected EgovPropertyService propertiesService;
	
    @Resource(name = "TCodeService")
    private TCodeService TCodeService;
    
    /**
	 * t_dsn_bank 목록을 조회한다. (pageing)
	 * @param searchVO - 조회할 정보가 담긴 TDsnBankVO
	 * @return "/TDsnBank/TDsnBankList"
	 * @exception Exception
	 */
    @RequestMapping(value="/dsnBankList.do")
    public String dsnBankList(@ModelAttribute("searchVO") FrontDsnBankVO searchVO, HttpSession session,
    		ModelMap model)
            throws Exception {
    	
    	if(session.getAttribute("DLinkDsnBank") == null) {
    		FrontDsnBankService.createTable(searchVO);
    		session.setAttribute("DLinkDsnBank","Y");
    	}
    	
    	/** EgovPropertyService.sample */
    	searchVO.setPageUnit(propertiesService.getInt("pageUnit"));
    	searchVO.setPageSize(propertiesService.getInt("pageSize"));
    	
    	/** pageing */
    	PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(searchVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(searchVO.getPageUnit());
		paginationInfo.setPageSize(20);
		
		searchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		searchVO.setLastIndex(paginationInfo.getLastRecordIndex());
		searchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		
		try {
			
			List<?> TDsnBankList = FrontDsnBankService.selectDsnBankList(searchVO);
			model.addAttribute("resultList", TDsnBankList);
			
		}catch (Exception e) {
			FrontDsnBankService.createTable(searchVO);
    		session.setAttribute("DLinkDsnBank","Y");
    		
    		List<?> TDsnBankList = FrontDsnBankService.selectDsnBankList(searchVO);
			model.addAttribute("resultList", TDsnBankList);
		}
        
        int totCnt = FrontDsnBankService.selectDsnBankListTotCnt(searchVO);
		paginationInfo.setTotalRecordCount(totCnt);
        model.addAttribute("paginationInfo", paginationInfo);
        
        TCodeVO codeVO = new TCodeVO();
    	codeVO.setUseYn("Y");
    	codeVO.setGubun("PA");
    	List<TCodeVO> codeList = TCodeService.selectTCodeList(codeVO);
    	model.addAttribute("codeList", codeList);
    	
        return "/front/dsnBank/dsnBankList";
    } 
    
    @ResponseBody
    @RequestMapping(value="/dsnBankAjaxSelect.do")
    public ResponseEntity<String> menuAjaxSelect(@ModelAttribute("searchVO") TDsnBankVO searchVO, 
    		ModelMap model, HttpServletResponse response)
            throws Exception {
    	HttpHeaders resHeaders = new HttpHeaders();
	    resHeaders.add("Content-Type", "application/json;charset=UTF-8");
	    ResponseEntity<String> jsonResult = null;
	    try {
	  		  
	    	TDsnBankVO result = TDsnBankService.selectTDsnBank(searchVO);
	    	
	    	if(result == null) result = new TDsnBankVO();
	    	
	    	ObjectMapper om = new ObjectMapper();
	    	String return_value = om.writeValueAsString(result);
	    	
	    	jsonResult = new ResponseEntity<String> (return_value, resHeaders, HttpStatus.CREATED);
  		} catch (Exception e) {
  			
  			e.printStackTrace();
  			
  		}
        return jsonResult;
    }
    
    
    @ResponseBody
    @RequestMapping(value="/dsnBankFavoriteAjax.do")
    public String dsnBankAjaxInsert(@ModelAttribute("searchVO") FrontDsnBankVO searchVO,  HttpSession session,
    		ModelMap model, HttpServletResponse response)
            throws Exception {
    	String msg = "";
	    try {
	    	//사용자 로그인 확인 Start
			TMemAccptVO loginVO = (TMemAccptVO) session.getAttribute("DlinkLogin");
			if(loginVO == null) {
				model.addAttribute("msg", "fail");
				return "redirect:/front/login.do";
			}
			//사용자 로그인 확인 End
	    	searchVO.setUserId(loginVO.getLoginId());
	    	searchVO.setSelGb("dsn");
	    	
	    	if(FrontDsnBankService.selectDsnBankFavoriteCnt(searchVO) > 0) {
	    		FrontDsnBankService.deleteDsnBank(searchVO);
	    	} else {
	    		FrontDsnBankService.insertDsnBank(searchVO);
	    	}
	    	
	    	msg = "succes";
  		} catch (Exception e) {
  			msg = "fail";
  			e.printStackTrace();
  			
  		}
        return msg;
    }
    
}
