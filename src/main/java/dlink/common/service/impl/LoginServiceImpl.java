package dlink.common.service.impl;


import java.security.MessageDigest;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;

import dlink.common.service.LoginService;
import dlink.common.vo.LoginVO;

import dlink.common.dao.LoginDAO;
/**
 * @Class Name : LoginServiceImpl.java
 * @Description : LoginServiceImpl class
 * @Modification Information
 *
 * @author 안성찬
 * @since 2022-04-07
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */

@Service("LoginService")
public class LoginServiceImpl extends EgovAbstractServiceImpl implements
        LoginService {
        
    @Resource(name="LoginDAO")
    private LoginDAO LoginDAO;
    


    /**
	 * t_mem_accpt을 조회한다.
	 * @param vo - 조회할 정보가 담긴 TMemAccptVO
	 * @return 조회한 t_mem_accpt
	 * @exception Exception
	 */
    public LoginVO selectUserInfo(LoginVO vo) throws Exception {
    	LoginVO resultVO = LoginDAO.selectUserInfo(vo);
        return resultVO;
    }
    
 // 암호화 함수
 	public String SHA256Encrypt(String password){
 		StringBuffer hexString = new StringBuffer();
 		
 		try {
 			MessageDigest digest = MessageDigest.getInstance("SHA-256");
 	    	byte[] hash = digest.digest(password.getBytes("UTF-8"));
 	    	
 	    	
 	    	for(int i=0; i < hash.length; i++){
 	    		String hex = Integer.toHexString(0xff & hash[i]);
 	    		if(hex.length() == 1) hexString.append('0');
 	    		
 	    		hexString.append(hex);
 	    	}
 			
 		}catch(Exception e){
 			e.printStackTrace();
 		}
 		return hexString.toString().toUpperCase();
 	}


    
}
