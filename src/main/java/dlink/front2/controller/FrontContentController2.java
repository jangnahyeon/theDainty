package dlink.front2.controller;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @Class Name : FrontContentController.java
 * @Description : FrontContent Controller class
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
@RequestMapping("/front2/content")
public class FrontContentController2 {

		/**디링크 소개 */
		@RequestMapping(value="/bsnIntro.do")
		public String bsnIntro(
	    		ModelMap model,
	    		HttpServletRequest req,
	    		HttpSession session,
	    		HttpServletResponse response)
	            throws Exception {
			
			return "/front2/content/bsnIntro"; 
		}
	
		/**공지사항 */
		@RequestMapping(value="/noticeList.do")
		public String notice(
	    		ModelMap model,
	    		HttpServletRequest req,
	    		HttpSession session,
	    		HttpServletResponse response)
	            throws Exception {
			
			return "/front2/content/noticeList";
		}
	
		/**공지사항 글보기 */
		@RequestMapping(value="/noticeView.do")
		public String noticeView(
	    		ModelMap model,
	    		HttpServletRequest req,
	    		HttpSession session,
	    		HttpServletResponse response)
	            throws Exception {
			
			return "/front2/content/noticeView";
		}
		
		/**오시는길 */
		@RequestMapping(value="/directions.do")
		public String directions(
	    		ModelMap model,
	    		HttpServletRequest req,
	    		HttpSession session,
	    		HttpServletResponse response)
	            throws Exception {
			
			return "/front2/content/directions";
		}
}
