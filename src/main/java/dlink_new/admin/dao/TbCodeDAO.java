package dlink_new.admin.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import org.egovframe.rte.psl.dataaccess.EgovAbstractDAO;
import dlink_new.admin.vo.TbCodeVO;
import dlink_new.admin.vo.TbCodeDefaultVO;

/**
 * @Class Name : TbCodeDAO.java
 * @Description : TbCode DAO Class
 * @Modification Information
 *
 * @author 김현재
 * @since 2023-01-18
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */

@Repository("tbCodeDAO")
public class TbCodeDAO extends EgovAbstractDAO {

	/**
	 * tb_code을 등록한다.
	 * @param vo - 등록할 정보가 담긴 TbCodeVO
	 * @return 등록 결과
	 * @exception Exception
	 */
    public String insertTbCode(TbCodeVO vo) throws Exception {
        return (String)insert("tbCodeDAO.insertTbCode_S", vo);
    }

    /**
	 * tb_code을 수정한다.
	 * @param vo - 수정할 정보가 담긴 TbCodeVO
	 * @return void형
	 * @exception Exception
	 */
    public void updateTbCode(TbCodeVO vo) throws Exception {
        update("tbCodeDAO.updateTbCode_S", vo);
    }

    /**
	 * tb_code을 삭제한다.
	 * @param vo - 삭제할 정보가 담긴 TbCodeVO
	 * @return void형 
	 * @exception Exception
	 */
    public void deleteTbCode(TbCodeVO vo) throws Exception {
        delete("tbCodeDAO.deleteTbCode_S", vo);
    }

    /**
	 * tb_code을 조회한다.
	 * @param vo - 조회할 정보가 담긴 TbCodeVO
	 * @return 조회한 tb_code
	 * @exception Exception
	 */
    public TbCodeVO selectTbCode(TbCodeVO vo) throws Exception {
        return (TbCodeVO) select("tbCodeDAO.selectTbCode_S", vo);
    }

    /**
	 * tb_code 목록을 조회한다.
	 * @param searchMap - 조회할 정보가 담긴 Map
	 * @return tb_code 목록
	 * @exception Exception
	 */
    public List<?> selectTbCodeList(TbCodeDefaultVO searchVO) throws Exception {
        return list("tbCodeDAO.selectTbCodeList_D", searchVO);
    }

    /**
	 * tb_code 총 갯수를 조회한다.
	 * @param searchMap - 조회할 정보가 담긴 Map
	 * @return tb_code 총 갯수
	 * @exception
	 */
    public int selectTbCodeListTotCnt(TbCodeDefaultVO searchVO) {
        return (Integer)select("tbCodeDAO.selectTbCodeListTotCnt_S", searchVO);
    }

	public List<?> selectTbCodeListFront(TbCodeVO searchVO) {
		return list("tbCodeDAO.selectTbCodeListFront", searchVO);
	}

}
