package dlink.admin.service;

import java.util.List;

import dlink.admin.vo.SearchVO;
import dlink.admin.vo.TMenuVO;

/**
 * @Class Name : TMenuService.java
 * @Description : TMenu Business class
 * @Modification Information
 *
 * @author 안성찬
 * @since 2022-03-31
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */
public interface TMenuService {
	
	/**
	 * t_menu을 등록한다.
	 * @param vo - 등록할 정보가 담긴 TMenuVO
	 * @return 등록 결과
	 * @exception Exception
	 */
    String insertTMenu(TMenuVO vo) throws Exception;
    
    /**
	 * t_menu을 수정한다.
	 * @param vo - 수정할 정보가 담긴 TMenuVO
	 * @return void형
	 * @exception Exception
	 */
    void updateTMenu(TMenuVO vo) throws Exception;
    
    /**
	 * t_menu을 삭제한다.
	 * @param vo - 삭제할 정보가 담긴 TMenuVO
	 * @return void형 
	 * @exception Exception
	 */
    void deleteTMenu(TMenuVO vo) throws Exception;
    
    /**
	 * t_menu을 조회한다.
	 * @param vo - 조회할 정보가 담긴 TMenuVO
	 * @return 조회한 t_menu
	 * @exception Exception
	 */
    TMenuVO selectTMenu(TMenuVO vo) throws Exception;
    
    /**
	 * t_menu 목록을 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return t_menu 목록
	 * @exception Exception
	 */
    List selectTMenuList(TMenuVO searchVO) throws Exception;
    
    /**
	 * t_menu 총 갯수를 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return t_menu 총 갯수
	 * @exception
	 */
    int selectTMenuListTotCnt(SearchVO searchVO);
    
    List selectTMenuTreeList(TMenuVO searchVO) throws Exception;
    
}
