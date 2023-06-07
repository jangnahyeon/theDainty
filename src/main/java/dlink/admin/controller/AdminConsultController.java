package dlink.admin.controller;

import java.math.BigDecimal;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
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
import org.springframework.web.servlet.ModelAndView;


import dlink.admin.service.TCommutyService;
import dlink.admin.service.TPtplInfoService;
import dlink.admin.service.TReqMakeService;
import dlink.admin.vo.SearchVO;
import dlink.admin.vo.TCommutyVO;
import dlink.admin.vo.TMemAccptVO;
import dlink.admin.vo.TPtplInfoVO;
import dlink.admin.vo.TReqMakeVO;

/**
 * @Class Name : AdminConsultController.java
 * @Description : AdminConsultController Controller class
 * @Modification Information
 *
 * @author 이효진
 * @since 2022-04-11
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */

@Controller
@RequestMapping("/admin/consult")
public class AdminConsultController {

    @Resource(name = "TReqMakeService")
    private TReqMakeService TReqMakeService;
    
    /** EgovPropertyService */
    @Resource(name = "propertiesService")
    protected EgovPropertyService propertiesService;
	
    @Resource(name = "TPtplInfoService")
    private TPtplInfoService TPtplInfoService;
    
    /**
	 * t_req_make 목록을 조회한다. (pageing)
	 * @param searchVO - 조회할 정보가 담긴 SerchVo
	 * @return "/consult/counSearchList"
	 * @exception Exception
	 */
    @RequestMapping(value="/counSearchList.do")
    public String selectTReqMakeList(@ModelAttribute("searchVO") SearchVO searchVO, 
    		 @RequestParam(value = "searchCondition", required=false) String searchCondition ,
    		 @RequestParam(value = "searchKeyword" , required=false) String searchKeyword ,
    		ModelMap model, HttpServletRequest request)
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
		searchVO.setSearchCondition(searchCondition);
		searchVO.setSearchKeyword(searchKeyword);
		
        List<?> TCommutyList = TReqMakeService.selectTReqMakeList(searchVO);
        model.addAttribute("resultList", TCommutyList);
        
        int totCnt = TReqMakeService.selectTReqMakeListTotCnt(searchVO);
		paginationInfo.setTotalRecordCount(totCnt);
	
        model.addAttribute("paginationInfo", paginationInfo);
        
        return "/admin/consult/counSearchList";
    } 
    
    
    @RequestMapping("/addConsultView.do")
    public String addConsultView(
    		@RequestParam("reqNo") int reqNo ,
    		@RequestParam("seq") int seq ,
    		@RequestParam("ptplNo") String ptplNo ,
    		@RequestParam("regGb") String regGb ,
    		@RequestParam("registerFlag") String registerFlag ,
    		 @ModelAttribute("searchVO") SearchVO searchVO, 
            Model model)
            throws Exception {
    	
    	TReqMakeVO TReqMakeVO = new TReqMakeVO();   
    	TReqMakeVO.setSeq(seq);  
    	TReqMakeVO.setReqNo(reqNo);
    	TReqMakeVO.setPtplNo(ptplNo);

       List<?> selectCommentList = TReqMakeService.selectCommentsTReqMakeList(TReqMakeVO);
        
       // 포트폴리오 정보를 가지고옴
       // String인 ptplNo 변수 bigdecimal 형변환 작업
       BigDecimal bigptplNo = new BigDecimal(ptplNo); 
       
       TPtplInfoVO TPtplInfoVO = new TPtplInfoVO();
       TPtplInfoVO.setPtplNo(bigptplNo);     
       TPtplInfoVO setTPtplInfoVO = TPtplInfoService.selectTPtplInfo(TPtplInfoVO);
       
       
        // 변수명은 CoC 에 따라 TCommutyVO
        model.addAttribute(selectTReqMake(TReqMakeVO, searchVO));
        model.addAttribute("selectCommentList", selectCommentList);
        model.addAttribute("setTPtplInfoVO", setTPtplInfoVO);
        
        model.addAttribute("reqNo", reqNo);
        model.addAttribute("seq", seq);
        model.addAttribute("ptplNo", ptplNo);
        model.addAttribute("regGb", regGb);
        model.addAttribute("registerFlag", registerFlag);
        
        return "/admin/consult/counConfirm";
    }

    
    /* 관리자 상담등록 */
    @ResponseBody
    @RequestMapping("/addConsult.do")
    public String addTReqMake(
    		HttpServletRequest request, ModelAndView view, ModelMap modelMap, 
    		HttpSession session, Model model,
           TReqMakeVO TReqMakeVO, 
            @ModelAttribute("searchVO") SearchVO searchVO, SessionStatus status)
            throws Exception {
    	
    	String res = "";
    	
    	
    	//사용자 로그인 확인 Start
		TMemAccptVO loginVO = (TMemAccptVO) session.getAttribute("DlinkLogin");
		if(loginVO == null) {
			model.addAttribute("msg", "fail");
			return "redirect:/admin/login.do";
		}
		//사용자 로그인 확인 End
    	
		try {
			TReqMakeVO setTReqMakeVO = new TReqMakeVO();
						
			setTReqMakeVO.setReqNo(TReqMakeVO.getReqNo());
			setTReqMakeVO.setPtplNo(TReqMakeVO.getPtplNo());

			int seq = TReqMakeService.selectForInsertSeq(setTReqMakeVO); // 상담순번 생성
			
			setTReqMakeVO.setSeq(seq);
			setTReqMakeVO.setCont(TReqMakeVO.getCont());
			setTReqMakeVO.setLoginId(loginVO.getLoginId());
			setTReqMakeVO.setRegister(loginVO.getLoginId());	
			setTReqMakeVO.setRegGb(TReqMakeVO.getRegGb());	
			
			TReqMakeService.insertTReqMake(setTReqMakeVO);
		    //status.setComplete();
		       
			res = "suc";
		}catch(Exception e){
			e.printStackTrace();
			return "fail";
		} finally {
			
		}
		
       
        return res;
    }
    
 

    @RequestMapping("/selectCommuty.do")
    public @ModelAttribute("TCommutyVO")
    TReqMakeVO selectTReqMake(
           TReqMakeVO TReqMakeVO,
            @ModelAttribute("searchVO") SearchVO searchVO) throws Exception {
        return TReqMakeService.selectTReqMake(TReqMakeVO);
    }
    
 
    
    
    // 삭제
    @ResponseBody
    @RequestMapping("/deleteConsult.do")
    public String deleteTReqMake(
    		TReqMakeVO TReqMakeVO, HttpSession session, Model model,
            @ModelAttribute("searchVO") SearchVO searchVO, 
            @RequestParam("reqNo") int reqNo ,
            SessionStatus status)
            throws Exception {
    	

        String res = "";
    	//사용자 로그인 확인 Start
		TMemAccptVO loginVO = (TMemAccptVO) session.getAttribute("DlinkLogin");
		if(loginVO == null) {
			model.addAttribute("msg", "fail");
			return "redirect:/admin/login.do";
		}
		//사용자 로그인 확인 End
    	
		try { 
			TReqMakeVO.setReqNo(reqNo);
			TReqMakeService.deleteTReqMake(TReqMakeVO);
	        //status.setComplete();
	        
			res = "suc";
				
		}catch(Exception e){
			
			e.printStackTrace();
			return "fail";
			
		} finally {
			
		}
		
        return res;
           
    }

     
    
}
