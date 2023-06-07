package dlink_new.common.service;

import java.util.List;
// Vo 객체에 대한 import 구문
// import (vo package).TbAtalkTmplDefaultVO;
// import (vo package).TbAtalkTmplVO;

import dlink_new.common.vo.TbAtalkTmplDefaultVO;
import dlink_new.common.vo.TbAtalkTmplVO;

/**
 * @Class Name : TbAtalkTmplService.java
 * @Description : TbAtalkTmpl Business class
 * @Modification Information
 *
 * @author 김현재
 * @since 2023-02-07
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */
public interface TbAtalkTmplService {
	
	/**
	 * tb_atalk_tmpl을 등록한다.
	 * @param vo - 등록할 정보가 담긴 TbAtalkTmplVO
	 * @return 등록 결과
	 * @exception Exception
	 */
    String insertTbAtalkTmpl(TbAtalkTmplVO vo) throws Exception;
    
    /**
	 * tb_atalk_tmpl을 수정한다.
	 * @param vo - 수정할 정보가 담긴 TbAtalkTmplVO
	 * @return void형
	 * @exception Exception
	 */
    void updateTbAtalkTmpl(TbAtalkTmplVO vo) throws Exception;
    
    /**
	 * tb_atalk_tmpl을 삭제한다.
	 * @param vo - 삭제할 정보가 담긴 TbAtalkTmplVO
	 * @return void형 
	 * @exception Exception
	 */
    void deleteTbAtalkTmpl(TbAtalkTmplVO vo) throws Exception;
    
    /**
	 * tb_atalk_tmpl을 조회한다.
	 * @param vo - 조회할 정보가 담긴 TbAtalkTmplVO
	 * @return 조회한 tb_atalk_tmpl
	 * @exception Exception
	 */
    TbAtalkTmplVO selectTbAtalkTmpl(TbAtalkTmplVO vo) throws Exception;
    
    /**
	 * tb_atalk_tmpl 목록을 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return tb_atalk_tmpl 목록
	 * @exception Exception
	 */
    List selectTbAtalkTmplList(TbAtalkTmplDefaultVO searchVO) throws Exception;
    
    /**
	 * tb_atalk_tmpl 총 갯수를 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return tb_atalk_tmpl 총 갯수
	 * @exception
	 */
    int selectTbAtalkTmplListTotCnt(TbAtalkTmplDefaultVO searchVO);
    
    /**
	 * mts_atalk_msg을 등록한다.
	 * @param vo - 등록할 정보가 담긴 MtsAtalkMsgVO
	 * @return 등록 결과
	 * @exception Exception
	 */
    java.lang.Integer insertMtsAtalkMsg(TbAtalkTmplVO vo) throws Exception;
    
}
