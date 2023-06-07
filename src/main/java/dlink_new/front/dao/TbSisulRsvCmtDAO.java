package dlink_new.front.dao;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.EgovAbstractDAO;
import org.springframework.stereotype.Repository;

import dlink_new.front.vo.TbSisulRsvCmtDefaultVO;
import dlink_new.front.vo.TbSisulRsvCmtVO;

/**
 * @Class Name : TbSisulRsvCmtDAO.java
 * @Description : TbSisulRsvCmt DAO Class
 * @Modification Information
 *
 * @author 이재욱
 * @since 2023-02-07
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */

@Repository("tbSisulRsvCmtDAO")
public class TbSisulRsvCmtDAO extends EgovAbstractDAO {

	/**
	 * tb_sisul_rsv_cmt을 등록한다.
	 * @param vo - 등록할 정보가 담긴 TbSisulRsvCmtVO
	 * @return 등록 결과
	 * @exception Exception
	 */
    public String insertTbSisulRsvCmt(TbSisulRsvCmtVO vo) throws Exception {
        return (String)insert("tbSisulRsvCmtDAO.insertTbSisulRsvCmt_S", vo);
    }

    /**
	 * tb_sisul_rsv_cmt을 수정한다.
	 * @param vo - 수정할 정보가 담긴 TbSisulRsvCmtVO
	 * @return void형
	 * @exception Exception
	 */
    public void updateTbSisulRsvCmt(TbSisulRsvCmtVO vo) throws Exception {
        update("tbSisulRsvCmtDAO.updateTbSisulRsvCmt_S", vo);
    }

    /**
	 * tb_sisul_rsv_cmt을 삭제한다.
	 * @param vo - 삭제할 정보가 담긴 TbSisulRsvCmtVO
	 * @return void형 
	 * @exception Exception
	 */
    public void deleteTbSisulRsvCmt(TbSisulRsvCmtVO vo) throws Exception {
        delete("tbSisulRsvCmtDAO.deleteTbSisulRsvCmt_S", vo);
    }

    /**
	 * tb_sisul_rsv_cmt을 조회한다.
	 * @param vo - 조회할 정보가 담긴 TbSisulRsvCmtVO
	 * @return 조회한 tb_sisul_rsv_cmt
	 * @exception Exception
	 */
    public TbSisulRsvCmtVO selectTbSisulRsvCmt(TbSisulRsvCmtVO vo) throws Exception {
        return (TbSisulRsvCmtVO) select("tbSisulRsvCmtDAO.selectTbSisulRsvCmt_S", vo);
    }

    /**
	 * tb_sisul_rsv_cmt 목록을 조회한다.
	 * @param searchMap - 조회할 정보가 담긴 Map
	 * @return tb_sisul_rsv_cmt 목록
	 * @exception Exception
	 */
    public List<?> selectTbSisulRsvCmtList(TbSisulRsvCmtDefaultVO searchVO) throws Exception {
        return list("tbSisulRsvCmtDAO.selectTbSisulRsvCmtList_D", searchVO);
    }

    /**
	 * tb_sisul_rsv_cmt 총 갯수를 조회한다.
	 * @param searchMap - 조회할 정보가 담긴 Map
	 * @return tb_sisul_rsv_cmt 총 갯수
	 * @exception
	 */
    public int selectTbSisulRsvCmtListTotCnt(TbSisulRsvCmtDefaultVO searchVO) {
        return (Integer)select("tbSisulRsvCmtDAO.selectTbSisulRsvCmtListTotCnt_S", searchVO);
    }

}
