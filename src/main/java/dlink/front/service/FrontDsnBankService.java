package dlink.front.service;

import java.util.List;

import dlink.front.vo.FrontDsnBankVO;

/**
 * @Class Name : TDsnBankService.java
 * @Description : TDsnBank Business class
 * @Modification Information
 *
 * @author 안성찬
 * @since 2022-04-11
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */
public interface FrontDsnBankService {
	
	/**
	 * t_dsn_bank을 등록한다.
	 * @param vo - 등록할 정보가 담긴 FrontDsnBankVO
	 * @return 등록 결과
	 * @exception Exception
	 */
    void insertDsnBank(FrontDsnBankVO vo) throws Exception;
    
    /**
	 * t_dsn_bank을 삭제한다.
	 * @param vo - 삭제할 정보가 담긴 FrontDsnBankVO
	 * @return void형 
	 * @exception Exception
	 */
    void deleteDsnBank(FrontDsnBankVO vo) throws Exception;
    
    
    /**
	 * t_dsn_bank 목록을 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return t_dsn_bank 목록
	 * @exception Exception
	 */
    List selectDsnBankList(FrontDsnBankVO searchVO) throws Exception;
    
    /**
	 * t_dsn_bank 총 갯수를 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return t_dsn_bank 총 갯수
	 * @exception
	 */
    int selectDsnBankListTotCnt(FrontDsnBankVO searchVO);
    
    void createTable(FrontDsnBankVO vo) throws Exception;
    
    int selectDsnBankFavoriteCnt(FrontDsnBankVO searchVO);
    
    
    
    /**
   	 * 관심정보 > 이미지 정보
   	 */
       List selectInterestDsnBankList(FrontDsnBankVO searchVO) throws Exception;
          
       int selectInterestDsnBankListTotCnt(FrontDsnBankVO searchVO);
}
