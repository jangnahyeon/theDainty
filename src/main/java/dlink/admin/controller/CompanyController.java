package dlink.admin.controller;

import java.io.File;
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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import dlink.admin.service.TMemComService;
import dlink.admin.vo.SearchVO;
import dlink.admin.vo.TMemAccptVO;
import dlink.admin.vo.TMemComFileVO;
import dlink.admin.vo.TMemComVO;
import dlink.common.service.TAttfileService;
import dlink.common.vo.TAttfileVO;
import dlink.front.service.TReqComService;
import dlink.front.vo.FrontSearchVO;
import dlink.front.vo.TReqComVO;
import dlink.front.service.TMemComFileService;
/**
 * @Class Name : CompanyController.java
 * @Description : Company Controller class
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
@RequestMapping("/admin/company")
public class CompanyController {

    @Resource(name = "TMemComService")
    private TMemComService TMemComService;
    
    @Resource(name = "TMemComFileService")
    private TMemComFileService TMemComFileService;
    
    /** EgovPropertyService */
    @Resource(name = "propertiesService")
    protected EgovPropertyService propertiesService;
	
    @Resource(name = "TReqComService")
    private TReqComService TReqComService;
    
	/** 파일정보 */
    @Resource(name = "TAttfileService")
     private TAttfileService tAttfileService;
 	    
    /**
	 * t_mem_com 목록을 조회한다. (pageing)
	 * @param searchVO - 조회할 정보가 담긴 SerchVo
	 * @return "/TMemCom/cpmInquiryList"
	 * @exception Exception
	 */
    @RequestMapping(value="/cpmInquiryList.do")
    public String selectTMemComList(@ModelAttribute("searchVO") SearchVO searchVO, ModelMap model, HttpSession session )
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
			paginationInfo.setCurrentPageNo(searchVO.getPageIndex());//현재 페이지 번호
			paginationInfo.setRecordCountPerPage(searchVO.getPageUnit());
			paginationInfo.setPageSize(searchVO.getPageSize());
			
			searchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
			searchVO.setLastIndex(paginationInfo.getLastRecordIndex());
			searchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
					
		    List<?> cpmInquiryList = TMemComService.selectTMemComList(searchVO);
	        model.addAttribute("resultList", cpmInquiryList);
	        
	        int totCnt = TMemComService.selectTMemComListTotCnt(searchVO);
			paginationInfo.setTotalRecordCount(totCnt); //전체 게시물 건 수
	        model.addAttribute("paginationInfo", paginationInfo);
	        
	        return "/admin/company/cpmInquiryList";
    	} 
    
	    /*@RequestMapping(value="/cpmDetail.do", method = RequestMethod.GET)
	    	public String getdetail(){
	    	return "/admin/company/cpmInquiryList";
	    }*/
  
	 //상세페이지
    @RequestMapping("/cpmDetail.do")
    public String TMemComView( HttpSession session,
        @RequestParam("loginId") String loginId,
        @RequestParam("registerFlag") String registerFlag ,
        @ModelAttribute("searchVO") SearchVO searchVO, Model model)
    
        throws Exception {
    	
	        TMemComVO TMemComVO = new TMemComVO();
	        TMemComVO setTMemComVO = new TMemComVO();
	    	System.out.println(loginId+"::::::::::::::::::::::::::::::::::::::::::::::::::::::");
	        TMemComVO.setLoginId(loginId);           
	        setTMemComVO = TMemComService.selectTMemCom(TMemComVO);
	    
	        // 기업정보 이미지 가져오기
	    	TMemComFileVO TMemComFileVO = new TMemComFileVO();
	    	TMemComFileVO.setLoginId(loginId);
	    	List<?> selectTMemComFileList = TMemComFileService.selectTMemComFileList(TMemComFileVO);
	    	
	        model.addAttribute(selectTMemCom(TMemComVO, searchVO));
	        model.addAttribute("TMemComVO",TMemComVO);
	        model.addAttribute("registerFlag", registerFlag);
	        model.addAttribute("TMemComVO", setTMemComVO);
	        
	        model.addAttribute("selectTMemComFileList",selectTMemComFileList);    
	        
	        
        
        // 변수명은 CoC 에 따라 TMemComVO
	    model.addAttribute(selectTMemCom(TMemComVO, searchVO));
        model.addAttribute("registerFlag", registerFlag);
        model.addAttribute("TMemComVO", setTMemComVO);
        
        
        /*model.addAttribute("result",TMemComService.selectTMemCom(setTMemComVO));*/
        
        return "/admin/company/cpmDetail";
    }
    
    //삭제
    @ResponseBody
    @RequestMapping("/deleteTMemCom.do")
    public String deleteTMemCom(
    		HttpServletRequest request, ModelAndView view, ModelMap modelMap, HttpSession session,
    		TMemComVO TMemComVO, Model model,
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
	    		  
	    		  TMemComVO setTMemComvo = new TMemComVO();
	    		  setTMemComvo.setLoginId(loginId);
	          
	          	TMemComService.deleteTMemCom(setTMemComvo);
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
    @RequestMapping("/addTMemComView.do")
    public String addTMemComView(
    		@ModelAttribute("searchVO") SearchVO searchVO,
            @RequestParam("registerFlag") String registerFlag, Model model)
    		throws Exception {
    	
    	model.addAttribute("registerFlag", registerFlag);
    	model.addAttribute("TMemComVO", new TMemComVO());
    	
        return "/admin/company/cpmWrite";
    }    
    @ResponseBody
    @RequestMapping("/addTMemCom.do")
    public String addTMemCom(
    		HttpServletRequest request, ModelAndView view, ModelMap modelMap, HttpSession session,
    		TMemComVO TMemComVO, Model model,
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
				
        	TMemComService.insertTMemCom(TMemComVO);
        	 
        	 res = "suc";
		} catch (Exception e) {
			
			e.printStackTrace();
			return "fail";
		}finally {
			
		}
                	        
        return res;
    }	
	   
  //수정
    @RequestMapping("/updateTMemComView.do")
    public String updateTMemComView( 
            @RequestParam("loginId") String loginId ,
            @RequestParam("registerFlag") String registerFlag ,
            @ModelAttribute("searchVO") SearchVO searchVO, Model model)
   
            throws Exception {
    	
    	TMemComVO setTMemComVO = new TMemComVO();
    	TMemComVO TMemComVO = new TMemComVO();
    	
    	TMemComVO.setLoginId(loginId);   
    	setTMemComVO = TMemComService.selectTMemCom(TMemComVO);
    	
    	
    	// 기업정보 이미지 가져오기
    	TMemComFileVO TMemComFileVO = new TMemComFileVO();
    	TMemComFileVO.setLoginId(loginId);
    	List<?> selectTMemComFileList = TMemComFileService.selectTMemComFileList(TMemComFileVO);
    	
        model.addAttribute(selectTMemCom(TMemComVO, searchVO));
        model.addAttribute("TMemComVO",TMemComVO);
        model.addAttribute("registerFlag", registerFlag);
        model.addAttribute("TMemComVO", setTMemComVO);
        
        model.addAttribute("selectTMemComFileList",selectTMemComFileList);
        return "/admin/company/cpmWrite"; 
    }    
    @ResponseBody
    @RequestMapping("/updateTMemCom.do")
    public String updateTMemCom(
    		HttpServletRequest request, ModelAndView view, ModelMap modelMap, HttpSession session,
    		TMemComVO TMemComVO, Model model,
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
	    	 
	    	TMemComVO memComVO = new TMemComVO();
	    	
	    	//대표이미지, 사업자등록증, 신고필증 사본 등 첨부파일
	    	TMemComFileVO fileVO = new TMemComFileVO();
	    	
	    	if(TMemComVO.getMultiFileSeq() != null){
		        for(int i = 0; i < TMemComVO.getMultiFileSeq().length; i++) {
		        	fileVO.setLoginId(TMemComVO.getLoginId());
		        	fileVO.setFileSeq(TMemComVO.getMultiFileSeq()[i]);
		        	fileVO.setFileKind(TMemComVO.getFileKind()[i]);
		        	
		        	TMemComService.insertTMemComFile(fileVO);
		        	
		        	if("CF0001".equals(fileVO.getFileKind())){
		        		memComVO.setImgPath(String.valueOf(fileVO.getFileSeq()));
		        		TMemComVO.setImgPath(String.valueOf(fileVO.getFileSeq()));
		        	}
		        }  
	        }      
	    	
        	TMemComService.updateTMemCom(TMemComVO);
	    	
	    	 
	    	rst = "upsuc";
		} catch (Exception e) {
			
			e.printStackTrace();
			return "fail";
		}finally {
			
		}
	            	        
	    return rst;
	}	
 // 등록된 기업파일 삭제
    @ResponseBody
    @RequestMapping("/deleteCompanyFile.do")
    public String deleteCompanyFile(
    		TMemComVO TMemComVO,
            @ModelAttribute("searchVO") SearchVO searchVO, SessionStatus status
            ,Model model, HttpServletRequest request, HttpSession session)
            throws Exception {
    	//사용자 로그인 확인 Start
		TMemAccptVO loginVO = (TMemAccptVO) session.getAttribute("DlinkLogin");
		if(loginVO == null) {
			model.addAttribute("msg", "fail");
			return "redirect:/admin/login.do";
		}
		//사용자 로그인 확인 End
    			
        
        
		String rst = "";
        try {
        	TMemComFileVO TMemComFileVO = new TMemComFileVO();
        	
        	TMemComFileVO.setFileSeq(TMemComVO.getFileSeq());
        	TMemComFileVO.setLoginId(loginVO.getLoginId());
        	TMemComFileService.deleteTMemComFile(TMemComFileVO);
        	
        	status.setComplete();
        	
        	
			try {
				TAttfileVO att = new TAttfileVO();
				att.setFileSeq(new BigDecimal(TMemComFileVO.getFileSeq()));
				att = tAttfileService.selectTAttfile(att);
				
				
				//파일 정보 삭제
				tAttfileService.deleteTAttfile(att);
				
				rst = "delete";
			} catch (NullPointerException e) {
				e.printStackTrace();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
        
        
        return rst;
    }

    
    @RequestMapping("/selectTMemCom.do")
    public @ModelAttribute("TMemComVO")
    TMemComVO selectTMemCom(
            TMemComVO TMemComVO,
            @ModelAttribute("searchVO") SearchVO searchVO) throws Exception {
        return TMemComService.selectTMemCom(TMemComVO);
    }
        
    
    @RequestMapping("/cpmInquiryRequestList.do")
    public String cpmInquiryRequestList(
            @ModelAttribute("searchVO") FrontSearchVO searchVO,ModelMap model, HttpSession session) throws Exception {
    	
    	
    	//사용자 로그인 확인 Start
		TMemAccptVO loginVO = (TMemAccptVO) session.getAttribute("DlinkLogin");
		if(loginVO == null) {
			model.addAttribute("msg", "fail");
			return "redirect:/admin/login.do";
		}
		//사용자 로그인 확인 End
		
		try {
			
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
			
			
			List<?> TCodeList = TReqComService.selectTReqComList(searchVO);
			model.addAttribute("resultList", TCodeList);
			
			int totCnt = TReqComService.selectTReqComListTotCnt(searchVO);
			paginationInfo.setTotalRecordCount(totCnt);
			model.addAttribute("paginationInfo", paginationInfo);
  		  
  		} catch (Exception e) {
  			
  			e.printStackTrace();
  			
  		}
        
		return "/admin/company/cpmReqComList";
    
    }
    
    
    @RequestMapping("/cpmInquiryRequestView.do")
    public String cpmInquiryRequestView(
    		TReqComVO vo,
            @ModelAttribute("searchVO") FrontSearchVO searchVO,ModelMap model, HttpSession session) throws Exception {
    	
    	
    	//사용자 로그인 확인 Start
		TMemAccptVO loginVO = (TMemAccptVO) session.getAttribute("DlinkLogin");
		if(loginVO == null) {
			model.addAttribute("msg", "fail");
			return "redirect:/admin/login.do";
		}
		//사용자 로그인 확인 End
		
		try {
			
			model.addAttribute("TReqComVO",TReqComService.selectTReqCom(vo));
			model.addAttribute("fileList",TReqComService.selectReqComFileList(vo));
			model.addAttribute("searchVO",searchVO);
			
  		} catch (Exception e) {
  			
  			e.printStackTrace();
  			
  		}
        
		return "/admin/company/cpmReqComView";
    
    }
    
    @RequestMapping("/cpmInquiryRequestInsert.do")
    public String cpmInquiryRequestInsert(
    		TReqComVO TReqComVO,
            @ModelAttribute("searchVO") SearchVO searchVO, SessionStatus status
            ,Model model, HttpServletRequest request, HttpSession session)
            throws Exception {
    	
    	//사용자 로그인 확인 Start
		TMemAccptVO loginVO = (TMemAccptVO) session.getAttribute("DlinkLogin");
		if(loginVO == null) {
			model.addAttribute("msg", "fail");
			return "redirect:/admin/login.do";
		}
		//사용자 로그인 확인 End
    			
		try {
			TReqComVO.setRegister(loginVO.getLoginId());
			//기업신청정보 승인여부 및 사유 수정
			TReqComService.updateTReqComAccept(TReqComVO);
			
			if("Y".equals(TReqComVO.getAcceptYn())) {
				//회원정보 등록
				TReqComService.insertMemAccpt(TReqComVO);
				
				//기업회원정보 등록
				TReqComService.insertMemCom(TReqComVO);
				
				//기업회원파일정보 등록
				TReqComService.insertMemComFile(TReqComVO);
				
			}
			
			status.setComplete();
	  		  
   		} catch (Exception e) {
   			
   			e.printStackTrace();
   			
   		}
		
        return "redirect:/admin/company/cpmInquiryRequestList.do";
    }

}
