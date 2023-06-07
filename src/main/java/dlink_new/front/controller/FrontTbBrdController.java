package dlink_new.front.controller;

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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import dlink_new.admin.service.TbBrdCmtService;
import dlink_new.admin.service.TbBrdFileService;
import dlink_new.admin.service.TbBrdService;
import dlink_new.admin.vo.TbBrdCmtVO;
import dlink_new.admin.vo.TbBrdDefaultVO;
import dlink_new.admin.vo.TbBrdFileVO;
import dlink_new.admin.vo.TbBrdVO;
import dlink_new.admin.vo.TbMemVO;
import dlink_new.front.service.TbMenuService;
import dlink_new.front.vo.TbMenuVO;

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
public class FrontTbBrdController {

    @Resource(name = "tbBrdService")
    private TbBrdService tbBrdService;
    
    @Resource(name = "tbMenuService")
    private TbMenuService tbMenuService;
    
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
	 * @return "/front/tbBrd/TbBrdList"
	 * @exception Exception
	 */
    @RequestMapping(value={"/front/tbBrd/TbBrdList.do", "/front/brd/brdList.do"})
    public String selectTbBrdList(@ModelAttribute("searchVO") TbBrdVO searchVO, 
    		TbBrdDefaultVO searchBrdVO,
    		TbMenuVO searchMenuVO,
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
		
		String title = searchVO.getSearchKeyword();
		if(title.isEmpty()) {
		searchVO.setSearchCondition("srcNm");
		searchVO.setSearchKeyword("디링크 공지사항");
		}
        List<?> tbBrdList = tbBrdService.selectTbBrdList(searchVO);
        model.addAttribute("resultList", tbBrdList);
        
        int totCnt = tbBrdService.selectTbBrdListTotCnt(searchVO);
		paginationInfo.setTotalRecordCount(totCnt);
        model.addAttribute("paginationInfo", paginationInfo);
        
        TbMenuVO tbMenuVO = tbMenuService.selectTbMenu(searchMenuVO);
        model.addAttribute("tbMenuVO", tbMenuVO);
        
        return "/front/tbBrd/TbBrdList";
    } 
    
    @RequestMapping(value={"/front/tbBrd/addTbBrdView.do", "/front/brd/brdRegister.do"})
    public String addTbBrdView(
            @ModelAttribute("searchVO") TbBrdVO searchVO, Model model)
            throws Exception {
        model.addAttribute("tbBrdVO", new TbBrdVO());
        return "/front/tbBrd/TbBrdRegister";
    }
    
    
    @RequestMapping("/front/tbBrd/addTbBrd.do")
    public String addTbBrd(
            TbBrdVO tbBrdVO,
            @ModelAttribute("searchVO") TbBrdDefaultVO searchVO, SessionStatus status)
            throws Exception {
    	
        tbBrdService.insertTbBrd(tbBrdVO);
        status.setComplete();
        return "forward:/front/tbBrd/TbBrdList.do";
    }
    
    
    
    
    @RequestMapping(value={"/front/tbBrd/updateTbBrdView.do", "/front/brd/brdView.do"})
    public String updateTbBrdView(
    		TbBrdFileVO tbBrdFileVO,
            @RequestParam("brdSeq") int brdSeq ,
            @RequestParam("menuSeq") int menuSeq ,
            TbMenuVO searchMenuVO,
            @ModelAttribute("searchVO") TbBrdVO searchVO, Model model, SessionStatus status)
            throws Exception {
        TbBrdVO tbBrdVO = new TbBrdVO();
        tbBrdVO.setBrdSeq(brdSeq);
        tbBrdVO.setMenuSeq(menuSeq);
        // 변수명은 CoC 에 따라 tbBrdVO
		String tempH = "";
        TbBrdVO brdVO = tbBrdService.selectTbBrd(tbBrdVO);
		//tempH = csiMasPopVo.getPop_cont().replace("&amp;", "&");
		
		tempH = brdVO.getCont();
		if(tempH != null) {
			tempH = tempH.replace("&amp;", "&");
			tempH = tempH.replace("&lt;", "<");
			tempH = tempH.replace("&gt;", ">");
			//tempH = tempH.replace("&nbsp;", " ");
			tempH = tempH.replace("&quot;", (char) 34 + "");
			tempH = tempH.replace("&apos;", "'");
			brdVO.setCont(tempH);
		}
		model.addAttribute("tbBrdVO", brdVO);
        
        TbMenuVO tbMenuVO = tbMenuService.selectTbMenu(searchMenuVO);
        model.addAttribute("tbMenuVO", tbMenuVO);
        
        // 조회수 증가
        tbBrdVO.setSearchCondition("readCnt");
        tbBrdService.updateTbBrd(tbBrdVO);
        
        //List<?> brdFileList = tbBrdFileService.selectTbBrdFileList(tbBrdFileVO);
        //model.addAttribute("brdFileList", brdFileList);
        
        tbBrdVO.setSearchCondition("prevBrd");
        TbBrdVO prevBrd = tbBrdService.selectTbBrd(tbBrdVO);
        model.addAttribute("prevBrd", prevBrd);
        
        tbBrdVO.setSearchCondition("nextBrd");
        TbBrdVO nextBrd = tbBrdService.selectTbBrd(tbBrdVO);
        model.addAttribute("nextBrd", nextBrd);
        
        status.setComplete();
        
        return "/front/tbBrd/TbBrdView";
    }
    
