package dlink_new.admin.service;

import java.util.List;
// Vo 객체에 대한 import 구문
// import (vo package).TbCodeDefaultVO;
// import (vo package).TbCodeVO;

import dlink_new.admin.vo.TbCodeDefaultVO;
import dlink_new.admin.vo.TbCodeVO;

/**
 * @Class Name : TbCodeService.java
 * @Description : TbCode Business class
 * @Modification Information
 *
 * @author 김현재
 * @since 2023-01-18
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */
public interface TbCodeService {
	
	/**
	 * tb_code을 등록한다.
	 * @param vo - 등록할 정보가 담긴 TbCodeVO
	 * @return 등록 결과
	 * @exception Exception
	 */
    String insertTbCode(TbCodeVO vo) throws Exception;
    
    /**
	 * tb_code을 수정한다.
	 * @param vo - 수정할 정보가 담긴 TbCodeVO
	 * @return void형
	 * @exception Exception
	 */
    void updateTbCode(TbCodeVO vo) throws Exception;
    
    /**
	 * tb_code을 삭제한다.
	 * @param vo - 삭제할 정보가 담긴 TbCodeVO
	 * @return void형 
	 * @exception Exception
	 */
    void deleteTbCode(TbCodeVO vo) throws Exception;
    
    /**
	 * tb_code을 조회한다.
	 * @param vo - 조회할 정보가 담긴 TbCodeVO
	 * @return 조회한 tb_code
	 * @exception Exception
	 */
    TbCodeVO selectTbCode(TbCodeVO vo) throws Exception;
    
    /**
	 * tb_code 목록을 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return tb_code 목록
	 * @exception Exception
	 */
    List selectTbCodeList(TbCodeVO searchVO) throws Exception;
    
    /**
	 * tb_code 총 갯수를 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return tb_code 총 갯수
	 * @exception
	 */
    int selectTbCodeListTotCnt(TbCodeVO searchVO);

	List<?> selectTbCodeListFront(TbCodeVO vo) throws Exception;
    
}
