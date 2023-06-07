package dlink_new.front.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import org.egovframe.rte.psl.dataaccess.EgovAbstractDAO;
import dlink_new.front.vo.TbMenuVO;
import dlink_new.front.vo.TbMenuDefaultVO;

/**
 * @Class Name : TbMenuDAO.java
 * @Description : TbMenu DAO Class
 * @Modification Information
 *
 * @author 김현재
 * @since 2023-01-19
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */

@Repository("tbMenuDAO")
public class TbMenuDAO extends EgovAbstractDAO {

	/**
	 * tb_menu을 등록한다.
	 * @param vo - 등록할 정보가 담긴 TbMenuVO
	 * @return 등록 결과
	 * @exception Exception
	 */
    public String insertTbMenu(TbMenuVO vo) throws Exception {
        return (String)insert("tbMenuDAO.insertTbMenu_S", vo);
    }

    /**
	 * tb_menu을 수정한다.
	 * @param vo - 수정할 정보가 담긴 TbMenuVO
	 * @return void형
	 * @exception Exception
	 */
    public void updateTbMenu(TbMenuVO vo) throws Exception {
        update("tbMenuDAO.updateTbMenu_S", vo);
    }

    /**
	 * tb_menu을 삭제한다.
	 * @param vo - 삭제할 정보가 담긴 TbMenuVO
	 * @return void형 
	 * @exception Exception
	 */
    public void deleteTbMenu(TbMenuVO vo) throws Exception {
        delete("tbMenuDAO.deleteTbMenu_S", vo);
    }

    /**
	 * tb_menu을 조회한다.
	 * @param vo - 조회할 정보가 담긴 TbMenuVO
	 * @return 조회한 tb_menu
	 * @exception Exception
	 */
    public TbMenuVO selectTbMenu(TbMenuVO vo) throws Exception {
        return (TbMenuVO) select("tbMenuDAO.selectTbMenu_S", vo);
    }

    /**
	 * tb_menu 목록을 조회한다.
	 * @param searchMap - 조회할 정보가 담긴 Map
	 * @return tb_menu 목록
	 * @exception Exception
	 */
    public List<?> selectTbMenuList(TbMenuVO searchVO) throws Exception {
        return list("tbMenuDAO.selectTbMenuList_D", searchVO);
    }

    /**
	 * tb_menu 총 갯수를 조회한다.
	 * @param searchMap - 조회할 정보가 담긴 Map
	 * @return tb_menu 총 갯수
	 * @exception
	 */
    public int selectTbMenuListTotCnt(TbMenuVO searchVO) {
        return (Integer)select("tbMenuDAO.selectTbMenuListTotCnt_S", searchVO);
    }

}
