package dlink_new.admin.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.egovframe.rte.fdl.property.EgovPropertyService;
import org.egovframe.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.util.UrlPathHelper;

import dlink_new.admin.service.TbBannerService;
import dlink_new.admin.vo.TbBannerDefaultVO;
import dlink_new.admin.vo.TbBannerVO;
import dlink_new.admin.vo.TbMemVO;
import dlink_new.admin.vo.TbPopupVO;

// Servoce 객체에 대한 import 구문
// import (service package).tbBannerService;
// Vo 객체에 대한 import 구문
// import (vo package).TbPopupDefaultVO;
// import (vo package).tbBannerVO;

/**
 * @Class Name : TbPopupController.java
 * @Description : TbPopup Controller class
 * @Modification Information
 *
 * @author 김준영
 * @since 2023-03-23
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */

@Controller
//@SessionAttributes(types=tbBannerVO.class)
public class TbBannerController {

    @Resource(name = "tbBannerService")
    private TbBannerService tbBannerService;
    
    /** EgovPropertyService */
    @Resource(name = "propertiesService")
    protected EgovPropertyService propertiesService;
	
    /**
	 * tb_popup 목록을 조회한다. (pageing)
	 * @param searchVO - 조회할 정보가 담긴 TbPopupDefaultVO
	 * @return "/tbPopup/TbPopupList"
	 * @exception Exception
	 */
    @RequestMapping(value="/admin/tbBn/TbBnList.do")
    public String selectTbPopupList(@ModelAttribute("searchVO") TbBannerVO searchVO, 
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
		
        List<?> tbBannerList = tbBannerService.selectTbBannerList(searchVO);
        model.addAttribute("resultList", tbBannerList);
        
        int totCnt = tbBannerService.selectTbPopupListTotCnt(searchVO);
		paginationInfo.setTotalRecordCount(totCnt);
		model.addAttribute("paginationInfo", paginationInfo);
		
		 model.addAttribute("searchVO", searchVO);
		searchVO.setSearchKeyword("");
		model.addAttribute("searchKeyword", searchVO.getSearchKeyword());
        
        return "/admin/tbBn/TbBannerList";
    } 
    
    @RequestMapping(value={"/admin/tbBn/addTbPopupView.do", "/admin/tbBn/updateTbPopupView.do"})
    public String addTbPopupView(
            @ModelAttribute("searchVO") TbBannerVO searchVO, Model model, HttpServletRequest req)
            throws Exception {
    	
    	UrlPathHelper urlPathHelper = new UrlPathHelper();
		String originalURL = urlPathHelper.getOriginatingRequestUri(req);
		
		try {
		
			if (originalURL.equals("/admin/tbBn/updateTbPopupView.do")) {
				searchVO = tbBannerService.selectTbPopup(searchVO);
			}
			model.addAttribute("searchVO", searchVO);
		} catch (Exception e) {
			e.printStackTrace();
		}
        return "/admin/tbBn/TbBannerRegister";
    }
    
    @RequestMapping("/admin/tbBn/addTbBanner.do")
    public String addTbPopup(
            TbBannerVO tbBannerVO,
            @ModelAttribute("searchVO") TbBannerDefaultVO searchVO, SessionStatus status, HttpSession session)
            throws Exception {
    	
    	TbMemVO tbMemVO = (TbMemVO) session.getAttribute("adminLoginVO");
		if(tbMemVO == null) {
			return "redirect:/admin/login.do";
		}
		
        String insertTbBanner = tbBannerService.insertTbBanner(tbBannerVO);
		
        status.setComplete();
        return "forward:/admin/tbBn/TbBnList.do";
    }
    
    @RequestMapping("/admin/tbBn/updateTbBanner.do")
    public String updateTbBanner(
            TbBannerVO tbBannerVO ,
            @ModelAttribute("searchVO") TbBannerDefaultVO searchVO, Model model, SessionStatus status)
            throws Exception {
    	tbBannerService.updateTbBanner(tbBannerVO);
    	
    	status.setComplete();
        return "forward:/admin/tbBn/TbBnList.do";
    }
    
	  @RequestMapping("/admin/tbBn/deleteTbBanner.do")
	  public String deleteTbPopup(
	            TbBannerVO tbBannerVO ,
	            @ModelAttribute("searchVO") TbBannerDefaultVO searchVO, Model model, SessionStatus status)
	          throws Exception {
	      tbBannerService.deleteTbBanner(tbBannerVO);
	      status.setComplete();
	      return "forward:/admin/tbBn/TbBnList.do";
	  }
//
//    @RequestMapping("/tbPopup/selectTbPopup.do")
//    public @ModelAttribute("tbBannerVO")
//    TbBannerVO selectTbPopup(
//            TbBannerVO tbBannerVO,
//            @ModelAttribute("searchVO") TbPopupDefaultVO searchVO) throws Exception {
//        return tbBannerService.selectTbPopup(tbBannerVO);
//    }
//
//    @RequestMapping("/tbPopup/updateTbPopup.do")
//    public String updateTbPopup(
//            TbBannerVO tbBannerVO,
//            @ModelAttribute("searchVO") TbPopupDefaultVO searchVO, SessionStatus status)
//            throws Exception {
//        tbBannerService.updateTbPopup(tbBannerVO);
//        status.setComplete();
//        return "forward:/tbPopup/TbPopupList.do";
//    }
//    


}
