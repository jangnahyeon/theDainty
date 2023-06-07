package dlink.admin.service;

import java.util.List;

import dlink.admin.vo.SearchVO;
import dlink.admin.vo.TCodeVO;

/**
 * @Class Name : TCodeService.java
 * @Description : TCode Business class
 * @Modification Information
 *
 * @author 안성찬
 * @since 2022-03-30
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */
public interface TCodeService {
	
	/**
	 * t_code을 등록한다.
	 * @param vo - 등록할 정보가 담긴 TCodeVO
	 * @return 등록 결과
	 * @exception Exception
	 */
    String insertTCode(TCodeVO vo) throws Exception;
    
    /**
	 * t_code을 수정한다.
	 * @param vo - 수정할 정보가 담긴 TCodeVO
	 * @return void형
	 * @exception Exception
	 */
    void updateTCode(TCodeVO vo) throws Exception;
    
    /**
	 * t_code을 삭제한다.
	 * @param vo - 삭제할 정보가 담긴 TCodeVO
	 * @return void형 
	 * @exception Exception
	 */
    void deleteTCode(TCodeVO vo) throws Exception;
    
    /**
	 * t_code을 조회한다.
	 * @param vo - 조회할 정보가 담긴 TCodeVO
	 * @return 조회한 t_code
	 * @exception Exception
	 */
    TCodeVO selectTCode(TCodeVO vo) throws Exception;
    
    /**
	 * t_code 목록을 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return t_code 목록
	 * @exception Exception
	 */
    List<TCodeVO> selectTCodeList(TCodeVO searchVO) throws Exception;
    
    /**
	 * t_code 총 갯수를 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return t_code 총 갯수
	 * @exception
	 */
    int selectTCodeListTotCnt(SearchVO searchVO);
    
}
