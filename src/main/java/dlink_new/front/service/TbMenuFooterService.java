package dlink_new.front.service;

import java.util.List;
// Vo 객체에 대한 import 구문
// import (vo package).TbMenuFooterDefaultVO;
// import (vo package).TbMenuFooterVO;

import dlink_new.front.vo.TbMenuFooterDefaultVO;
import dlink_new.front.vo.TbMenuFooterVO;

/**
 * @Class Name : TbMenuFooterService.java
 * @Description : TbMenuFooter Business class
 * @Modification Information
 *
 * @author 김현재
 * @since 2023-01-24
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */
public interface TbMenuFooterService {
	
	/**
	 * tb_menu_footer을 등록한다.
	 * @param vo - 등록할 정보가 담긴 TbMenuFooterVO
	 * @return 등록 결과
	 * @exception Exception
	 */
    String insertTbMenuFooter(TbMenuFooterVO vo) throws Exception;
    
    /**
	 * tb_menu_footer을 수정한다.
	 * @param vo - 수정할 정보가 담긴 TbMenuFooterVO
	 * @return void형
	 * @exception Exception
	 */
    void updateTbMenuFooter(TbMenuFooterVO vo) throws Exception;
    
    /**
	 * tb_menu_footer을 삭제한다.
	 * @param vo - 삭제할 정보가 담긴 TbMenuFooterVO
	 * @return void형 
	 * @exception Exception
	 */
    void deleteTbMenuFooter(TbMenuFooterVO vo) throws Exception;
    
    /**
	 * tb_menu_footer을 조회한다.
	 * @param vo - 조회할 정보가 담긴 TbMenuFooterVO
	 * @return 조회한 tb_menu_footer
	 * @exception Exception
	 */
    TbMenuFooterVO selectTbMenuFooter(TbMenuFooterVO vo) throws Exception;
    
    /**
	 * tb_menu_footer 목록을 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return tb_menu_footer 목록
	 * @exception Exception
	 */
    List selectTbMenuFooterList(TbMenuFooterVO searchVO) throws Exception;
    
    /**
	 * tb_menu_footer 총 갯수를 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return tb_menu_footer 총 갯수
	 * @exception
	 */
    int selectTbMenuFooterListTotCnt(TbMenuFooterVO searchVO);
    
}
