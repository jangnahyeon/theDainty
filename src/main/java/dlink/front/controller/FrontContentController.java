package dlink.front.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

//
@Controller
@RequestMapping("/front/content")
public class FrontContentController {
	
	//사용자 로그인 작동
	@RequestMapping(value="/{content}.do")
    public String logout(
    		@PathVariable String content,
    		ModelMap model,
    		HttpServletRequest req,
    		HttpSession session,
    		HttpServletResponse response)
            throws Exception {
		
		return "/front/content/" + content;
    }
	
	
}
