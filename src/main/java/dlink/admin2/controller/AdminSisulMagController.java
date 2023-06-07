package dlink.admin2.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @Class Name : AdminSisulMagController.java
 * @Description : AdminSisulMag Controller class
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
@RequestMapping("/admin2/sisulMag")
public class AdminSisulMagController {

	/** 시설예약관리 */
	@RequestMapping(value="/sisulRsrMag.do")
	public String sisulRsrMag(
			ModelMap model,
			HttpServletRequest req,
			HttpServletResponse response)
			throws Exception{
		return "/admin2/sisulMag/sisulRsrMag";
	}
	
	/** 시설예약상세 */
	@RequestMapping(value="/sisulRsrDtl.do")
	public String sisulRsrDtl(
			ModelMap model,
			HttpServletRequest req,
			HttpServletResponse response)
			throws Exception{
		return "/admin2/sisulMag/sisulRsrDtl";
	}
}
