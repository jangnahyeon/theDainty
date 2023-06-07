package dlink.admin.controller;

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


import dlink.admin.service.TMemAccptService;
import dlink.admin.vo.SearchVO;
import dlink.admin.vo.TMemAccptVO;

/**
 * @Class Name : TMemAccptController.java
 * @Description : TMemAccpt Controller class
 * @Modification Information
 *
 * @author 이은지
 * @since 2022-03-30
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */

@Controller
public class TMemAccptController {

    @Resource(name = "TMemAccptService")
    private TMemAccptService TMemAccptService;
    
    /** EgovPropertyService */
    @Resource(name = "propertiesService")
    protected EgovPropertyService propertiesService;
	
    /**
	 * t_mem_accpt 목록을 조회한다. (pageing)
	 * @param searchVO - 조회할 정보가 담긴 SerchVo
	 * @return "/TMemAccpt/TMemAccptList"
	 * @exception Exception
	 */
    @RequestMapping(value="/TMemAccpt/TMemAccptList.do")
    public String selectTMemAccptList(@ModelAttribute("searchVO") SearchVO searchVO, 
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
		
        List<?> TMemAccptList = TMemAccptService.selectTMemAccptList(searchVO);
        model.addAttribute("resultList", TMemAccptList);
        
        int totCnt = TMemAccptService.selectTMemAccptListTotCnt(searchVO);
		paginationInfo.setTotalRecordCount(totCnt);
        model.addAttribute("paginationInfo", paginationInfo);
        
        return "/TMemAccpt/TMemAccptList";
    } 
    
    @RequestMapping("/TMemAccpt/addTMemAccptView.do")
    public String addTMemAccptView(
            @ModelAttribute("searchVO") SearchVO searchVO, Model model)
            throws Exception {
        model.addAttribute("TMemAccptVO", new TMemAccptVO());
        return "/TMemAccpt/TMemAccptRegister";
    }
    
    @RequestMapping("/TMemAccpt/addTMemAccpt.do")
    public String addTMemAccpt(
            TMemAccptVO TMemAccptVO,
            @ModelAttribute("searchVO") SearchVO searchVO, SessionStatus status)
            throws Exception {
        TMemAccptService.insertTMemAccpt(TMemAccptVO);
        status.setComplete();
        return "forward:/TMemAccpt/TMemAccptList.do";
    }
    
    @RequestMapping("/TMemAccpt/updateTMemAccptView.do")
    public String updateTMemAccptView(
            @RequestParam("loginId") java.lang.String loginId ,
            @ModelAttribute("searchVO") SearchVO searchVO, Model model)
            throws Exception {
        TMemAccptVO TMemAccptVO = new TMemAccptVO();
        TMemAccptVO.setLoginId(loginId);        
        // 변수명은 CoC 에 따라 TMemAccptVO
        model.addAttribute(selectTMemAccpt(TMemAccptVO, searchVO));
        return "/TMemAccpt/TMemAccptRegister";
    }

    @RequestMapping("/TMemAccpt/selectTMemAccpt.do")
    public @ModelAttribute("TMemAccptVO")
    TMemAccptVO selectTMemAccpt(
            TMemAccptVO TMemAccptVO,
            @ModelAttribute("searchVO") SearchVO searchVO) throws Exception {
        return TMemAccptService.selectTMemAccpt(TMemAccptVO);
    }

    @RequestMapping("/TMemAccpt/updateTMemAccpt.do")
    public String updateTMemAccpt(
            TMemAccptVO TMemAccptVO,
            @ModelAttribute("searchVO") SearchVO searchVO, SessionStatus status)
            throws Exception {
        TMemAccptService.updateTMemAccpt(TMemAccptVO);
        status.setComplete();
        return "forward:/TMemAccpt/TMemAccptList.do";
    }
    
    @RequestMapping("/TMemAccpt/deleteTMemAccpt.do")
    public String deleteTMemAccpt(
            TMemAccptVO TMemAccptVO,
            @ModelAttribute("searchVO") SearchVO searchVO, SessionStatus status)
            throws Exception {
        TMemAccptService.deleteTMemAccpt(TMemAccptVO);
        status.setComplete();
        return "forward:/TMemAccpt/TMemAccptList.do";
    }

}
