package dlink_new.front.controller;

import java.math.BigDecimal;
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

import dlink_new.admin.service.TbPortfService;
import dlink_new.admin.vo.TbPortfDefaultVO;
import dlink_new.admin.vo.TbPortfVO;

// Servoce 객체에 대한 import 구문
// import (service package).TbPortfService;
// Vo 객체에 대한 import 구문
// import (vo package).TbPortfDefaultVO;
// import (vo package).TbPortfVO;

/**
 * @Class Name : TbPortfController.java
 * @Description : TbPortf Controller class
 * @Modification Information
 *
 * @author 김현재
 * @since 2023-01-21
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */

@Controller
//@SessionAttributes(types=TbPortfVO.class)
public class FrontTbPortfController {

    @Resource(name = "tbPortfService")
    private TbPortfService tbPortfService;
    
    /** EgovPropertyService */
    @Resource(name = "propertiesService")
    protected EgovPropertyService propertiesService;
	
    /**
	 * tb_portf 목록을 조회한다. (pageing)
	 * @param searchVO - 조회할 정보가 담긴 TbPortfDefaultVO
	 * @return "/front/tbPortf/TbPortfList"
	 * @exception Exception
	 */
    @RequestMapping(value={"/front/tbPortf/TbPortfList.do", "/front/dsnStd/portfList.do"})
    public String selectTbPortfList(@ModelAttribute("searchVO") TbPortfVO searchVO, 
    		ModelMap model)
            throws Exception {
    	
    	/** EgovPropertyService.sample */
    	searchVO.setPageUnit(propertiesService.getInt("pageUnit"));
    	searchVO.setPageUnit(8);
    	searchVO.setPageSize(propertiesService.getInt("pageSize"));
    	
    	/** pageing */
    	PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(searchVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(searchVO.getPageUnit());
		paginationInfo.setPageSize(searchVO.getPageSize());
		
		searchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		searchVO.setLastIndex(paginationInfo.getLastRecordIndex());
		searchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		
        List<?> tbPortfList = tbPortfService.selectTbPortfList(searchVO);
        model.addAttribute("resultList", tbPortfList);
        
        int totCnt = tbPortfService.selectTbPortfListTotCnt(searchVO);
		paginationInfo.setTotalRecordCount(totCnt);
        model.addAttribute("paginationInfo", paginationInfo);
        
        return "/front/tbPortf/TbPortfList";
    } 
    
    @RequestMapping("/front/tbPortf/addTbPortfView.do")
    public String addTbPortfView(
            @ModelAttribute("searchVO") TbPortfDefaultVO searchVO, Model model)
            throws Exception {
        model.addAttribute("tbPortfVO", new TbPortfVO());
        return "/front/tbPortf/TbPortfRegister";
    }
    
    @RequestMapping("/front/tbPortf/addTbPortf.do")
    public String addTbPortf(
            TbPortfVO tbPortfVO,
            @ModelAttribute("searchVO") TbPortfDefaultVO searchVO, SessionStatus status)
            throws Exception {
        tbPortfService.insertTbPortf(tbPortfVO);
        status.setComplete();
        return "forward:/front/tbPortf/TbPortfList.do";
    }
    
    @RequestMapping("/front/tbPortf/updateTbPortfView.do")
    public String updateTbPortfView(
            @RequestParam("portfSeq") int portfSeq ,
            @ModelAttribute("searchVO") TbPortfDefaultVO searchVO, Model model)
            throws Exception {
        TbPortfVO tbPortfVO = new TbPortfVO();
        tbPortfVO.setPortfSeq( portfSeq );        
        // 변수명은 CoC 에 따라 tbPortfVO
        model.addAttribute(selectTbPortf(tbPortfVO, searchVO));
        return "/front/tbPortf/TbPortfRegister";
    }

    @RequestMapping("/front/tbPortf/selectTbPortf.do")
    public @ModelAttribute("tbPortfVO")
    TbPortfVO selectTbPortf(
            TbPortfVO tbPortfVO,
            @ModelAttribute("searchVO") TbPortfDefaultVO searchVO) throws Exception {
        return tbPortfService.selectTbPortf(tbPortfVO);
    }

    @RequestMapping("/front/tbPortf/updateTbPortf.do")
    public String updateTbPortf(
            TbPortfVO tbPortfVO,
            @ModelAttribute("searchVO") TbPortfDefaultVO searchVO, SessionStatus status)
            throws Exception {
        tbPortfService.updateTbPortf(tbPortfVO);
        status.setComplete();
        return "forward:/front/tbPortf/TbPortfList.do";
    }
    
    @RequestMapping("/front/tbPortf/deleteTbPortf.do")
    public String deleteTbPortf(
            TbPortfVO tbPortfVO,
            @ModelAttribute("searchVO") TbPortfDefaultVO searchVO, SessionStatus status)
            throws Exception {
        tbPortfService.deleteTbPortf(tbPortfVO);
        status.setComplete();
        return "forward:/front/tbPortf/TbPortfList.do";
    }

}
