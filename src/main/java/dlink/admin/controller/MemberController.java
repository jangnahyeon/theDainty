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

import dlink.admin.service.TSpecReqComService;
import dlink.admin.vo.SearchVO;
import dlink.admin.vo.TMemAccptVO;
import dlink.admin.vo.TMemComVO;
import dlink.admin.vo.TMemUserVO;
import dlink.admin.vo.TSpecComVO;
import dlink.admin.vo.TSpecReqComVO;
import dlink.common.service.MtsAtalkMsgService;
import dlink.front.vo.MtsAtalkMsgVO;
import dlink.admin.service.TSpecComService;
import dlink.admin.service.TMemComService;
import dlink.admin.service.TMemUserService;
/**
 * @Class Name : MemberController.java
 * @Description : Member Controller class
 * @Modification Information
 *
 * @author 이은지
 * @since 2022-04-07
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */

@Controller
@RequestMapping("/admin/member")
public class MemberController {

    @Resource(name = "TSpecReqComService")
    private TSpecReqComService TSpecReqComService;
    
    @Resource(name = "TSpecComService")
    private TSpecComService TSpecComService;
    
    /** EgovPropertyService */
    @Resource(name = "propertiesService")
    protected EgovPropertyService propertiesService;
	
    @Resource(name = "TMemComService")
    protected TMemComService TMemComService;
    
   @Resource(name = "TMemUserService")
    private TMemUserService TMemUserService;
   
   /** 알림톡 */
   @Resource(name = "MtsAtalkMsgService")
   private MtsAtalkMsgService MtsAtalkMsgService;
    
