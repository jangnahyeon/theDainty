package dlink.admin2.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @Class Name : AdminMemMagController.java
 * @Description : AdminMemMag Controller class
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
@RequestMapping("/admin2/memMag")
public class AdminMemMagController {

	/** 개인회원상세정보 */
	@RequestMapping(value="/memDtlInfo.do")
	public String memDtlInfo(
			ModelMap model,
			HttpServletRequest req,
			HttpServletResponse response)
			throws Exception{
		return "/admin2/memMag/memDtlInfo";
	}
	
	/** 개인회원조회 */
	@RequestMapping(value="/memInq.do")
	public String memInq(
			ModelMap model,
			HttpServletRequest req,
			HttpServletResponse response)
			throws Exception{
		return "/admin2/memMag/memInq";
	}
}
