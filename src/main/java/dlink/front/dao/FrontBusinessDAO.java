package dlink.front.dao;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.EgovAbstractDAO;
import org.springframework.stereotype.Repository;

import dlink.admin.vo.TCommutyVO;
import dlink.front.vo.BusinessVO;
import dlink.front.vo.FrontSearchVO;


/**
 * @Class Name : BusinessDAO.java
 * @Description : Business DAO Class
 * @Modification Information
 *
 * @author 이효진
 * @since 2022-04-06
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */

@Repository("FrontBusinessDAO")
public class FrontBusinessDAO extends EgovAbstractDAO {

	  /**
		 * t_word 목록을 조회한다.
		 * @param searchMap - 조회할 정보가 담긴 Map
		 * @return t_word 목록
		 * @exception Exception
		 */
	    public List<?> selectTWordList(FrontSearchVO searchVO) throws Exception {
	        return list("FrontBusinessDAO.selectTWordList_D", searchVO);
	    }

	    /**
		 * t_word 총 갯수를 조회한다.
		 * @param searchMap - 조회할 정보가 담긴 Map
		 * @return t_word 총 갯수
		 * @exception
		 */
	    public int selectTWordListTotCnt(FrontSearchVO searchVO) {
	        return (Integer)select("FrontBusinessDAO.selectTWordListTotCnt_S", searchVO);
	    }
	    
	    /**
		 * t_faq 목록을 조회한다.
		 * @param searchMap - 조회할 정보가 담긴 Map
		 * @return t_faq 목록
		 * @exception Exception
		 */
	    public List<?> selectTFaqList(FrontSearchVO searchVO) throws Exception {
	        return list("FrontBusinessDAO.selectTFaqList_D", searchVO);
	    }

	    /**
		 * t_faq 총 갯수를 조회한다.
		 * @param searchMap - 조회할 정보가 담긴 Map
		 * @return t_faq 총 갯수
		 * @exception
		 */
	    public int selectTFaqListTotCnt(FrontSearchVO searchVO) {
	        return (Integer)select("FrontBusinessDAO.selectTFaqListTotCnt_S", searchVO);
	    }
	    
	    /**
		 * t_commuty 목록을 조회한다.
		 * @param searchMap - 조회할 정보가 담긴 Map
		 * @return t_commuty 목록
		 * @exception Exception
		 */
	    public List<?> selectTCommutyList(FrontSearchVO searchVO) throws Exception {
	        return list("FrontBusinessDAO.selectTCommutyList_D", searchVO);
	    }

	    /**
		 * t_commuty 총 갯수를 조회한다.
		 * @param searchMap - 조회할 정보가 담긴 Map
		 * @return t_commuty 총 갯수
		 * @exception
		 */
	    public int selectTCommutyListTotCnt(FrontSearchVO searchVO) {
	        return (Integer)select("FrontBusinessDAO.selectTCommutyListTotCnt_S", searchVO);
	    }
	  
}
