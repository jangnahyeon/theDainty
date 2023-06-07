package dlink_new.interceptors;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import dlink_new.admin.vo.TbMemVO;

public class FrontJoinInterceptor extends HandlerInterceptorAdapter {	
	
	@Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

		TbMemVO frontLoginVO = (TbMemVO) request.getSession().getAttribute("frontLoginVO");
		if(null != frontLoginVO) {
			response.sendRedirect("/front/main.do");
			return false;
		}
    	
        return super.preHandle(request, response, handler);
    }
    
    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception { }

}
