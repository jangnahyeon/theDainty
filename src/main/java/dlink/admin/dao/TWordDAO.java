package dlink.admin.dao;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.EgovAbstractDAO;
import org.springframework.stereotype.Repository;

import dlink.admin.vo.TWordVO;
import dlink.admin.vo.SearchVO;

/**
 * @Class Name : TWordDAO.java
 * @Description : TWord DAO Class
 * @Modification Information
 *
 * @author 이효진
 * @since 2022-03-30
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */

@Repository("TWordDAO")
public class TWordDAO extends EgovAbstractDAO {

	/**
	 * t_word을 등록한다.
	 * @param vo - 등록할 정보가 담긴 TWordVO
	 * @return 등록 결과
	 * @exception Exception
	 */
    public String insertTWord(TWordVO vo) throws Exception {
        return (String)insert("TWordDAO.insertTWord_S", vo);
    }

    /**
	 * t_word을 수정한다.
	 * @param vo - 수정할 정보가 담긴 TWordVO
	 * @return void형
	 * @exception Exception
	 */
    public void updateTWord(TWordVO vo) throws Exception {
        update("TWordDAO.updateTWord_S", vo);
    }

    /**
	 * t_word을 삭제한다.
	 * @param vo - 삭제할 정보가 담긴 TWordVO
	 * @return void형 
	 * @exception Exception
	 */
    public void deleteTWord(TWordVO vo) throws Exception {
        delete("TWordDAO.deleteTWord_S", vo);
    }

    /**
	 * t_word을 조회한다.
	 * @param vo - 조회할 정보가 담긴 TWordVO
	 * @return 조회한 t_word
	 * @exception Exception
	 */
    public TWordVO selectTWord(TWordVO vo) throws Exception {
        return (TWordVO) select("TWordDAO.selectTWord_S", vo);
    }

    /**
	 * t_word 목록을 조회한다.
	 * @param searchMap - 조회할 정보가 담긴 Map
	 * @return t_word 목록
	 * @exception Exception
	 */
    public List<?> selectTWordList(SearchVO searchVO) throws Exception {
        return list("TWordDAO.selectTWordList_D", searchVO);
    }

    /**
	 * t_word 총 갯수를 조회한다.
	 * @param searchMap - 조회할 정보가 담긴 Map
	 * @return t_word 총 갯수
	 * @exception
	 */
    public int selectTWordListTotCnt(SearchVO searchVO) {
        return (Integer)select("TWordDAO.selectTWordListTotCnt_S", searchVO);
    }
    
    /**
     * WORD_NO 번호 만들어줌
     * */
    public int selectForInsertCd(TWordVO vo) throws Exception {
		return (int) select("TWordDAO.selectForInsertCd", vo);
	}
}
