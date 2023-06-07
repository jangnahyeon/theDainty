package dlink_new.admin.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.egovframe.rte.fdl.property.EgovPropertyService;
import org.egovframe.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.util.UrlPathHelper;

import dlink_new.admin.service.TbBrdCmtService;
import dlink_new.admin.service.TbBrdFileService;
import dlink_new.admin.service.TbBrdService;
import dlink_new.admin.vo.TbBrdCmtVO;
import dlink_new.admin.vo.TbBrdDefaultVO;
import dlink_new.admin.vo.TbBrdFileVO;
import dlink_new.admin.vo.TbBrdVO;
import dlink_new.admin.vo.TbMemVO;

// Servoce 객체에 대한 import 구문
// import (service package).TbBrdService;
// Vo 객체에 대한 import 구문
// import (vo package).TbBrdDefaultVO;
// import (vo package).TbBrdVO;

/**
 * @Class Name : TbBrdController.java
 * @Description : TbBrd Controller class
 * @Modification Information
 *
 * @author 김현재
 * @since 2023-01-25
 * @version 1.0
 * @see
 *
 *  Copyright (C)  All right reserved.
 */

@Controller
//@SessionAttributes(types=TbBrdVO.class)
public class TbBrdController {

    @Resource(name = "tbBrdService")
    private TbBrdService tbBrdService;
    
    @Resource(name = "tbBrdFileService")
    private TbBrdFileService tbBrdFileService;
    
    @Resource(name = "tbBrdCmtService")
    private TbBrdCmtService tbBrdCmtService;
    
    /** EgovPropertyService */
    @Resource(name = "propertiesService")
    protected EgovPropertyService propertiesService;
	
    /**
	 * tb_brd 목록을 조회한다. (pageing)
	 * @param searchVO - 조회할 정보가 담긴 TbBrdDefaultVO
	 * @return "/admin/tbBrd/TbBrdList"
	 * @exception Exception
	 */
    @RequestMapping(value="/admin/tbBrd/TbBrdList.do")
    public String selectTbBrdList(@ModelAttribute("searchVO") TbBrdVO searchVO, 
    		TbBrdDefaultVO searchBrdVO,
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
		
        List<?> tbBrdList = tbBrdService.selectTbBrdList(searchVO);
        model.addAttribute("resultList", tbBrdList);
        
        int totCnt = tbBrdService.selectTbBrdListTotCnt(searchVO);
		paginationInfo.setTotalRecordCount(totCnt);
        model.addAttribute("paginationInfo", paginationInfo);
        
        return "/admin/tbBrd/TbBrdList";
    } 
    
    @RequestMapping("/admin/tbBrd/addTbBrdView.do")
    public String addTbBrdView(
            @ModelAttribute("searchVO") TbBrdVO searchVO, Model model)
            throws Exception {
    		
        model.addAttribute("tbBrdVO", new TbBrdVO());
        return "/admin/tbBrd/TbBrdRegister";
        
        
    }
    
    @RequestMapping("/admin/tbBrd/addTbBrd.do")
    public String addTbBrd(
            TbBrdVO tbBrdVO,
            TbBrdFileVO tbBrdFileVO,
            String [] multiFileSeq,
            @ModelAttribute("searchVO") TbBrdDefaultVO searchVO, SessionStatus status, HttpSession session)
            throws Exception {
    	
    	TbMemVO tbMemVO = (TbMemVO) session.getAttribute("adminLoginVO");
		if(tbMemVO == null) {
			return "redirect:/admin/login.do";
		}
		
		tbBrdVO.setMemSeq(tbMemVO.getMemSeq().intValue() );
		tbBrdVO.setMemId(tbMemVO.getMemId());		
    
		
        int brdSeq = tbBrdService.insertTbBrd(tbBrdVO);
        
        // 첨부파일
        if(null != multiFileSeq) {        	
        	tbBrdFileVO.setBrdSeq( tbBrdVO.getBrdSeq() );        	
        	
        	tbBrdFileService.deleteTbBrdFile(tbBrdFileVO);
        	
        	for( int i = 0; i < multiFileSeq.length; i++ ) {
        		if( StringUtils.isEmpty( multiFileSeq[i] ) ) {
        			continue;
        		}
        		tbBrdFileVO.setFileSeq( Integer.parseInt( multiFileSeq[i] ) );
        		tbBrdFileService.insertTbBrdFile(tbBrdFileVO);
        	}
   		}
        
        status.setComplete();
        return "forward:/admin/tbBrd/TbBrdList.do";
    }
    
    @RequestMapping("/admin/tbBrd/updateTbBrdView.do")
    public String updateTbBrdView(
    		TbBrdFileVO tbBrdFileVO,
            @RequestParam("brdSeq") int brdSeq ,
            @RequestParam("menuSeq") int menuSeq ,
            @ModelAttribute("searchVO") TbBrdDefaultVO searchVO, Model model)
            throws Exception {
        TbBrdVO tbBrdVO = new TbBrdVO();
        tbBrdVO.setBrdSeq(brdSeq); 
        tbBrdVO.setMenuSeq(menuSeq);
        // 변수명은 CoC 에 따라 tbBrdVO
        model.addAttribute(selectTbBrd(tbBrdVO, searchVO));
        
        
        List<?> brdFileList = tbBrdFileService.selectTbBrdFileList(tbBrdFileVO);
        model.addAttribute("brdFileList", brdFileList);
        
        return "/admin/tbBrd/TbBrdRegister";
    }

