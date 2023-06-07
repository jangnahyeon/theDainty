package dlink.admin.dao;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.EgovAbstractDAO;
import org.springframework.stereotype.Repository;


import dlink.admin.vo.TCodeVO;
import dlink.admin.vo.SearchVO;

/**
 * @Class Name : TCodeDAO.java
 * @Description : TCode DAO Class
 * @Modification Information
 *
 * @author 안성찬
 * @since 2022-03-30
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */

@Repository("TCodeDAO")
public class TCodeDAO extends EgovAbstractDAO {

	/**
	 * t_code을 등록한다.
	 * @param vo - 등록할 정보가 담긴 TCodeVO
	 * @return 등록 결과
	 * @exception Exception
	 */
    public String insertTCode(TCodeVO vo) throws Exception {
        return (String)insert("TCodeDAO.insertTCode_S", vo);
    }

    /**
	 * t_code을 수정한다.
	 * @param vo - 수정할 정보가 담긴 TCodeVO
	 * @return void형
	 * @exception Exception
	 */
    public void updateTCode(TCodeVO vo) throws Exception {
        update("TCodeDAO.updateTCode_S", vo);
    }

    /**
	 * t_code을 삭제한다.
	 * @param vo - 삭제할 정보가 담긴 TCodeVO
	 * @return void형 
	 * @exception Exception
	 */
    public void deleteTCode(TCodeVO vo) throws Exception {
        delete("TCodeDAO.deleteTCode_S", vo);
    }

    /**
	 * t_code을 조회한다.
	 * @param vo - 조회할 정보가 담긴 TCodeVO
	 * @return 조회한 t_code
	 * @exception Exception
	 */
    public TCodeVO selectTCode(TCodeVO vo) throws Exception {
        return (TCodeVO) select("TCodeDAO.selectTCode_S", vo);
    }

    /**
	 * t_code 목록을 조회한다.
	 * @param searchMap - 조회할 정보가 담긴 Map
	 * @return t_code 목록
	 * @exception Exception
	 */
    public List<TCodeVO> selectTCodeList(TCodeVO searchVO) throws Exception {
        return (List<TCodeVO>) list("TCodeDAO.selectTCodeList_D", searchVO);
    }

    /**
	 * t_code 총 갯수를 조회한다.
	 * @param searchMap - 조회할 정보가 담긴 Map
	 * @return t_code 총 갯수
	 * @exception
	 */
    public int selectTCodeListTotCnt(SearchVO searchVO) {
        return (Integer)select("TCodeDAO.selectTCodeListTotCnt_S", searchVO);
    }

}
