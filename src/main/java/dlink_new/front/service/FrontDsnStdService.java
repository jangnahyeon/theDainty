package dlink_new.front.service;

import java.util.List;
// Vo 객체에 대한 import 구문
// import (vo package).TbSisulRsvDefaultVO;
// import (vo package).TbSisulRsvVO;

import dlink_new.front.vo.TbSisulRsvDefaultVO;
import dlink_new.front.vo.TbSisulRsvFileVO;
import dlink_new.front.vo.TbSisulRsvVO;

/**
 * @Class Name : FrontDsnStdService.java
 * @Description : FrontDsnStdService Business class
 * @Modification Information
 *
 * @author 이재욱
 * @since 2023-01-16
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */
public interface FrontDsnStdService {
	
	/**
	 * tb_sisul_rsv을 등록한다.
	 * @param vo - 등록할 정보가 담긴 TbSisulRsvVO
	 * @return 등록 결과
	 * @exception Exception
	 */
    int insertTbSisulRsvForm(TbSisulRsvVO vo) throws Exception;
    
    void insertTbSisulRsvImgInfo(TbSisulRsvVO vo) throws Exception;
    
    void insertTbSisulRsvMultiImg(TbSisulRsvVO vo) throws Exception;
    
    /**
	 * tb_sisul_rsv을 수정한다.
	 * @param vo - 수정할 정보가 담긴 TbSisulRsvVO
	 * @return void형
	 * @exception Exception
	 */
    void updateTbSisulRsv(TbSisulRsvVO vo) throws Exception;
    
    /**
	 * tb_sisul_rsv을 삭제한다.
	 * @param vo - 삭제할 정보가 담긴 TbSisulRsvVO
	 * @return void형 
	 * @exception Exception
	 */
    void deleteTbSisulRsv(TbSisulRsvVO vo) throws Exception;
    
    /**
	 * tb_sisul_rsv을 조회한다.
	 * @param vo - 조회할 정보가 담긴 TbSisulRsvVO
	 * @return 조회한 tb_sisul_rsv
	 * @exception Exception
	 */
    List<?> selectTbSisulRsv(TbSisulRsvVO vo) throws Exception;
    
    List<?> selectTbSisulRsv_L(TbSisulRsvVO vo) throws Exception;
    
    /**
	 * tb_sisul_rsv 목록을 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return tb_sisul_rsv 목록
	 * @exception Exception
	 */
    List selectTbSisulRsvList(TbSisulRsvVO searchVO) throws Exception;
    
    List selectTbSisulRsvList_M(TbSisulRsvVO searchVO) throws Exception;
    /**
	 * tb_sisul_rsv 총 갯수를 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return tb_sisul_rsv 총 갯수
	 * @exception
	 */
    int selectTbSisulRsvListTotCnt(TbSisulRsvVO searchVO);
    
    int selectTbSisulRsvListTotCnt_M(TbSisulRsvVO searchVO);
    /**
	 * tb_sisul_rsv 예약번호를 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return tb_sisul_rsv 예약번호와 같은 정보
	 * @exception
	 */
    TbSisulRsvVO selectTbSisulRsvSeq(TbSisulRsvVO vo) throws Exception;
    /**
	 * tb_sisul_rsv_file 예약번호를 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return tb_sisul_rsv_file 예약번호와 같은 정보
	 * @exception
	 */
    List selectTbSisulRsvSeqList(TbSisulRsvFileVO vo) throws Exception;

    /**
	 * tb_sisul_rsv 수정한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return tb_sisul_rsv 수정
	 * @exception
	 */
    void updateSisulRsvReadCnt(TbSisulRsvVO vo) throws Exception;

	List selectTbSisulRsvReply(TbSisulRsvVO searchVO)  throws Exception;

	void sisulRsvCancle(TbSisulRsvVO tbSisulRsvVO) throws Exception;
	
}
