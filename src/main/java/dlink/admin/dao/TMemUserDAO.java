package dlink.admin.dao;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.EgovAbstractDAO;
import org.springframework.stereotype.Repository;

import dlink.admin.vo.TMemUserVO;
import dlink.admin.vo.SearchVO;
import dlink.admin.vo.TMemAccptVO;

/**
 * @Class Name : TMemUserDAO.java
 * @Description : TMemUser DAO Class
 * @Modification Information
 *
 * @author 이은지
 * @since 2022-04-06
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */

@Repository("TMemUserDAO")
public class TMemUserDAO extends EgovAbstractDAO {

	/**
	 * t_mem_user을 등록한다.
	 * @param vo - 등록할 정보가 담긴 TMemUserVO
	 * @return 등록 결과
	 * @exception Exception
	 */
    public String insertTMemUser(TMemAccptVO vo) throws Exception {
        return (String)insert("TMemUserDAO.insertTMemUser_S", vo);
    }
    public String insertMemAccpt(TMemUserVO vo) throws Exception {
        return (String)insert("TMemUserDAO.insertMemAccpt", vo);
    }
    public String insertReqMemToTMemUser(TMemUserVO vo) throws Exception {
        return (String)insert("TMemUserDAO.insertReqMemToTMemUser", vo);
    }
    /**
	 * t_mem_user을 수정한다.
	 * @param vo - 수정할 정보가 담긴 TMemUserVO
	 * @return void형
	 * @exception Exception
	 */
    public void updateTMemUser(TMemUserVO vo) throws Exception {
        update("TMemUserDAO.updateTMemUser_S", vo);
    }

    /**
	 * t_mem_user을 삭제한다.
	 * @param vo - 삭제할 정보가 담긴 TMemUserVO
	 * @return void형 
	 * @exception Exception
	 */
    public void deleteTMemUser(TMemUserVO vo) throws Exception {
        delete("TMemUserDAO.deleteTMemUser_S", vo);
    }

    /**
	 * t_mem_user을 조회한다.
	 * @param vo - 조회할 정보가 담긴 TMemUserVO
	 * @return 조회한 t_mem_user
	 * @exception Exception
	 */
    public TMemUserVO selectTMemUser(TMemUserVO vo) throws Exception {
        return (TMemUserVO) select("TMemUserDAO.selectTMemUser_S", vo);
    }
    

    /**
	 * t_mem_user 목록을 조회한다.
	 * @param searchMap - 조회할 정보가 담긴 Map
	 * @return t_mem_user 목록
	 * @exception Exception
	 */
    public List<?> selectTMemUserList(SearchVO searchVO) throws Exception {
        return list("TMemUserDAO.selectTMemUserList_D", searchVO);
    }
    

    /**
	 * t_mem_user 총 갯수를 조회한다.
	 * @param searchMap - 조회할 정보가 담긴 Map
	 * @return t_mem_user 총 갯수
	 * @exception
	 */
    public int selectTMemUserListTotCnt(SearchVO searchVO) {
        return (Integer)select("TMemUserDAO.selectTMemUserListTotCnt_S", searchVO);
    }
    
    
   
}
