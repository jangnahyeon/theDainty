package dlink_new.admin.service;

import java.util.List;
// Vo 객체에 대한 import 구문
// import (vo package).TbBrdDefaultVO;
// import (vo package).TbBrdVO;

import dlink_new.admin.vo.TbBrdDefaultVO;
import dlink_new.admin.vo.TbBrdVO;

/**
 * @Class Name : TbBrdService.java
 * @Description : TbBrd Business class
 * @Modification Information
 *
 * @author 김현재
 * @since 2023-01-25
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */
public interface TbBrdService {
	
	/**
	 * tb_brd을 등록한다.
	 * @param vo - 등록할 정보가 담긴 TbBrdVO
	 * @return 등록 결과
	 * @exception Exception
	 */
    int insertTbBrd(TbBrdVO vo) throws Exception;
    
    /**
	 * tb_brd을 수정한다.
	 * @param vo - 수정할 정보가 담긴 TbBrdVO
	 * @return void형
	 * @exception Exception
	 */
    void updateTbBrd(TbBrdVO vo) throws Exception;
    
    /**
	 * tb_brd을 삭제한다.
	 * @param vo - 삭제할 정보가 담긴 TbBrdVO
	 * @return void형 
	 * @exception Exception
	 */
    void deleteTbBrd(TbBrdVO vo) throws Exception;
    
    /**
	 * tb_brd을 조회한다.
	 * @param vo - 조회할 정보가 담긴 TbBrdVO
	 * @return 조회한 tb_brd
	 * @exception Exception
	 */
    TbBrdVO selectTbBrd(TbBrdVO vo) throws Exception;
    
    /**
	 * tb_brd 목록을 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return tb_brd 목록
	 * @exception Exception
	 */
    List selectTbBrdList(TbBrdDefaultVO searchVO) throws Exception;
    
    /**
	 * tb_brd 총 갯수를 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return tb_brd 총 갯수
	 * @exception
	 */
    int selectTbBrdListTotCnt(TbBrdDefaultVO searchVO);
    /**
	 * tb_brd 공지사항 마지막을 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return tb_brd 목록
	 * @exception Exception
	 */
    TbBrdVO selectTbBrdLast(TbBrdVO vo) throws Exception;
}
