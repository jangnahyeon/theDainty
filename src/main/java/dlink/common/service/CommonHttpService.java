package dlink.common.service;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;

@Component("CommonHttpService")
public class CommonHttpService {

	public void alert(HttpServletResponse response, String str) throws IOException {
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		out.println("<script language='javascript'>");
		out.println("alert('"+str+"')");
		out.println("</script>");
		
		out.flush();
		
	}
}
