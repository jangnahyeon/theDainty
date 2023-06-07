package dlink.admin.service;

import java.util.ArrayList;
import java.util.List;

import dlink.admin.vo.SearchVO;
import dlink.admin.vo.TCommutyVO;
import dlink.admin.vo.TFaqVO;

/**
 * @Class Name : TCommutyService.java
 * @Description : TCommuty Business class
 * @Modification Information
 *
 * @author 이효진
 * @since 2022-03-30
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */
public interface TCommutyService {
	
	/**
	 * t_commuty을 등록한다.
	 * @param vo - 등록할 정보가 담긴 TCommutyVO
	 * @return 등록 결과
	 * @exception Exception
	 */
    String insertTCommuty(TCommutyVO vo) throws Exception;
    
    /**
	 * t_commuty을 수정한다.
	 * @param vo - 수정할 정보가 담긴 TCommutyVO
	 * @return void형
	 * @exception Exception
	 */
    void updateTCommuty(TCommutyVO vo) throws Exception;
    
    /**
	 * t_commuty을 삭제한다.
	 * @param vo - 삭제할 정보가 담긴 TCommutyVO
	 * @return void형 
	 * @exception Exception
	 */
    void deleteTCommuty(TCommutyVO vo) throws Exception;
    
    /**
	 * t_commuty을 조회한다.
	 * @param vo - 조회할 정보가 담긴 TCommutyVO
	 * @return 조회한 t_commuty
	 * @exception Exception
	 */
    TCommutyVO selectTCommuty(TCommutyVO vo) throws Exception;
    
    /**
	 * t_commuty 목록을 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return t_commuty 목록
	 * @exception Exception
	 */
    List selectTCommutyList(SearchVO searchVO) throws Exception;
    
    /**
	 * t_commuty 총 갯수를 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return t_commuty 총 갯수
	 * @exception
	 */
    int selectTCommutyListTotCnt(SearchVO searchVO);
    
    
    /**
     * t_commuty의 POST_NO 번호 만들어줌
     * */
    int selectForInsertPostNo(TCommutyVO vo) throws Exception;
    
    /**
     * t_commuty의 SEQ 번호 만들어줌
     * */
    int selectForInsertSeq(TCommutyVO vo) throws Exception;
    
    /**
     * 답변 등록
     * */
    String insertCommentsTCommuty(TCommutyVO vo) throws Exception;
    
    
    /**
     * 답변 수정
     * */
    void updateCommentsTCommuty(TCommutyVO vo) throws Exception;
    
   
    /**
     * 답변 조회
     * */
    List selectCommentsTCommutyList(TCommutyVO vo) throws Exception;
    
    /**
     * 메인 공지사항
     * */
    List selectMainTCommutyList(TCommutyVO TCommutyVO) throws Exception;
    
    /**
	 * t_commuty_file을 등록한다.
	 * @param vo - 등록할 정보가 담긴 TCommutyVO
	 * @return 등록 결과
	 * @exception Exception
	 */
    String insertTCommutyFileS(TCommutyVO vo) throws Exception;
    
    /**
	 * t_commuty_file을 수정한다.
	 * @param vo - 수정할 정보가 담긴 TCommutyVO
	 * @return void형
	 * @exception Exception
	 */
    void updateTCommutyFile(TCommutyVO vo) throws Exception;
    
    /**
	 * t_commuty_file을 삭제한다.
	 * @param vo - 삭제할 정보가 담긴 TCommutyVO
	 * @return void형 
	 * @exception Exception
	 */
    void deleteTCommutyFile(TCommutyVO vo) throws Exception;
    
    /**
     * 게시물 첨부파일 조회
     * */
    List selectTCommutyFileList(TCommutyVO vo) throws Exception;
    
}
