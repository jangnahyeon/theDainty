package dlink.common.service;

import java.util.List;

import dlink.admin.vo.SearchVO;
import dlink.admin.vo.TMemAccptVO;
import dlink.common.vo.LoginVO;

/**
 * @Class Name : TMemAccptService.java
 * @Description : TMemAccpt Business class
 * @Modification Information
 *
 * @author 안성찬
 * @since 2022-04-07
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */
public interface LoginService {
	
    /**
	 * t_mem_accpt을 조회한다.
	 * @param vo - 조회할 정보가 담긴 TMemAccptVO
	 * @return 조회한 t_mem_accpt
	 * @exception Exception
	 */
	LoginVO selectUserInfo(LoginVO vo) throws Exception;
    
	
	String SHA256Encrypt(String password) throws Exception;
    
}
