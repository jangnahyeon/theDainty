package dlink_new.admin.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import org.egovframe.rte.psl.dataaccess.EgovAbstractDAO;
import dlink_new.admin.vo.TbBrdCmtVO;
import dlink_new.admin.vo.TbBrdCmtDefaultVO;

/**
 * @Class Name : TbBrdCmtDAO.java
 * @Description : TbBrdCmt DAO Class
 * @Modification Information
 *
 * @author 김현재
 * @since 2023-02-02
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */

@Repository("tbBrdCmtDAO")
public class TbBrdCmtDAO extends EgovAbstractDAO {

	/**
	 * tb_brd_cmt을 등록한다.
	 * @param vo - 등록할 정보가 담긴 TbBrdCmtVO
	 * @return 등록 결과
	 * @exception Exception
	 */
    public int insertTbBrdCmt(TbBrdCmtVO vo) throws Exception {
        return (int)insert("tbBrdCmtDAO.insertTbBrdCmt_S", vo);
    }

    /**
	 * tb_brd_cmt을 수정한다.
	 * @param vo - 수정할 정보가 담긴 TbBrdCmtVO
	 * @return void형
	 * @exception Exception
	 */
    public void updateTbBrdCmt(TbBrdCmtVO vo) throws Exception {
        update("tbBrdCmtDAO.updateTbBrdCmt_S", vo);
    }

    /**
	 * tb_brd_cmt을 삭제한다.
	 * @param vo - 삭제할 정보가 담긴 TbBrdCmtVO
	 * @return void형 
	 * @exception Exception
	 */
    public void deleteTbBrdCmt(TbBrdCmtVO vo) throws Exception {
        delete("tbBrdCmtDAO.deleteTbBrdCmt_S", vo);
    }

    /**
	 * tb_brd_cmt을 조회한다.
	 * @param vo - 조회할 정보가 담긴 TbBrdCmtVO
	 * @return 조회한 tb_brd_cmt
	 * @exception Exception
	 */
    public TbBrdCmtVO selectTbBrdCmt(TbBrdCmtVO vo) throws Exception {
        return (TbBrdCmtVO) select("tbBrdCmtDAO.selectTbBrdCmt_S", vo);
    }

    /**
	 * tb_brd_cmt 목록을 조회한다.
	 * @param searchMap - 조회할 정보가 담긴 Map
	 * @return tb_brd_cmt 목록
	 * @exception Exception
	 */
    public List<?> selectTbBrdCmtList(TbBrdCmtDefaultVO searchVO) throws Exception {
        return list("tbBrdCmtDAO.selectTbBrdCmtList_D", searchVO);
    }

    /**
	 * tb_brd_cmt 총 갯수를 조회한다.
	 * @param searchMap - 조회할 정보가 담긴 Map
	 * @return tb_brd_cmt 총 갯수
	 * @exception
	 */
    public int selectTbBrdCmtListTotCnt(TbBrdCmtDefaultVO searchVO) {
        return (Integer)select("tbBrdCmtDAO.selectTbBrdCmtListTotCnt_S", searchVO);
    }

	public void updateBrdCmt(TbBrdCmtVO vo) {
		update("tbBrdCmtDAO.updateBrdCmt", vo);
	}

}
