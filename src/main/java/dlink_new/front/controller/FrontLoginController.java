package dlink_new.front.controller;

import static org.junit.Assert.assertNotNull;

import java.util.HashMap;
import java.util.Random;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;

import dlink_new.admin.service.TbMemService;
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
public class FrontLoginController {
	
	@Resource(name = "tbMemService")
    private TbMemService tbMemService;
	
	@Resource(name = "tbAtalkTmplService")
	private TbAtalkTmplService tbAtalkTmplService;
	
	@RequestMapping(value="/login.do")
	public String frontLogin(
			ModelMap model,
			HttpServletRequest req,
			HttpServletResponse response)
			throws Exception{
		return "/front/login";
	}
	
	@RequestMapping(value="/login_act.do")
	@ResponseBody
	public String frontLoginAct(
			TbMemVO tbMemVO,
			ModelMap model,
			HttpServletRequest req,
			HttpServletResponse response,
			HttpSession session )
					throws Exception{
		
		TbMemVO memVO = tbMemService.selectTbMem(tbMemVO);
		if(null == memVO) {
			return "NOT_EXIST";
		}
		
		if( StringUtils.isEmpty(tbMemVO.getMemPw()) ) {
			return "PW_EMPTY";
		}
		
		String code = memVO.getCode();
		if( null == code ) {
			return "N";
		}
		
		/*switch( code ) {
		case "0002":
		case "0003":
			
			break;
			
		default:
			return "N";			
		}	*/
		
		String memPw = tbMemVO.getMemPw();
		String encMemPw = memVO.getMemPw();
		
		boolean isValid = PasswordUtils.isValid(memPw, encMemPw);
		if(!isValid) {
			return "N";
		}		
		
		if( "O".equals(memVO.getAcceptYn()) ) {
			return "OUT_MEM";
		}
		
		session.setAttribute("frontLoginVO", memVO);
		
		return "Y";
	}
	
	@RequestMapping(value="/logout.do")
	public String frontLogout(
			TbMemVO tbMemVO,
			ModelMap model,
			HttpServletRequest req,
			HttpServletResponse response,
			HttpSession session )
					throws Exception{
		
		session.removeAttribute("frontLoginVO");		
		
		return "redirect:/front/login.do";
	}
	
	@RequestMapping(value="/logout_act.do")
	@ResponseBody
	public String frontLogoutAct(
			TbMemVO tbMemVO,
			ModelMap model,
			HttpServletRequest req,
			HttpServletResponse response,
			HttpSession session )
					throws Exception{
		
		session.removeAttribute("frontLoginVO");		
		
		return "Y";
	}
	
	@RequestMapping(value="/mem/findId.do")
	public String frontMemFindId(
			ModelMap model,
			HttpServletRequest req,
			HttpServletResponse response)
			throws Exception{
		return "/front/mem/findId";
	}
	
	@RequestMapping(value="/mem/findId_act.do")
	@ResponseBody
	public String frontMemFindIdAct(
			TbMemVO tbMemVO,
			ModelMap model,
			HttpServletRequest req,
			HttpServletResponse response,
			HttpSession session )
					throws Exception{
		
		ObjectMapper mapper = new ObjectMapper();
    	HashMap<String, Object> returnMap = new HashMap<String, Object>();
    	String jsonStr = "";
    	
    	returnMap.put("result", "N");
		jsonStr = mapper.writeValueAsString(returnMap);
		
		tbMemVO.setSearchCondition("findId");
		TbMemVO memVO = tbMemService.selectTbMem(tbMemVO);
		if(null == memVO) {		
			returnMap.put("msg", "NO_EXIST");
			jsonStr = mapper.writeValueAsString(returnMap);
			return jsonStr;
		}		
		
		String code = memVO.getCode();
		if( null == code ) {
			returnMap.put("msg", "NO_CODE");
			jsonStr = mapper.writeValueAsString(returnMap);
			return jsonStr;
		}
		
		switch( code ) {
		case "0002":
		case "0003":
			
			break;
			
		default:
			returnMap.put("msg", "NO_CODE");
			jsonStr = mapper.writeValueAsString(returnMap);
			return jsonStr;		
		}	
		
		if( StringUtils.isEmpty( tbMemVO.getMemNm() ) || !tbMemVO.getMemNm().equals(memVO.getMemNm()) ) {
			returnMap.put("msg", "NO_MEM_NM");
			jsonStr = mapper.writeValueAsString(returnMap);
			return jsonStr;
		}
		
		if( StringUtils.isEmpty( tbMemVO.getEmail() ) || !tbMemVO.getEmail().equals(memVO.getEmail()) ) {
			returnMap.put("msg", "NO_EMAIL");
			jsonStr = mapper.writeValueAsString(returnMap);
			return jsonStr;
		}
		
		returnMap.put("result", "Y");
		returnMap.put("memId", memVO.getMemId());
		
		jsonStr = mapper.writeValueAsString(returnMap);
		return jsonStr;
	}
	
