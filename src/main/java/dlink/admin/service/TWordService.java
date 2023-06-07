package dlink.admin.service;

import java.util.List;

import dlink.admin.vo.SearchVO;
import dlink.admin.vo.TWordVO;

/**
 * @Class Name : TWordService.java
 * @Description : TWord Business class
 * @Modification Information
 *
 * @author 이효진
 * @since 2022-03-30
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */
public interface TWordService {
	
	/**
	 * t_word을 등록한다.
	 * @param vo - 등록할 정보가 담긴 TWordVO
	 * @return 등록 결과
	 * @exception Exception
	 */
    String insertTWord(TWordVO vo) throws Exception;
    
    /**
	 * t_word을 수정한다.
	 * @param vo - 수정할 정보가 담긴 TWordVO
	 * @return void형
	 * @exception Exception
	 */
    void updateTWord(TWordVO vo) throws Exception;
    
    /**
	 * t_word을 삭제한다.
	 * @param vo - 삭제할 정보가 담긴 TWordVO
	 * @return void형 
	 * @exception Exception
	 */
    void deleteTWord(TWordVO vo) throws Exception;
    
    /**
	 * t_word을 조회한다.
	 * @param vo - 조회할 정보가 담긴 TWordVO
	 * @return 조회한 t_word
	 * @exception Exception
	 */
    TWordVO selectTWord(TWordVO vo) throws Exception;
    
    /**
	 * t_word 목록을 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return t_word 목록
	 * @exception Exception
	 */
    List selectTWordList(SearchVO searchVO) throws Exception;
    
    /**
	 * t_word 총 갯수를 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return t_word 총 갯수
	 * @exception
	 */
    int selectTWordListTotCnt(SearchVO searchVO);
    
    
    /**
     * t_word의 WORD_NO 번호 만들어줌
     * */
    int selectForInsertCd(TWordVO vo) throws Exception;

}
