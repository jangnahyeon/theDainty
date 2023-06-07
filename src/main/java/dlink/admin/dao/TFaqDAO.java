package dlink.admin.dao;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.EgovAbstractDAO;
import org.springframework.stereotype.Repository;


import dlink.admin.vo.TFaqVO;
import dlink.admin.vo.TWordVO;
import dlink.admin.vo.SearchVO;

/**
 * @Class Name : TFaqDAO.java
 * @Description : TFaq DAO Class
 * @Modification Information
 *
 * @author 이효진
 * @since 2022-03-30
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */

@Repository("TFaqDAO")
public class TFaqDAO extends EgovAbstractDAO {

	/**
	 * t_faq을 등록한다.
	 * @param vo - 등록할 정보가 담긴 TFaqVO
	 * @return 등록 결과
	 * @exception Exception
	 */
    public String insertTFaq(TFaqVO vo) throws Exception {
        return (String)insert("TFaqDAO.insertTFaq_S", vo);
    }

    /**
	 * t_faq을 수정한다.
	 * @param vo - 수정할 정보가 담긴 TFaqVO
	 * @return void형
	 * @exception Exception
	 */
    public void updateTFaq(TFaqVO vo) throws Exception {
        update("TFaqDAO.updateTFaq_S", vo);
    }

    /**
	 * t_faq을 삭제한다.
	 * @param vo - 삭제할 정보가 담긴 TFaqVO
	 * @return void형 
	 * @exception Exception
	 */
    public void deleteTFaq(TFaqVO vo) throws Exception {
        delete("TFaqDAO.deleteTFaq_S", vo);
    }

    /**
	 * t_faq을 조회한다.
	 * @param vo - 조회할 정보가 담긴 TFaqVO
	 * @return 조회한 t_faq
	 * @exception Exception
	 */
    public TFaqVO selectTFaq(TFaqVO vo) throws Exception {
        return (TFaqVO) select("TFaqDAO.selectTFaq_S", vo);
    }

    /**
	 * t_faq 목록을 조회한다.
	 * @param searchMap - 조회할 정보가 담긴 Map
	 * @return t_faq 목록
	 * @exception Exception
	 */
    public List<?> selectTFaqList(SearchVO searchVO) throws Exception {
        return list("TFaqDAO.selectTFaqList_D", searchVO);
    }

    /**
	 * t_faq 총 갯수를 조회한다.
	 * @param searchMap - 조회할 정보가 담긴 Map
	 * @return t_faq 총 갯수
	 * @exception
	 */
    public int selectTFaqListTotCnt(SearchVO searchVO) {
        return (Integer)select("TFaqDAO.selectTFaqListTotCnt_S", searchVO);
    }
    
    /**
     * WORD_NO 번호 만들어줌
     * */
    public int selectForInsertCd(TFaqVO vo) throws Exception {
		return (int) select("TFaqDAO.selectForInsertCd", vo);
	}

}
