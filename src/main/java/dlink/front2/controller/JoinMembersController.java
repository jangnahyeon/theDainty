package dlink.front2.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
/**
 * @Class Name : JoinMembersController.java
 * @Description : JoinMembers Controller class
 * @Modification Information
 *
 * @author 이재욱
 * @since 2023-01-06
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */
@Controller
@RequestMapping("/front2")
public class JoinMembersController {

	/** 회원가입 1단계 */
	@RequestMapping(value="/joinMember1.do")
	public String joinMember1(
    		ModelMap model,
    		HttpServletRequest req,
    		HttpSession session,
    		HttpServletResponse response)
            throws Exception {
		
		return "/front2/joinMember1";
    }
	
	/** 회원가입 2단계 */
	@RequestMapping(value="/joinMember2.do")
	public String joinMember2(
    		ModelMap model,
    		HttpServletRequest req,
    		HttpSession session,
    		HttpServletResponse response)
            throws Exception {
		
		return "/front2/joinMember2";
    }
	
	/** 회원가입 3단계 */
	@RequestMapping(value="/joinMember3.do")
	public String joinMember3(
    		ModelMap model,
    		HttpServletRequest req,
    		HttpSession session,
    		HttpServletResponse response)
            throws Exception {
		
		return "/front2/joinMember3";
    }
	
	/** 회원가입 4단계 */
	@RequestMapping(value="/joinMember4.do")
	public String joinMember4(
    		ModelMap model,
    		HttpServletRequest req,
    		HttpSession session,
    		HttpServletResponse response)
            throws Exception {
		
		return "/front2/joinMember4";
    }
}
