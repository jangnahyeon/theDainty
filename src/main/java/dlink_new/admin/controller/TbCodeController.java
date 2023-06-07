package dlink_new.admin.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import org.egovframe.rte.fdl.property.EgovPropertyService;
import org.egovframe.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

import dlink_new.admin.service.TbCodeService;
import dlink_new.admin.vo.TbCodeDefaultVO;
// Vo 객체에 대한 import 구문
// import (vo package).TbCodeDefaultVO;
// import (vo package).TbCodeVO;
import dlink_new.admin.vo.TbCodeVO;

/**
 * @Class Name : TbCodeController.java
 * @Description : TbCode Controller class
 * @Modification Information
 *
 * @author 김현재
 * @since 2023-01-18
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */

@Controller
//@SessionAttributes(types=TbCodeVO.class)
@RequestMapping("/admin")
public class TbCodeController {

    @Resource(name = "tbCodeService")
    private TbCodeService tbCodeService;
    
    /** EgovPropertyService */
    @Resource(name = "propertiesService")
    protected EgovPropertyService propertiesService;
	
    /**
	 * tb_code 목록을 조회한다. (pageing)
	 * @param searchVO - 조회할 정보가 담긴 TbCodeDefaultVO
	 * @return "/tbCode/TbCodeList"
	 * @exception Exception
	 */
    @RequestMapping(value={"/tbCode/TbCodeList.do", "/code/codeList.do"})
    public String selectTbCodeList(@ModelAttribute("searchVO") TbCodeVO searchVO, 
    		ModelMap model)
            throws Exception {
    	
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
		
        List<?> tbCodeList = tbCodeService.selectTbCodeList(searchVO);
        model.addAttribute("resultList", tbCodeList);
        
        int totCnt = tbCodeService.selectTbCodeListTotCnt(searchVO);
		paginationInfo.setTotalRecordCount(totCnt);
        model.addAttribute("paginationInfo", paginationInfo);
        
//        return "/tbCode/TbCodeList";
        return "/admin/code/codeList";
    } 
    
    @RequestMapping(value={"/tbCode/addTbCodeView.do"})
    public String addTbCodeView(
            @ModelAttribute("searchVO") TbCodeDefaultVO searchVO, Model model)
            throws Exception {
        model.addAttribute("tbCodeVO", new TbCodeVO());
//        return "/tbCode/TbCodeRegister";
        return "/admin/code/codeRegister";
    }
    
    @RequestMapping("/tbCode/addTbCode.do")
    public String addTbCode(
            TbCodeVO tbCodeVO,
            @ModelAttribute("searchVO") TbCodeDefaultVO searchVO, SessionStatus status)
            throws Exception {
        tbCodeService.insertTbCode(tbCodeVO);
        status.setComplete();
        return "forward:/admin/code/codeList.do";
    }
    
    @RequestMapping(value={"/tbCode/updateTbCodeView.do"})
    public String updateTbCodeView(
            @RequestParam("code") java.lang.String code ,
            @RequestParam("gbCd") java.lang.String gbCd ,
            @ModelAttribute("searchVO") TbCodeDefaultVO searchVO, Model model)
            throws Exception {
        TbCodeVO tbCodeVO = new TbCodeVO();
        tbCodeVO.setCode(code);     
        tbCodeVO.setGbCd(gbCd);
        // 변수명은 CoC 에 따라 tbCodeVO
        model.addAttribute(selectTbCode(tbCodeVO, searchVO));
//        return "/tbCode/TbCodeRegister";
        return "/admin/code/codeRegister";
    }

    @RequestMapping("/tbCode/selectTbCode.do")
    public @ModelAttribute("tbCodeVO")
    TbCodeVO selectTbCode(
            TbCodeVO tbCodeVO,
            @ModelAttribute("searchVO") TbCodeDefaultVO searchVO) throws Exception {
        return tbCodeService.selectTbCode(tbCodeVO);
    }

    @RequestMapping("/tbCode/updateTbCode.do")
    public String updateTbCode(
            TbCodeVO tbCodeVO,
            @ModelAttribute("searchVO") TbCodeDefaultVO searchVO, SessionStatus status)
            throws Exception {
        tbCodeService.updateTbCode(tbCodeVO);
        status.setComplete();
        return "forward:/admin/tbCode/TbCodeList.do";
    }
    
    @RequestMapping("/tbCode/deleteTbCode.do")
    public String deleteTbCode(
            TbCodeVO tbCodeVO,
            @ModelAttribute("searchVO") TbCodeDefaultVO searchVO, SessionStatus status)
            throws Exception {
        tbCodeService.deleteTbCode(tbCodeVO);
        status.setComplete();
        return "forward:/admin/tbCode/TbCodeList.do";
    }

}
