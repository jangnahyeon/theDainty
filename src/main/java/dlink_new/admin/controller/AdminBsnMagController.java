package dlink_new.admin.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @Class Name : AdminBsnMagController.java
 * @Description : AdminBsnMag Controller class
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
@RequestMapping("/admin/bsnMag")
public class AdminBsnMagController {

	/** 팝업관리 */
	@RequestMapping(value="/popMag.do")
	public String popMag(
			ModelMap model,
			HttpServletRequest req,
			HttpServletResponse response)
			throws Exception{
		return "/admin/bsnMag/popMag";
	}
	
	/** 팝업관리_수정 */
	@RequestMapping(value="/popMagMdf.do")
	public String popMagMdf(
			ModelMap model,
			HttpServletRequest req,
			HttpServletResponse response)
			throws Exception{
		return "/admin/bsnMag/popMagMdf";
	}
	
	/** 코드관리 */
	@RequestMapping(value="/codeMag.do")
	public String codeMag(
			ModelMap model,
			HttpServletRequest req,
			HttpServletResponse response)
			throws Exception{
		return "/admin/bsnMag/codeMag";
	}
	
	/** 게시판등록 */
	@RequestMapping(value="/ntcRgs.do")
	public String ntcRgs(
			ModelMap model,
			HttpServletRequest req,
			HttpServletResponse response)
			throws Exception{
		return "/admin/bsnMag/ntcRgs";
	}
	
	/** 게시판목록 */
	@RequestMapping(value="/ntcList.do")
	public String ntcList(
			ModelMap model,
			HttpServletRequest req,
			HttpServletResponse response)
			throws Exception{
		return "/admin/bsnMag/ntcList";
	}
	
	/** 게시판상세 */
	@RequestMapping(value="/ntcDtl.do")
	public String ntcDtl(
			ModelMap model,
			HttpServletRequest req,
			HttpServletResponse response)
			throws Exception{
		return "/admin/bsnMag/ntcDtl";
	}
}