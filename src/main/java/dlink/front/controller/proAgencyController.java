package dlink.front.controller;

import java.math.BigDecimal;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.egovframe.rte.fdl.property.EgovPropertyService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import dlink.admin.service.TMemComService;
import dlink.admin.service.TSpecReqComService;
import dlink.common.service.CommProperties;
import dlink.common.service.LoginService;
import dlink.common.service.MtsAtalkMsgService;
import dlink.common.service.TAttfileService;
import dlink.admin.service.TMemAccptService;
import dlink.front.service.TMemComFileService;

import dlink.common.vo.TAttfileVO;
import dlink.admin.vo.SearchVO;
import dlink.admin.vo.TMemAccptVO;
import dlink.admin.vo.TMemComFileVO;
import dlink.admin.vo.TMemComVO;
import dlink.admin.vo.TSpecReqComVO;
import dlink.front.vo.FrontSearchVO;
import dlink.front.vo.MtsAtalkMsgVO;
import egovframework.cmmn.service.EgovStringUtil;

/**
 * @Class Name : proAgencyController.java
 * @Description : proAgency Controller class
 * @Modification Information
 *
 * @author 이은지
 * @since 2022-04-14
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */



@Controller
@RequestMapping("/front/proAgency")
public class proAgencyController {
	
	/** 기업회원정보 */
	@Resource(name = "TMemComService")
    private TMemComService TMemComService;
	
	/** 회원접속정보 */
	@Resource(name = "TMemAccptService")
    private TMemAccptService TMemAccptService;
	
	/** 전문회사신청정보 */
	@Resource(name = "TSpecReqComService")
    private TSpecReqComService TSpecReqComService;
	
	/** 비밀번호획인 */
	@Resource(name = "LoginService")
    private LoginService LoginService;
	
    /** EgovPropertyService */
    @Resource(name = "propertiesService")
    protected EgovPropertyService propertiesService;
	
	/** 기업회원파일정보 */
	@Resource(name = "TMemComFileService")
    private TMemComFileService TMemComFileService;
    
	/** 파일정보 */
   @Resource(name = "TAttfileService")
    private TAttfileService tAttfileService;
	    
   
   /** 알림톡 */
   @Resource(name = "MtsAtalkMsgService")
    private MtsAtalkMsgService MtsAtalkMsgService;
   
   final static String ADMIN_PHONE = CommProperties.getProperty("admin.phone");
    