    @RequestMapping("/admin/tbBrd/selectTbBrd.do")
    public @ModelAttribute("tbBrdVO")
    TbBrdVO selectTbBrd(
            TbBrdVO tbBrdVO,
            @ModelAttribute("searchVO") TbBrdDefaultVO searchVO) throws Exception {
        return tbBrdService.selectTbBrd(tbBrdVO);
    }

    @RequestMapping("/admin/tbBrd/updateTbBrd.do")
    public String updateTbBrd(
            TbBrdVO tbBrdVO,
            TbBrdFileVO tbBrdFileVO,
            String[] multiFileSeq,
            @ModelAttribute("searchVO") TbBrdDefaultVO searchVO, SessionStatus status)
            throws Exception {
        tbBrdService.updateTbBrd(tbBrdVO);
        
        // 첨부파일
        if(null != multiFileSeq) {        	
        	tbBrdFileVO.setBrdSeq( tbBrdVO.getBrdSeq() );        	
        	
        	tbBrdFileService.deleteTbBrdFile(tbBrdFileVO);
        	
        	for( int i = 0; i < multiFileSeq.length; i++ ) {
        		if( StringUtils.isEmpty( multiFileSeq[i] ) ) {
        			continue;
        		}
        		tbBrdFileVO.setFileSeq( Integer.parseInt( multiFileSeq[i] ) );
        		tbBrdFileService.insertTbBrdFile(tbBrdFileVO);
        	}
   		}
        
        status.setComplete();
        return "forward:/admin/tbBrd/TbBrdList.do";
    }
    
    @RequestMapping("/admin/tbBrd/deleteTbBrd.do")
    public String deleteTbBrd(
            TbBrdVO tbBrdVO,
            TbBrdFileVO tbBrdFileVO,
            TbBrdCmtVO tbBrdCmtVO,
            @ModelAttribute("searchVO") TbBrdDefaultVO searchVO, SessionStatus status)
            throws Exception {
    	
        tbBrdService.deleteTbBrd(tbBrdVO);
        
        tbBrdFileVO.setBrdSeq(tbBrdVO.getBrdSeq());
        tbBrdFileService.deleteTbBrdFile(tbBrdFileVO);
        
        tbBrdCmtVO.setBrdSeq(tbBrdVO.getBrdSeq());
        tbBrdCmtService.deleteTbBrdCmt(tbBrdCmtVO);
        
        status.setComplete();
        return "forward:/admin/tbBrd/TbBrdList.do";
    }
    
    @RequestMapping(value={"/admin/tbBrdCmt/TbBrdCmtList.do"})
    public String _cmt_selectTbBrdCmtList(@ModelAttribute("searchVO") TbBrdCmtVO searchVO, 
    		ModelMap model)
            throws Exception {
    	
    	/** EgovPropertyService.sample */
//    	searchVO.setPageUnit(propertiesService.getInt("pageUnit"));
//    	searchVO.setPageSize(propertiesService.getInt("pageSize"));
    	
    	/** pageing */
    	PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(searchVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(searchVO.getPageUnit());
		paginationInfo.setPageSize(searchVO.getPageSize());
		
		searchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		searchVO.setLastIndex(paginationInfo.getLastRecordIndex());
		searchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		
        List<?> tbBrdList = tbBrdCmtService.selectTbBrdCmtList(searchVO);
        model.addAttribute("resultList", tbBrdList);
        
        int totCnt = tbBrdCmtService.selectTbBrdCmtListTotCnt(searchVO);
		paginationInfo.setTotalRecordCount(totCnt);
        model.addAttribute("paginationInfo", paginationInfo);
        
        return "/admin/tbBrdCmt/TbBrdCmtList";
    } 
    
    @RequestMapping("/admin/brdCmt/addBrdCmt_act.do")
    @ResponseBody
    public String _cmt_addBrdCmt_act(
            TbBrdCmtVO tbBrdCmtVO,            
            SessionStatus status,
            HttpSession session )
            throws Exception {
    	
    	TbMemVO tbMemVO = (TbMemVO) session.getAttribute("adminLoginVO");
		if(tbMemVO == null) {
			return "NO_LOGIN";
		}
		
		tbBrdCmtVO.setMemSeq( tbMemVO.getMemSeq().intValue() );
		tbBrdCmtVO.setMemId(tbMemVO.getMemId());
		
		tbBrdCmtService.insertTbBrdCmt(tbBrdCmtVO);
        
        status.setComplete();
        return "Y";
    }
    
    @RequestMapping("/admin/brdCmt/deleteBrdCmt_act.do")
    @ResponseBody
    public String _cmt_deleteBrdCmt_act(            
    		TbBrdCmtVO tbBrdCmtVO,
            SessionStatus status,
            HttpSession session )
            throws Exception {
    	
    	TbMemVO tbMemVO = (TbMemVO) session.getAttribute("adminLoginVO");
		if(tbMemVO == null) {
			return "NO_LOGIN";
		}
    	
    	tbBrdCmtService.deleteTbBrdCmt(tbBrdCmtVO);
        
        status.setComplete();
        return "Y";
    }
    
    @RequestMapping("/admin/brdCmt/updateBrdCmt_act.do")
	@ResponseBody
    public String updateBrdCmt_act(TbBrdCmtVO tbBrdCmtVO, Model model)
            throws Exception {
		
		String rs = "";
		try {
		
			tbBrdCmtService.updateBrdCmt(tbBrdCmtVO);
			rs = "Y";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return rs;
    }

}
