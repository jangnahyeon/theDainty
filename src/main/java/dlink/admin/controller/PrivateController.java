package dlink.admin.controller;

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
import org.springframework.web.util.UrlPathHelper;

import dlink.admin.service.TMemUserService;
import dlink.front.service.TReqUserService;
import dlink.front.vo.TReqUserVO;
import dlink.admin.vo.SearchVO;
import dlink.admin.vo.TMemAccptVO;
import dlink.admin.vo.TMemUserVO;

/**
 * @Class Name : PrivateController.java
 * @Description : Private Controller class
 * @Modification Information
 *
 * @author 이은지
 * @since 2022-04-06
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */

@Controller
//@SessionAttributes(types=TMemUserVO.class)
@RequestMapping("/admin/private")
public class PrivateController {

    @Resource(name = "TMemUserService")
    private TMemUserService TMemUserService;
    
    @Resource(name = "TReqUserService")
    private TReqUserService TReqUserService;
    
    /** EgovPropertyService */
    @Resource(name = "propertiesService")
    protected EgovPropertyService propertiesService;
	
    
    /**
	 * t_mem_user 목록을 조회한다. (pageing)
	 * @param searchVO - 조회할 정보가 담긴 SerchVo
	 * @return "/private/prmInquiryList"
	 * @exception Exception
	 */
    @RequestMapping(value={"/prmInquiryList.do", "/prmInquiryRequestList.do"})
    public String selectTMemUserList(@ModelAttribute("searchVO") SearchVO searchVO, HttpServletRequest request,ModelMap model, HttpSession session )
            throws Exception {
    	
	    	//사용자 로그인 확인 Start
			TMemAccptVO loginVO = (TMemAccptVO) session.getAttribute("DlinkLogin");
			if(loginVO == null) {
				model.addAttribute("msg", "fail");
				return "redirect:/admin/login.do";
			}
			UrlPathHelper urlPathHelper = new UrlPathHelper();
			String originalURL = urlPathHelper.getOriginatingRequestUri(request);
			//사용자 로그인 확인 End
			
	    	/** EgovPropertyService.sample */
	    	searchVO.setPageUnit(propertiesService.getInt("pageUnit"));
	    	searchVO.setPageSize(propertiesService.getInt("pageSize"));

	    	/** pageing */
	    	PaginationInfo paginationInfo = new PaginationInfo();
			paginationInfo.setCurrentPageNo(searchVO.getPageIndex());//현재 페이지 번호
			paginationInfo.setRecordCountPerPage(searchVO.getPageUnit());
			paginationInfo.setPageSize(searchVO.getPageSize());
			
			searchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
			searchVO.setLastIndex(paginationInfo.getLastRecordIndex());
			searchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
			String url = "";
			if (originalURL.equals("/admin/private/prmInquiryRequestList.do")) {
				 List<?> prmInquiryList = TReqUserService.selectTReqUserList(searchVO);
		        model.addAttribute("resultList", prmInquiryList);
		        int totCnt = TReqUserService.selectTReqUserListTotCnt(searchVO);
		        paginationInfo.setTotalRecordCount(totCnt); //전체 게시물 건 수
		        url = "/admin/private/prmInquiryReqList";
			} else if(originalURL.equals("/admin/private/prmInquiryList.do")) {
		        List<?> prmInquiryList = TMemUserService.selectTMemUserList(searchVO);
		        model.addAttribute("resultList", prmInquiryList);
		        int totCnt = TMemUserService.selectTMemUserListTotCnt(searchVO);
		        paginationInfo.setTotalRecordCount(totCnt); //전체 게시물 건 수
		        url = "/admin/private/prmInquiryList";
			}
	        model.addAttribute("paginationInfo", paginationInfo);
	        
	        
	        return url;
	    } 
    
    @RequestMapping(value={"/prmDetail.do", "/prmReqDetail.do"})
    public String TMemUserView( HttpSession session,
        @RequestParam("loginId") String loginId,
        @RequestParam("registerFlag") String registerFlag ,
        @ModelAttribute("searchVO") SearchVO searchVO, Model model, HttpServletRequest request)
    
        throws Exception {
	    	UrlPathHelper urlPathHelper = new UrlPathHelper();
			String originalURL = urlPathHelper.getOriginatingRequestUri(request);
	        TMemUserVO TMemUserVO = new TMemUserVO();
	        TMemUserVO setTMemUserVO = new TMemUserVO();
	        TReqUserVO TReqUserVO = new TReqUserVO();
	        
	    	System.out.println(loginId+"::::::::::::::::::::::::::::::::::::::::::::::::::::::");
	        TMemUserVO.setLoginId(loginId);
	        TReqUserVO.setLoginId(loginId);
	        String url = "";
			if (originalURL.equals("/admin/private/prmReqDetail.do")) {
				TReqUserVO = TReqUserService.selectTReqUser(TReqUserVO);
		        url = "/admin/private/prmReqDetail";
		        model.addAttribute("TMemUserVO", TReqUserVO);
		        
			} else if(originalURL.equals("/admin/private/prmDetail.do")) {
				setTMemUserVO = TMemUserService.selectTMemUser(TMemUserVO);
		        url = "/admin/private/prmDetail";
		        model.addAttribute("TMemUserVO", setTMemUserVO);
			}
			
	              
      
        model.addAttribute("registerFlag", registerFlag);
        
       
        return url;
        
    }
    
