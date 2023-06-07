package dlink_new.admin.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import dlink_new.admin.service.TbMemService;
import dlink_new.admin.service.TbMenuAdminService;
import dlink_new.admin.vo.TbMemVO;
import dlink_new.admin.vo.TbMenuAdminVO;
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
public class AdminLoginController {
	
	@Resource(name = "tbMemService")
    private TbMemService tbMemService;
	
	@Resource(name = "TbMenuAdminService")
    private TbMenuAdminService TbMenuAdminService;
	
	@RequestMapping(value="/admin/login.do")
	public String adminLogin(
			ModelMap model,
			HttpServletRequest req,
			HttpServletResponse response)
			throws Exception{
		return "/admin/login";
	}
	
	@RequestMapping(value="/admin/login_act.do")
	@ResponseBody
	public String adminLoginAct(
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
		
		switch( code ) {
		case "0001":
		case "0004":
			
			break;
			
		default:
			return "N";			
		}
		
		String memPw = tbMemVO.getMemPw();
		String encMemPw = memVO.getMemPw();
		
		boolean isValid = PasswordUtils.isValid(memPw, encMemPw);
		if(!isValid) {
			return "N";
		}		
		
		session.setAttribute("adminLoginVO", memVO);
		
		return code;
	}
	
	@RequestMapping(value="/admin/getUrl.do")
	@ResponseBody
	public String getUrl(
			TbMemVO tbMemVO,
			ModelMap model,
			HttpServletRequest req,
			HttpServletResponse response,
			HttpSession session )
					throws Exception{
		
		TbMenuAdminVO searchVO = new TbMenuAdminVO();
		searchVO.setRecordCountPerPage(100);
		if(tbMemVO != null) {
			searchVO.setAuth(tbMemVO.getCode());			
		}
		searchVO.setUseYn("Y");
		searchVO.setMenuDepth(3);	
		List<TbMenuAdminVO> adminMenuList3 = TbMenuAdminService.selectTbMenuAdminList(searchVO);	
		session.setAttribute("adminMenuList3", adminMenuList3);
		
		String url = "";
		for(TbMenuAdminVO vo : adminMenuList3) {
			if(vo.getMenuUrl() == null) {
				continue;
			} else if(vo.getMenuUrl() != null){		
				url = vo.getMenuUrl();
				break;
			}
		}
		
		
		return url;
	}
	
	@RequestMapping(value="/admin/logout.do")
	public String adminLogout(
			TbMemVO tbMemVO,
			ModelMap model,
			HttpServletRequest req,
			HttpServletResponse response,
			HttpSession session )
					throws Exception{
		
		session.removeAttribute("adminLoginVO");		
		
		return "redirect:/admin/login.do";
	}
}
