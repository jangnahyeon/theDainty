package dlink_new.front.controller;

import java.util.List;

import javax.annotation.Resource;

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

import dlink_new.front.service.TbSisulRsvCmtService;
import dlink_new.front.vo.TbSisulRsvCmtDefaultVO;
import dlink_new.front.vo.TbSisulRsvCmtVO;

// Servoce 객체에 대한 import 구문
// import (service package).TbSisulRsvCmtService;
// Vo 객체에 대한 import 구문
// import (vo package).TbSisulRsvCmtDefaultVO;
// import (vo package).TbSisulRsvCmtVO;

/**
 * @Class Name : TbSisulRsvCmtController.java
 * @Description : TbSisulRsvCmt Controller class
 * @Modification Information
 *
 * @author 이재욱
 * @since 2023-02-07
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */

@Controller
@SessionAttributes(types=TbSisulRsvCmtVO.class)
public class TbSisulRsvCmtController {

    @Resource(name = "tbSisulRsvCmtService")
    private TbSisulRsvCmtService tbSisulRsvCmtService;
    
    /** EgovPropertyService */
    @Resource(name = "propertiesService")
    protected EgovPropertyService propertiesService;
	
    /**
	 * tb_sisul_rsv_cmt 목록을 조회한다. (pageing)
	 * @param searchVO - 조회할 정보가 담긴 TbSisulRsvCmtDefaultVO
	 * @return "/tbSisulRsvCmt/TbSisulRsvCmtList"
	 * @exception Exception
	 */
    @RequestMapping(value="/tbSisulRsvCmt/TbSisulRsvCmtList.do")
    public String selectTbSisulRsvCmtList(@ModelAttribute("searchVO") TbSisulRsvCmtDefaultVO searchVO, 
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
		
        List<?> tbSisulRsvCmtList = tbSisulRsvCmtService.selectTbSisulRsvCmtList(searchVO);
        model.addAttribute("resultList", tbSisulRsvCmtList);
        
        int totCnt = tbSisulRsvCmtService.selectTbSisulRsvCmtListTotCnt(searchVO);
		paginationInfo.setTotalRecordCount(totCnt);
        model.addAttribute("paginationInfo", paginationInfo);
        
        return "/tbSisulRsvCmt/TbSisulRsvCmtList";
    } 
    
    @RequestMapping("/tbSisulRsvCmt/addTbSisulRsvCmtView.do")
    public String addTbSisulRsvCmtView(
            @ModelAttribute("searchVO") TbSisulRsvCmtDefaultVO searchVO, Model model)
            throws Exception {
        model.addAttribute("tbSisulRsvCmtVO", new TbSisulRsvCmtVO());
        return "/tbSisulRsvCmt/TbSisulRsvCmtRegister";
    }
    
    @RequestMapping("/tbSisulRsvCmt/addTbSisulRsvCmt.do")
    public String addTbSisulRsvCmt(
            TbSisulRsvCmtVO tbSisulRsvCmtVO,
            @ModelAttribute("searchVO") TbSisulRsvCmtDefaultVO searchVO, SessionStatus status)
            throws Exception {
        tbSisulRsvCmtService.insertTbSisulRsvCmt(tbSisulRsvCmtVO);
        status.setComplete();
        return "forward:/tbSisulRsvCmt/TbSisulRsvCmtList.do";
    }
    
    @RequestMapping("/tbSisulRsvCmt/updateTbSisulRsvCmtView.do")
    public String updateTbSisulRsvCmtView(
            @RequestParam("cmtSeq") int cmtSeq ,
            @ModelAttribute("searchVO") TbSisulRsvCmtDefaultVO searchVO, Model model)
            throws Exception {
        TbSisulRsvCmtVO tbSisulRsvCmtVO = new TbSisulRsvCmtVO();
        tbSisulRsvCmtVO.setCmtSeq(cmtSeq);        
        // 변수명은 CoC 에 따라 tbSisulRsvCmtVO
        model.addAttribute(selectTbSisulRsvCmt(tbSisulRsvCmtVO, searchVO));
        return "/tbSisulRsvCmt/TbSisulRsvCmtRegister";
    }

    @RequestMapping("/tbSisulRsvCmt/selectTbSisulRsvCmt.do")
    public @ModelAttribute("tbSisulRsvCmtVO")
    TbSisulRsvCmtVO selectTbSisulRsvCmt(
            TbSisulRsvCmtVO tbSisulRsvCmtVO,
            @ModelAttribute("searchVO") TbSisulRsvCmtDefaultVO searchVO) throws Exception {
        return tbSisulRsvCmtService.selectTbSisulRsvCmt(tbSisulRsvCmtVO);
    }

    @RequestMapping("/tbSisulRsvCmt/updateTbSisulRsvCmt.do")
    public String updateTbSisulRsvCmt(
            TbSisulRsvCmtVO tbSisulRsvCmtVO,
            @ModelAttribute("searchVO") TbSisulRsvCmtDefaultVO searchVO, SessionStatus status)
            throws Exception {
        tbSisulRsvCmtService.updateTbSisulRsvCmt(tbSisulRsvCmtVO);
        status.setComplete();
        return "forward:/tbSisulRsvCmt/TbSisulRsvCmtList.do";
    }
    
    @RequestMapping("/tbSisulRsvCmt/deleteTbSisulRsvCmt.do")
    public String deleteTbSisulRsvCmt(
            TbSisulRsvCmtVO tbSisulRsvCmtVO,
            @ModelAttribute("searchVO") TbSisulRsvCmtDefaultVO searchVO, SessionStatus status)
            throws Exception {
        tbSisulRsvCmtService.deleteTbSisulRsvCmt(tbSisulRsvCmtVO);
        status.setComplete();
        return "forward:/tbSisulRsvCmt/TbSisulRsvCmtList.do";
    }

}
