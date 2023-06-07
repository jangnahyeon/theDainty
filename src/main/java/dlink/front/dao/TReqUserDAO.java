package dlink.front.dao;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.EgovAbstractDAO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dlink.front.vo.TReqUserVO;
import dlink.admin.vo.SearchVO;
import dlink.front.vo.FrontSearchVO;

/**
 * @Class Name : TReqUserDAO.java
 * @Description : TReqUser DAO Class
 * @Modification Information
 *
 * @author 이은지
 * @since 2022-04-11
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */

@Repository("TReqUserDAO")
public class TReqUserDAO extends EgovAbstractDAO {
	
	
	/**
	 * t_req_user을 등록한다.
	 * @param vo - 등록할 정보가 담긴 TReqUserVO
	 * @return 등록 결과
	 * @exception Exception
	 */
    public String insertTReqUser(TReqUserVO vo) throws Exception {
        return (String)insert("TReqUserDAO.insertTReqUser_S", vo);
    }
    public String insertTMemUser(TReqUserVO vo) throws Exception {
        return (String)insert("TReqUserDAO.insertTMemUser_S", vo);
    }
    public String insertTAccptUser(TReqUserVO vo) throws Exception {
        return (String)insert("TReqUserDAO.insertTAccptUser_S", vo);
    }

    /**
	 * t_req_user을 수정한다.
	 * @param vo - 수정할 정보가 담긴 TReqUserVO
	 * @return void형
	 * @exception Exception
	 */
    public void updateTReqUser(TReqUserVO vo) throws Exception {
        update("TReqUserDAO.updateTReqUser_S", vo);
    }
    
    public void updateTReqMemAcceptYn(TReqUserVO vo) throws Exception {
        update("TReqUserDAO.updateTReqMemAcceptYn", vo);
    }

    /**
	 * t_req_user을 삭제한다.
	 * @param vo - 삭제할 정보가 담긴 TReqUserVO
	 * @return void형 
	 * @exception Exception
	 */
    public void deleteTReqUser(TReqUserVO vo) throws Exception {
        delete("TReqUserDAO.deleteTReqUser_S", vo);
    }

    /**
	 * t_req_user을 조회한다.
	 * @param vo - 조회할 정보가 담긴 TReqUserVO
	 * @return 조회한 t_req_user
	 * @exception Exception
	 */
    public TReqUserVO selectTReqUser(TReqUserVO vo) throws Exception {
        return (TReqUserVO) select("TReqUserDAO.selectTReqUser_S", vo);
    }

    /**
	 * t_req_user 목록을 조회한다.
	 * @param searchMap - 조회할 정보가 담긴 Map
	 * @return t_req_user 목록
	 * @exception Exception
	 */
    public List<?> selectTReqUserList(SearchVO searchVO) throws Exception {
        return list("TReqUserDAO.selectTReqUserList_D", searchVO);
    }

    /**
	 * t_req_user 총 갯수를 조회한다.
	 * @param searchMap - 조회할 정보가 담긴 Map
	 * @return t_req_user 총 갯수
	 * @exception
	 */
   public int selectTReqUserListTotCnt(SearchVO searchVO) {
        return (Integer)select("TReqUserDAO.selectTReqUserListTotCnt_S", searchVO);
    }
   
   /**
	 * 아이디중복체크
	 */
   public int idCheck(String loginId) {
	   return (Integer)select("TReqUserDAO.idCheck", loginId);
          }
      
}
