package dlink_new.admin.service;

import java.util.List;
// Vo 객체에 대한 import 구문
// import (vo package).TbPortfDefaultVO;
// import (vo package).TbPortfVO;

import dlink_new.admin.vo.TbPortfDefaultVO;
import dlink_new.admin.vo.TbPortfVO;

/**
 * @Class Name : TbPortfService.java
 * @Description : TbPortf Business class
 * @Modification Information
 *
 * @author 김현재
 * @since 2023-01-21
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */
public interface TbPortfService {
	
	/**
	 * tb_portf을 등록한다.
	 * @param vo - 등록할 정보가 담긴 TbPortfVO
	 * @return 등록 결과
	 * @exception Exception
	 */
    String insertTbPortf(TbPortfVO vo) throws Exception;
    
    /**
	 * tb_portf을 수정한다.
	 * @param vo - 수정할 정보가 담긴 TbPortfVO
	 * @return void형
	 * @exception Exception
	 */
    void updateTbPortf(TbPortfVO vo) throws Exception;
    
    /**
	 * tb_portf을 삭제한다.
	 * @param vo - 삭제할 정보가 담긴 TbPortfVO
	 * @return void형 
	 * @exception Exception
	 */
    void deleteTbPortf(TbPortfVO vo) throws Exception;
    
    /**
	 * tb_portf을 조회한다.
	 * @param vo - 조회할 정보가 담긴 TbPortfVO
	 * @return 조회한 tb_portf
	 * @exception Exception
	 */
    TbPortfVO selectTbPortf(TbPortfVO vo) throws Exception;
    
    /**
	 * tb_portf 목록을 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return tb_portf 목록
	 * @exception Exception
	 */
    List selectTbPortfList(TbPortfVO searchVO) throws Exception;
    
    List selectOrderNoList(TbPortfVO searchVO) throws Exception;
    
    /**
	 * tb_portf 총 갯수를 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return tb_portf 총 갯수
	 * @exception
	 */
    int selectTbPortfListTotCnt(TbPortfVO searchVO);
    
}