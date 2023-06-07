package dlink_new.admin.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import org.egovframe.rte.psl.dataaccess.EgovAbstractDAO;
import dlink_new.admin.vo.TbSisulVO;
import dlink_new.admin.vo.TbSisulDefaultVO;

/**
 * @Class Name : TbSisulDAO.java
 * @Description : TbSisul DAO Class
 * @Modification Information
 *
 * @author 김현재
 * @since 2023-01-21
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */

@Repository("tbSisulDAO")
public class TbSisulDAO extends EgovAbstractDAO {

	/**
	 * tb_sisul을 등록한다.
	 * @param vo - 등록할 정보가 담긴 TbSisulVO
	 * @return 등록 결과
	 * @exception Exception
	 */
    public String insertTbSisul(TbSisulVO vo) throws Exception {
        return (String)insert("tbSisulDAO.insertTbSisul_S", vo);
    }

    /**
	 * tb_sisul을 수정한다.
	 * @param vo - 수정할 정보가 담긴 TbSisulVO
	 * @return void형
	 * @exception Exception
	 */
    public void updateTbSisul(TbSisulVO vo) throws Exception {
        update("tbSisulDAO.updateTbSisul_S", vo);
    }

    /**
	 * tb_sisul을 삭제한다.
	 * @param vo - 삭제할 정보가 담긴 TbSisulVO
	 * @return void형 
	 * @exception Exception
	 */
    public void deleteTbSisul(TbSisulVO vo) throws Exception {
        delete("tbSisulDAO.deleteTbSisul_S", vo);
    }

    /**
	 * tb_sisul을 조회한다.
	 * @param vo - 조회할 정보가 담긴 TbSisulVO
	 * @return 조회한 tb_sisul
	 * @exception Exception
	 */
    public TbSisulVO selectTbSisul(TbSisulVO vo) throws Exception {
        return (TbSisulVO) select("tbSisulDAO.selectTbSisul_S", vo);
    }

    /**
	 * tb_sisul 목록을 조회한다.
	 * @param searchMap - 조회할 정보가 담긴 Map
	 * @return tb_sisul 목록
	 * @exception Exception
	 */
    public List<?> selectTbSisulList(TbSisulDefaultVO searchVO) throws Exception {
        return list("tbSisulDAO.selectTbSisulList_D", searchVO);
    }

    /**
	 * tb_sisul 총 갯수를 조회한다.
	 * @param searchMap - 조회할 정보가 담긴 Map
	 * @return tb_sisul 총 갯수
	 * @exception
	 */
    public int selectTbSisulListTotCnt(TbSisulDefaultVO searchVO) {
        return (Integer)select("tbSisulDAO.selectTbSisulListTotCnt_S", searchVO);
    }

}
