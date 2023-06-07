package dlink.admin.service;

import java.util.List;

import dlink.admin.vo.SearchVO;
import dlink.admin.vo.TFaqVO;
import dlink.admin.vo.TWordVO;

/**
 * @Class Name : TFaqService.java
 * @Description : TFaq Business class
 * @Modification Information
 *
 * @author 이효진
 * @since 2022-03-30
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */
public interface TFaqService {
	
	/**
	 * t_faq을 등록한다.
	 * @param vo - 등록할 정보가 담긴 TFaqVO
	 * @return 등록 결과
	 * @exception Exception
	 */
    String insertTFaq(TFaqVO vo) throws Exception;
    
    /**
	 * t_faq을 수정한다.
	 * @param vo - 수정할 정보가 담긴 TFaqVO
	 * @return void형
	 * @exception Exception
	 */
    void updateTFaq(TFaqVO vo) throws Exception;
    
    /**
	 * t_faq을 삭제한다.
	 * @param vo - 삭제할 정보가 담긴 TFaqVO
	 * @return void형 
	 * @exception Exception
	 */
    void deleteTFaq(TFaqVO vo) throws Exception;
    
    /**
	 * t_faq을 조회한다.
	 * @param vo - 조회할 정보가 담긴 TFaqVO
	 * @return 조회한 t_faq
	 * @exception Exception
	 */
    TFaqVO selectTFaq(TFaqVO vo) throws Exception;
    
    /**
	 * t_faq 목록을 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return t_faq 목록
	 * @exception Exception
	 */
    List selectTFaqList(SearchVO searchVO) throws Exception;
    
    /**
	 * t_faq 총 갯수를 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return t_faq 총 갯수
	 * @exception
	 */
    int selectTFaqListTotCnt(SearchVO searchVO);
    
    /**
     * t_faq의 FAQ_NO 번호 만들어줌
     * */
    int selectForInsertCd(TFaqVO vo) throws Exception;

    
}
