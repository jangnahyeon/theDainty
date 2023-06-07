package dlink.common.controller;

import java.security.MessageDigest;
import java.util.List;
import java.util.Map;
import java.util.logging.Logger;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;

import dlink.admin.vo.TMenuVO;
import dlink.admin.service.TMenuService;
import dlink.common.service.CommonHttpService;
//
@Controller
public class MenuController {
	
	private final static Logger LOG = Logger.getGlobal();
	
    @Resource(name = "TMenuService")
    private TMenuService TMenuService;
    
    @Resource(name = "CommonHttpService")
    private CommonHttpService CommonHttpService;
    
    
	//header Menu
	@RequestMapping(value="/admin/menu/header.do")
    @ResponseBody
    public ResponseEntity<String> selectHeaderJason(HttpServletRequest req, HttpServletResponse response, ModelMap model, HttpSession session)
            throws Exception {
    	HttpHeaders resHeaders = new HttpHeaders();
	    resHeaders.add("Content-Type", "application/json;charset=UTF-8");
	    
    	List<?> menuList = null;
    	try{
    		TMenuVO vo = new TMenuVO();
    		vo.setUpMenuId("admin");
    		vo.setPagingYn("N");
    		menuList = TMenuService.selectTMenuList(vo);
    		
    	}catch(Exception e){
			e.printStackTrace();
		}
    	
    	ObjectMapper om = new ObjectMapper();
    	String return_value = om.writeValueAsString(menuList);
    	
    	ResponseEntity<String> result = new ResponseEntity<String> (return_value, resHeaders, HttpStatus.CREATED);
        return result;
    }
	
	//Left Menu
	@RequestMapping(value="/admin/menu/leftMenu.do")
    public String leftMenu(@RequestParam Map<String, Object> param,ModelMap model, HttpSession session)
            throws Exception {
		TMenuVO vo = new TMenuVO();
		String menuGubun = "";
		vo.setMenuPath((String)param.get("path"));
		vo = TMenuService.selectTMenu(vo);
		if(vo != null) {
			menuGubun = vo.getMenuGubun();
			
			session.setAttribute("DLinkMenuGubun", vo.getMenuGubun());
			session.setAttribute("DLinkMenuId", vo.getMemuId());
			
			model.addAttribute("menuId", vo.getMemuId());
			
		} else {
			menuGubun = menuGubunSetting(session);
			model.addAttribute("menuId", menuIdSetting(session));
		}
		
		TMenuVO tMenuVO = new TMenuVO();
		tMenuVO.setMenuGubun(menuGubun);
		tMenuVO.setPagingYn("N");
		model.addAttribute("menuList", TMenuService.selectTMenuList(tMenuVO));
		
		return "admin/menu/adminLeftMenu";
    }
	
	public String menuGubunSetting(HttpSession session){
		String menuGubun = "";

		if(session.getAttribute("DLinkMenuGubun") == null) {
			menuGubun = "infoMng";
		} else {
			menuGubun = (String) session.getAttribute("DLinkMenuGubun");
		}
		
		return menuGubun;
	}
	
	public String menuIdSetting(HttpSession session){
		
		String menuId = "";
		
		if(session.getAttribute("DLinkMenuId") == null) {
			menuId = "codeMagmtList";
		} else {
			menuId = (String) session.getAttribute("DLinkMenuId");
		}
		
		return menuId;
	}
         
}
