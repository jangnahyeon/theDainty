package dlink_new.common.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import org.egovframe.rte.psl.dataaccess.EgovAbstractDAO;
import dlink_new.common.vo.TbAtalkTmplVO;
import dlink_new.common.vo.TbAtalkTmplDefaultVO;

/**
 * @Class Name : TbAtalkTmplDAO.java
 * @Description : TbAtalkTmpl DAO Class
 * @Modification Information
 *
 * @author 김현재
 * @since 2023-02-07
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */

@Repository("tbAtalkTmplDAO")
public class TbAtalkTmplDAO extends EgovAbstractDAO {

	/**
	 * tb_atalk_tmpl을 등록한다.
	 * @param vo - 등록할 정보가 담긴 TbAtalkTmplVO
	 * @return 등록 결과
	 * @exception Exception
	 */
    public String insertTbAtalkTmpl(TbAtalkTmplVO vo) throws Exception {
        return (String)insert("tbAtalkTmplDAO.insertTbAtalkTmpl_S", vo);
    }

    /**
	 * tb_atalk_tmpl을 수정한다.
	 * @param vo - 수정할 정보가 담긴 TbAtalkTmplVO
	 * @return void형
	 * @exception Exception
	 */
    public void updateTbAtalkTmpl(TbAtalkTmplVO vo) throws Exception {
        update("tbAtalkTmplDAO.updateTbAtalkTmpl_S", vo);
    }

    /**
	 * tb_atalk_tmpl을 삭제한다.
	 * @param vo - 삭제할 정보가 담긴 TbAtalkTmplVO
	 * @return void형 
	 * @exception Exception
	 */
    public void deleteTbAtalkTmpl(TbAtalkTmplVO vo) throws Exception {
        delete("tbAtalkTmplDAO.deleteTbAtalkTmpl_S", vo);
    }

    /**
	 * tb_atalk_tmpl을 조회한다.
	 * @param vo - 조회할 정보가 담긴 TbAtalkTmplVO
	 * @return 조회한 tb_atalk_tmpl
	 * @exception Exception
	 */
    public TbAtalkTmplVO selectTbAtalkTmpl(TbAtalkTmplVO vo) throws Exception {
        return (TbAtalkTmplVO) select("tbAtalkTmplDAO.selectTbAtalkTmpl_S", vo);
    }

    /**
	 * tb_atalk_tmpl 목록을 조회한다.
	 * @param searchMap - 조회할 정보가 담긴 Map
	 * @return tb_atalk_tmpl 목록
	 * @exception Exception
	 */
    public List<?> selectTbAtalkTmplList(TbAtalkTmplDefaultVO searchVO) throws Exception {
        return list("tbAtalkTmplDAO.selectTbAtalkTmplList_D", searchVO);
    }

    /**
	 * tb_atalk_tmpl 총 갯수를 조회한다.
	 * @param searchMap - 조회할 정보가 담긴 Map
	 * @return tb_atalk_tmpl 총 갯수
	 * @exception
	 */
    public int selectTbAtalkTmplListTotCnt(TbAtalkTmplDefaultVO searchVO) {
        return (Integer)select("tbAtalkTmplDAO.selectTbAtalkTmplListTotCnt_S", searchVO);
    }

}
