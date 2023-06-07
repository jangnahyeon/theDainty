package dlink_new.admin.service;

import java.util.List;
// Vo 객체에 대한 import 구문
// import (vo package).TbSisulHldDefaultVO;
// import (vo package).TbSisulHldVO;

import dlink_new.admin.vo.TbSisulHldDefaultVO;
import dlink_new.admin.vo.TbSisulHldVO;

/**
 * @Class Name : TbSisulHldService.java
 * @Description : TbSisulHld Business class
 * @Modification Information
 *
 * @author 이재욱
 * @since 2023-03-08
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */
public interface TbSisulHldService {
	
	/**
	 * tb_sisul_hld을 등록한다.
	 * @param vo - 등록할 정보가 담긴 TbSisulHldVO
	 * @return 등록 결과
	 * @exception Exception
	 */
    String insertTbSisulHld(TbSisulHldVO vo) throws Exception;
    
    /**
	 * tb_sisul_hld을 수정한다.
	 * @param vo - 수정할 정보가 담긴 TbSisulHldVO
	 * @return void형
	 * @exception Exception
	 */
    void updateTbSisulHld(TbSisulHldVO vo) throws Exception;
    
    /**
	 * tb_sisul_hld을 삭제한다.
	 * @param vo - 삭제할 정보가 담긴 TbSisulHldVO
	 * @return void형 
	 * @exception Exception
	 */
    void deleteTbSisulHld(TbSisulHldVO vo) throws Exception;
    
    /**
	 * tb_sisul_hld을 조회한다.
	 * @param vo - 조회할 정보가 담긴 TbSisulHldVO
	 * @return 조회한 tb_sisul_hld
	 * @exception Exception
	 */
    List selectTbSisulHld(TbSisulHldDefaultVO searchVO) throws Exception;
    
    List selectTbSisulHld_L(TbSisulHldDefaultVO searchVO) throws Exception;
    
    TbSisulHldVO selectTbSisulHldDetail(TbSisulHldVO vo) throws Exception;
    
    /**
	 * tb_sisul_hld 목록을 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return tb_sisul_hld 목록
	 * @exception Exception
	 */
    List selectTbSisulHldList(TbSisulHldDefaultVO searchVO) throws Exception;
    
    /**
	 * tb_sisul_hld 총 갯수를 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return tb_sisul_hld 총 갯수
	 * @exception
	 */
    int selectTbSisulHldListTotCnt(TbSisulHldDefaultVO searchVO);
    
}
