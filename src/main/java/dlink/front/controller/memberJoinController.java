package dlink.front.controller;

import java.math.BigDecimal;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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

import dlink.front.service.TReqUserService;
import dlink.front.service.TReqComService;
import dlink.common.service.CommProperties;
import dlink.common.service.LoginService;
import dlink.common.service.MtsAtalkAuthService;
import dlink.common.service.MtsAtalkMsgService;
import dlink.common.vo.MtsAtalkAuthVO;
import dlink.admin.service.TMemComService;
import dlink.admin.vo.TMemAccptVO;
import dlink.admin.vo.TMemComVO;
import dlink.front.vo.FrontSearchVO;
import dlink.front.vo.MtsAtalkMsgVO;
import dlink.front.vo.TReqComFileVO;
import dlink.front.vo.TReqComVO;
import dlink.front.vo.TReqUserVO;
import dlink.admin.service.TMemAccptService;
/**
 * @Class Name : memberJoinController.java
 * @Description : memberJoin Controller class
 * @Modification Information
 *
 * @author 이은지
 * @since 2022-04-11
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */

@Controller
@RequestMapping("/front/memberJoin")
public class memberJoinController {

    @Resource(name = "TReqUserService")
    private TReqUserService TReqUserService;
    
    @Resource(name = "TReqComService")
    private TReqComService TReqComService;
    
    /** EgovPropertyService */
    @Resource(name = "propertiesService")
    protected EgovPropertyService propertiesService;
    
    @Resource(name = "LoginService")
    private LoginService LoginService;
    
    @Resource(name = "TMemComService")
    private TMemComService TMemComService;
    
    /** 알림톡 */
    @Resource(name = "MtsAtalkMsgService")
    private MtsAtalkMsgService MtsAtalkMsgService;
    
    @Resource(name = "TMemAccptService")
    private TMemAccptService TMemAccptService;
    
    @Resource(name = "MtsAtalkAuthService")
    private MtsAtalkAuthService MtsAtalkAuthService;
    
    final static String ADMIN_PHONE = CommProperties.getProperty("admin.phone");
	        
    /**
	 * t_req_user 회원관리 - 01회원선택 화면 
	 * @exception Exception
	 */
    @RequestMapping(value="/mtypeSelect.do")
    public String mtypeSelect(@ModelAttribute("searchVO") FrontSearchVO searchVO, ModelMap model )
            throws Exception {

        return "/front/memberJoin/mtypeSelect";
    } 
    
    
    /**
	 * t_req_user 회원관리 - 02약관동의(개인) 화면
	 * @exception Exception
	 */
    @RequestMapping("/prtermsAgree.do")
    public String prtermsAgree(
            @ModelAttribute("searchVO") FrontSearchVO searchVO, Model model)
            throws Exception {
    	    	
        return "/front/memberJoin/prtermsAgree";
    }
  
    
    /**
	 * t_req_user 회원관리 - 02약관동의(기업) 화면 
	 * @exception Exception
	 */
    @RequestMapping("/cptermsAgree.do")
    public String cptrermsAgree(
            @ModelAttribute("searchVO") FrontSearchVO searchVO, Model model)
            throws Exception {
           	
        return "/front/memberJoin/cptermsAgree";
    }
      
           
    /**
	 * t_req_user 회원관리 - 03회원정보입력(개인) 화면 
	 * @exception Exception
	 */
    @RequestMapping("/addTReqUserView.do")
    public String addTReqUserView(
            @ModelAttribute("searchVO") TReqUserVO searchVO, 
            @RequestParam(value  = "registerFlag" , required = false)// RequestParam 값이 Null 일 때 예외 처리
            String registerFlag, Model model)
            throws Exception {
    	
    	model.addAttribute("registerFlag", registerFlag);
        model.addAttribute("TReqUserVO",searchVO);
        
        return "/front/memberJoin/TReqUserRegister";
    }  
    @ResponseBody
    @RequestMapping("/addTReqUser.do")
    public String addTReqUser(
    		HttpServletRequest request, ModelAndView view, ModelMap modelMap, HttpSession session,
            TReqUserVO TReqUserVO, Model model,
            @ModelAttribute("searchVO") TReqUserVO searchVO, SessionStatus status)
            throws Exception {
    	
    	String res = "";

    	try {
    		TReqUserVO.setLoginPwd(LoginService.SHA256Encrypt(TReqUserVO.getLoginPwd()));
    		TReqUserService.insertTAccptUser(TReqUserVO);
    		TReqUserService.insertTMemUser(TReqUserVO);
    		
        	 res = "suc";
        	 
     		    					
 			// 사용자등록
 			MtsAtalkMsgVO reqvo = new MtsAtalkMsgVO();
 			reqvo.setMobileNo(TReqUserVO.getMobileNo().replaceAll("-", ""));	
 			reqvo.setTranTmplCd("sendTalk_mst002");
 			MtsAtalkMsgService.sendTalk_Default(reqvo);
 			
 			//인증키 삭제
			MtsAtalkAuthVO authVO = new MtsAtalkAuthVO();
			authVO.setHpNm(TReqUserVO.getMobileNo().replaceAll("-", ""));
			MtsAtalkAuthService.deleteMtsAtalkAuth(authVO);
		} catch (Exception e) {
			
			e.printStackTrace();
			return "fail";
		}finally {
			
		}
                	        
        return res;
    }
    
