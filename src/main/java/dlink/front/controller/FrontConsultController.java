package dlink.front.controller;

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

import dlink.admin.service.TReqMakeService;
import dlink.admin.vo.SearchVO;
import dlink.admin.vo.TMemAccptVO;
import dlink.admin.vo.TMemComVO;
import dlink.admin.vo.TMemUserVO;
import dlink.admin.vo.TPtplInfoVO;
import dlink.admin.vo.TReqMakeVO;
import dlink.common.service.MtsAtalkMsgService;
import dlink.front.vo.MtsAtalkMsgVO;
import dlink.admin.service.TMemAccptService;
import dlink.admin.service.TMemUserService;
import dlink.admin.service.TPtplInfoService;
import dlink.admin.service.TMemComService;
/**
 * @Class Name : FrontConsultController.java
 * @Description : FrontConsultController Controller class
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
@RequestMapping("/front/consult")
public class FrontConsultController {

    @Resource(name = "TReqMakeService")
    private TReqMakeService TReqMakeService;
    
    @Resource(name = "TMemUserService")
    private TMemUserService TMemUserService;
    
	@Resource(name = "MtsAtalkMsgService")
	private MtsAtalkMsgService MtsAtalkMsgService;
	
    /** EgovPropertyService */
    @Resource(name = "propertiesService")
    protected EgovPropertyService propertiesService;
	
    @Resource(name = "TMemAccptService")
    private TMemAccptService TMemAccptService;
    
    @Resource(name = "TPtplInfoService")
    private TPtplInfoService TPtplInfoService;
    
    @Resource(name = "TMemComService")
    private TMemComService TMemComService;
    
    /**
	 * t_commuty 목록을 조회한다. (pageing)
	 * @param searchVO - 조회할 정보가 담긴 SerchVo
	 * @return "/TCommuty/TCommutyList"
	 * @exception Exception
	 */
    @RequestMapping(value="/consultInquiryList.do")
    public String selectTReqMakeList(@ModelAttribute("searchVO") SearchVO searchVO, 
    		 @RequestParam(value = "searchCondition", required=false) String searchCondition ,
    		 @RequestParam(value = "searchKeyword" , required=false) String searchKeyword ,
    		ModelMap model, HttpServletRequest request,  HttpSession session)
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
    	
    	String userType = loginVO.getUserType();
		String res = "";
    	if (userType.equals("MG0001")) {
    		
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
			searchVO.setRegister("front");
			searchVO.setLoginId(loginVO.getLoginId());
    		
		    List<?> TReqMakeList = TReqMakeService.selectTReqMakeList(searchVO);
		    model.addAttribute("resultList", TReqMakeList);
		    
		    int totCnt = TReqMakeService.selectTReqMakeListTotCnt(searchVO);
			paginationInfo.setTotalRecordCount(totCnt);
		
		    model.addAttribute("paginationInfo", paginationInfo);
    
    		
		    res = "/front/consult/consultInquiryList";
    		
		}else if(userType.equals("MG0002")){
			
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
			searchVO.setRegister("usertype");
			searchVO.setLoginId(loginVO.getLoginId());
			
		    List<?> TReqMakeList = TReqMakeService.selectTReqMakeList(searchVO);
		    model.addAttribute("resultList", TReqMakeList);
		    
		    int totCnt = TReqMakeService.selectTReqMakeListTotCnt(searchVO);
			paginationInfo.setTotalRecordCount(totCnt);
		
		    model.addAttribute("paginationInfo", paginationInfo);
    
    		
		    res = "/front/consult/consultInquiryList";
		}
		    
        return res;
    } 
    
    @RequestMapping("/addConsultView.do")
    public String addTReqMakeView(
    		@RequestParam("reqNo") int reqNo ,
    		@RequestParam("seq") int seq ,
    		@RequestParam("ptplNo") String ptplNo ,
    		@RequestParam("regGb") String regGb ,
    		@RequestParam("registerFlag") String registerFlag ,
            @ModelAttribute("searchVO") SearchVO searchVO, Model model)
            throws Exception {
    	
    	TReqMakeVO TReqMakeVO = new TReqMakeVO(); 
    	TReqMakeVO.setSeq(seq);  
    	TReqMakeVO.setReqNo(reqNo);  
    	TReqMakeVO.setPtplNo(ptplNo);  
    	
    	 List<?> selectCommentList = TReqMakeService.selectCommentsTReqMakeList(TReqMakeVO);
         
         
         // 변수명은 CoC 에 따라 TCommutyVO
         model.addAttribute(selectTReqMake(TReqMakeVO, searchVO));
         model.addAttribute("selectCommentList", selectCommentList);
         
        model.addAttribute("reqNo", reqNo);
        model.addAttribute("seq", seq);
        model.addAttribute("ptplNo", ptplNo);
        model.addAttribute("regGb", regGb);
        model.addAttribute("registerFlag", registerFlag);
        
        return "/front/consult/consultMagmt";
    }
    
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
			return "redirect:/front/login.do";
		}
		//사용자 로그인 확인 End
    	
		try {
			
			String registerFlag = TReqMakeVO.getRegisterFlag();
			
			if( registerFlag.equals("MyInsert")){
				
				TReqMakeVO setTReqMakeVO = new TReqMakeVO();
				
				setTReqMakeVO.setPtplNo(TReqMakeVO.getPtplNo());				
				setTReqMakeVO.setReqNo(TReqMakeVO.getReqNo());
				
				int seq = TReqMakeService.selectForInsertSeq(setTReqMakeVO); // 게시순번 생성
				
				setTReqMakeVO.setSeq(seq);
				setTReqMakeVO.setCont(TReqMakeVO.getCont());
				setTReqMakeVO.setLoginId(loginVO.getLoginId());
				setTReqMakeVO.setRegister(loginVO.getLoginId());
				setTReqMakeVO.setRegGb(TReqMakeVO.getRegGb());
			
				TReqMakeService.insertTReqMake(setTReqMakeVO);
				
			
				// 상담 답변시 알림톡 발송
				String userType = loginVO.getUserType();
				if(userType.equals("MG0001")){ // 개인
					// 개인회원 정보 가지고 오기
					TMemUserVO TMemUserVO = new TMemUserVO();
					TMemUserVO.setLoginId(loginVO.getLoginId());
					
					TMemUserVO setTMemUserVO = TMemUserService.selectTMemUser(TMemUserVO);
					
					TPtplInfoVO TPtplInfoVO = new TPtplInfoVO();
					
					// 포트폴리오 정보를 가지고옴
				       // String인 ptplNo 변수 bigdecimal 형변환 작업
				       BigDecimal bigptplNo = new BigDecimal(TReqMakeVO.getPtplNo()); 
					   TPtplInfoVO.setPtplNo(bigptplNo);     
				       TPtplInfoVO setTPtplInfoVO = TPtplInfoService.selectTPtplInfo(TPtplInfoVO);
					       			       
						// 상담등록시 알림톡 발송
						MtsAtalkMsgVO reqvo = new MtsAtalkMsgVO();
						reqvo.setPtplNm(setTPtplInfoVO.getPtplNm());   // 포트폴리오 이름
						reqvo.setMobileNo(setTMemUserVO.getMobileNo().replaceAll("-", ""));		// 개인회원 핸드폰 번호	
						reqvo.setTranTmplCd("sendTalk_mst008");
						MtsAtalkMsgService.sendTalk_Default(reqvo);
						
				}else if(userType.equals("MG0002")){ // 기업
					
					// 회원 정보 가지고 오기
					TMemComVO TMemComVO = new TMemComVO();
					TMemComVO.setLoginId(loginVO.getLoginId());
					
					TMemComVO setTMemComVO = TMemComService.selectTMemCom(TMemComVO);
					
					TPtplInfoVO TPtplInfoVO = new TPtplInfoVO();
					
					// 포트폴리오 정보를 가지고옴
				       // String인 ptplNo 변수 bigdecimal 형변환 작업
				       BigDecimal bigptplNo = new BigDecimal(TReqMakeVO.getPtplNo()); 
					   TPtplInfoVO.setPtplNo(bigptplNo);     
				       TPtplInfoVO setTPtplInfoVO = TPtplInfoService.selectTPtplInfo(TPtplInfoVO);
				       			       
					// 상담등록시 알림톡 발송
					MtsAtalkMsgVO reqvo = new MtsAtalkMsgVO();
					reqvo.setPtplNm(setTPtplInfoVO.getPtplNm());
					reqvo.setMobileNo(setTMemComVO.getDamdangMobileNo().replaceAll("-", ""));				
					reqvo.setTranTmplCd("sendTalk_mst008");
					MtsAtalkMsgService.sendTalk_Default(reqvo);
					
				}
				
				
			
				res = "suc";
				
			}else if(registerFlag.equals("Insert")){
				
				TReqMakeVO setTReqMakeVO = new TReqMakeVO();
				
				int reqNo = TReqMakeService.selectForInsertReqNo(setTReqMakeVO); // 게시순번 생성
				
				setTReqMakeVO.setPtplNo(TReqMakeVO.getPtplNo());
				
				setTReqMakeVO.setReqNo(reqNo);
				
				int seq = TReqMakeService.selectForInsertSeq(setTReqMakeVO); // 게시순번 생성
				
				setTReqMakeVO.setSeq(seq);
				setTReqMakeVO.setCont(TReqMakeVO.getCont());
				setTReqMakeVO.setLoginId(loginVO.getLoginId());
				setTReqMakeVO.setRegister(loginVO.getLoginId());
				setTReqMakeVO.setRegGb(TReqMakeVO.getRegGb());
			
				TReqMakeService.insertTReqMake(setTReqMakeVO);
				
				
				String regGb = TReqMakeVO.getRegGb();
				
				if(regGb.equals("MG0001")){
					
					/*TMemUserVO TMemUserVO = new TMemUserVO();
					TMemUserVO.setLoginId(loginVO.getLoginId());
					
					TMemUserVO setTMemUserVO = TMemUserService.selectTMemUser(TMemUserVO);
					*/
					TPtplInfoVO TPtplInfoVO = new TPtplInfoVO();
					
					// 포트폴리오 정보를 가지고옴
				       // String인 ptplNo 변수 bigdecimal 형변환 작업
				       BigDecimal bigptplNo = new BigDecimal(TReqMakeVO.getPtplNo()); 
				   TPtplInfoVO.setPtplNo(bigptplNo);     
			       TPtplInfoVO setTPtplInfoVO = TPtplInfoService.selectTPtplInfo(TPtplInfoVO);
				     
			       
			       TMemComVO TMemComVO = new TMemComVO();
			       TMemComVO.setLoginId(setTPtplInfoVO.getLoginId());
			   		TMemComVO setTMemComVO = TMemComService.selectTMemCom(TMemComVO);
				       
					// 상담등록시 알림톡 발송
					MtsAtalkMsgVO reqvo = new MtsAtalkMsgVO();
					reqvo.setPtplNm(setTPtplInfoVO.getPtplNm());
					reqvo.setMobileNo(setTMemComVO.getCeoMobileNo().replaceAll("-", ""));				
					reqvo.setTranTmplCd("sendTalk_mst007");
					MtsAtalkMsgService.sendTalk_Default(reqvo);
				}
				
				
				res = "suc";
			}     
				
		}catch(Exception e){
			
			e.printStackTrace();
			return "fail";
			
		} finally {
			
		}
		
       
        return res;
    }
    
    
    
    // 사용자페이지 > 전문업체 검색 > 전문기업 포트폴리오 의뢰하기 전용
    @ResponseBody
    @RequestMapping("/addAgDetail.do")
    public String addAgDetail(
    		HttpServletRequest request, ModelAndView view, ModelMap modelMap, 
    		HttpSession session, Model model,
    		
    		@RequestParam(value ="ptplNo", required=false) String ptplNo ,
    		@RequestParam(value ="cont", required=false) String cont ,
    		@RequestParam(value ="loginId", required=false) String loginId ,
    		@RequestParam(value ="registerFlag", required=false) String registerFlag ,
    		@RequestParam(value ="regGb", required=false) String regGb ,
    		
            @ModelAttribute("searchVO") SearchVO searchVO, SessionStatus status)
            throws Exception {
    	
    	String res = "";
    	
    	
    	//사용자 로그인 확인 Start
		TMemAccptVO loginVO = (TMemAccptVO) session.getAttribute("DlinkLogin");
		if(loginVO == null) {
			model.addAttribute("msg", "fail");
			return "redirect:/front/login.do";
		}
		//사용자 로그인 확인 End
    	
		try {
			
			
			 if(registerFlag.equals("Insert")){
				
				TReqMakeVO setTReqMakeVO = new TReqMakeVO();
				
				int reqNo = TReqMakeService.selectForInsertReqNo(setTReqMakeVO); // 게시순번 생성
				
				setTReqMakeVO.setPtplNo(ptplNo);
				
				setTReqMakeVO.setReqNo(reqNo);
				
				int seq = TReqMakeService.selectForInsertSeq(setTReqMakeVO); // 게시순번 생성
				
				setTReqMakeVO.setSeq(seq);
				setTReqMakeVO.setCont(cont);
				setTReqMakeVO.setLoginId(loginId);
				setTReqMakeVO.setRegister(loginVO.getLoginId());
				setTReqMakeVO.setRegGb(regGb);
			
				TReqMakeService.insertTReqMake(setTReqMakeVO);
				
				
				if(regGb.equals("MG0001")){  // 개인

				/*	TMemUserVO TMemUserVO = new TMemUserVO();
					TMemUserVO.setLoginId(loginVO.getLoginId());
					TMemUserVO setTMemUserVO = TMemUserService.selectTMemUser(TMemUserVO);*/
					
					// 포트폴리오 정보를 가지고옴
				       // String인 ptplNo 변수 bigdecimal 형변환 작업
				       BigDecimal bigptplNo = new BigDecimal(ptplNo);
				       
				    TPtplInfoVO TPtplInfoVO = new TPtplInfoVO();
			       TPtplInfoVO.setPtplNo(bigptplNo);     
			       TPtplInfoVO setTPtplInfoVO = TPtplInfoService.selectTPtplInfo(TPtplInfoVO);
				      
			       TMemComVO TMemComVO = new TMemComVO();
			       TMemComVO.setLoginId(setTPtplInfoVO.getLoginId());
			   		TMemComVO setTMemComVO = TMemComService.selectTMemCom(TMemComVO);
			   	
					// 상담등록시 알림톡 발송
					MtsAtalkMsgVO reqvo = new MtsAtalkMsgVO();
					reqvo.setUserNm(setTMemComVO.getCeoNm());
					reqvo.setMobileNo(setTMemComVO.getCeoMobileNo().replaceAll("-", ""));
					reqvo.setTranTmplCd("sendTalk_mst007");
					MtsAtalkMsgService.sendTalk_Default(reqvo);
				}
				
				
				res = "suc";
			}     
				
		}catch(Exception e){
			
			e.printStackTrace();
			return "fail";
			
		} finally {
			
		}
		
       
        return res;
    }
    
    
    
    @RequestMapping("/selectCommuty.do")
    public @ModelAttribute("TReqMakeVO")
    TReqMakeVO selectTReqMake(
    		TReqMakeVO TReqMakeVO,
            @ModelAttribute("searchVO") SearchVO searchVO) throws Exception {
        return TReqMakeService.selectTReqMake(TReqMakeVO);
    }
    
 
    // 게시판 수정
    @ResponseBody
    @RequestMapping("/updateConsult.do")
    public String updateTReqMake(
    		TReqMakeVO TReqMakeVO, HttpSession session, Model model,
            @ModelAttribute("searchVO") SearchVO searchVO, SessionStatus status)
            throws Exception {
    	
    	String res = "";
    	//사용자 로그인 확인 Start
		TMemAccptVO loginVO = (TMemAccptVO) session.getAttribute("DlinkLogin");
		if(loginVO == null) {
			model.addAttribute("msg", "fail");
			return "redirect:/front/login.do";
		}
		//사용자 로그인 확인 End
    	
		try {
			TReqMakeVO setTReqMakeVO = new TReqMakeVO();
			
			setTReqMakeVO.setCont(TReqMakeVO.getCont());
			setTReqMakeVO.setRegister(loginVO.getLoginId());	
			setTReqMakeVO.setRegGb(TReqMakeVO.getRegGb());
			setTReqMakeVO.setLoginId(TReqMakeVO.getLoginId());
			setTReqMakeVO.setReqNo(TReqMakeVO.getReqNo());
			setTReqMakeVO.setSeq(TReqMakeVO.getSeq());
			setTReqMakeVO.setPtplNo(TReqMakeVO.getPtplNo());
			
			TReqMakeService.updateTReqMake(setTReqMakeVO);
		       //status.setComplete();
			
			res = "upsuc";
				
		}catch(Exception e){
			
			e.printStackTrace();
			return "fail";
			
		} finally {
			
		}
		   
        return res;
    }
    
    // 게시판 삭제
    @ResponseBody
    @RequestMapping("/deleteConsult.do")
    public String deleteTReqMake(
    		TReqMakeVO TReqMakeVO,HttpSession session, Model model,
            @ModelAttribute("searchVO") SearchVO searchVO, SessionStatus status)
            throws Exception {
    	

        String res = "";
    	//사용자 로그인 확인 Start
		TMemAccptVO loginVO = (TMemAccptVO) session.getAttribute("DlinkLogin");
		if(loginVO == null) {
			model.addAttribute("msg", "fail");
			return "redirect:/front/login.do";
		}
		//사용자 로그인 확인 End
    	
		try {

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