    @ResponseBody
    @RequestMapping("/acceptMem.do")
    public String acceptMem(
    		HttpServletRequest request, ModelAndView view, ModelMap modelMap, HttpSession session,
    		TReqUserVO TReqUserVO, Model model,
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
		
		TMemUserVO TMemUserVO = new TMemUserVO();
		TMemUserVO.setLoginId(TReqUserVO.getLoginId());
		TMemUserVO.setRegister(loginVO.getLoginId());
		TMemUserVO.setReqDt(TReqUserVO.getReqDt());
		try {
						
			TReqUserService.updateTReqMemAcceptYn(TReqUserVO);
        	// status.setComplete();
			
			
			if("Y".equals(TReqUserVO.getAcceptYn())) {
				//회원정보 등록
				TMemUserService.insertReqMemToTMemUser(TMemUserVO);
				
				//기업회원정보 등록
				TMemUserService.insertMemAccpt(TMemUserVO);
				
			}
        	res = "suc";
		} catch (Exception e) {
			
			e.printStackTrace();
			return "fail";
		}finally {
			
		}
                	        
        return res;
    }	
    
    //삭제
    @ResponseBody
    @RequestMapping("/deleteTMemUser.do")
    public String deleteTMemUser(
    		HttpServletRequest request, ModelAndView view, ModelMap modelMap, HttpSession session,
    		TMemUserVO TMemUserVO, Model model,
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
	    		  
	    		  TMemUserVO setTMemUservo = new TMemUserVO();
	    		  setTMemUservo.setLoginId(loginId);
	          
	          	TMemUserService.deleteTMemUser(setTMemUservo);
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
    @RequestMapping("/addTMemUserView.do")
    public String addTMemUserView(
    		@ModelAttribute("searchVO") SearchVO searchVO,
            @RequestParam("registerFlag") String registerFlag ,
            Model model)
    		throws Exception {
    	
    	model.addAttribute("registerFlag", registerFlag);
    	model.addAttribute("TMemUserVO", new TMemUserVO());
    	
        return "/admin/private/prmWrite";
    } 
    @ResponseBody
    @RequestMapping("/addTMemUser.do")
    public String addTMemUser(
    		HttpServletRequest request, ModelAndView view, ModelMap modelMap, HttpSession session,
    		TMemUserVO TMemUserVO, Model model,
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
						
        	TMemUserService.insertTMemUser(TMemUserVO);
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
    @RequestMapping("/updateTMemUserView.do")
    public String updateTMemUserView( 
            @RequestParam("loginId") String loginId ,
            @ModelAttribute("searchVO") SearchVO searchVO, 
            @RequestParam("registerFlag") String registerFlag ,Model model)
   
            throws Exception {
    	
    	TMemUserVO setTMemUserVO = new TMemUserVO();
    	TMemUserVO TMemUserVO = new TMemUserVO();
    	
    	TMemUserVO.setLoginId(loginId); 
    	setTMemUserVO = TMemUserService.selectTMemUser(TMemUserVO);
    	
        model.addAttribute(selectTMemUser(TMemUserVO, searchVO));
        model.addAttribute("TMemUserVO",TMemUserVO);
        model.addAttribute("registerFlag", registerFlag);
        model.addAttribute("TMemUserVO", setTMemUserVO);
        
        return "/admin/private/prmWrite"; 
    }    
    @ResponseBody
    @RequestMapping("/updateTMemUser.do")
    public String updateTMemUser(
    		HttpServletRequest request, ModelAndView view, ModelMap modelMap, HttpSession session,
    		TMemUserVO TMemUserVO, Model model,
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
	    	
	    	
	    	TMemUserVO.setLoginId(TMemUserVO.getLoginId());
	    	
        	TMemUserService.updateTMemUser(TMemUserVO);
	    	// status.setComplete();
	    	 
	    	rst = "upsuc";
		} catch (Exception e) {
			
			e.printStackTrace();
			
			return "fail";
		}finally {
			
		}
	            	        
	    return rst;
	}
       
    @RequestMapping("/selectTMemUser.do")
    public @ModelAttribute("TMemUserVO")
    TMemUserVO selectTMemUser(
            TMemUserVO TMemUserVO,
            @ModelAttribute("searchVO") SearchVO searchVO) throws Exception {
        return TMemUserService.selectTMemUser(TMemUserVO);
    }

}
