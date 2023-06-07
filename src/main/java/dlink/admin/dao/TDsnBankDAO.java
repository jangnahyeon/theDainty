package dlink.admin.dao;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.EgovAbstractDAO;
import org.springframework.stereotype.Repository;


import dlink.admin.vo.TDsnBankVO;
import dlink.admin.vo.TDsnBankVO;

/**
 * @Class Name : TDsnBankDAO.java
 * @Description : TDsnBank DAO Class
 * @Modification Information
 *
 * @author 장나현
 * @since 2022-04-11
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */

@Repository("TDsnBankDAO")
public class TDsnBankDAO extends EgovAbstractDAO {

	/**
	 * t_dsn_bank을 등록한다.
	 * @param vo - 등록할 정보가 담긴 TDsnBankVO
	 * @return 등록 결과
	 * @exception Exception
	 */
    public String insertTDsnBank(TDsnBankVO vo) throws Exception {
        return (String)insert("TDsnBankDAO.insertTDsnBank_S", vo);
    }

    /**
	 * t_dsn_bank을 수정한다.
	 * @param vo - 수정할 정보가 담긴 TDsnBankVO
	 * @return void형
	 * @exception Exception
	 */
    public void updateTDsnBank(TDsnBankVO vo) throws Exception {
        update("TDsnBankDAO.updateTDsnBank_S", vo);
    }

    /**
	 * t_dsn_bank을 삭제한다.
	 * @param vo - 삭제할 정보가 담긴 TDsnBankVO
	 * @return void형 
	 * @exception Exception
	 */
    public void deleteTDsnBank(TDsnBankVO vo) throws Exception {
        delete("TDsnBankDAO.deleteTDsnBank_S", vo);
    }

    /**
	 * t_dsn_bank을 조회한다.
	 * @param vo - 조회할 정보가 담긴 TDsnBankVO
	 * @return 조회한 t_dsn_bank
	 * @exception Exception
	 */
    public TDsnBankVO selectTDsnBank(TDsnBankVO vo) throws Exception {
        return (TDsnBankVO) select("TDsnBankDAO.selectTDsnBank_S", vo);
    }

    /**
	 * t_dsn_bank 목록을 조회한다.
	 * @param searchMap - 조회할 정보가 담긴 Map
	 * @return t_dsn_bank 목록
	 * @exception Exception
	 */
    public List<?> selectTDsnBankList(TDsnBankVO searchVO) throws Exception {
        return list("TDsnBankDAO.selectTDsnBankList_D", searchVO);
    }

    /**
	 * t_dsn_bank 총 갯수를 조회한다.
	 * @param searchMap - 조회할 정보가 담긴 Map
	 * @return t_dsn_bank 총 갯수
	 * @exception
	 */
    public int selectTDsnBankListTotCnt(TDsnBankVO searchVO) {
        return (Integer)select("TDsnBankDAO.selectTDsnBankListTotCnt_S", searchVO);
    }

}
