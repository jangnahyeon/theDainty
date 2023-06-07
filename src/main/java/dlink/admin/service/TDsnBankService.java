package dlink.admin.service;

import java.util.List;
import dlink.admin.vo.TDsnBankVO;
import dlink.admin.vo.TDsnBankVO;

/**
 * @Class Name : TDsnBankService.java
 * @Description : TDsnBank Business class
 * @Modification Information
 *
 * @author 장나현
 * @since 2022-04-11
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */
public interface TDsnBankService {
	
	/**
	 * t_dsn_bank을 등록한다.
	 * @param vo - 등록할 정보가 담긴 TDsnBankVO
	 * @return 등록 결과
	 * @exception Exception
	 */
    String insertTDsnBank(TDsnBankVO vo) throws Exception;
    
    /**
	 * t_dsn_bank을 수정한다.
	 * @param vo - 수정할 정보가 담긴 TDsnBankVO
	 * @return void형
	 * @exception Exception
	 */
    void updateTDsnBank(TDsnBankVO vo) throws Exception;
    
    /**
	 * t_dsn_bank을 삭제한다.
	 * @param vo - 삭제할 정보가 담긴 TDsnBankVO
	 * @return void형 
	 * @exception Exception
	 */
    void deleteTDsnBank(TDsnBankVO vo) throws Exception;
    
    /**
	 * t_dsn_bank을 조회한다.
	 * @param vo - 조회할 정보가 담긴 TDsnBankVO
	 * @return 조회한 t_dsn_bank
	 * @exception Exception
	 */
    TDsnBankVO selectTDsnBank(TDsnBankVO vo) throws Exception;
    
    /**
	 * t_dsn_bank 목록을 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return t_dsn_bank 목록
	 * @exception Exception
	 */
    List selectTDsnBankList(TDsnBankVO searchVO) throws Exception;
    
    /**
	 * t_dsn_bank 총 갯수를 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return t_dsn_bank 총 갯수
	 * @exception
	 */
    int selectTDsnBankListTotCnt(TDsnBankVO searchVO);
    
}
