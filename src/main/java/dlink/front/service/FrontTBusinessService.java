package dlink.front.service;

import java.util.List;

import dlink.admin.vo.TCommutyVO;
import dlink.front.vo.BusinessVO;
import dlink.front.vo.FrontSearchVO;


/**
 * @Class Name : BusinessService.java
 * @Description : Business Business class
 * @Modification Information
 *
 * @author 이효진
 * @since 2022-04-06
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */
public interface FrontTBusinessService {
	
	  /**
		 * t_word 목록을 조회한다.
		 * @param searchVO - 조회할 정보가 담긴 VO
		 * @return t_word 목록
		 * @exception Exception
		 */
	    List selectTWordList(FrontSearchVO searchVO) throws Exception;
	    
	    /**
		 * t_word 총 갯수를 조회한다.
		 * @param searchVO - 조회할 정보가 담긴 VO
		 * @return t_word 총 갯수
		 * @exception
		 */
	    int selectTWordListTotCnt(FrontSearchVO searchVO);
	    
	    /**
		 * t_faq 목록을 조회한다.
		 * @param searchVO - 조회할 정보가 담긴 VO
		 * @return t_faq 목록
		 * @exception Exception
		 */
	    List selectTFaqList(FrontSearchVO searchVO) throws Exception;
	    
	    /**
		 * t_faq 총 갯수를 조회한다.
		 * @param searchVO - 조회할 정보가 담긴 VO
		 * @return t_faq 총 갯수
		 * @exception
		 */
	    int selectTFaqListTotCnt(FrontSearchVO searchVO);
	    
	    /**
		 * t_commuty 목록을 조회한다.
		 * @param searchVO - 조회할 정보가 담긴 VO
		 * @return t_commuty 목록
		 * @exception Exception
		 */
	    List selectTCommutyList(FrontSearchVO searchVO) throws Exception;
	    
	   
	    
	    /**
		 * t_commuty 총 갯수를 조회한다.
		 * @param searchVO - 조회할 정보가 담긴 VO
		 * @return t_commuty 총 갯수
		 * @exception
		 */
	    int selectTCommutyListTotCnt(FrontSearchVO searchVO);
	    
	    
	  
	   
}
