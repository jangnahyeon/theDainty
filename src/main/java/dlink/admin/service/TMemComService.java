package dlink.admin.service;

import java.math.BigDecimal;
import java.util.List;

import dlink.admin.vo.SearchVO;
import dlink.admin.vo.TMemComFileVO;
import dlink.admin.vo.TMemComVO;

/**
 * @Class Name : TMemComService.java
 * @Description : TMemCom Business class
 * @Modification Information
 *
 * @author 이은지
 * @since 2022-03-30
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */
public interface TMemComService {
	
	/**
	 * t_mem_com을 등록한다.
	 * @param vo - 등록할 정보가 담긴 TMemComVO
	 * @return 등록 결과
	 * @exception Exception
	 */
    String insertTMemCom(TMemComVO vo) throws Exception;
    
    /* 파일첨부*/
    void insertTMemComFile(TMemComFileVO vo) throws Exception;
    
   
    
    /**
	 * t_mem_com을 수정한다.
	 * @param vo - 수정할 정보가 담긴 TMemComVO
	 * @return void형
	 * @exception Exception
	 */
    void updateTMemCom(TMemComVO vo) throws Exception;
    
    /**
	 * t_mem_com을 삭제한다.
	 * @param vo - 삭제할 정보가 담긴 TMemComVO
	 * @return void형 
	 * @exception Exception
	 */
    void deleteTMemCom(TMemComVO vo) throws Exception;
    
    /**
	 * t_mem_com을 조회한다.
	 * @param vo - 조회할 정보가 담긴 TMemComVO
	 * @return 조회한 t_mem_com
	 * @exception Exception
	 */
    TMemComVO selectTMemCom(TMemComVO vo) throws Exception;    
    
    /**
	 * t_mem_com 목록을 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return t_mem_com 목록
	 * @exception Exception
	 */
    List selectTMemComList(SearchVO searchVO) throws Exception;
    
    /**
	 * t_mem_com 총 갯수를 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return t_mem_com 총 갯수
	 * @exception
	 */
    int selectTMemComListTotCnt(SearchVO searchVO);
    

    /**
	 * t_mem_com 목록을 전문업체  조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return t_mem_com 목록
	 * @exception Exception
	 */
    List selectagSearchList(SearchVO searchVO) throws Exception;
    
    /**
	 * t_mem_com 총 갯수를 전문업체 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return t_mem_com 총 갯수
	 * @exception
	 */
    int selectagSearchListTotCnt(SearchVO searchVO);
    
    
    /**
	 * t_mem_com의 SpecYn을 수정한다.
	 * @param vo - 수정할 정보가 담긴 TMemComVO
	 * @return void형
	 * @exception Exception
	 */
    void updateSpecYnTMemCom(TMemComVO vo) throws Exception;
    
}
