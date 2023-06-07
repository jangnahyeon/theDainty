package dlink.front.controller;

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
import org.springframework.web.bind.support.SessionStatus;

import dlink.admin.vo.TMemAccptVO;
import dlink.front.service.FrontMtsAtalkMsgService;
import dlink.front.vo.MtsAtalkMsgDefaultVO;
import dlink.front.vo.MtsAtalkMsgVO;

/**
 * @Class Name : MtsAtalkMsgController.java
 * @Description : MtsAtalkMsg Controller class
 * @Modification Information
 *
 * @author 이효진
 * @since 2022-04-07
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */

@Controller
@RequestMapping("/front/mtsAtalkMsg")
//@SessionAttributes(types=MtsAtalkMsgVO.class)
public class FrontMtsAtalkMsgController {
	

    @Resource(name = "mtsAtalkMsgService")
    private FrontMtsAtalkMsgService mtsAtalkMsgService;
    
    /** EgovPropertyService */
    @Resource(name = "propertiesService")
    protected EgovPropertyService propertiesService;
	
    
    /**
	 * mts_atalk_msg 목록을 조회한다. (pageing)
	 * @param searchVO - 조회할 정보가 담긴 MtsAtalkMsgDefaultVO
	 * @return "/mtsAtalkMsg/MtsAtalkMsgList"
	 * @exception Exception
	 */
    
    @RequestMapping(value="/MtsAtalkMsgList.do")
    public String selectMtsAtalkMsgList(@ModelAttribute("searchVO") MtsAtalkMsgDefaultVO searchVO, 
    		ModelMap model,  HttpSession session)
            throws Exception {
    	
    	//사용자 로그인 확인 Start
		TMemAccptVO loginVO = (TMemAccptVO) session.getAttribute("DlinkLogin");
		if(loginVO == null) {
			model.addAttribute("msg", "fail");
			return "redirect:/front/login.do";
		}
		//사용자 로그인 확인 End

    	
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
		
        List<?> mtsAtalkMsgList = mtsAtalkMsgService.selectMtsAtalkMsgList(searchVO);
        model.addAttribute("resultList", mtsAtalkMsgList);
        
        int totCnt = mtsAtalkMsgService.selectMtsAtalkMsgListTotCnt(searchVO);
		paginationInfo.setTotalRecordCount(totCnt);
        model.addAttribute("paginationInfo", paginationInfo);
        
        return "/front/mtsAtalkMsg/MtsAtalkMsgList";
    } 
    
    @RequestMapping("/addMtsAtalkMsgView.do")
    public String addMtsAtalkMsgView(
            @ModelAttribute("searchVO") MtsAtalkMsgDefaultVO searchVO, Model model)
            throws Exception {
        model.addAttribute("mtsAtalkMsgVO", new MtsAtalkMsgVO());
        return "/front/mtsAtalkMsg/MtsAtalkMsgRegister";
    }
    
    @RequestMapping("/addMtsAtalkMsg.do")
    public String addMtsAtalkMsg(
            MtsAtalkMsgVO mtsAtalkMsgVO,
            @ModelAttribute("searchVO") MtsAtalkMsgDefaultVO searchVO, SessionStatus status)
            throws Exception {
        mtsAtalkMsgService.insertMtsAtalkMsg(mtsAtalkMsgVO);
        status.setComplete();
        return "forward:/front/mtsAtalkMsg/MtsAtalkMsgList.do";
    }
    
    @RequestMapping("/updateMtsAtalkMsgView.do")
    public String updateMtsAtalkMsgView(
            @RequestParam("tranPr") java.math.BigInteger tranPr ,
            @ModelAttribute("searchVO") MtsAtalkMsgDefaultVO searchVO, Model model)
            throws Exception {
        MtsAtalkMsgVO mtsAtalkMsgVO = new MtsAtalkMsgVO();
        mtsAtalkMsgVO.setTranPr(tranPr);        
        // 변수명은 CoC 에 따라 mtsAtalkMsgVO
        model.addAttribute(selectMtsAtalkMsg(mtsAtalkMsgVO, searchVO));
        return "/front/mtsAtalkMsg/MtsAtalkMsgRegister";
    }

    @RequestMapping("/selectMtsAtalkMsg.do")
    public @ModelAttribute("mtsAtalkMsgVO")
    MtsAtalkMsgVO selectMtsAtalkMsg(
            MtsAtalkMsgVO mtsAtalkMsgVO,
            @ModelAttribute("searchVO") MtsAtalkMsgDefaultVO searchVO) throws Exception {
        return mtsAtalkMsgService.selectMtsAtalkMsg(mtsAtalkMsgVO);
    }

    @RequestMapping("/updateMtsAtalkMsg.do")
    public String updateMtsAtalkMsg(
            MtsAtalkMsgVO mtsAtalkMsgVO,
            @ModelAttribute("searchVO") MtsAtalkMsgDefaultVO searchVO, SessionStatus status)
            throws Exception {
        mtsAtalkMsgService.updateMtsAtalkMsg(mtsAtalkMsgVO);
        status.setComplete();
        return "forward:/front/mtsAtalkMsg/MtsAtalkMsgList.do";
    }
    
    @RequestMapping("/deleteMtsAtalkMsg.do")
    public String deleteMtsAtalkMsg(
            MtsAtalkMsgVO mtsAtalkMsgVO,
            @ModelAttribute("searchVO") MtsAtalkMsgDefaultVO searchVO, SessionStatus status)
            throws Exception {
        mtsAtalkMsgService.deleteMtsAtalkMsg(mtsAtalkMsgVO);
        status.setComplete();
        return "forward:/front/mtsAtalkMsg/MtsAtalkMsgList.do";
    }

}