    /**
	 * t_spec_req_com 목록을 조회한다. (pageing)
	 * @param searchVO - 조회할 정보가 담긴 SearchVO
	 * @return "/member/mJoinInquiryList"
	 * @exception Exception
	 */
    @RequestMapping(value="/mJoinInquiryList.do")
    public String selectTSpecReqComList(@ModelAttribute("searchVO") SearchVO searchVO, ModelMap model, HttpSession session )
            throws Exception {
    	
    	//사용자 로그인 확인 Start
		TMemAccptVO loginVO = (TMemAccptVO) session.getAttribute("DlinkLogin");
		if(loginVO == null) {
			model.addAttribute("msg", "fail");
			return "redirect:/admin/login.do";
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
		
        List<?> TSpecReqComList = TSpecReqComService.selectTSpecReqComList(searchVO);
        model.addAttribute("resultList", TSpecReqComList);
        
        int totCnt = TSpecReqComService.selectTSpecReqComListTotCnt(searchVO);
		paginationInfo.setTotalRecordCount(totCnt);
        model.addAttribute("paginationInfo", paginationInfo);
        
        return "/admin/member/mJoinInquiryList";
    } 
    
    //상세페이지
    @RequestMapping("/mJoinDetail.do")
    public String TSpecReqComView( HttpSession session,
        @RequestParam("loginId") String loginId,
        @RequestParam("reqNo") BigDecimal reqNo,
        @RequestParam("registerFlag") String registerFlag ,
        @ModelAttribute("searchVO") SearchVO searchVO, Model model)
    
        throws Exception {
    	
    	try {
    		TSpecReqComVO TSpecReqComVO = new TSpecReqComVO();
	        TSpecReqComVO setTSpecReqComVO = new TSpecReqComVO();
	    	    
	    	 // 전문회사신청정보
	    	TSpecReqComVO.setLoginId(loginId);        
	    	TSpecReqComVO.setReqNo(reqNo);
	        setTSpecReqComVO = TSpecReqComService.selectTSpecReqCom(TSpecReqComVO);
	        
	        // 전문회사신청인력현황 정보
	        TSpecReqComVO getTSpecReqComVO = new TSpecReqComVO();
	        getTSpecReqComVO.setLoginId(loginId);  
	        getTSpecReqComVO.setReqNo(reqNo);
	       List<?> selectTSpecMemList = TSpecReqComService.selectAdminTSpecReqMem(getTSpecReqComVO);
	       
	       TSpecComVO TSpecComVO = new TSpecComVO(); 
	       TSpecComVO.setLoginId(loginId);
	       
	       List<?> TMemComFileList = TSpecComService.selectTMemComFileList(TSpecComVO);
	       
	        // 변수명은 CoC 에 따라 TSpecReqComVO
		    model.addAttribute(selectTSpecReqCom(TSpecReqComVO, searchVO));
	        model.addAttribute("registerFlag", registerFlag);
	        model.addAttribute("TSpecReqComVO", setTSpecReqComVO);
	        model.addAttribute("selectTSpecMemList", selectTSpecMemList);
	        model.addAttribute("TMemComFileList", TMemComFileList);
    	} catch (Exception e) {
    		e.printStackTrace();
		}
	        
        
        return "/admin/member/mJoinDetail";
    }
   
    //삭제
    @ResponseBody
    @RequestMapping("/deleteTSpecReqCom.do")
    public String deleteTSpecReqCom(
    		HttpServletRequest request, ModelAndView view, ModelMap modelMap, HttpSession session,
    		TSpecReqComVO TSpecReqComVO, Model model,
            @ModelAttribute("searchVO") SearchVO searchVO,
            @RequestParam("loginId") String loginId ,
            SessionStatus status)
    
            throws Exception {
    	
	    	String rst = "";
	    	
	    	//사용자 로그인 확인 Start
			TMemAccptVO loginVO = (TMemAccptVO) session.getAttribute("DlinkLogin");
			if(loginVO == null) {
				model.addAttribute("msg", "fail");
				return "redirect:/admin/login.do";
			}
			//사용자 로그인 확인 End
    	
	    	  try {
	    		  
	    		  TSpecReqComVO setTSpecReqComvo = new TSpecReqComVO();
	    		  setTSpecReqComvo.setLoginId(loginId);
	    		  setTSpecReqComvo.setReqNo(TSpecReqComVO.getReqNo());
	    		  
	    		  TSpecReqComService.deleteTSpecReqMem(setTSpecReqComvo);  //  전문회사신청 인력 현황 정보 삭제
	    		  
	          	   TSpecReqComService.deleteTSpecReqCom(setTSpecReqComvo);   // 전문회사신청정보 삭제
	          	
	          	
	          //status.setComplete();
	              
	          	rst = "suc";
	  		} catch (Exception e) {
	  			
	  			e.printStackTrace();
	  			
	  			return "fail";
	  		}finally {
	  			
	  		}
    	  
        return rst;
    }
    
  //등록
    @RequestMapping("/addTSpecReqComView.do")
    public String addTSpecReqComView(
    		@ModelAttribute("searchVO") SearchVO searchVO,
            @RequestParam("registerFlag") String registerFlag ,
            Model model)
    		throws Exception {
    	
    	model.addAttribute("registerFlag", registerFlag);
    	model.addAttribute("TSpecReqComVO", new TSpecReqComVO());
    	
        return "/admin/member/mJoinWrite";
    }    
    @ResponseBody
    @RequestMapping("/addTSpecReqCom.do")
    public String addTSpecReqCom(
    		HttpServletRequest request, ModelAndView view, ModelMap modelMap, HttpSession session,
    		TSpecReqComVO TSpecReqComVO, Model model,
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
						
        	TSpecReqComService.insertTSpecReqCom(TSpecReqComVO);
        	// status.setComplete();
        	 
        	 res = "suc";
		} catch (Exception e) {
			
			e.printStackTrace();
			return "fail";
		}finally {
			
		}
                	        
        return res;
    }	
    
    //수정
    @RequestMapping("/updateTSpecReqComView.do")
    public String updateTSpecReqComView( 
            @RequestParam("loginId") String loginId ,
            @ModelAttribute("searchVO") SearchVO searchVO, 
            @RequestParam("registerFlag") String registerFlag ,Model model)
   
            throws Exception {
    	
    	TSpecReqComVO setTSpecReqComVO = new TSpecReqComVO();
    	TSpecReqComVO TSpecReqComVO = new TSpecReqComVO();
    	
    	TSpecReqComVO.setLoginId(loginId);   
    	setTSpecReqComVO = TSpecReqComService.selectTSpecReqCom(TSpecReqComVO);
    	
        // 변수명은 CoC 에 따라 TWordVO
        model.addAttribute(selectTSpecReqCom(TSpecReqComVO, searchVO));
        model.addAttribute("TSpecReqComVO",TSpecReqComVO);
        model.addAttribute("registerFlag", registerFlag);
        model.addAttribute("TSpecReqComVO", setTSpecReqComVO);
        
        return "/admin/member/mJoinWrite"; 
    }  
    
