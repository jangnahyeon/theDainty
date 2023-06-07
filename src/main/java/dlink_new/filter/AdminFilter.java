package dlink_new.filter;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

import dlink_new.admin.vo.TbMemVO;
import dlink_new.wrapper.EditableHttpServletRequest;

public class AdminFilter implements Filter {

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		// TODO Auto-generated method stub
		
		HttpServletRequest httpRequest = (HttpServletRequest) request;
		
		TbMemVO adminLoginVO = (TbMemVO) httpRequest.getSession().getAttribute("adminLoginVO");
		if(null != adminLoginVO) {		
			EditableHttpServletRequest m = new EditableHttpServletRequest(httpRequest);
			m.setParameter( "regId", adminLoginVO.getMemId() );
			m.setParameter( "updId", adminLoginVO.getMemId() );
			
			//m.setParameter( "memSeq", String.valueOf( adminLoginVO.getMemSeq() ) );
			//m.setParameter( "memId", adminLoginVO.getMemId() );
			
			chain.doFilter(m, response);
		} else {
			chain.doFilter(httpRequest, response);
		}
		
	}

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

}
