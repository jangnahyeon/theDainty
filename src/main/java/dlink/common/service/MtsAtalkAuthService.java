package dlink.common.service;

import java.util.List;
import dlink.common.vo.SearchVO;
import dlink.common.vo.MtsAtalkAuthVO;

/**
 * @Class Name : MtsAtalkAuthService.java
 * @Description : MtsAtalkAuth Business class
 * @Modification Information
 *
 * @author 이은지
 * @since 2022-05-03
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */
public interface MtsAtalkAuthService {
	
	/**
	 * mts_atalk_auth을 등록한다.
	 * @param vo - 등록할 정보가 담긴 MtsAtalkAuthVO
	 * @return 등록 결과
	 * @exception Exception
	 */
    String insertMtsAtalkAuth(MtsAtalkAuthVO vo) throws Exception;
    
    
    
    /**
	 * mts_atalk_auth을 수정한다.
	 * @param vo - 수정할 정보가 담긴 MtsAtalkAuthVO
	 * @return void형
	 * @exception Exception
	 */
    void updateMtsAtalkAuth(MtsAtalkAuthVO vo) throws Exception;
    
    /**
	 * mts_atalk_auth을 삭제한다.
	 * @param vo - 삭제할 정보가 담긴 MtsAtalkAuthVO
	 * @return void형 
	 * @exception Exception
	 */
    void deleteMtsAtalkAuth(MtsAtalkAuthVO vo) throws Exception;
    
    /**
	 * mts_atalk_auth을 조회한다.
	 * @param vo - 조회할 정보가 담긴 MtsAtalkAuthVO
	 * @return 조회한 mts_atalk_auth
	 * @exception Exception
	 */
    MtsAtalkAuthVO selectMtsAtalkAuth(MtsAtalkAuthVO vo) throws Exception;
    
    /**
	 * mts_atalk_auth 목록을 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return mts_atalk_auth 목록
	 * @exception Exception
	 */
    List selectMtsAtalkAuthList(SearchVO searchVO) throws Exception;
    
    /**
	 * mts_atalk_auth 총 갯수를 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return mts_atalk_auth 총 갯수
	 * @exception
	 */
    int selectMtsAtalkAuthListTotCnt(MtsAtalkAuthVO vo);

	
    
}
