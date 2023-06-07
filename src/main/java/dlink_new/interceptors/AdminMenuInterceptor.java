package dlink_new.interceptors;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hsqldb.lib.StringUtil;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import dlink_new.admin.service.TbMenuAdminService;
import dlink_new.admin.vo.TbMemVO;
import dlink_new.admin.vo.TbMenuAdminVO;

public class AdminMenuInterceptor extends HandlerInterceptorAdapter {
	
	@Resource(name = "TbMenuAdminService")
    private TbMenuAdminService TbMenuAdminService;
	
	@Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		TbMemVO adminLoginVO = (TbMemVO) request.getSession().getAttribute("adminLoginVO");
		
		HttpSession session = request.getSession();
		String uri = request.getRequestURI();		
		String url = request.getRequestURL().toString();	
		
		String code = request.getParameter("code");
		if( !StringUtil.isEmpty(code) ) {
			uri += "?code=" + code;
		}
		
		String menuSeq = request.getParameter("menuSeq");
		if( !StringUtil.isEmpty(menuSeq) ) {
			uri += "?menuSeq=" + menuSeq;
		}
				
		TbMenuAdminVO searchVO = new TbMenuAdminVO();
		//searchVO.setSearchCondition("menuDepth");
		searchVO.setRecordCountPerPage(100);
		if(adminLoginVO != null) {
			searchVO.setAuth(adminLoginVO.getCode());			
		}
		searchVO.setMenuDepth(1);	
		searchVO.setUseYn("Y");
		List<TbMenuAdminVO> adminMenuList1 = TbMenuAdminService.selectTbMenuAdminList(searchVO);
		session.setAttribute("adminMenuList1", adminMenuList1);
		
		searchVO.setMenuDepth(2);	
		List<TbMenuAdminVO> adminMenuList2 = TbMenuAdminService.selectTbMenuAdminList(searchVO);	
		session.setAttribute("adminMenuList2", adminMenuList2);	
		
		searchVO.setMenuDepth(3);	
		List<TbMenuAdminVO> adminMenuList3 = TbMenuAdminService.selectTbMenuAdminList(searchVO);	
		session.setAttribute("adminMenuList3", adminMenuList3);
		
		int adminMenuSeq = -1;
		
		int adminMenuSeq1 = -1;
		int adminMenuSeq2 = -1;
		int adminMenuSeq3 = -1;
		
		TbMenuAdminVO adminMenuVO1 = null;
		TbMenuAdminVO adminMenuVO2 = null;
		TbMenuAdminVO adminMenuVO3 = null;
		
		if(null != uri) {		
			for(TbMenuAdminVO vo : adminMenuList3) {
				if( null != vo.getMenuUrl() && vo.getMenuUrl().contains(uri) ) {
					adminMenuSeq = vo.getMenuSeq();
				}
				
				if(adminMenuSeq == vo.getMenuSeq()) {
					adminMenuSeq3 = vo.getMenuSeq();
					adminMenuSeq2 = vo.getUpMenuSeq();
					
					adminMenuVO3 = vo;
				}
			}
			
			
			for(TbMenuAdminVO vo : adminMenuList2) {
				if( null != vo.getMenuUrl() && vo.getMenuUrl().contains(uri) ) {
					adminMenuSeq = vo.getMenuSeq();					
				}
				
				if(adminMenuSeq == vo.getMenuSeq()) {
					adminMenuSeq2 = vo.getMenuSeq();
					adminMenuSeq1 = vo.getUpMenuSeq();	
					
					adminMenuVO2 = vo;
				} 
				
				if(null != adminMenuVO3 && adminMenuVO3.getUpMenuSeq() == vo.getMenuSeq()) {
					adminMenuVO2 = vo;
				}
			}
			
			for(TbMenuAdminVO vo : adminMenuList1) {
				if( null != vo.getMenuUrl() && vo.getMenuUrl().contains(uri) ) {
					adminMenuSeq = vo.getMenuSeq();
				}
				
				if(adminMenuSeq == vo.getMenuSeq()) {
					adminMenuSeq1 = vo.getMenuSeq();	
					
					adminMenuVO1 = vo;
				}
				
				if(null != adminMenuVO2 && adminMenuVO2.getUpMenuSeq() == vo.getMenuSeq()) {
					adminMenuVO1 = vo;
				}
			}
		}
		
		if(-1 != adminMenuSeq) {
			session.setAttribute("adminMenuSeq", adminMenuSeq);
		} else {
			session.removeAttribute("adminMenuSeq");
		}
		
		if(-1 != adminMenuSeq1) {
			session.setAttribute("adminMenuSeq1", adminMenuSeq1);
		} else {
			session.removeAttribute("adminMenuSeq1");
		}
		
		if(-1 != adminMenuSeq2) {
			session.setAttribute("adminMenuSeq2", adminMenuSeq2);
		} else {
			session.removeAttribute("adminMenuSeq3");
		}
		
		if(-1 != adminMenuSeq3) {
			session.setAttribute("adminMenuSeq3", adminMenuSeq3);
		} else {
			session.removeAttribute("adminMenuSeq3");
		}	
		
		if(null == adminMenuVO1 && null == adminMenuVO2 && null == adminMenuVO3 ) {
			
		} else {		
			session.setAttribute("adminMenuVO1", adminMenuVO1 != null ? adminMenuVO1 : null);
			session.setAttribute("adminMenuVO2", adminMenuVO2 != null ? adminMenuVO2 : null);
			session.setAttribute("adminMenuVO3", adminMenuVO3 != null ? adminMenuVO3 : null);
		}
    	
        return super.preHandle(request, response, handler);
    }
    
    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception { }

}
