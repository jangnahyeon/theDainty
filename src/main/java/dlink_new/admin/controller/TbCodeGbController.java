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

import dlink_new.admin.service.TbCodeGbService;
import dlink_new.admin.vo.TbCodeGbDefaultVO;
// Vo 객체에 대한 import 구문
// import (vo package).TbCodeGbDefaultVO;
// import (vo package).TbCodeGbVO;
import dlink_new.admin.vo.TbCodeGbVO;

/**
 * @Class Name : TbCodeGbController.java
 * @Description : TbCodeGb Controller class
 * @Modification Information
 *
 * @author 김현재
 * @since 2023-01-17
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */

@Controller
//@SessionAttributes(types=TbCodeGbVO.class)
@RequestMapping("/admin")
public class TbCodeGbController {

    @Resource(name = "tbCodeGbService")
    private TbCodeGbService tbCodeGbService;
    
    /** EgovPropertyService */
    @Resource(name = "propertiesService")
    protected EgovPropertyService propertiesService;
	
    /**
	 * tb_code_gb 목록을 조회한다. (pageing)
	 * @param searchVO - 조회할 정보가 담긴 TbCodeGbDefaultVO
	 * @return "/tbCodeGb/TbCodeGbList"
	 * @exception Exception
	 */
    @RequestMapping(value={"/tbCodeGb/TbCodeGbList.do", "/code/codeGbList.do"})
    public String selectTbCodeGbList(@ModelAttribute("searchVO") TbCodeGbDefaultVO searchVO, 
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
		
        List<?> tbCodeGbList = tbCodeGbService.selectTbCodeGbList(searchVO);
        model.addAttribute("resultList", tbCodeGbList);
        
        int totCnt = tbCodeGbService.selectTbCodeGbListTotCnt(searchVO);
		paginationInfo.setTotalRecordCount(totCnt);
        model.addAttribute("paginationInfo", paginationInfo);
        
        //return "/tbCodeGb/TbCodeGbList";
        return "/admin/code/codeGbList";
    } 
    
    @RequestMapping("/tbCodeGb/addTbCodeGbView.do")
    public String addTbCodeGbView(
            @ModelAttribute("searchVO") TbCodeGbDefaultVO searchVO, Model model)
            throws Exception {
        model.addAttribute("tbCodeGbVO", new TbCodeGbVO());
        //return "/tbCodeGb/TbCodeGbRegister";
        return "/admin/code/codeGbRegister";
    }
    
    @RequestMapping("/tbCodeGb/addTbCodeGb.do")
    public String addTbCodeGb(
            TbCodeGbVO tbCodeGbVO,
            @ModelAttribute("searchVO") TbCodeGbDefaultVO searchVO, SessionStatus status)
            throws Exception {
        tbCodeGbService.insertTbCodeGb(tbCodeGbVO);
        status.setComplete();
        return "forward:/admin/tbCodeGb/TbCodeGbList.do";
    }
    
    @RequestMapping("/tbCodeGb/updateTbCodeGbView.do")
    public String updateTbCodeGbView(
            @RequestParam("gbCd") java.lang.String gbCd ,
            @ModelAttribute("searchVO") TbCodeGbDefaultVO searchVO, Model model)
            throws Exception {
        TbCodeGbVO tbCodeGbVO = new TbCodeGbVO();
        tbCodeGbVO.setGbCd(gbCd);        
        // 변수명은 CoC 에 따라 tbCodeGbVO
        model.addAttribute(selectTbCodeGb(tbCodeGbVO, searchVO));
        //return "/tbCodeGb/TbCodeGbRegister";
        return "/admin/code/codeGbRegister";
    }

    @RequestMapping("/tbCodeGb/selectTbCodeGb.do")
    public @ModelAttribute("tbCodeGbVO")
    TbCodeGbVO selectTbCodeGb(
            TbCodeGbVO tbCodeGbVO,
            @ModelAttribute("searchVO") TbCodeGbDefaultVO searchVO) throws Exception {
        return tbCodeGbService.selectTbCodeGb(tbCodeGbVO);
    }

    @RequestMapping("/tbCodeGb/updateTbCodeGb.do")
    public String updateTbCodeGb(
            TbCodeGbVO tbCodeGbVO,
            @ModelAttribute("searchVO") TbCodeGbDefaultVO searchVO, SessionStatus status)
            throws Exception {
        tbCodeGbService.updateTbCodeGb(tbCodeGbVO);
        status.setComplete();
        return "forward:/admin/tbCodeGb/TbCodeGbList.do";
    }
    
    @RequestMapping("/tbCodeGb/deleteTbCodeGb.do")
    public String deleteTbCodeGb(
            TbCodeGbVO tbCodeGbVO,
            @ModelAttribute("searchVO") TbCodeGbDefaultVO searchVO, SessionStatus status)
            throws Exception {
        tbCodeGbService.deleteTbCodeGb(tbCodeGbVO);
        status.setComplete();
        return "forward:/admin/tbCodeGb/TbCodeGbList.do";
    }

}
