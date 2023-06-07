package dlink.front2.controller;

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
//@Controller
//@RequestMapping("/front2/dsnStd")
public class FrontDsnStdController {

		/** 시설예약_예약게시판_글쓰기 */
		@RequestMapping(value="/sisulRsvBoardForm.do")
		public String sisulRsvBoardForm(
	    		ModelMap model,
	    		HttpServletRequest req,
	    		HttpSession session,
	    		HttpServletResponse response)
	            throws Exception {
			
			return "/front2/dsnStd/sisulRsvBoardForm";
	    }
		
		/** 시설예약_예약게시판*/
		@RequestMapping(value="/sisulRsvBoardList.do")
		public String sisulRsvBoardList(
	    		ModelMap model,
	    		HttpServletRequest req,
	    		HttpSession session,
	    		HttpServletResponse response)
	            throws Exception {
			
			return "/front2/dsnStd/sisulRsvBoardList";
		}
		
		/** 시설예약 */
		@RequestMapping(value="/sisulRsv.do")
		public String sisulRsv(
	    		ModelMap model,
	    		HttpServletRequest req,
	    		HttpSession session,
	    		HttpServletResponse response)
				throws Exception{
			return "/front2/dsnStd/sisulRsv";
		}
		
		/** 시설소개 */
		@RequestMapping(value="/sisulIntro.do")
		public String sisulInt(
				ModelMap model,
				HttpServletRequest req,
				HttpSession session,
				HttpServletResponse response)
				throws Exception{
			return "/front2/dsnStd/sisulIntro";
		}
		
		/** 촬영 포트폴리오*/
		@RequestMapping(value="/protfList.do")
		public String protList(
				ModelMap model,
				HttpServletRequest req,
				HttpSession session,
				HttpServletResponse response)
				throws Exception{
			return "/front2/dsnStd/protfList";
		}
}
