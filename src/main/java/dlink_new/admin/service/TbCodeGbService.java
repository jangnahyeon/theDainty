package dlink_new.admin.service;

import java.util.List;
// Vo 객체에 대한 import 구문
// import (vo package).TbCodeGbDefaultVO;
// import (vo package).TbCodeGbVO;

import dlink_new.admin.vo.TbCodeGbDefaultVO;
import dlink_new.admin.vo.TbCodeGbVO;

/**
 * @Class Name : TbCodeGbService.java
 * @Description : TbCodeGb Business class
 * @Modification Information
 *
 * @author 김현재
 * @since 2023-01-17
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */
public interface TbCodeGbService {
	
	/**
	 * tb_code_gb을 등록한다.
	 * @param vo - 등록할 정보가 담긴 TbCodeGbVO
	 * @return 등록 결과
	 * @exception Exception
	 */
    String insertTbCodeGb(TbCodeGbVO vo) throws Exception;
    
    /**
	 * tb_code_gb을 수정한다.
	 * @param vo - 수정할 정보가 담긴 TbCodeGbVO
	 * @return void형
	 * @exception Exception
	 */
    void updateTbCodeGb(TbCodeGbVO vo) throws Exception;
    
    /**
	 * tb_code_gb을 삭제한다.
	 * @param vo - 삭제할 정보가 담긴 TbCodeGbVO
	 * @return void형 
	 * @exception Exception
	 */
    void deleteTbCodeGb(TbCodeGbVO vo) throws Exception;
    
    /**
	 * tb_code_gb을 조회한다.
	 * @param vo - 조회할 정보가 담긴 TbCodeGbVO
	 * @return 조회한 tb_code_gb
	 * @exception Exception
	 */
    TbCodeGbVO selectTbCodeGb(TbCodeGbVO vo) throws Exception;
    
    /**
	 * tb_code_gb 목록을 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return tb_code_gb 목록
	 * @exception Exception
	 */
    List selectTbCodeGbList(TbCodeGbDefaultVO searchVO) throws Exception;
    
    /**
	 * tb_code_gb 총 갯수를 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return tb_code_gb 총 갯수
	 * @exception
	 */
    int selectTbCodeGbListTotCnt(TbCodeGbDefaultVO searchVO);
    
}