	@RequestMapping(value="/mem/findPw_act.do")
	@ResponseBody
	public String frontMemFindPwAct(
			TbMemVO tbMemVO,
			ModelMap model,
			HttpServletRequest req,
			HttpServletResponse response,
			HttpSession session )
					throws Exception{
		
		ObjectMapper mapper = new ObjectMapper();
    	HashMap<String, Object> returnMap = new HashMap<String, Object>();
    	String jsonStr = "";
    	
    	returnMap.put("result", "N");
		jsonStr = mapper.writeValueAsString(returnMap);
		
		tbMemVO.setSearchCondition("findPw");
		TbMemVO memVO = tbMemService.selectTbMem(tbMemVO);
		if(null == memVO) {		
			returnMap.put("msg", "NO_EXIST");
			jsonStr = mapper.writeValueAsString(returnMap);
			return jsonStr;
		}
		
		String code = memVO.getCode();
		if( null == code ) {
			returnMap.put("msg", "NO_CODE");
			jsonStr = mapper.writeValueAsString(returnMap);
			return jsonStr;
		}
		
		switch( code ) {
		case "0002":
		case "0003":
			
			break;
			
		default:
			returnMap.put("msg", "NO_CODE");
			jsonStr = mapper.writeValueAsString(returnMap);
			return jsonStr;		
		}	
		
		if( StringUtils.isEmpty( tbMemVO.getMemNm() ) || !tbMemVO.getMemNm().equals(memVO.getMemNm()) ) {
			returnMap.put("msg", "NO_MEM_NM");
			jsonStr = mapper.writeValueAsString(returnMap);
			return jsonStr;
		}
		
		if( StringUtils.isEmpty( tbMemVO.getMemId() ) || !tbMemVO.getMemId().equals(memVO.getMemId()) ) {
			returnMap.put("msg", "NO_MEM_ID");
			jsonStr = mapper.writeValueAsString(returnMap);
			return jsonStr;
		}
		
		if( StringUtils.isEmpty( tbMemVO.getEmail() ) || !tbMemVO.getEmail().equals(memVO.getEmail()) ) {
			returnMap.put("msg", "NO_EMAIL");
			jsonStr = mapper.writeValueAsString(returnMap);
			return jsonStr;
		}
		
		String hp1 = tbMemVO.getHp();
		if( null != hp1 ) {
			hp1 = hp1.replace("-", "");
		}
		
		String hp2 = memVO.getHp();
		if( null != hp2 ) {
			hp2 = hp2.replace("-", "");
		}
		
		if( StringUtils.isEmpty( hp1 ) || !hp1.equals( hp2 ) ) {
			returnMap.put("msg", "NO_HP");
			jsonStr = mapper.writeValueAsString(returnMap);
			return jsonStr;
		}
		
		// 비밀번호 초기화
		String pw = makeCode(6);
		
		String encPw = PasswordUtils.encript(pw);
		memVO.setMemPw(encPw);		
		tbMemService.updateTbMem(memVO);
		
		TbAtalkTmplVO vo = new TbAtalkTmplVO();
		vo.setTmplCd("dlink_mts006");
		vo = tbAtalkTmplService.selectTbAtalkTmpl(vo);
		//assertNotNull(vo);
		if(null != vo) {		
			String msg = vo.getTranMsg();	
			msg = msg.replace("#{비밀번호}", pw);
			vo.setTranMsg(msg);
			vo.setTranPhone(memVO.getHp().replace("-", ""));
			java.lang.Integer tranPr = tbAtalkTmplService.insertMtsAtalkMsg(vo);
		}
		
		returnMap.put("result", "Y");
		returnMap.put("memPw", pw);
		
		// 알림톡 전송
		
		jsonStr = mapper.writeValueAsString(returnMap);
		return jsonStr;
	}
	
	private String makeCode(int size) {
		Random ran = new Random();
		StringBuffer sb = new StringBuffer();
		int num = 0;
			do {
			num = ran.nextInt(75) + 48;
			if ((num >= 48 && num <= 57) || (num >= 65 && num <= 90) || (num >= 97 && num <= 122)) {
				sb.append((char) num);
			} else {
				continue;
			}
			} while (sb.length() < size);
		return sb.toString();
	}
}
