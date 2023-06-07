package dlink_new.front.service;

import java.util.List;
// Vo 객체에 대한 import 구문
// import (vo package).TbSisulRsvCmtDefaultVO;
// import (vo package).TbSisulRsvCmtVO;

import dlink_new.front.vo.TbSisulRsvCmtDefaultVO;
import dlink_new.front.vo.TbSisulRsvCmtVO;

/**
 * @Class Name : TbSisulRsvCmtService.java
 * @Description : TbSisulRsvCmt Business class
 * @Modification Information
 *
 * @author 이재욱
 * @since 2023-02-07
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */
public interface TbSisulRsvCmtService {
	
	/**
	 * tb_sisul_rsv_cmt을 등록한다.
	 * @param vo - 등록할 정보가 담긴 TbSisulRsvCmtVO
	 * @return 등록 결과
	 * @exception Exception
	 */
    String insertTbSisulRsvCmt(TbSisulRsvCmtVO vo) throws Exception;
    
    /**
	 * tb_sisul_rsv_cmt을 수정한다.
	 * @param vo - 수정할 정보가 담긴 TbSisulRsvCmtVO
	 * @return void형
	 * @exception Exception
	 */
    void updateTbSisulRsvCmt(TbSisulRsvCmtVO vo) throws Exception;
    
    /**
	 * tb_sisul_rsv_cmt을 삭제한다.
	 * @param vo - 삭제할 정보가 담긴 TbSisulRsvCmtVO
	 * @return void형 
	 * @exception Exception
	 */
    void deleteTbSisulRsvCmt(TbSisulRsvCmtVO vo) throws Exception;
    
    /**
	 * tb_sisul_rsv_cmt을 조회한다.
	 * @param vo - 조회할 정보가 담긴 TbSisulRsvCmtVO
	 * @return 조회한 tb_sisul_rsv_cmt
	 * @exception Exception
	 */
    TbSisulRsvCmtVO selectTbSisulRsvCmt(TbSisulRsvCmtVO vo) throws Exception;
    
    /**
	 * tb_sisul_rsv_cmt 목록을 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return tb_sisul_rsv_cmt 목록
	 * @exception Exception
	 */
    List selectTbSisulRsvCmtList(TbSisulRsvCmtDefaultVO searchVO) throws Exception;
    
    /**
	 * tb_sisul_rsv_cmt 총 갯수를 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return tb_sisul_rsv_cmt 총 갯수
	 * @exception
	 */
    int selectTbSisulRsvCmtListTotCnt(TbSisulRsvCmtDefaultVO searchVO);
    
}
