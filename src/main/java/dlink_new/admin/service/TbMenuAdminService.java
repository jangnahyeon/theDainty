package dlink_new.admin.service;

import java.util.List;
// Vo 객체에 대한 import 구문
// import (vo package).TbMenuAdminDefaultVO;
// import (vo package).TbMenuAdminVO;

import dlink_new.admin.vo.TbMenuAdminDefaultVO;
import dlink_new.admin.vo.TbMenuAdminVO;

/**
 * @Class Name : TbMenuAdminService.java
 * @Description : TbMenuAdmin Business class
 * @Modification Information
 *
 * @author 김현재
 * @since 2023.01.16
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */
public interface TbMenuAdminService {
	
	/**
	 * t_menu_admin을 등록한다.
	 * @param vo - 등록할 정보가 담긴 TbMenuAdminVO
	 * @return 등록 결과
	 * @exception Exception
	 */
    String insertTbMenuAdmin(TbMenuAdminVO vo) throws Exception;
    
    /**
	 * t_menu_admin을 수정한다.
	 * @param vo - 수정할 정보가 담긴 TbMenuAdminVO
	 * @return void형
	 * @exception Exception
	 */
    void updateTbMenuAdmin(TbMenuAdminVO vo) throws Exception;
    
    /**
	 * t_menu_admin을 삭제한다.
	 * @param vo - 삭제할 정보가 담긴 TbMenuAdminVO
	 * @return void형 
	 * @exception Exception
	 */
    void deleteTbMenuAdmin(TbMenuAdminVO vo) throws Exception;
    
    /**
	 * t_menu_admin을 조회한다.
	 * @param vo - 조회할 정보가 담긴 TbMenuAdminVO
	 * @return 조회한 t_menu_admin
	 * @exception Exception
	 */
    TbMenuAdminVO selectTbMenuAdmin(TbMenuAdminVO vo) throws Exception;
    
    /**
	 * t_menu_admin 목록을 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return t_menu_admin 목록
	 * @exception Exception
	 */
    List selectTbMenuAdminList(TbMenuAdminDefaultVO searchVO) throws Exception;
    
    /**
	 * t_menu_admin 총 갯수를 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return t_menu_admin 총 갯수
	 * @exception
	 */
    int selectTbMenuAdminListTotCnt(TbMenuAdminDefaultVO searchVO);
    
}
