package dlink.front.controller;

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

import dlink.admin.service.TMemUserService;
import dlink.common.service.LoginService;
import dlink.admin.service.TMemAccptService;
import dlink.admin.vo.TMemAccptVO;
import dlink.admin.vo.TMemUserVO;
import dlink.front.vo.FrontSearchVO;

/**
 * @Class Name : privacyController.java
 * @Description : privacy Controller class
 * @Modification Information
 *
 * @author 이은지
 * @since 2022-04-13
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */



@Controller
@RequestMapping("/front/privacy")
public class privacyController {
	
	/** 개인회원정보 */
	@Resource(name = "TMemUserService")
    private TMemUserService TMemUserService;
	
	/** 회원접속정보 */
	@Resource(name = "TMemAccptService")
    private TMemAccptService TMemAccptService;
	
	/** 비밀번호획인 */
	@Resource(name = "LoginService")
    private LoginService LoginService;
	
    /** EgovPropertyService */
    @Resource(name = "propertiesService")
    protected EgovPropertyService propertiesService;
	
	/**
	 * 마이페이지-개인정보관리 화면
	 * @exception Exception
	 */
    @RequestMapping(value="/infoInquiry.do")
    public String infoInquiry(
    		@ModelAttribute("TMemUserVO") TMemUserVO TMemUserVO, ModelMap model, 
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
    	
    	TMemUserVO tMemUserVO = new TMemUserVO();
    	TMemUserVO settMemUserVO = new TMemUserVO();
    	tMemUserVO.setLoginId(loginVO.getLoginId());
    	settMemUserVO = TMemUserService.selectTMemUser(tMemUserVO);
    	
    	model.addAttribute("settMemAccptVO",settMemAccptVO);
    	model.addAttribute("settMemUserVO",settMemUserVO);
    	
        return "/front/privacy/infoInquiry";
    } 
    @ResponseBody
    @RequestMapping("/updateinfoInquiry.do")
    public String updateinfoInquiry(
    		HttpServletRequest request, ModelAndView view, ModelMap modelMap, HttpSession session,
    		TMemUserVO TMemUserVO, TMemAccptVO TMemAccptVO, Model model,
            @ModelAttribute("TMemUserVO") TMemUserVO searchVO, SessionStatus status)
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
	    		    	
	    	TMemUserVO.setRegister(loginVO.getLoginId());
	    	TMemUserVO.setLoginId(loginVO.getLoginId());
	    	
	    	TMemUserService.updateTMemUser(TMemUserVO);
	    		    	
	    	TMemAccptVO tMemAccptVO = new TMemAccptVO();	    		
	    	
	    	TMemAccptVO.setRegister(loginVO.getLoginId());
	    	TMemAccptVO.setLoginId(TMemUserVO.getLoginId());
	    	TMemAccptVO.setSmsYn(TMemUserVO.getSmsYn());
	    	TMemAccptVO.setMailYn(TMemUserVO.getMailYn());
	    	TMemAccptService.updateTMemAccpt(tMemAccptVO);
	    		    	
	    	TMemAccptVO.setLoginPwd(LoginService.SHA256Encrypt(loginVO.getLoginPwd()));
	    	TMemAccptService.updateTMemAccpt(TMemAccptVO);
	    	
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
    		@RequestParam("loginPwd") String loginPwd,Model model, HttpSession session) throws Exception{
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
	        
	        //TMemAccptVO.setLoginPwd(); 
	        
        return String.valueOf(cnt);
    }
    
    
    
    
    @RequestMapping("/selectinfoInquiry.do")
    public @ModelAttribute("TMemUserVO")
    TMemUserVO selectinfoInquiry(
    		TMemUserVO TMemUserVO,
            @ModelAttribute("FrontSearchVO") FrontSearchVO searchVO) throws Exception {
        return TMemUserService.selectTMemUser(TMemUserVO);
    }
 
    

}

