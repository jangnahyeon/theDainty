package dlink_new.admin.controller;

import java.util.List;
import java.util.Map;

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
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import dlink_new.admin.service.TbPortfService;
import dlink_new.admin.vo.TbMemVO;
import dlink_new.admin.vo.TbPortfDefaultVO;
import dlink_new.admin.vo.TbPortfVO;
import dlink_new.common.service.FileService;

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
public class TbPortfController {

    @Resource(name = "tbPortfService")
    private TbPortfService tbPortfService;
    
    @Resource(name = "FileService")
    private FileService fileService;
    
    /** EgovPropertyService */
    @Resource(name = "propertiesService")
    protected EgovPropertyService propertiesService;
	
    /**
	 * tb_portf 목록을 조회한다. (pageing)
	 * @param searchVO - 조회할 정보가 담긴 TbPortfDefaultVO
	 * @return "/admin/tbPortf/TbPortfList"
	 * @exception Exception
	 */
    @RequestMapping(value={"/admin/tbPortf/TbPortfList.do", "/admin/portf/portfList.do"})
    public String selectTbPortfList(@ModelAttribute("searchVO") TbPortfVO searchVO, 
    		ModelMap model)
            throws Exception {
    	
        List<?> tbPortList = tbPortfService.selectOrderNoList(searchVO);
        model.addAttribute("tbPortList", tbPortList);
    	
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
		
        List<?> tbPortfList = tbPortfService.selectTbPortfList(searchVO);
        model.addAttribute("resultList", tbPortfList);
        
        int totCnt = tbPortfService.selectTbPortfListTotCnt(searchVO);
		paginationInfo.setTotalRecordCount(totCnt);
        model.addAttribute("paginationInfo", paginationInfo);
        
        return "/admin/tbPortf/TbPortfList";
    } 
    
    @RequestMapping("/admin/tbSisul/tbPortfDetail.do")
	public String tbPortfDetail(@RequestParam("portfSeq") Integer portfSeq,
			@ModelAttribute("searchVO") TbPortfVO searchVO, Model model) throws Exception {
    	TbPortfVO tbPortfVO = new TbPortfVO();
    	tbPortfVO.setPortfSeq(portfSeq);
    	tbPortfVO = tbPortfService.selectTbPortf(tbPortfVO);
		model.addAttribute("resultList", tbPortfVO);

		return "/admin/tbPortf/TbPortfDetail";
	}
    
    @RequestMapping("/admin/tbPortf/addTbPortfView.do")
    public String addTbPortfView(
            @ModelAttribute("searchVO") TbPortfVO searchVO, Model model)
            throws Exception {
        model.addAttribute("resultList", searchVO);
        return "/admin/tbPortf/TbPortfAdd";
    }
    
