package dlink_new.util;

import org.apache.commons.lang.StringUtils;
import org.springframework.security.crypto.password.StandardPasswordEncoder;


public class PasswordUtils {

	public static boolean isValid(String plnTxt, String encTxt){
		
		StandardPasswordEncoder passwordEncoder = new StandardPasswordEncoder("secret");
		return !StringUtils.isEmpty(plnTxt) && !StringUtils.isEmpty(encTxt) && passwordEncoder.matches(plnTxt, encTxt);
	}
	
	public static String encript(String plnTxt) {
		StandardPasswordEncoder passwordEncoder = new StandardPasswordEncoder("secret");
		return passwordEncoder.encode(plnTxt);
	}	
	
}
