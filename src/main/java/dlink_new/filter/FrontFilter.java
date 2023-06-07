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

public class FrontFilter implements Filter {

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		// TODO Auto-generated method stub
		
		HttpServletRequest httpRequest = (HttpServletRequest) request;
		
		TbMemVO frontLoginVO = (TbMemVO) httpRequest.getSession().getAttribute("frontLoginVO");
		if(null != frontLoginVO) {		
			EditableHttpServletRequest m = new EditableHttpServletRequest(httpRequest);
			m.setParameter( "regId", frontLoginVO.getMemId() );
			m.setParameter( "updId", frontLoginVO.getMemId() );
			
			m.setParameter( "memSeq", String.valueOf( frontLoginVO.getMemSeq() ) );
			m.setParameter( "memId", frontLoginVO.getMemId() );
			
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
