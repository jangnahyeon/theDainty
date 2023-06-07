package dlink.admin.dao;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.EgovAbstractDAO;
import org.springframework.stereotype.Repository;


import dlink.admin.vo.TMemAccptVO;
import dlink.common.vo.LoginVO;
import dlink.admin.vo.SearchVO;

/**
 * @Class Name : TMemAccptDAO.java
 * @Description : TMemAccpt DAO Class
 * @Modification Information
 *
 * @author 이은지
 * @since 2022-03-30
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */

@Repository("TMemAccptDAO")
public class TMemAccptDAO extends EgovAbstractDAO {

	/**
	 * t_mem_accpt을 등록한다.
	 * @param vo - 등록할 정보가 담긴 TMemAccptVO
	 * @return 등록 결과
	 * @exception Exception
	 */
    public String insertTMemAccpt(TMemAccptVO vo) throws Exception {
        return (String)insert("TMemAccptDAO.insertTMemAccpt_S", vo);
    }
    

    /**
	 * t_mem_accpt을 수정한다.
	 * @param vo - 수정할 정보가 담긴 TMemAccptVO
	 * @return void형
	 * @exception Exception
	 */
    public void updateTMemAccpt(TMemAccptVO vo) throws Exception {
        update("TMemAccptDAO.updateTMemAccpt_S", vo);
    }
    
    
    /**
	 * t_mem_accpt을 삭제한다.
	 * @param vo - 삭제할 정보가 담긴 TMemAccptVO
	 * @return void형 
	 * @exception Exception
	 */
    public void deleteTMemAccpt(TMemAccptVO vo) throws Exception {
        delete("TMemAccptDAO.deleteTMemAccpt_S", vo);
    }

    /**
	 * t_mem_accpt을 조회한다.
	 * @param vo - 조회할 정보가 담긴 TMemAccptVO
	 * @return 조회한 t_mem_accpt
	 * @exception Exception
	 */
    public TMemAccptVO selectTMemAccpt(TMemAccptVO vo) throws Exception {
        return (TMemAccptVO) select("TMemAccptDAO.selectTMemAccpt_S", vo);
    }

    /**
	 * t_mem_accpt 목록을 조회한다.
	 * @param searchMap - 조회할 정보가 담긴 Map
	 * @return t_mem_accpt 목록
	 * @exception Exception
	 */
    public List<?> selectTMemAccptList(SearchVO searchVO) throws Exception {
        return list("TMemAccptDAO.selectTMemAccptList_D", searchVO);
    }

    /**
	 * t_mem_accpt 총 갯수를 조회한다.
	 * @param searchMap - 조회할 정보가 담긴 Map
	 * @return t_mem_accpt 총 갯수
	 * @exception
	 */
    public int selectTMemAccptListTotCnt(SearchVO searchVO) {
        return (Integer)select("TMemAccptDAO.selectTMemAccptListTotCnt_S", searchVO);
    }
    
    //로그인
    public TMemAccptVO selectLogin(TMemAccptVO vo) throws Exception {
        return (TMemAccptVO) select("TMemAccptDAO.selectLogin", vo);
    }
    
    /**
	 * t_mem_accpt을 수정한다.
	 * @param vo - 수정할 정보가 담긴 LoginVO
	 * @return void형
	 * @exception Exception
	 */
    public void updateUserPsw(TMemAccptVO vo) throws Exception {
        update("TMemAccptDAO.updateUserPsw", vo);
    }
    
    
    /**
	 * 현재비밀번호확인 체크
	 */
   public int pwCheck(TMemAccptVO vo) {
	   return (Integer)select("TMemAccptDAO.pwCheck", vo);
          }
}