    // 전문회사 승인여부 등록
    @ResponseBody
    @RequestMapping("/updateTSpecReqCom.do")
    public String updateTSpecReqCom(
    		HttpServletRequest request, ModelAndView view, ModelMap modelMap, HttpSession session,
    		TSpecReqComVO TSpecReqComVO, Model model,
    		 @ModelAttribute("searchVO") SearchVO searchVO, SessionStatus status)
            throws Exception {
    	
    	String rst = "";

    	//사용자 로그인 확인 Start
		TMemAccptVO loginVO = (TMemAccptVO) session.getAttribute("DlinkLogin");
		if(loginVO == null) {
			model.addAttribute("msg", "fail");
			return "redirect:/admin/login.do";
		}
		//사용자 로그인 확인 End
		
	    try {
	    		// 승인결과
	    	String acceptYn = TSpecReqComVO.getAcceptYn();
	    			
	    	// 승인일경우
	    	if("AC0001".equals(acceptYn)){  
	    		
	    			TMemComVO TMemComVO = new TMemComVO();
	    			TMemComVO.setSpecYn("Y"); // 전문회사 여부 체크
	    			TMemComVO.setLoginId(TSpecReqComVO.getLoginId());
	    			TMemComService.updateSpecYnTMemCom(TMemComVO);
	    				    		
		    		TSpecComVO TSpecComVO = new TSpecComVO();
		    		TSpecComVO.setLoginId(TSpecReqComVO.getLoginId());
		    		int specNo = TSpecComService.selectSpecNoInsertCd(TSpecComVO);
		    		
		    		TSpecComVO.setSpecNo(specNo);
		    		TSpecComVO.setSalesAmt(TSpecReqComVO.getSalesAmt());
		    		TSpecComVO.setKeyCustomer(TSpecReqComVO.getKeyCustomer());
		    		TSpecComVO.setEmploy(TSpecReqComVO.getEmploy());
		    		TSpecComVO.setAccepter(loginVO.getLoginId());
		    		TSpecComService.insertTSpecCom(TSpecComVO);   // 전문회사정보 등록
		    		
		    		
		    		TSpecComService.insertTSpecMem(TSpecComVO); // 전문회사별인력현황 등록
		    		
		    		
		    		// 회원 정보 가지고 오기
					TMemComVO.setLoginId(TSpecReqComVO.getLoginId());
					
					TMemComVO setTMemComVO = TMemComService.selectTMemCom(TMemComVO);
					
					// 전문업체신청 승인 시 알림톡 발송
					MtsAtalkMsgVO reqvo = new MtsAtalkMsgVO();
					reqvo.setUserNm(setTMemComVO.getCeoNm());
					reqvo.setMobileNo(setTMemComVO.getCeoMobileNo().replaceAll("-", ""));
					reqvo.setTranTmplCd("sendTalk_mst005");
					MtsAtalkMsgService.sendTalk_Default(reqvo);
					
	    	}else if("AC0002".equals(acceptYn)){  // 반려
	    		
	    		TSpecReqComService.updateAcceptTSpecReqCom(TSpecReqComVO);
	    		
	    		
	    		// 회원 정보 가지고 오기
				TMemComVO TMemComVO = new TMemComVO();
				TMemComVO.setLoginId(TSpecReqComVO.getLoginId());
				
				TMemComVO setTMemComVO = TMemComService.selectTMemCom(TMemComVO);
				
				// 전문업체신청 반려 시 알림톡 발송
				MtsAtalkMsgVO reqvo = new MtsAtalkMsgVO();
				reqvo.setUserNm(setTMemComVO.getCeoNm());
				reqvo.setMobileNo(setTMemComVO.getCeoMobileNo().replaceAll("-", ""));
				reqvo.setTranTmplCd("sendTalk_mst006");
				MtsAtalkMsgService.sendTalk_Default(reqvo);
				
	    	}
	    	
	    	 status.setComplete();
	    	 
	    	rst = "suc";
		} catch (Exception e) {
			
			e.printStackTrace();
			return "fail";
		}finally {
			
		}
	            	        
	    return rst;
	}	
        
            
    @RequestMapping("selectTSpecReqCom.do")
    public @ModelAttribute("TSpecReqComVO")
    TSpecReqComVO selectTSpecReqCom(
            TSpecReqComVO TSpecReqComVO,
            @ModelAttribute("searchVO") SearchVO searchVO) throws Exception {
        return TSpecReqComService.selectTSpecReqCom(TSpecReqComVO);
    }
    
    
    
    
    /**
   	 * t_spec_com, t_spec_mem  목록을 조회한다. (pageing)
   	 * @param searchVO - 조회할 정보가 담긴 SearchVO
   	 * @return "/member/mJoinInquiryEndList"
   	 * @exception Exception
   	 */
       @RequestMapping(value="/mJoinInquiryEndList.do")
       public String mJoinInquiryEndList(
    		   @ModelAttribute("searchVO") SearchVO searchVO, ModelMap model, HttpSession session,
    		   @RequestParam(value = "searchCondition", required=false) String searchCondition ,
      		 @RequestParam(value = "searchKeyword" , required=false) String searchKeyword 
    		   )
               throws Exception {
       	
       	//사용자 로그인 확인 Start
   		TMemAccptVO loginVO = (TMemAccptVO) session.getAttribute("DlinkLogin");
   		if(loginVO == null) {
   			model.addAttribute("msg", "fail");
   			return "redirect:/admin/login.do";
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
   		searchVO.setSearchCondition(searchCondition);
		searchVO.setSearchKeyword(searchKeyword);
		
           List<?> TSpecComList = TSpecComService.selectTSpecList(searchVO);
           model.addAttribute("TSpecComList", TSpecComList);
           
           int totCnt = TSpecComService.selectTSpecListTotCnt(searchVO);
           
   		paginationInfo.setTotalRecordCount(totCnt);
           model.addAttribute("paginationInfo", paginationInfo);
           
           return "/admin/member/mJoinInquiryEndList";
       } 
       
       
       //상세페이지
       @RequestMapping("/mJoinInquiryEndDetail.do")
       public String mJoinInquiryEndDetail( HttpSession session,
           @RequestParam("loginId") String loginId,
           @RequestParam("specNo") int specNo ,
           @ModelAttribute("searchVO") SearchVO searchVO, Model model)
       
           throws Exception {
       	
   	        TSpecComVO TSpecComVO = new TSpecComVO();
   	        TSpecComVO setTSpecComVO = new TSpecComVO();
   	    	
   	        TSpecComVO.setSpecNo(specNo);           
   	        setTSpecComVO = TSpecComService.selectTSpecCom(TSpecComVO);
           
   	        TSpecComVO.setSpecNo(specNo);
   	        List<?> selectTSpecMemList = TSpecComService.selectTSpecMemList(TSpecComVO);
   	        
   	        TSpecComVO.setLoginId(loginId);
   	        List<?> TMemComFileList = TSpecComService.selectTMemComFileList(TSpecComVO);
   	     
   	        	// 변수명은 CoC 에 따라 TSpecComVO
   	        model.addAttribute(selectTSpecCom(TSpecComVO, searchVO));
           model.addAttribute("selectTSpecMemList", selectTSpecMemList);
           model.addAttribute("setTSpecComVO", setTSpecComVO);
           model.addAttribute("TMemComFileList", TMemComFileList);
           
           return "/admin/member/mJoinInquiryEndDetail";
       }
       
       @RequestMapping("/selectTSpecCom.do")
       public @ModelAttribute("TSpecComVO")
       TSpecComVO selectTSpecCom(
    		   TSpecComVO TSpecComVO,
               @ModelAttribute("searchVO") SearchVO searchVO) throws Exception {
           return TSpecComService.selectTSpecCom(TSpecComVO);
       }
       
       
       //삭제
       @ResponseBody
       @RequestMapping("/deleteTSpecCom.do")
       public String deleteTSpecCom(
       		HttpServletRequest request, ModelAndView view, ModelMap modelMap, HttpSession session,
       		TSpecComVO TSpecComVO, Model model,
               @ModelAttribute("searchVO") SearchVO searchVO,
               SessionStatus status)
       
               throws Exception {
       	
   	    	String rst = "";
   	    	
   	    	//사용자 로그인 확인 Start
   			TMemAccptVO loginVO = (TMemAccptVO) session.getAttribute("DlinkLogin");
   			if(loginVO == null) {
   				model.addAttribute("msg", "fail");
   				return "redirect:/admin/login.do";
   			}
   			//사용자 로그인 확인 End
       	
   	    	  try {
   	    		  
   	    		  TSpecComVO setTSpecComvo = new TSpecComVO();
   	    		setTSpecComvo.setSpecNo(TSpecComVO.getSpecNo());
   	    		
   	    		// 전문회사정보 삭제
   	          	TSpecComService.deleteTSpecMem(setTSpecComvo);
   	          	
   	          	// 전문회사별인력현황
   	          	TSpecComService.deleteTSpecCom(setTSpecComvo);
   	          //status.setComplete();
   	              
   	          	rst = "suc";
   	  		} catch (Exception e) {
   	  			
   	  			e.printStackTrace();
   	  			
   	  			return "fail";
   	  		}finally {
   	  			
   	  		}
       	  
           return rst;
       }
       
}
