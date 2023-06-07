package dlink.admin.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.egovframe.rte.fdl.property.EgovPropertyService;
import org.egovframe.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.fasterxml.jackson.databind.ObjectMapper;

import dlink.admin.service.TMenuService;
import dlink.admin.vo.SearchVO;
import dlink.admin.vo.TCodeVO;
import dlink.admin.vo.TMemAccptVO;
import dlink.admin.vo.TMenuVO;

/**
 * @Class Name : TMenuController.java
 * @Description : TMenu Controller class
 * @Modification Information
 *
 * @author 안성찬
 * @since 2022-03-31
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */

@Controller
@RequestMapping("/admin/menu")
public class AdminMenuController {

    @Resource(name = "TMenuService")
    private TMenuService TMenuService;
    
    /** EgovPropertyService */
    @Resource(name = "propertiesService")
    protected EgovPropertyService propertiesService;
	
    /**
	 * t_menu 목록을 조회한다. (pageing)
	 * @param searchVO - 조회할 정보가 담긴 SerchVo
	 * @return "/TMenu/TMenuList"
	 * @exception Exception
	 */
    @RequestMapping(value="/menuMagmtList.do")
    public String selectTMenuList(@ModelAttribute("searchVO") TMenuVO searchVO, 
    		ModelMap model)
            throws Exception {
    	try {
    		  
    		searchVO.setPagingYn("N");
    		List<?> TMenuList = TMenuService.selectTMenuTreeList(searchVO);
    		
    		
    		//json객체로 변경
    		ObjectMapper om = new ObjectMapper();
    		String menuJsonList = om.writeValueAsString(TMenuList);
    		
    		model.addAttribute("menuJsonList", menuJsonList);
  		} catch (Exception e) {
  			
  			e.printStackTrace();
  			
  		}
        return "/admin/menu/menuMagmtList";
    } 
    
    @ResponseBody
    @RequestMapping(value="/menuAjaxSelect.do")
    public ResponseEntity<String> menuAjaxSelect(@ModelAttribute("searchVO") TMenuVO searchVO, 
    		ModelMap model, HttpServletResponse response)
            throws Exception {
    	HttpHeaders resHeaders = new HttpHeaders();
	    resHeaders.add("Content-Type", "application/json;charset=UTF-8");
	    ResponseEntity<String> jsonResult = null;
	    try {
	  		  
	    	TMenuVO result = TMenuService.selectTMenu(searchVO);
	    	
	    	if(result == null) result = new TMenuVO();
	    	
	    	ObjectMapper om = new ObjectMapper();
	    	String return_value = om.writeValueAsString(result);
	    	
	    	jsonResult = new ResponseEntity<String> (return_value, resHeaders, HttpStatus.CREATED);
  		} catch (Exception e) {
  			
  			e.printStackTrace();
  			
  		}
        return jsonResult;
    }
    
    @RequestMapping("/menuMagmtInsert.do")
    public String addTMenu(
            TMenuVO TMenuVO,
            @ModelAttribute("searchVO") SearchVO searchVO, SessionStatus status, HttpSession session, Model model)
            throws Exception {
    	//사용자 로그인 확인 Start
		TMemAccptVO loginVO = (TMemAccptVO) session.getAttribute("DlinkLogin");
		if(loginVO == null) {
			model.addAttribute("msg", "fail");
			return "redirect:/admin/login.do";
		}
		//사용자 로그인 확인 End
    			
        try {
        	TMenuVO.setRegister(loginVO.getLoginId());
        	TMenuService.insertTMenu(TMenuVO);
            status.setComplete();
             
  		} catch (Exception e) {
  			
  			e.printStackTrace();
  			
  		}
        
        return "redirect:/admin/menu/menuMagmtList.do";
    }
    
    @RequestMapping("/menuMagmtUpdate.do")
    public String updateTMenu(
            TMenuVO TMenuVO,
            @ModelAttribute("searchVO") SearchVO searchVO, SessionStatus status, HttpSession session, Model model)
            throws Exception {
    	//사용자 로그인 확인 Start
		TMemAccptVO loginVO = (TMemAccptVO) session.getAttribute("DlinkLogin");
		if(loginVO == null) {
			model.addAttribute("msg", "fail");
			return "redirect:/admin/login.do";
		}
		//사용자 로그인 확인 End
		
        try {
        	TMenuVO.setRegister(loginVO.getLoginId());
        	TMenuService.updateTMenu(TMenuVO);
        	status.setComplete();
              
  		} catch (Exception e) {
  			
  			e.printStackTrace();
  			
  		}finally {
  			
  		}
        
        return "redirect:/admin/menu/menuMagmtList.do";
    }
    
    @RequestMapping("/menuMagmtDelete.do")
    public String deleteTMenu(
            TMenuVO TMenuVO,
            @ModelAttribute("searchVO") SearchVO searchVO, SessionStatus status, HttpSession session, Model model)
            throws Exception {
        
      //사용자 로그인 확인 Start
  		TMemAccptVO loginVO = (TMemAccptVO) session.getAttribute("DlinkLogin");
  		if(loginVO == null) {
  			model.addAttribute("msg", "fail");
  			return "redirect:/admin/login.do";
  		}
  		//사용자 로그인 확인 End
      		
        try {
        	TMenuService.deleteTMenu(TMenuVO);
        	status.setComplete();
              
  		} catch (Exception e) {
  			
  			e.printStackTrace();
  			
  		}finally {
  			
  		}
        
        return "redirect:/admin/menu/menuMagmtList.do";
    }
    

}
