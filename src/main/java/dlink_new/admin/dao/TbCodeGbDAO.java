package dlink_new.admin.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import org.egovframe.rte.psl.dataaccess.EgovAbstractDAO;
import dlink_new.admin.vo.TbCodeGbVO;
import dlink_new.admin.vo.TbCodeGbDefaultVO;

/**
 * @Class Name : TbCodeGbDAO.java
 * @Description : TbCodeGb DAO Class
 * @Modification Information
 *
 * @author 김현재
 * @since 2023-01-17
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */

@Repository("tbCodeGbDAO")
public class TbCodeGbDAO extends EgovAbstractDAO {

	/**
	 * tb_code_gb을 등록한다.
	 * @param vo - 등록할 정보가 담긴 TbCodeGbVO
	 * @return 등록 결과
	 * @exception Exception
	 */
    public String insertTbCodeGb(TbCodeGbVO vo) throws Exception {
        return (String)insert("tbCodeGbDAO.insertTbCodeGb_S", vo);
    }

    /**
	 * tb_code_gb을 수정한다.
	 * @param vo - 수정할 정보가 담긴 TbCodeGbVO
	 * @return void형
	 * @exception Exception
	 */
    public void updateTbCodeGb(TbCodeGbVO vo) throws Exception {
        update("tbCodeGbDAO.updateTbCodeGb_S", vo);
    }

    /**
	 * tb_code_gb을 삭제한다.
	 * @param vo - 삭제할 정보가 담긴 TbCodeGbVO
	 * @return void형 
	 * @exception Exception
	 */
    public void deleteTbCodeGb(TbCodeGbVO vo) throws Exception {
        delete("tbCodeGbDAO.deleteTbCodeGb_S", vo);
    }

    /**
	 * tb_code_gb을 조회한다.
	 * @param vo - 조회할 정보가 담긴 TbCodeGbVO
	 * @return 조회한 tb_code_gb
	 * @exception Exception
	 */
    public TbCodeGbVO selectTbCodeGb(TbCodeGbVO vo) throws Exception {
        return (TbCodeGbVO) select("tbCodeGbDAO.selectTbCodeGb_S", vo);
    }

    /**
	 * tb_code_gb 목록을 조회한다.
	 * @param searchMap - 조회할 정보가 담긴 Map
	 * @return tb_code_gb 목록
	 * @exception Exception
	 */
    public List<?> selectTbCodeGbList(TbCodeGbDefaultVO searchVO) throws Exception {
        return list("tbCodeGbDAO.selectTbCodeGbList_D", searchVO);
    }

    /**
	 * tb_code_gb 총 갯수를 조회한다.
	 * @param searchMap - 조회할 정보가 담긴 Map
	 * @return tb_code_gb 총 갯수
	 * @exception
	 */
    public int selectTbCodeGbListTotCnt(TbCodeGbDefaultVO searchVO) {
        return (Integer)select("tbCodeGbDAO.selectTbCodeGbListTotCnt_S", searchVO);
    }

}
