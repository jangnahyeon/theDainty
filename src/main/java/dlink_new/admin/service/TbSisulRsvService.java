package dlink_new.admin.service;

import java.util.List;
// Vo 객체에 대한 import 구문
// import (vo package).TbSisulRsvDefaultVO;
// import (vo package).TbSisulRsvVO;

import dlink_new.admin.vo.TbSisulRsvDefaultVO;
import dlink_new.admin.vo.TbSisulRsvVO;

/**
 * @Class Name : TbSisulRsvService.java
 * @Description : TbSisulRsv Business class
 * @Modification Information
 *
 * @author 김현재
 * @since 2023-01-21
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */
public interface TbSisulRsvService {
	
	/**
	 * tb_sisul_rsv을 등록한다.
	 * @param vo - 등록할 정보가 담긴 TbSisulRsvVO
	 * @return 등록 결과
	 * @exception Exception
	 */
    String insertTbSisulRsv(TbSisulRsvVO vo) throws Exception;
    
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
    TbSisulRsvVO selectTbSisulRsv(TbSisulRsvVO vo) throws Exception;
    
    /**
	 * tb_sisul_rsv 목록을 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return tb_sisul_rsv 목록
	 * @exception Exception
	 */
    List selectTbSisulRsvList(TbSisulRsvVO searchVO) throws Exception;
    
    /**
	 * tb_sisul_rsv 총 갯수를 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return tb_sisul_rsv 총 갯수
	 * @exception
	 */
    int selectTbSisulRsvListTotCnt(TbSisulRsvVO searchVO);

    List selectTbSisulRsvReply(TbSisulRsvVO searchVO) throws Exception;

	void insertRsvReply(TbSisulRsvVO searchVO) throws Exception;

	void updateRsvReply(TbSisulRsvVO searchVO) throws Exception;

	void deleteRsvReply(TbSisulRsvVO searchVO) throws Exception;

	void updateTbSisulRsvAccept(TbSisulRsvVO searchVO) throws Exception;

	List selectTbSisulRsvFileList(TbSisulRsvVO searchVO) throws Exception;
	
	List selectSmBizFileList(TbSisulRsvVO searchVO) throws Exception;

	void updateRsvDt(TbSisulRsvVO searchVO) throws Exception;

	void updateZipFile(TbSisulRsvVO searchVO) throws Exception;

	List selectTbSisulRsvListExcel(TbSisulRsvVO searchVO) throws Exception;

}
