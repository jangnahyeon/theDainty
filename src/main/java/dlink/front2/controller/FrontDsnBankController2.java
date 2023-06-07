package dlink.front2.controller;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @Class Name : FrontDsnBankController.java
 * @Description : FrontDsnBank Controller class
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
@RequestMapping(value="/front2/dsnBank")
public class FrontDsnBankController2 {
	
	/** 디자인뱅크_패키지디자인소스 */
	@RequestMapping(value="/packageDsnSc.do")
	public String packageDsnSc(
    		ModelMap model,
    		HttpServletRequest req,
    		HttpSession session,
    		HttpServletResponse response)
            throws Exception {
		
		return "/front2/dsnBank/packageDsnSc";
    }
}
