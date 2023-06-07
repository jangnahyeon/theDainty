package dlink.admin2.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @Class Name : AdminNtcMagController.java
 * @Description : AdminNtcMag Controller class
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
@RequestMapping("/admin2/ntcMag")
public class AdminNtcMagController {

	/** 포트폴리오 관리 */
	@RequestMapping(value="/protfMag.do")
	public String protMag(
			ModelMap model,
			HttpServletRequest req,
			HttpServletResponse response)
			throws Exception{
		return "/admin2/ntcMag/protfMag";
	}
	
	/** 포트폴리오 상세 */
	@RequestMapping(value="/protfDtl.do")
	public String protfDtl(
			ModelMap model,
			HttpServletRequest req,
			HttpServletResponse response)
			throws Exception{
		return "/admin2/ntcMag/protfDtl";
	}
	
}
