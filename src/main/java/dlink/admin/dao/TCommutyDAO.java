package dlink.admin.dao;

import java.util.ArrayList;
import java.util.List;

import org.egovframe.rte.psl.dataaccess.EgovAbstractDAO;
import org.springframework.stereotype.Repository;


import dlink.admin.vo.TCommutyVO;
import dlink.admin.vo.TFaqVO;
import dlink.admin.vo.SearchVO;

/**
 * @Class Name : TCommutyDAO.java
 * @Description : TCommuty DAO Class
 * @Modification Information
 *
 * @author 이효진
 * @since 2022-03-30
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */

@Repository("TCommutyDAO")
public class TCommutyDAO extends EgovAbstractDAO {

	/**
	 * t_commuty을 등록한다.
	 * @param vo - 등록할 정보가 담긴 TCommutyVO
	 * @return 등록 결과
	 * @exception Exception
	 */
    public String insertTCommuty(TCommutyVO vo) throws Exception {
        return (String)insert("TCommutyDAO.insertTCommuty_S", vo);
    }

    /**
	 * t_commuty을 수정한다.
	 * @param vo - 수정할 정보가 담긴 TCommutyVO
	 * @return void형
	 * @exception Exception
	 */
    public void updateTCommuty(TCommutyVO vo) throws Exception {
        update("TCommutyDAO.updateTCommuty_S", vo);
    }

    /**
	 * t_commuty을 삭제한다.
	 * @param vo - 삭제할 정보가 담긴 TCommutyVO
	 * @return void형 
	 * @exception Exception
	 */
    public void deleteTCommuty(TCommutyVO vo) throws Exception {
        delete("TCommutyDAO.deleteTCommuty_S", vo);
    }

    /**
	 * t_commuty을 조회한다.
	 * @param vo - 조회할 정보가 담긴 TCommutyVO
	 * @return 조회한 t_commuty
	 * @exception Exception
	 */
    public TCommutyVO selectTCommuty(TCommutyVO vo) throws Exception {
        return (TCommutyVO) select("TCommutyDAO.selectTCommuty_S", vo);
    }

    /**
	 * t_commuty 목록을 조회한다.
	 * @param searchMap - 조회할 정보가 담긴 Map
	 * @return t_commuty 목록
	 * @exception Exception
	 */
    public List<?> selectTCommutyList(SearchVO searchVO) throws Exception {
        return list("TCommutyDAO.selectTCommutyList_D", searchVO);
    }

    /**
	 * t_commuty 총 갯수를 조회한다.
	 * @param searchMap - 조회할 정보가 담긴 Map
	 * @return t_commuty 총 갯수
	 * @exception
	 */
    public int selectTCommutyListTotCnt(SearchVO searchVO) {
        return (Integer)select("TCommutyDAO.selectTCommutyListTotCnt_S", searchVO);
    }
    
    
    /**
     * POST_NO 번호 만들어줌
     * */
    public int selectForInsertPostNo(TCommutyVO vo) throws Exception {
		return (int) select("TCommutyDAO.selectForInsertPostNo", vo);
	}
    
    /**
     * SEQ 번호 만들어줌
     * */
    public int selectForInsertSeq(TCommutyVO vo) throws Exception {
		return (int) select("TCommutyDAO.selectForInsertSeq", vo);
	}
   
    /**
     * 답변 등록
     * */
    public String insertCommentsTCommuty(TCommutyVO vo) throws Exception {
        return (String)insert("TCommutyDAO.insertCommentsTCommuty", vo);
    }
    /**
     * 답변 수정
     * */
    public void updateCommentsTCommuty(TCommutyVO vo) throws Exception {
        update("TCommutyDAO.updateCommentsTCommuty", vo);
    }
  
    
	public List<?> selectCommentsTCommutyList(TCommutyVO vo) throws Exception {
        return list("TCommutyDAO.selectCommentsTCommutyList", vo);
    }

    
    public List<?> selectMainTCommutyList(TCommutyVO TCommutyVO) throws Exception {
        return list("TCommutyDAO.selectMainTCommutyList", TCommutyVO);
    }
    
	/**
	 * t_commuty_file을 등록한다.
	 * @param vo - 등록할 정보가 담긴 TCommutyVO
	 * @return 등록 결과
	 * @exception Exception
	 */
    public String insertTCommutyFileS(TCommutyVO vo) throws Exception {
        return (String)insert("TCommutyDAO.insertTCommutyFile_S", vo);
    }

    /**
	 * t_commuty_file을 수정한다.
	 * @param vo - 수정할 정보가 담긴 TCommutyVO
	 * @return void형
	 * @exception Exception
	 */
    public void updateTCommutyFile(TCommutyVO vo) throws Exception {
        update("TCommutyDAO.updateTCommutyFile_S", vo);
    }

    /**
	 * t_commuty_file을 삭제한다.
	 * @param vo - 삭제할 정보가 담긴 TCommutyVO
	 * @return void형 
	 * @exception Exception
	 */
    public void deleteTCommutyFile(TCommutyVO vo) throws Exception {
        delete("TCommutyDAO.deleteTCommutyFile_S", vo);
    }
    
    /**
   	 * t_commuty_file을 조회한다.
   	 * @param vo - 삭제할 정보가 담긴 TCommutyVO
   	 * @return void형 
   	 * @exception Exception
   	 */
    public List<?> selectTCommutyFileList(TCommutyVO vo) throws Exception {
        return list("TCommutyDAO.selectTCommutyFileList", vo);
    }

}
