package dlink_new.front.service;

import java.util.List;
// Vo 객체에 대한 import 구문
// import (vo package).TbMenuDefaultVO;
// import (vo package).TbMenuVO;

import dlink_new.front.vo.TbMenuDefaultVO;
import dlink_new.front.vo.TbMenuVO;

/**
 * @Class Name : TbMenuService.java
 * @Description : TbMenu Business class
 * @Modification Information
 *
 * @author 김현재
 * @since 2023-01-19
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */
public interface TbMenuService {
	
	/**
	 * tb_menu을 등록한다.
	 * @param vo - 등록할 정보가 담긴 TbMenuVO
	 * @return 등록 결과
	 * @exception Exception
	 */
    String insertTbMenu(TbMenuVO vo) throws Exception;
    
    /**
	 * tb_menu을 수정한다.
	 * @param vo - 수정할 정보가 담긴 TbMenuVO
	 * @return void형
	 * @exception Exception
	 */
    void updateTbMenu(TbMenuVO vo) throws Exception;
    
    /**
	 * tb_menu을 삭제한다.
	 * @param vo - 삭제할 정보가 담긴 TbMenuVO
	 * @return void형 
	 * @exception Exception
	 */
    void deleteTbMenu(TbMenuVO vo) throws Exception;
    
    /**
	 * tb_menu을 조회한다.
	 * @param vo - 조회할 정보가 담긴 TbMenuVO
	 * @return 조회한 tb_menu
	 * @exception Exception
	 */
    TbMenuVO selectTbMenu(TbMenuVO vo) throws Exception;
    
    /**
	 * tb_menu 목록을 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return tb_menu 목록
	 * @exception Exception
	 */
    List selectTbMenuList(TbMenuVO searchVO) throws Exception;
    
    /**
	 * tb_menu 총 갯수를 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return tb_menu 총 갯수
	 * @exception
	 */
    int selectTbMenuListTotCnt(TbMenuVO searchVO);
    
}
