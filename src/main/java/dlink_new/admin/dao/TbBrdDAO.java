package dlink_new.admin.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import org.egovframe.rte.psl.dataaccess.EgovAbstractDAO;
import dlink_new.admin.vo.TbBrdVO;
import dlink_new.admin.vo.TbBrdDefaultVO;

/**
 * @Class Name : TbBrdDAO.java
 * @Description : TbBrd DAO Class
 * @Modification Information
 *
 * @author 김현재
 * @since 2023-01-25
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */

@Repository("tbBrdDAO")
public class TbBrdDAO extends EgovAbstractDAO {

	/**
	 * tb_brd을 등록한다.
	 * @param vo - 등록할 정보가 담긴 TbBrdVO
	 * @return 등록 결과
	 * @exception Exception
	 */
    public int insertTbBrd(TbBrdVO vo) throws Exception {
        return (int)insert("tbBrdDAO.insertTbBrd_S", vo);
    }

    /**
	 * tb_brd을 수정한다.
	 * @param vo - 수정할 정보가 담긴 TbBrdVO
	 * @return void형
	 * @exception Exception
	 */
    public void updateTbBrd(TbBrdVO vo) throws Exception {
        update("tbBrdDAO.updateTbBrd_S", vo);
    }

    /**
	 * tb_brd을 삭제한다.
	 * @param vo - 삭제할 정보가 담긴 TbBrdVO
	 * @return void형 
	 * @exception Exception
	 */
    public void deleteTbBrd(TbBrdVO vo) throws Exception {
        delete("tbBrdDAO.deleteTbBrd_S", vo);
    }

    /**
	 * tb_brd을 조회한다.
	 * @param vo - 조회할 정보가 담긴 TbBrdVO
	 * @return 조회한 tb_brd
	 * @exception Exception
	 */
    public TbBrdVO selectTbBrd(TbBrdVO vo) throws Exception {
        return (TbBrdVO) select("tbBrdDAO.selectTbBrd_S", vo);
    }

    /**
	 * tb_brd 목록을 조회한다.
	 * @param searchMap - 조회할 정보가 담긴 Map
	 * @return tb_brd 목록
	 * @exception Exception
	 */
    public List<?> selectTbBrdList(TbBrdDefaultVO searchVO) throws Exception {
        return list("tbBrdDAO.selectTbBrdList_D", searchVO);
    }

    /**
	 * tb_brd 총 갯수를 조회한다.
	 * @param searchMap - 조회할 정보가 담긴 Map
	 * @return tb_brd 총 갯수
	 * @exception
	 */
    public int selectTbBrdListTotCnt(TbBrdDefaultVO searchVO) {
        return (Integer)select("tbBrdDAO.selectTbBrdListTotCnt_S", searchVO);
    }
    
    /**
	 * tb_brd 공지사항 마지막을 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return tb_brd 목록
	 * @exception Exception
	 */
    public TbBrdVO selectTbBrdLast(TbBrdVO vo) throws Exception {
        return (TbBrdVO) select("tbBrdDAO.selectTbBrdLast", vo);
    }
}