    @RequestMapping("/admin/tbPortf/addTbPortf.do")
    @ResponseBody
    public String addTbPortf(
            TbPortfVO tbPortfVO,
            @ModelAttribute("searchVO") TbPortfVO searchVO, SessionStatus status, HttpSession session)
            throws Exception {
    	String rs = "";
		try {
	    	TbMemVO tbMemVO = (TbMemVO) session.getAttribute("adminLoginVO");
			if(tbMemVO == null) {
				return "redirect:/admin/login.do";
			}
			
			tbPortfVO.setMemSeq(tbMemVO.getMemSeq());
			tbPortfVO.setMemId(tbMemVO.getMemId());

			TbPortfVO forTbPortfVO = new TbPortfVO();;
			List<Map<String, Object>> tbPortfList = tbPortfService.selectOrderNoList(searchVO);
			String portfSeq = "0";
			int order = 2;
			for(int i=0; i<tbPortfList.size(); i++) {
				
				portfSeq = tbPortfList.get(i).get("portfSeq").toString(); 
				forTbPortfVO.setPortfSeq(Integer.valueOf(portfSeq));
				
				forTbPortfVO = tbPortfService.selectTbPortf(forTbPortfVO);
				
//				String OrderNo = forTbPortfVO.getOrderNo();
//				int OrderNo1 = Integer.valueOf(OrderNo) + 1;
				forTbPortfVO.setOrderNo(String.valueOf(order++));
				
				tbPortfService.updateTbPortf(forTbPortfVO);
			}
			
			tbPortfVO.setOrderNo("1");
	        tbPortfService.insertTbPortf(tbPortfVO);
	        status.setComplete();

			rs = "Y";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return rs;
    }
    
    @RequestMapping("/admin/tbPortf/updateTbPortfView.do")
    public String updateTbPortfView(
            @RequestParam("portfSeq") Integer portfSeq ,
            @ModelAttribute("searchVO") TbPortfDefaultVO searchVO, Model model)
            throws Exception {
        TbPortfVO tbPortfVO = new TbPortfVO();
        tbPortfVO.setPortfSeq(portfSeq);        
        // 변수명은 CoC 에 따라 tbPortfVO
        tbPortfVO = selectTbPortf(tbPortfVO, searchVO);
        model.addAttribute("resultList", tbPortfVO);
        
        return "/admin/tbPortf/TbPortfAdd";
    }
    
    @RequestMapping("/admin/tbPortf/updateTbPortf.do")
    @ResponseBody
    public String updateTbPortf(
            TbPortfVO tbPortfVO,
            @ModelAttribute("searchVO") TbPortfDefaultVO searchVO, SessionStatus status, HttpSession session)
            throws Exception {
    	String rs = "";
		try {
	    	TbMemVO tbMemVO = (TbMemVO) session.getAttribute("adminLoginVO");
			if(tbMemVO == null) {
				return "redirect:/admin/login.do";
			}
	        tbPortfService.updateTbPortf(tbPortfVO);
	        status.setComplete();
	        rs = "Y";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return rs;
    }

    @RequestMapping("/admin/tbPortf/selectTbPortf.do")
    public @ModelAttribute("tbPortfVO")
    TbPortfVO selectTbPortf(
            TbPortfVO tbPortfVO,
            @ModelAttribute("searchVO") TbPortfDefaultVO searchVO) throws Exception {
        return tbPortfService.selectTbPortf(tbPortfVO);
    }

    
    @RequestMapping("/admin/tbPortf/deleteTbPortf.do")
    public String deleteTbPortf(
            TbPortfVO tbPortfVO,
            @ModelAttribute("searchVO") TbPortfDefaultVO searchVO, SessionStatus status)
            throws Exception {
    	String code = tbPortfVO.getCode();
        tbPortfService.deleteTbPortf(tbPortfVO);
        status.setComplete();
        return "forward:/admin/tbPortf/TbPortfList.do?code=" + code;
    }
    
    @RequestMapping("/admin/tbPortf/updateUpDown.do")
    public String updateUpDown(
    	TbPortfVO tbPortfVO, RedirectAttributes rttr,
        @ModelAttribute("searchVO") TbPortfVO searchVO, SessionStatus status, HttpSession session)
        throws Exception {
    	
    	TbMemVO tbMemVO = (TbMemVO) session.getAttribute("adminLoginVO");
    	tbPortfVO.setUpdId(tbMemVO.getMemId());
    	
		String code = searchVO.getCode();
		String pageIndex = String.valueOf(searchVO.getPageIndex());
    	if(null != tbPortfVO.getTarget_portfSeq()) {
    		
    		TbPortfVO curTbPortfVO = tbPortfService.selectTbPortf(searchVO);
    		
    		searchVO.setPortfSeq(searchVO.getTarget_portfSeq());
    		TbPortfVO tarTbPortfVO = tbPortfService.selectTbPortf(searchVO);
    		
    		if(null != curTbPortfVO && null != tarTbPortfVO) {
    			
    			String curOrderNo = curTbPortfVO.getOrderNo();
    			String tarOrderNo = tarTbPortfVO.getOrderNo();
    			
    			curTbPortfVO.setOrderNo(tarOrderNo);
    			tarTbPortfVO.setOrderNo(curOrderNo);
    			
    			curTbPortfVO.setUpdId(tbMemVO.getMemId());
    			tarTbPortfVO.setUpdId(tbMemVO.getMemId());
    			
    			tbPortfService.updateTbPortf(curTbPortfVO);
    			tbPortfService.updateTbPortf(tarTbPortfVO);
    		}
    	} else {
    		return "redirect:/admin/tbPortf/TbPortfList.do?code=" + code + "&&pageIndex=" + pageIndex;
    	}
    	
    	return "redirect:/admin/tbPortf/TbPortfList.do?code=" + code + "&&pageIndex=" + pageIndex;
    }

}
