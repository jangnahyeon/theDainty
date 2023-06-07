package dlink.front.dao;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.EgovAbstractDAO;
import org.springframework.stereotype.Repository;


import dlink.front.vo.FrontDsnBankVO;

/**
 * @Class Name : TDsnBankDAO.java
 * @Description : TDsnBank DAO Class
 * @Modification Information
 *
 * @author 안성찬
 * @since 2022-04-11
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */

@Repository("FrontDsnBankDAO")
public class FrontDsnBankDAO extends EgovAbstractDAO {

	/**
	 * t_dsn_bank을 등록한다.
	 * @param vo - 등록할 정보가 담긴 FrontDsnBankVO
	 * @return 등록 결과
	 * @exception Exception
	 */
    public void insertDsnBank(FrontDsnBankVO vo) throws Exception {
        insert("FrontDsnBankDAO.insertDsnBank", vo);
    }

    /**
	 * t_dsn_bank을 삭제한다.
	 * @param vo - 삭제할 정보가 담긴 FrontDsnBankVO
	 * @return void형 
	 * @exception Exception
	 */
    public void deleteDsnBank(FrontDsnBankVO vo) throws Exception {
        delete("FrontDsnBankDAO.deleteDsnBank", vo);
    }


    /**
	 * t_dsn_bank 목록을 조회한다.
	 * @param searchMap - 조회할 정보가 담긴 Map
	 * @return t_dsn_bank 목록
	 * @exception Exception
	 */
    public List<?> selectDsnBankList(FrontDsnBankVO searchVO) throws Exception {
        return list("FrontDsnBankDAO.selectDsnBankList", searchVO);
    }

    /**
	 * t_dsn_bank 총 갯수를 조회한다.
	 * @param searchMap - 조회할 정보가 담긴 Map
	 * @return t_dsn_bank 총 갯수
	 * @exception
	 */
    public int selectDsnBankListTotCnt(FrontDsnBankVO searchVO) {
        return (Integer)select("FrontDsnBankDAO.selectDsnBankListTotCnt", searchVO);
    }
    
    
    public void createTable(FrontDsnBankVO vo) throws Exception {
        delete("FrontDsnBankDAO.createTable", vo);
    }
    
    public int selectDsnBankFavoriteCnt(FrontDsnBankVO searchVO) {
        return (Integer)select("FrontDsnBankDAO.selectDsnBankFavoriteCnt", searchVO);
    }
    
    
    
    /**
   	 * 관심정보 > 이미지 정보
   	 */
       public List<?> selectInterestDsnBankList(FrontDsnBankVO searchVO) throws Exception {
           return list("FrontDsnBankDAO.selectInterestDsnBankList", searchVO);
       }

       public int selectInterestDsnBankListTotCnt(FrontDsnBankVO searchVO) {
           return (Integer)select("FrontDsnBankDAO.selectInterestDsnBankListTotCnt", searchVO);
       }
       

}
