package dlink_new.front.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
/**
 * @Class Name : FrontDsnStdController.java
 * @Description : FrontDsnStd Controller class
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
@RequestMapping("/front")
public class FrontDlinkController {
		
		/** 디링크소개 */
		@RequestMapping(value="/dlink/intro.do")
		public String dlinkIntro(
				ModelMap model,
				HttpServletRequest req,
				HttpSession session,
				HttpServletResponse response)
				throws Exception{
			
			return "/front/dlink/intro";
		}
		
		/** 오시는길 */
		@RequestMapping(value="/dlink/directions.do")
		public String dlinkDirections(
				ModelMap model,
				HttpServletRequest req,
				HttpSession session,
				HttpServletResponse response)
				throws Exception{
			
			return "/front/dlink/directions";
		}
}