    @RequestMapping("/front/tbBrd/selectTbBrd.do")
    public @ModelAttribute("tbBrdVO")
    TbBrdVO selectTbBrd(
            TbBrdVO tbBrdVO,
            @ModelAttribute("searchVO") TbBrdDefaultVO searchVO) throws Exception {
        return tbBrdService.selectTbBrd(tbBrdVO);
    }
    
    @RequestMapping("/front/tbBrd/updateTbBrd.do")
    public String updateTbBrd(
            TbBrdVO tbBrdVO,
            @ModelAttribute("searchVO") TbBrdDefaultVO searchVO, SessionStatus status)
            throws Exception {
        tbBrdService.updateTbBrd(tbBrdVO);
        status.setComplete();
        return "forward:/front/tbBrd/TbBrdList.do";
    }
    
    @RequestMapping("/front/tbBrd/deleteTbBrd.do")
    public String deleteTbBrd(
            TbBrdVO tbBrdVO,
            @ModelAttribute("searchVO") TbBrdDefaultVO searchVO, SessionStatus status)
            throws Exception {
        tbBrdService.deleteTbBrd(tbBrdVO);
        status.setComplete();
        return "forward:/front/tbBrd/TbBrdList.do";
    }
    
    @RequestMapping(value={"/front/tbBrdCmt/TbBrdCmtList.do"})
    public String _cmt_selectTbBrdCmtList(@ModelAttribute("searchVO") TbBrdCmtVO searchVO, 
    		ModelMap model)
            throws Exception {
    	
    	/** EgovPropertyService.sample */
    	//searchVO.setPageUnit(propertiesService.getInt("pageUnit"));
    	//searchVO.setPageSize(propertiesService.getInt("pageSize"));
    	
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
        
        return "/front/tbBrdCmt/TbBrdCmtList";
    } 
    
    @RequestMapping("/front/brdCmt/addBrdCmt_act.do")
    @ResponseBody
    public String _cmt_addBrdCmt_act(
            TbBrdCmtVO tbBrdCmtVO,            
            SessionStatus status,
            HttpSession session )
            throws Exception {
    	
    	TbMemVO tbMemVO = (TbMemVO) session.getAttribute("frontLoginVO");
		if(tbMemVO == null) {
			return "NO_LOGIN";
		}
		
		tbBrdCmtVO.setMemSeq( tbMemVO.getMemSeq().intValue() );
		tbBrdCmtVO.setMemId(tbMemVO.getMemId());
		
		tbBrdCmtService.insertTbBrdCmt(tbBrdCmtVO);
        
        status.setComplete();
        return "Y";
    }
    
    @RequestMapping("/front/brdCmt/deleteBrdCmt_act.do")
    @ResponseBody
    public String _cmt_deleteBrdCmt_act(            
    		TbBrdCmtVO tbBrdCmtVO,
            SessionStatus status,
            HttpSession session )
            throws Exception {
    	
    	TbMemVO tbMemVO = (TbMemVO) session.getAttribute("frontLoginVO");
		if(tbMemVO == null) {
			return "NO_LOGIN";
		}
    	
    	tbBrdCmtService.deleteTbBrdCmt(tbBrdCmtVO);
        
        status.setComplete();
        return "Y";
    }

}
