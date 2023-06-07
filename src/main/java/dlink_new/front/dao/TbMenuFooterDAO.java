package dlink_new.front.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import org.egovframe.rte.psl.dataaccess.EgovAbstractDAO;
import dlink_new.front.vo.TbMenuFooterVO;
import dlink_new.front.vo.TbMenuFooterDefaultVO;

/**
 * @Class Name : TbMenuFooterDAO.java
 * @Description : TbMenuFooter DAO Class
 * @Modification Information
 *
 * @author 김현재
 * @since 2023-01-24
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */

@Repository("tbMenuFooterDAO")
public class TbMenuFooterDAO extends EgovAbstractDAO {

	/**
	 * tb_menu_footer을 등록한다.
	 * @param vo - 등록할 정보가 담긴 TbMenuFooterVO
	 * @return 등록 결과
	 * @exception Exception
	 */
    public String insertTbMenuFooter(TbMenuFooterVO vo) throws Exception {
        return (String)insert("tbMenuFooterDAO.insertTbMenuFooter_S", vo);
    }

    /**
	 * tb_menu_footer을 수정한다.
	 * @param vo - 수정할 정보가 담긴 TbMenuFooterVO
	 * @return void형
	 * @exception Exception
	 */
    public void updateTbMenuFooter(TbMenuFooterVO vo) throws Exception {
        update("tbMenuFooterDAO.updateTbMenuFooter_S", vo);
    }

    /**
	 * tb_menu_footer을 삭제한다.
	 * @param vo - 삭제할 정보가 담긴 TbMenuFooterVO
	 * @return void형 
	 * @exception Exception
	 */
    public void deleteTbMenuFooter(TbMenuFooterVO vo) throws Exception {
        delete("tbMenuFooterDAO.deleteTbMenuFooter_S", vo);
    }

    /**
	 * tb_menu_footer을 조회한다.
	 * @param vo - 조회할 정보가 담긴 TbMenuFooterVO
	 * @return 조회한 tb_menu_footer
	 * @exception Exception
	 */
    public TbMenuFooterVO selectTbMenuFooter(TbMenuFooterVO vo) throws Exception {
        return (TbMenuFooterVO) select("tbMenuFooterDAO.selectTbMenuFooter_S", vo);
    }

    /**
	 * tb_menu_footer 목록을 조회한다.
	 * @param searchMap - 조회할 정보가 담긴 Map
	 * @return tb_menu_footer 목록
	 * @exception Exception
	 */
    public List<?> selectTbMenuFooterList(TbMenuFooterVO searchVO) throws Exception {
        return list("tbMenuFooterDAO.selectTbMenuFooterList_D", searchVO);
    }

    /**
	 * tb_menu_footer 총 갯수를 조회한다.
	 * @param searchMap - 조회할 정보가 담긴 Map
	 * @return tb_menu_footer 총 갯수
	 * @exception
	 */
    public int selectTbMenuFooterListTotCnt(TbMenuFooterVO searchVO) {
        return (Integer)select("tbMenuFooterDAO.selectTbMenuFooterListTotCnt_S", searchVO);
    }

}
