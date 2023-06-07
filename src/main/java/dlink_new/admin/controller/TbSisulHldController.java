package dlink_new.admin.controller;

import java.math.BigDecimal;
import java.util.List;

import javax.annotation.Resource;

import org.egovframe.rte.fdl.property.EgovPropertyService;
import org.egovframe.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import dlink_new.admin.service.TbSisulHldService;
import dlink_new.admin.vo.TbSisulDefaultVO;
import dlink_new.admin.vo.TbSisulHldDefaultVO;
import dlink_new.admin.vo.TbSisulHldVO;
import dlink_new.admin.vo.TbSisulVO;

// Servoce 객체에 대한 import 구문
// import (service package).TbSisulHldService;
// Vo 객체에 대한 import 구문
// import (vo package).TbSisulHldDefaultVO;
// import (vo package).TbSisulHldVO;

/**
 * @Class Name : TbSisulHldController.java
 * @Description : TbSisulHld Controller class
 * @Modification Information
 *
 * @author 이재욱
 * @since 2023-03-08
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */

@Controller
@SessionAttributes(types=TbSisulHldVO.class)
public class TbSisulHldController {

	private static final Logger LOGGER  = LoggerFactory.getLogger(TbSisulHldController.class);
	
    @Resource(name = "tbSisulHldService")
    private TbSisulHldService tbSisulHldService;
    
    /** EgovPropertyService */
    @Resource(name = "propertiesService")
    protected EgovPropertyService propertiesService;
	
    /**
	 * tb_sisul_hld 목록을 조회한다. (pageing)
	 * @param searchVO - 조회할 정보가 담긴 TbSisulHldDefaultVO
	 * @return "/tbSisulHld/TbSisulHldList"
	 * @exception Exception
	 */
    @RequestMapping("/admin/sisul/sisulHldList.do")
    public String sisulHld(@ModelAttribute("searchVO") TbSisulHldDefaultVO searchVO, 
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
		
        List<?> tbSisulHldList = tbSisulHldService.selectTbSisulHldList(searchVO);
        model.addAttribute("resultList", tbSisulHldList);
        
        int totCnt = tbSisulHldService.selectTbSisulHldListTotCnt(searchVO);
		paginationInfo.setTotalRecordCount(totCnt);
        model.addAttribute("paginationInfo", paginationInfo);
        
        return "/admin/tbSisulHld/TbSisulHldList";
    }
    
    @RequestMapping("/admin/sisul/tbSisulHldDetail.do")
    public String selectTbSisulHldDetail(@RequestParam("hldSeq") int hldSeq,
    		@ModelAttribute("searchVO") TbSisulDefaultVO searchVO,
    		Model model) throws Exception{
    	TbSisulHldVO tbSisulHldVO = new TbSisulHldVO();
    	tbSisulHldVO.setHldSeq(hldSeq);
    	tbSisulHldVO = tbSisulHldService.selectTbSisulHldDetail(tbSisulHldVO);
    	model.addAttribute("tbSisulHldVO", tbSisulHldVO);
    	
    	return "/admin/tbSisulHld/TbSisulHldDetail";
    }
    
    @RequestMapping({"/admin/tbSisulHld/tbSisulHldAddView.do", "/admin/tbSisulHld/tbSisulHldAdd.do"})
    public String addTbSisulHldView(
            @ModelAttribute("searchVO") TbSisulHldDefaultVO searchVO, Model model)
            throws Exception {
        model.addAttribute("tbSisulHldVO", new TbSisulHldVO());
        return "/admin/tbSisulHld/TbSisulHldAdd";
    }
    
    @RequestMapping("/admin/tbSisulHld/updateTbSisulHldView.do")
    public String updateTbSisulHldView(
            @RequestParam("hldSeq") int hldSeq ,
            @ModelAttribute("searchVO") TbSisulHldDefaultVO searchVO, Model model)
            throws Exception {
        TbSisulHldVO tbSisulHldVO = new TbSisulHldVO();
        tbSisulHldVO.setHldSeq(hldSeq);        
        // 변수명은 CoC 에 따라 tbSisulHldVO
        tbSisulHldVO = tbSisulHldService.selectTbSisulHldDetail(tbSisulHldVO);
        model.addAttribute("tbSisulHldVO", tbSisulHldVO);
        return "/admin/tbSisulHld/TbSisulHldAdd";
    }

	@RequestMapping("/admin/tbSisulHld/addTbSisulHld.do")
	@ResponseBody
	public String addTbSisul(TbSisulHldVO tbSisulHldVO, @ModelAttribute("searchVO") TbSisulDefaultVO searchVO,
			SessionStatus status) throws Exception {
		String rs = "";
		try {
			tbSisulHldService.insertTbSisulHld(tbSisulHldVO);
			status.setComplete();
			rs = "Y";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return rs;
	}
	
	@RequestMapping("/admin/tbSisulHld/updateTbSisulHld.do")
	@ResponseBody
	public String updateTbSisulHld(TbSisulHldVO tbSisulHldVO, @ModelAttribute("searchVO") TbSisulDefaultVO searchVO,
			SessionStatus status) throws Exception {
		String rs = "";
		try {
			tbSisulHldService.updateTbSisulHld(tbSisulHldVO);
			status.setComplete();
			rs = "Y";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return rs;
	}
	
    @RequestMapping("/admin/tbSisulHld/deleteTbSisulHld.do")
    public String deleteTbSisulHld(
            TbSisulHldVO tbSisulHldVO,
            @ModelAttribute("searchVO") TbSisulHldDefaultVO searchVO, SessionStatus status)
            throws Exception {
        tbSisulHldService.deleteTbSisulHld(tbSisulHldVO);
        status.setComplete();
        return "forward:/admin/sisul/sisulHldList.do";
    }
    
    @RequestMapping("/tbSisulHld/selectTbSisulHld.do")
    public @ModelAttribute("tbSisulHldVO")
    TbSisulHldVO selectTbSisulHld(
            TbSisulHldVO tbSisulHldVO,
            @ModelAttribute("searchVO") TbSisulHldDefaultVO searchVO) throws Exception {
//        return tbSisulHldService.selectTbSisulHld(tbSisulHldVO);
    	return tbSisulHldVO;
    }

    @RequestMapping("/tbSisulHld/updateTbSisulHld.do")
    public String updateTbSisulHld(
            TbSisulHldVO tbSisulHldVO,
            @ModelAttribute("searchVO") TbSisulHldDefaultVO searchVO, SessionStatus status)
            throws Exception {
        tbSisulHldService.updateTbSisulHld(tbSisulHldVO);
        status.setComplete();
        return "forward:/tbSisulHld/TbSisulHldList.do";
    }
    


}
