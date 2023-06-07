package dlink_new.admin.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import org.egovframe.rte.psl.dataaccess.EgovAbstractDAO;
import dlink_new.admin.vo.TbMemVO;
import dlink_new.admin.vo.TbMemDefaultVO;

/**
 * @Class Name : TbMemDAO.java
 * @Description : TbMem DAO Class
 * @Modification Information
 *
 * @author 김현재
 * @since 2023-01-18
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */

@Repository("tbMemDAO")
public class TbMemDAO extends EgovAbstractDAO {

	/**
	 * tb_mem을 등록한다.
	 * @param vo - 등록할 정보가 담긴 TbMemVO
	 * @return 등록 결과
	 * @exception Exception
	 */
    public java.lang.Integer insertTbMem(TbMemVO vo) throws Exception {
        return (java.lang.Integer)insert("tbMemDAO.insertTbMem_S", vo);
    }

    /**
	 * tb_mem을 수정한다.
	 * @param vo - 수정할 정보가 담긴 TbMemVO
	 * @return void형
	 * @exception Exception
	 */
    public void updateTbMem(TbMemVO vo) throws Exception {
        update("tbMemDAO.updateTbMem_S", vo);
    }

    /**
	 * tb_mem을 삭제한다.
	 * @param vo - 삭제할 정보가 담긴 TbMemVO
	 * @return void형 
	 * @exception Exception
	 */
    public void deleteTbMem(TbMemVO vo) throws Exception {
        delete("tbMemDAO.deleteTbMem_S", vo);
    }

    /**
	 * tb_mem을 조회한다.
	 * @param vo - 조회할 정보가 담긴 TbMemVO
	 * @return 조회한 tb_mem
	 * @exception Exception
	 */
    public TbMemVO selectTbMem(TbMemVO vo) throws Exception {
        return (TbMemVO) select("tbMemDAO.selectTbMem_S", vo);
    }

    /**
	 * tb_mem 목록을 조회한다.
	 * @param searchMap - 조회할 정보가 담긴 Map
	 * @return tb_mem 목록
	 * @exception Exception
	 */
    public List<?> selectTbMemList(TbMemDefaultVO searchVO) throws Exception {
        return list("tbMemDAO.selectTbMemList_D", searchVO);
    }

    /**
	 * tb_mem 총 갯수를 조회한다.
	 * @param searchMap - 조회할 정보가 담긴 Map
	 * @return tb_mem 총 갯수
	 * @exception
	 */
    public int selectTbMemListTotCnt(TbMemDefaultVO searchVO) {
        return (Integer)select("tbMemDAO.selectTbMemListTotCnt_S", searchVO);
    }

	public void tbMemAcceotUpdate(TbMemVO vo) throws Exception {
        update("tbMemDAO.tbMemAcceotUpdate", vo);
    }


}