	/**
	 * 마이페이지-기업회원정보관리 화면
	 * @exception Exception
	 */
    @RequestMapping(value="/infoMagmt.do")
    public String infoMagmt(
    		@ModelAttribute("TMemComVO") TMemComVO TMemComVO, ModelMap model, 
    		HttpServletRequest request, ModelAndView view, ModelMap modelMap, HttpSession session)
            throws Exception {
    	
    	//사용자 로그인 확인 Start
			TMemAccptVO loginVO = (TMemAccptVO) session.getAttribute("DlinkLogin");
			if(loginVO == null) {
				model.addAttribute("msg", "fail");
				return "redirect:/front/login.do";
			}
		//사용자 로그인 확인 End
    	    			
    	TMemAccptVO tMemAccptVO = new TMemAccptVO();
    	TMemAccptVO settMemAccptVO = new TMemAccptVO();
    	    	  	    	
    	tMemAccptVO.setLoginId(loginVO.getLoginId());
    	settMemAccptVO = TMemAccptService.selectTMemAccpt(tMemAccptVO);
    	
    	// 기업정보 이미지 가져오기
    	TMemComFileVO TMemComFileVO = new TMemComFileVO();
    	TMemComFileVO.setLoginId(loginVO.getLoginId());
    	TMemComFileVO.setFirstIndex(0);
    	 List<?> selectTMemComFileList = TMemComFileService.selectTMemComFileList(TMemComFileVO);
    	
    	TMemComVO tMemComVO = new TMemComVO();
    	TMemComVO settMemComVO = new TMemComVO();
    	tMemComVO.setLoginId(loginVO.getLoginId());
    	settMemComVO = TMemComService.selectTMemCom(tMemComVO);
    	    	
    	model.addAttribute("settMemAccptVO",settMemAccptVO);
    	model.addAttribute("settMemComVO",settMemComVO);
    	model.addAttribute("selectTMemComFileList",selectTMemComFileList);
    	    	
        return "/front/proAgency/infoMagmt";
    } 
    @ResponseBody
    @RequestMapping("/updateinfoMagmt.do")
    public String updateinfoMagmt(
    		HttpServletRequest request, ModelAndView view, ModelMap modelMap, HttpSession session,
    		TMemAccptVO TMemAccptVO, Model model,
            @ModelAttribute("TMemComVO") TMemComVO TMemComVO, SessionStatus status)
            throws Exception {
    	
    	String rst = "";

    	//사용자 로그인 확인 Start
		TMemAccptVO loginVO = (TMemAccptVO) session.getAttribute("DlinkLogin");
		if(loginVO == null) {
			model.addAttribute("msg", "fail");
			return "redirect:/front/login.do";
		}
		//사용자 로그인 확인 End
		
	    try {
	    	//회원접속정보 수정
	    	TMemAccptVO tMemAccptVO = new TMemAccptVO();
	    	
	    	tMemAccptVO.setUpdater(loginVO.getLoginId());
	    	tMemAccptVO.setLoginId(TMemComVO.getLoginId());
	    	tMemAccptVO.setSmsYn(TMemComVO.getSmsYn());
	    	tMemAccptVO.setMailYn(TMemComVO.getMailYn());
	    	if(TMemAccptVO.getLoginPwd() != null && TMemAccptVO.getLoginPwdAfter() != null){
	    		tMemAccptVO.setLoginPwd(LoginService.SHA256Encrypt(TMemAccptVO.getLoginPwd()));
	    		tMemAccptVO.setLoginPwdAfter(LoginService.SHA256Encrypt(TMemAccptVO.getLoginPwdAfter()));
	    	}
	    	TMemAccptService.updateTMemAccpt(tMemAccptVO);
	    	
	    	
	    	TMemComVO memComVO = new TMemComVO();
	    	
	    	//대표이미지, 사업자등록증, 신고필증 사본 등 첨부파일
	    	TMemComFileVO fileVO = new TMemComFileVO();
	    		
	    	if(TMemComVO.getMultiFileSeq() != null){
	    	
	        				
	        	// 파일을 다시  저장한다.
		        for(int i = 0; i < TMemComVO.getMultiFileSeq().length; i++) {
		        		        	
		        	fileVO.setLoginId(loginVO.getLoginId());
		        	fileVO.setFileSeq(TMemComVO.getMultiFileSeq()[i]);
		        	fileVO.setFileKind(TMemComVO.getFileKind()[i]);
		        	
		        	TMemComService.insertTMemComFile(fileVO);
		        	
		        	if("CF0001".equals(fileVO.getFileKind())){
		        		memComVO.setImgPath(String.valueOf(fileVO.getFileSeq()));
		        	}
		        }  
	        }      
	        //업체정보입력, 담당자 정보 수정
	    	memComVO.setRegister(loginVO.getLoginId());
	    	memComVO.setLoginId(loginVO.getLoginId());
	    	memComVO.setComType(TMemComVO.getComType());
	    	memComVO.setComUrl(TMemComVO.getComUrl());
	    	memComVO.setCeoMobileNo(TMemComVO.getCeoMobileNo());
	    	memComVO.setComZip(TMemComVO.getComZip());
	    	memComVO.setComAddr(TMemComVO.getComAddr());
	    	memComVO.setComDtlAddr(TMemComVO.getComDtlAddr());
	    	memComVO.setDamdangNm(TMemComVO.getDamdangNm());
	    	memComVO.setDamdangDept(TMemComVO.getDamdangDept());
	    	memComVO.setDamdangMobileNo(TMemComVO.getDamdangMobileNo());
	    	memComVO.setDamdangEmail(TMemComVO.getDamdangEmail());
	    	memComVO.setSpecYn(TMemComVO.getSpecYn());
	    	TMemComService.updateTMemCom(memComVO);
		    	
	    	
	    	rst = "upsuc";
		} catch (Exception e) {
			
			e.printStackTrace();
			return "fail";
		}finally {
			
		}
	            	        
	    return rst;
	}	
    
    
    //현재비밀번호 확인
    @ResponseBody
    @RequestMapping("/pwCheck.do")
    public String pwCheck(
    		@RequestParam("loginPwd") String loginPwd,Model model, HttpSession session) 
    				throws Exception{
    	
    		//사용자 로그인 확인 Start
			TMemAccptVO loginVO = (TMemAccptVO) session.getAttribute("DlinkLogin");
			if(loginVO == null) {
				model.addAttribute("msg", "fail");
				return "redirect:/front/login.do";
			}
			//사용자 로그인 확인 End
    			
    			
    		TMemAccptVO vo = new TMemAccptVO();
    		vo.setLoginId(loginVO.getLoginId());
    		vo.setLoginPwd(LoginService.SHA256Encrypt(loginPwd));
    		
	        int cnt =  TMemAccptService.pwCheck(vo);
	        
	       	        
        return String.valueOf(cnt);
    }
    
    
    //전문회사신청
    @RequestMapping("/specialCompanyView.do")
    public String addspecialCompany(
    		@ModelAttribute("TMemComVO") TMemComVO TMemComVO,SessionStatus status
            ,Model model, HttpServletRequest request, HttpSession session)
            throws Exception {
    	
    	//사용자 로그인 확인 Start
			TMemAccptVO loginVO = (TMemAccptVO) session.getAttribute("DlinkLogin");
			if(loginVO == null) {
				model.addAttribute("msg", "fail");
				return "redirect:/front/login.do";
			}
		//사용자 로그인 확인 End
			    	  				
			try {
				
				TSpecReqComVO tSpecReqComVO = new TSpecReqComVO();
				
				BigDecimal ReqNo = TSpecReqComService.selectTSpecReqComReqNo(tSpecReqComVO);
								
				tSpecReqComVO.setRegister(loginVO.getLoginId());
				tSpecReqComVO.setLoginId(loginVO.getLoginId());
				tSpecReqComVO.setReqNo(ReqNo);							
				tSpecReqComVO.setSalesAmt(TMemComVO.getSalesAmt());
				tSpecReqComVO.setKeyCustomer(TMemComVO.getKeyCustomer());
				tSpecReqComVO.setEmploy(TMemComVO.getEmploy());
				tSpecReqComVO.setAcceptYn(TMemComVO.getAcceptYn());
				tSpecReqComVO.setAcceptCont(TMemComVO.getAcceptCont());;
				tSpecReqComVO.setReqDt(TMemComVO.getReqDt());
				tSpecReqComVO.setRequester(TMemComVO.getRequester());
				tSpecReqComVO.setCont(EgovStringUtil.getHtmlStrCnvr(TMemComVO.getCont()));   // 저장된 cont내용을 변환시켜서 cont로 담는다.
				
				TSpecReqComService.insertTSpecReqCom(tSpecReqComVO);
									
				String[] staffNm = TMemComVO.getStaffNm();
				String[] position = TMemComVO.getPosition();
				String[] birthday = TMemComVO.getBirthday();
				String[] jungong = TMemComVO.getJungong();
				String[] jungongPart = TMemComVO.getJungongPart();
				String[] career = TMemComVO.getCareer();
				String[] lstHakwi = TMemComVO.getLstHakwi();
				String[] mSex = TMemComVO.getmSex();
				String[] school = TMemComVO.getSchool();
				String[] acquisitionYear = TMemComVO.getAcquisitionYear();
				
				
				for (int i = 0; i < staffNm.length; i++) {
					
					tSpecReqComVO.setStaffNm(staffNm[i]);
					tSpecReqComVO.setPosition(position[i]);
					tSpecReqComVO.setBirthday(birthday[i]); 
					tSpecReqComVO.setJungong(jungong[i]);
					tSpecReqComVO.setJungongPart(jungongPart[i]);
					tSpecReqComVO.setCareer(career[i]);
					tSpecReqComVO.setLstHakwi(lstHakwi[i]);
					tSpecReqComVO.setmSex(mSex[i]);
					tSpecReqComVO.setSchool(school[i]);
					tSpecReqComVO.setAcquisitionYear(acquisitionYear[i]);
					
					TSpecReqComService.insertTSpecReqMem(tSpecReqComVO);
				}
				
				
				// 회원 정보 가지고 오기
				TMemComVO.setLoginId(tSpecReqComVO.getLoginId());
				
				TMemComVO setTMemComVO = TMemComService.selectTMemCom(TMemComVO);
				
				// 전문업체신청 승인 시 알림톡 발송
				MtsAtalkMsgVO reqvo = new MtsAtalkMsgVO();
				reqvo.setUserNm(setTMemComVO.getCeoNm());
				reqvo.setMobileNo(setTMemComVO.getCeoMobileNo().replaceAll("-", ""));		
	 			reqvo.setTranTmplCd("sendTalk_mst003");
	 			MtsAtalkMsgService.sendTalk_Default(reqvo);
	 			
	 			reqvo.setMobileNo(ADMIN_PHONE);		
	 			reqvo.setTranTmplCd("sendTalk_mst004");
	 			MtsAtalkMsgService.sendTalk_Default(reqvo);
				
	   		} catch (Exception e) {
	   			
	   			e.printStackTrace();
	   			
	   		}
			
	        return "redirect:/front/proAgency/infoMagmt.do";
	    }
        
    
    @RequestMapping("/selectinfoMagmt.do")
    public @ModelAttribute("TMemComVO")
    TMemComVO selectinfoMagmt(
    		TMemComVO TMemComVO,
            @ModelAttribute("FrontSearchVO") FrontSearchVO searchVO) throws Exception {
        return TMemComService.selectTMemCom(TMemComVO);
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
    
}

