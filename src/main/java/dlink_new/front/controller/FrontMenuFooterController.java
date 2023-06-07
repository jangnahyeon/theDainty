package dlink_new.front.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

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
public class FrontMenuFooterController {	
	
	@RequestMapping(value="/menuFooter/{1}.do")
	public String frontLogin(
			ModelMap model,
			HttpServletRequest req,
			HttpServletResponse response)
			throws Exception{
		
		String uri = req.getRequestURI();
		
		String view_nm = uri.replaceAll(".do", "");
		
		return view_nm;
	}	
}
