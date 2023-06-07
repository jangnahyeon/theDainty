package dlink_new.interceptors;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import dlink_new.front.service.TbMenuFooterService;
import dlink_new.front.service.TbMenuService;
import dlink_new.front.vo.TbMenuFooterVO;
import dlink_new.front.vo.TbMenuVO;

public class FrontMenuInterceptor extends HandlerInterceptorAdapter {
	
	@Resource(name = "tbMenuService")
    private TbMenuService tbMenuService;
	
	@Resource(name = "tbMenuFooterService")
    private TbMenuFooterService tbMenuFooterService;
	
	@Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		
		HttpSession session = request.getSession();
		String uri = request.getRequestURI();		
		String url = request.getRequestURL().toString();	
		
		String code = request.getParameter("code");
		if(null != code) {
			uri += "?code=" + code;
		}
		
		String menuSeq = request.getParameter("menuSeq");
		if(null != menuSeq) {
			
		}
				
		TbMenuVO searchVO = new TbMenuVO();
		//searchVO.setSearchCondition("menuDepth");
		searchVO.setRecordCountPerPage(100);
		
		searchVO.setMenuDepth(1);		
		List<TbMenuVO> frontMenuList1 = tbMenuService.selectTbMenuList(searchVO);
		session.setAttribute("frontMenuList1", frontMenuList1);
		
		searchVO.setMenuDepth(2);	
		List<TbMenuVO> frontMenuList2 = tbMenuService.selectTbMenuList(searchVO);	
		session.setAttribute("frontMenuList2", frontMenuList2);	
		
		searchVO.setMenuDepth(3);	
		List<TbMenuVO> frontMenuList3 = tbMenuService.selectTbMenuList(searchVO);	
		session.setAttribute("frontMenuList3", frontMenuList3);
		
		int frontMenuSeq = -1;
		
		int frontMenuSeq1 = -1;
		int frontMenuSeq2 = -1;
		int frontMenuSeq3 = -1;
		
		TbMenuVO frontMenuVO1 = null;
		TbMenuVO frontMenuVO2 = null;
		TbMenuVO frontMenuVO3 = null;
		
		if(null != uri) {		
			for(TbMenuVO vo : frontMenuList3) {
				if( null != vo.getMenuUrl() && vo.getMenuUrl().contains(uri) ) {
					frontMenuSeq = vo.getMenuSeq();
				} else if( String.valueOf( vo.getMenuSeq() ).equals( menuSeq ) ) {
					frontMenuSeq = vo.getMenuSeq();
				}
				
				if(frontMenuSeq == vo.getMenuSeq()) {
					frontMenuSeq3 = vo.getMenuSeq();
					frontMenuSeq2 = vo.getUpMenuSeq();
					
					frontMenuVO3 = vo;
				}
			}
			
			
			for(TbMenuVO vo : frontMenuList2) {
				if( null != vo.getMenuUrl() && vo.getMenuUrl().contains(uri) ) {
					frontMenuSeq = vo.getMenuSeq();					
				} else if( String.valueOf( vo.getMenuSeq() ).equals( menuSeq ) ) {
					frontMenuSeq = vo.getMenuSeq();
				}
				
				if(frontMenuSeq == vo.getMenuSeq()) {
					frontMenuSeq2 = vo.getMenuSeq();
					frontMenuSeq1 = vo.getUpMenuSeq();	
					
					frontMenuVO2 = vo;
				} 
				
				if(null != frontMenuVO3 && frontMenuVO3.getUpMenuSeq() == vo.getMenuSeq()) {
					frontMenuVO2 = vo;
				}
			}
			
			for(TbMenuVO vo : frontMenuList1) {
				if( null != vo.getMenuUrl() && vo.getMenuUrl().contains(uri) ) {
					frontMenuSeq = vo.getMenuSeq();
				} else if( String.valueOf( vo.getMenuSeq() ).equals( menuSeq ) ) {
					frontMenuSeq = vo.getMenuSeq();
				}
				
				if(frontMenuSeq == vo.getMenuSeq()) {
					frontMenuSeq1 = vo.getMenuSeq();	
					
					frontMenuVO1 = vo;
				}
				
				if(null != frontMenuVO2 && frontMenuVO2.getUpMenuSeq() == vo.getMenuSeq()) {
					frontMenuVO1 = vo;
				}
			}
		}
		
		if(-1 != frontMenuSeq) {
			session.setAttribute("frontMenuSeq", frontMenuSeq);
		} else {
			session.removeAttribute("frontMenuSeq");
		}
		
		if(-1 != frontMenuSeq1) {
			session.setAttribute("frontMenuSeq1", frontMenuSeq1);
		} else {
			session.removeAttribute("frontMenuSeq1");
		}
		
		if(-1 != frontMenuSeq2) {
			session.setAttribute("frontMenuSeq2", frontMenuSeq2);
		} else {
			session.removeAttribute("frontMenuSeq3");
		}
		
		if(-1 != frontMenuSeq3) {
			session.setAttribute("frontMenuSeq3", frontMenuSeq3);
		} else {
			session.removeAttribute("frontMenuSeq3");
		}		
		
		session.setAttribute("frontMenuVO1", frontMenuVO1 != null ? frontMenuVO1 : null);
		session.setAttribute("frontMenuVO2", frontMenuVO2 != null ? frontMenuVO2 : null);
		session.setAttribute("frontMenuVO3", frontMenuVO3 != null ? frontMenuVO3 : null);
		
		
		TbMenuFooterVO menuFooterVO = new TbMenuFooterVO();
		menuFooterVO.setUseYn("Y");
		List<TbMenuFooterVO> frontMenuFooterList = tbMenuFooterService.selectTbMenuFooterList(menuFooterVO);
		session.setAttribute("frontMenuFooterList", frontMenuFooterList);
		
		int frontMenuFooterSeq = -1;
		
		TbMenuFooterVO frontMenuFooterVO = null;
		
		if(null != uri) {
			for(TbMenuFooterVO vo : frontMenuFooterList) {
				if( null != vo.getMenuUrl() && vo.getMenuUrl().contains(uri) ) {
					frontMenuFooterSeq = vo.getMenuSeq();
				}
				
				if(frontMenuFooterSeq == vo.getMenuSeq()) {
					frontMenuFooterVO = vo;
				}
			}
		}
		
		session.setAttribute("frontMenuFooterVO", frontMenuFooterVO != null ? frontMenuFooterVO : null);
    	
        return super.preHandle(request, response, handler);
    }
    
    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception { }

}
