package dlink.admin.service;

import java.util.List;

import dlink.admin.vo.SearchVO;
import dlink.admin.vo.TMemAccptVO;

/**
 * @Class Name : TMemAccptService.java
 * @Description : TMemAccpt Business class
 * @Modification Information
 *
 * @author 이은지
 * @since 2022-03-30
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */
public interface TMemAccptService {
	
	/**
	 * t_mem_accpt을 등록한다.
	 * @param vo - 등록할 정보가 담긴 TMemAccptVO
	 * @return 등록 결과
	 * @exception Exception
	 */
    String insertTMemAccpt(TMemAccptVO vo) throws Exception;
    
    /**
	 * t_mem_accpt을 수정한다.
	 * @param vo - 수정할 정보가 담긴 TMemAccptVO
	 * @return void형
	 * @exception Exception
	 */
    void updateTMemAccpt(TMemAccptVO vo) throws Exception;
    
    /**
	 * t_mem_accpt을 삭제한다.
	 * @param vo - 삭제할 정보가 담긴 TMemAccptVO
	 * @return void형 
	 * @exception Exception
	 */
    void deleteTMemAccpt(TMemAccptVO vo) throws Exception;
    
    /**
	 * t_mem_accpt을 조회한다.
	 * @param vo - 조회할 정보가 담긴 TMemAccptVO
	 * @return 조회한 t_mem_accpt
	 * @exception Exception
	 */
    TMemAccptVO selectTMemAccpt(TMemAccptVO vo) throws Exception;
    
    /**
	 * t_mem_accpt 목록을 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return t_mem_accpt 목록
	 * @exception Exception
	 */
    List selectTMemAccptList(SearchVO searchVO) throws Exception;
    
    /**
	 * t_mem_accpt 총 갯수를 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return t_mem_accpt 총 갯수
	 * @exception
	 */
    int selectTMemAccptListTotCnt(SearchVO searchVO);
    
    //로그인
    TMemAccptVO selectLogin(TMemAccptVO vo) throws Exception;
    
    /**
	 * t_mem_accpt을 수정한다.
	 * @param vo - 수정할 정보가 담긴 LoginVO
	 * @return void형
	 * @exception Exception
	 */
    void updateUserPsw(TMemAccptVO vo) throws Exception;
    
    //비밀번호확인
    int pwCheck(TMemAccptVO vo);
}
