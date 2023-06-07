package dlink.admin.dao;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.EgovAbstractDAO;
import org.springframework.stereotype.Repository;

import dlink.admin.vo.SearchVO;
import dlink.admin.vo.TReqMakeVO;



/**
 * @Class Name : TReqMakeDAO.java
 * @Description : TReqMake DAO Class
 * @Modification Information
 *
 * @author 이효진
 * @since 2022-04-11
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */

@Repository("TReqMakeDAO")
public class TReqMakeDAO extends EgovAbstractDAO {

	/**
	 * t_req_make을 등록한다.
	 * @param vo - 등록할 정보가 담긴 TCommutyVO
	 * @return 등록 결과
	 * @exception Exception
	 */
    public String insertTReqMake(TReqMakeVO vo) throws Exception {
        return (String)insert("TReqMakeDAO.insertTReqMake_S", vo);
    }

    /**
	 * t_req_make을 수정한다.
	 * @param vo - 수정할 정보가 담긴 TCommutyVO
	 * @return void형
	 * @exception Exception
	 */
    public void updateTReqMake(TReqMakeVO vo) throws Exception {
        update("TReqMakeDAO.updateTReqMake_S", vo);
    }

    /**
	 * t_req_make을 삭제한다.
	 * @param vo - 삭제할 정보가 담긴 TCommutyVO
	 * @return void형 
	 * @exception Exception
	 */
    public void deleteTReqMake(TReqMakeVO vo) throws Exception {
        delete("TReqMakeDAO.deleteTReqMake_S", vo);
    }

    /**
	 * t_req_make을 조회한다.
	 * @param vo - 조회할 정보가 담긴 TCommutyVO
	 * @return 조회한 t_req_make
	 * @exception Exception
	 */
    public TReqMakeVO selectTReqMake(TReqMakeVO vo) throws Exception {
        return (TReqMakeVO) select("TReqMakeDAO.selectTReqMake_S", vo);
    }

    /**
	 * t_req_make 목록을 조회한다.
	 * @param searchMap - 조회할 정보가 담긴 Map
	 * @return t_req_make 목록
	 * @exception Exception
	 */
    public List<?> selectTReqMakeList(SearchVO searchVO) throws Exception {
        return list("TReqMakeDAO.selectTReqMakeList_D", searchVO);
    }

    /**
	 * t_req_make 총 갯수를 조회한다.
	 * @param searchMap - 조회할 정보가 담긴 Map
	 * @return t_req_make 총 갯수
	 * @exception
	 */
    public int selectTReqMakeListTotCnt(SearchVO searchVO) {
        return (Integer)select("TReqMakeDAO.selectTReqMakeListTotCnt_S", searchVO);
    }
    
    
    /**
     * req_no 번호 만들어줌
     * */
    public int selectForInsertReqNo(TReqMakeVO vo) throws Exception {
		return (int) select("TReqMakeDAO.selectForInsertReqNo", vo);
	}
    
    /**
    * SEQ 번호 만들어줌
    * */
   public int selectForInsertSeq(TReqMakeVO vo) throws Exception {
		return (int) select("TReqMakeDAO.selectForInsertSeq", vo);
	}
   
   
	public List<?> selectCommentsTReqMakeList(TReqMakeVO vo) throws Exception {
        return list("TReqMakeDAO.selectCommentsTReqMakeList", vo);
    }


}
