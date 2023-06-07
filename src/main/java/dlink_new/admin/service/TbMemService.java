package dlink_new.admin.service;

import java.util.List;
// Vo 객체에 대한 import 구문
// import (vo package).TbMemDefaultVO;
// import (vo package).TbMemVO;

import dlink_new.admin.vo.TbMemDefaultVO;
import dlink_new.admin.vo.TbMemVO;
import dlink_new.admin.vo.TbSisulRsvVO;

/**
 * @Class Name : TbMemService.java
 * @Description : TbMem Business class
 * @Modification Information
 *
 * @author 김현재
 * @since 2023-01-18
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */
public interface TbMemService {
	
	/**
	 * tb_mem을 등록한다.
	 * @param vo - 등록할 정보가 담긴 TbMemVO
	 * @return 등록 결과
	 * @exception Exception
	 */
	java.lang.Integer insertTbMem(TbMemVO vo) throws Exception;
    
    /**
	 * tb_mem을 수정한다.
	 * @param vo - 수정할 정보가 담긴 TbMemVO
	 * @return void형
	 * @exception Exception
	 */
    void updateTbMem(TbMemVO vo) throws Exception;
    
    /**
	 * tb_mem을 삭제한다.
	 * @param vo - 삭제할 정보가 담긴 TbMemVO
	 * @return void형 
	 * @exception Exception
	 */
    void deleteTbMem(TbMemVO vo) throws Exception;
    
    /**
	 * tb_mem을 조회한다.
	 * @param vo - 조회할 정보가 담긴 TbMemVO
	 * @return 조회한 tb_mem
	 * @exception Exception
	 */
    TbMemVO selectTbMem(TbMemVO vo) throws Exception;
    
    /**
	 * tb_mem 목록을 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return tb_mem 목록
	 * @exception Exception
	 */
    List selectTbMemList(TbMemDefaultVO searchVO) throws Exception;
    
    /**
	 * tb_mem 총 갯수를 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return tb_mem 총 갯수
	 * @exception
	 */
    int selectTbMemListTotCnt(TbMemDefaultVO searchVO);

	void tbMemAcceotUpdate(TbMemVO searchVO) throws Exception;
    
}
