package dlink.common.dao;

import org.egovframe.rte.psl.dataaccess.EgovAbstractDAO;
import org.springframework.stereotype.Repository;

import dlink.common.vo.TAttfileVO;
import dlink.common.vo.LoginVO;

/**
 * @Class Name : TAttfileDAO.java
 * @Description : TAttfile DAO Class
 * @Modification Information
 *
 * @author 안성찬
 * @since 2022-04-08
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */

@Repository("LoginDAO")
public class LoginDAO extends EgovAbstractDAO {

    public LoginVO selectUserInfo(LoginVO vo) throws Exception {
        return (LoginVO) select("LoginDAO.selectUserInfo", vo);
    }


}
