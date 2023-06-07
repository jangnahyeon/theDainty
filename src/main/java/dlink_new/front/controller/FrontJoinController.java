package dlink_new.front.controller;

import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNotSame;

import java.math.BigDecimal;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import dlink_new.admin.service.TbCodeService;
import dlink_new.admin.service.TbMemService;
import dlink_new.admin.vo.TbCodeVO;
import dlink_new.admin.vo.TbMemVO;
import dlink_new.common.service.TbAtalkTmplService;
import dlink_new.common.vo.TbAtalkTmplVO;
import dlink_new.util.PasswordUtils;

/**
 * @Class Name : AdminLoginController.java
 * @Description : AdminLogin Controller class
 * @Modification Information
 *
 * @author 이재욱
 * @since 2023-01-09
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */

@Controller
@RequestMapping("/front")
public class FrontJoinController {
	
	@Resource(name = "tbMemService")
    private TbMemService tbMemService;
	
	@Resource(name = "tbAtalkTmplService")
    private TbAtalkTmplService tbAtalkTmplService;
	
	@Resource(name = "tbCodeService")
    private TbCodeService tbCodeService;
	
	@RequestMapping(value="/join/joinMember1.do")
	public String joinMember1(
			ModelMap model,
			HttpServletRequest req,
			HttpServletResponse response)
			throws Exception{		
		return "/front/join/joinMember1";
	}
	
	@RequestMapping(value="/join/joinMember2.do")
	public String joinMember2(
			@RequestParam(required=false) String code,
			ModelMap model,
			HttpServletRequest req,
			HttpServletResponse response,
			HttpSession session)
			throws Exception{
		
		if(null != code) {
			TbMemVO joinMemVO = new TbMemVO();
			joinMemVO.setCode(code);
			
			session.setAttribute("joinMemVO", joinMemVO);
		}
		
		return "/front/join/joinMember2";
	}
	
	@RequestMapping(value="/join/joinMember3.do")
	public String joinMember3(
			ModelMap model,
			HttpServletRequest req,
			HttpServletResponse response)
			throws Exception{
		
			TbCodeVO vo = new TbCodeVO();
	        String searchKeyword = "plt009";
	        vo.setSearchCondition("gbCd");
	        vo.setSearchKeyword(searchKeyword);
	        
//	        vo.setGbCd("plt002");
//	        vo.setGbCd("plt003");
//	        vo.setGbCd("plt004");
	        List<?> codelist = tbCodeService.selectTbCodeListFront(vo);
	        model.addAttribute("codelist", codelist);
		return "/front/join/joinMember3";
	}
	
	@RequestMapping(value="/join/joinMember4.do")
	public String joinMember4(
			ModelMap model,
			HttpServletRequest req,
			HttpServletResponse response)
			throws Exception{
		return "/front/join/joinMember4";
	}
	
	@RequestMapping(value="/join/idCheck_act.do")
	@ResponseBody
	public String frontJoinIdCheckAct(
			TbMemVO tbMemVO,
			ModelMap model,
			HttpServletRequest req,
			HttpServletResponse response,
			HttpSession session )
					throws Exception{
		
		TbMemVO memVO = tbMemService.selectTbMem(tbMemVO);
		if(null != memVO) {
			return "EXIST";
		}
		
		return "Y";
	}
	
	@RequestMapping(value="/join/emailCheck_act.do")
	@ResponseBody
	public String frontJoinEmailCheckAct(
			TbMemVO tbMemVO,
			ModelMap model,
			HttpServletRequest req,
			HttpServletResponse response,
			HttpSession session )
					throws Exception{
		
		if( StringUtils.isEmpty(tbMemVO.getEmail()) ) {
			return "N";
		}
		
		tbMemVO.setSearchCondition("email");
		TbMemVO memVO = tbMemService.selectTbMem(tbMemVO);
		if(null != memVO) {
			return "EXIST";
		}
		
		return "Y";
	}
	
	@RequestMapping(value="/join/join_act.do")
	@ResponseBody
	public String frontJoinAct(
			TbMemVO tbMemVO,
			ModelMap model,
			HttpServletRequest req,
			HttpServletResponse response,
			HttpSession session )
					throws Exception{
		
		TbMemVO joinMemVO = (TbMemVO)session.getAttribute("joinMemVO");
		if(null == joinMemVO ) {
			return "NO_CODE";
		}
		
		String code = joinMemVO.getCode();
		if( !"0002".equals( code ) 
						&& !"0003".equals( code ) ) {
			return "NO_CODE";
		}
		
		tbMemVO.setCode(code);
		
		TbMemVO memVO = tbMemService.selectTbMem(tbMemVO);
		if(null != memVO) {
			return "EXIST";
		}
		
		if(StringUtils.isEmpty(tbMemVO.getMemId())
				|| StringUtils.isEmpty(tbMemVO.getMemPw())
				|| StringUtils.isEmpty(tbMemVO.getMemNm()) ) {
			return "N";
		}
		
		if( !StringUtils.isEmpty(tbMemVO.getMemPw()) ) {
    		String memPw = tbMemVO.getMemPw();
    		String encMemPw = PasswordUtils.encript(memPw);
    		tbMemVO.setMemPw(encMemPw);
    	}
		
		// 이메일 중복 확인
		TbMemVO emailChkVO = new TbMemVO();
		emailChkVO.setEmail(tbMemVO.getEmail());
		emailChkVO.setSearchCondition("email");
		memVO = tbMemService.selectTbMem(emailChkVO);
		if(null != memVO) {
			return "EMAIL_EXIST";
		}		
		
		java.lang.Integer memSeq = tbMemService.insertTbMem(tbMemVO);
		if( memSeq <= 0 ) {
			return "N";
		}
		
		/*관리자에게 알림톡*/
		TbAtalkTmplVO vo = new TbAtalkTmplVO();
		vo.setTmplCd("dlink_mts001");
		vo = tbAtalkTmplService.selectTbAtalkTmpl(vo);
		//assertNotNull(vo);
		if(null != vo) {
			String msg = vo.getTranMsg();
			vo.setTranMsg(msg);
			
			java.lang.Integer tranPr = tbAtalkTmplService.insertMtsAtalkMsg(vo);
			//assertNotSame(0, tranPr);			
		}
		
		/*사용자에게 알림톡*/
//		vo = new TbAtalkTmplVO();
//		vo.setTmplCd("dlink_mts003");
//		vo = tbAtalkTmplService.selectTbAtalkTmpl(vo);
//		if(null != vo) {
//			//assertNotNull(vo);
//			
//			String msg = vo.getTranMsg();		
//			vo.setTranMsg(msg);
//			vo.setTranPhone(tbMemVO.getHp().replace("-", ""));
//			
//			java.lang.Integer tranPr = tbAtalkTmplService.insertMtsAtalkMsg(vo);
//		}
		
		memVO = tbMemService.selectTbMem(tbMemVO);
		if(null == memVO) {
			return "N";
		}
		
		joinMemVO.setMemId(memVO.getMemId());
		joinMemVO.setMemNm(memVO.getMemNm());
		joinMemVO.setEmail(memVO.getEmail());
		
		return "Y";
	}
}
