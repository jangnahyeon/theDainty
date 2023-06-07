package dlink_new.admin.service;

import java.util.List;
// Vo 객체에 대한 import 구문
// import (vo package).TbBrdCmtDefaultVO;
// import (vo package).TbBrdCmtVO;

import dlink_new.admin.vo.TbBrdCmtDefaultVO;
import dlink_new.admin.vo.TbBrdCmtVO;

/**
 * @Class Name : TbBrdCmtService.java
 * @Description : TbBrdCmt Business class
 * @Modification Information
 *
 * @author 김현재
 * @since 2023-02-02
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */
public interface TbBrdCmtService {
	
	/**
	 * tb_brd_cmt을 등록한다.
	 * @param vo - 등록할 정보가 담긴 TbBrdCmtVO
	 * @return 등록 결과
	 * @exception Exception
	 */
    int insertTbBrdCmt(TbBrdCmtVO vo) throws Exception;
    
    /**
	 * tb_brd_cmt을 수정한다.
	 * @param vo - 수정할 정보가 담긴 TbBrdCmtVO
	 * @return void형
	 * @exception Exception
	 */
    void updateTbBrdCmt(TbBrdCmtVO vo) throws Exception;
    
    /**
	 * tb_brd_cmt을 삭제한다.
	 * @param vo - 삭제할 정보가 담긴 TbBrdCmtVO
	 * @return void형 
	 * @exception Exception
	 */
    void deleteTbBrdCmt(TbBrdCmtVO vo) throws Exception;
    
    /**
	 * tb_brd_cmt을 조회한다.
	 * @param vo - 조회할 정보가 담긴 TbBrdCmtVO
	 * @return 조회한 tb_brd_cmt
	 * @exception Exception
	 */
    TbBrdCmtVO selectTbBrdCmt(TbBrdCmtVO vo) throws Exception;
    
    /**
	 * tb_brd_cmt 목록을 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return tb_brd_cmt 목록
	 * @exception Exception
	 */
    List selectTbBrdCmtList(TbBrdCmtDefaultVO searchVO) throws Exception;
    
    /**
	 * tb_brd_cmt 총 갯수를 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return tb_brd_cmt 총 갯수
	 * @exception
	 */
    int selectTbBrdCmtListTotCnt(TbBrdCmtDefaultVO searchVO);

	void updateBrdCmt(TbBrdCmtVO tbBrdCmtVO) throws Exception;
    
}
