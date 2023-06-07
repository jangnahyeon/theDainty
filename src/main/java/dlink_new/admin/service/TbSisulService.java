package dlink_new.admin.service;

import java.util.List;
// Vo 객체에 대한 import 구문
// import (vo package).TbSisulDefaultVO;
// import (vo package).TbSisulVO;

import dlink_new.admin.vo.TbSisulDefaultVO;
import dlink_new.admin.vo.TbSisulVO;

/**
 * @Class Name : TbSisulService.java
 * @Description : TbSisul Business class
 * @Modification Information
 *
 * @author 김현재
 * @since 2023-01-21
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */
public interface TbSisulService {
	
	/**
	 * tb_sisul을 등록한다.
	 * @param vo - 등록할 정보가 담긴 TbSisulVO
	 * @return 등록 결과
	 * @exception Exception
	 */
    String insertTbSisul(TbSisulVO vo) throws Exception;
    
    /**
	 * tb_sisul을 수정한다.
	 * @param vo - 수정할 정보가 담긴 TbSisulVO
	 * @return void형
	 * @exception Exception
	 */
    void updateTbSisul(TbSisulVO vo) throws Exception;
    
    /**
	 * tb_sisul을 삭제한다.
	 * @param vo - 삭제할 정보가 담긴 TbSisulVO
	 * @return void형 
	 * @exception Exception
	 */
    void deleteTbSisul(TbSisulVO vo) throws Exception;
    
    /**
	 * tb_sisul을 조회한다.
	 * @param vo - 조회할 정보가 담긴 TbSisulVO
	 * @return 조회한 tb_sisul
	 * @exception Exception
	 */
    TbSisulVO selectTbSisul(TbSisulVO vo) throws Exception;
    
    /**
	 * tb_sisul 목록을 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return tb_sisul 목록
	 * @exception Exception
	 */
    List selectTbSisulList(TbSisulDefaultVO searchVO) throws Exception;
    
    /**
	 * tb_sisul 총 갯수를 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return tb_sisul 총 갯수
	 * @exception
	 */
    int selectTbSisulListTotCnt(TbSisulDefaultVO searchVO);
    
}