    /**
	 * t_req_user 회원관리 - 03회원정보입력(기업) 화면 
	 * @exception Exception
	 */
    @RequestMapping("/addTReqComView.do")
    public String addTReqComView(
            @ModelAttribute("searchVO") TReqComVO searchVO, 
            @RequestParam(value  = "registerFlag" , required = false)// RequestParam 값이 Null 일 때 예외 처리
            String registerFlag, Model model)
            throws Exception {
    	
    	model.addAttribute("registerFlag", registerFlag);
        model.addAttribute("TReqComVO",searchVO);
        
        return "/front/memberJoin/TReqComRegister";
    }  
    @ResponseBody
    @RequestMapping("/addTReqCom.do")
    public String addTReqCom(
    		HttpServletRequest request, ModelAndView view, ModelMap modelMap, HttpSession session,
            Model model,
            TMemAccptVO accptVO, TMemComVO memcomVO,
            @ModelAttribute("searchVO") TReqComVO searchVO, SessionStatus status)
            throws Exception {
    	
    	String res = "";

    	try {
			//대표이미지, 사업자등록증, 신고필증 사본 등 첨부파일
    		TReqComFileVO fileVO = new TReqComFileVO();
	        for(int i = 0; i < memcomVO.getMultiFileSeq().length; i++) {	       

	        	fileVO.setLoginId(memcomVO.getLoginId());
	        	// 파일 형변환 사용 TReqComVO fileSeq변수 BigDecimal->int
	        	int fileSeq =memcomVO.getMultiFileSeq()[i];
	            BigDecimal getfileSeq  = new BigDecimal(fileSeq);		            
	            fileVO.setFileSeq(getfileSeq);
	        	fileVO.setFileKind(memcomVO.getFileKind()[i]);
	        	
	        	TReqComService.insertTMemComFile(fileVO);
	        	
	        	if("CF0001".equals(fileVO.getFileKind())){
	        		memcomVO.setImgPath(String.valueOf(fileVO.getFileSeq()));
	        	}
	        }
	        accptVO.setLoginPwd(LoginService.SHA256Encrypt(accptVO.getLoginPwd()));
	        accptVO.setUserType("MG0002");
	        TMemAccptService.insertTMemAccpt(accptVO);
	        TMemComService.insertTMemCom(memcomVO);
    		    		
    		res = "suc";
    		
    		    					
			// 업체등록
			MtsAtalkMsgVO reqvo = new MtsAtalkMsgVO();
			reqvo.setMobileNo(memcomVO.getCeoMobileNo().replaceAll("-", ""));				
			reqvo.setTranTmplCd("sendTalk_mst002");
			MtsAtalkMsgService.sendTalk_Default(reqvo);
 			
			
			//인증키 삭제
			MtsAtalkAuthVO authVO = new MtsAtalkAuthVO();
			authVO.setHpNm(memcomVO.getCeoMobileNo().replaceAll("-", ""));
			MtsAtalkAuthService.deleteMtsAtalkAuth(authVO);
		} catch (Exception e) {
			
			e.printStackTrace();
			return "/front/memberJoin/joinCmplt.do";
		}finally {
			
		}  	
                	        
        return res;
    }
    
  //아이디중복확인(개인)
    @ResponseBody
    @RequestMapping("/idCheck.do")
    public String idCheck(
    		@RequestParam("loginId") String loginId){
   
	        int cnt = TReqUserService.idCheck(loginId);
	        
        return String.valueOf(cnt);
    }
    
  //아이디중복확인(기업)
    @ResponseBody
    @RequestMapping("/comIdCheck.do")
    public String comIdCheck(
    		@RequestParam("loginId") String loginId){
   
    	 int cnt = TReqComService.comIdCheck(loginId);
	        
        return String.valueOf(cnt);
    }
    
    /**
	 * t_req_user 회원관리 - 04가입완료 화면 
	 * @exception Exception
	 */
    @RequestMapping("/joinCmplt.do")
    public String joinCmplt(
    		 @ModelAttribute("TReqUserVO") TReqUserVO searchVO, 
             @RequestParam(value  = "registerFlag" , required = false)// RequestParam 값이 Null 일 때 예외 처리
             String registerFlag, Model model)
             throws Exception {
     	
 		model.addAttribute("registerFlag", registerFlag);
 		model.addAttribute("TReqUserVO",searchVO);
    	
 		
 		
    	 return "/front/memberJoin/joinCmplt";
    
    }

    
    @RequestMapping("/selectTReqUser.do")
    public @ModelAttribute("TReqUserVO")
    TReqUserVO selectTReqUser(
            TReqUserVO TReqUserVO,
            @ModelAttribute("searchVO") FrontSearchVO searchVO) throws Exception {
        return TReqUserService.selectTReqUser(TReqUserVO);
    }

    
    
    
    
}
