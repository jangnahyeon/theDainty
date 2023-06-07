package dlink.admin.dao;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.EgovAbstractDAO;
import org.springframework.stereotype.Repository;

import dlink.admin.vo.TMenuVO;
import dlink.admin.vo.SearchVO;

/**
 * @Class Name : TMenuDAO.java
 * @Description : TMenu DAO Class
 * @Modification Information
 *
 * @author 안성찬
 * @since 2022-03-31
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */

@Repository("TMenuDAO")
public class TMenuDAO extends EgovAbstractDAO {

	/**
	 * t_menu을 등록한다.
	 * @param vo - 등록할 정보가 담긴 TMenuVO
	 * @return 등록 결과
	 * @exception Exception
	 */
    public String insertTMenu(TMenuVO vo) throws Exception {
        return (String)insert("TMenuDAO.insertTMenu_S", vo);
    }

    /**
	 * t_menu을 수정한다.
	 * @param vo - 수정할 정보가 담긴 TMenuVO
	 * @return void형
	 * @exception Exception
	 */
    public void updateTMenu(TMenuVO vo) throws Exception {
        update("TMenuDAO.updateTMenu_S", vo);
    }

    /**
	 * t_menu을 삭제한다.
	 * @param vo - 삭제할 정보가 담긴 TMenuVO
	 * @return void형 
	 * @exception Exception
	 */
    public void deleteTMenu(TMenuVO vo) throws Exception {
        delete("TMenuDAO.deleteTMenu_S", vo);
    }

    /**
	 * t_menu을 조회한다.
	 * @param vo - 조회할 정보가 담긴 TMenuVO
	 * @return 조회한 t_menu
	 * @exception Exception
	 */
    public TMenuVO selectTMenu(TMenuVO vo) throws Exception {
        return (TMenuVO) select("TMenuDAO.selectTMenu_S", vo);
    }

    /**
	 * t_menu 목록을 조회한다.
	 * @param searchMap - 조회할 정보가 담긴 Map
	 * @return t_menu 목록
	 * @exception Exception
	 */
    public List<?> selectTMenuList(TMenuVO searchVO) throws Exception {
        return list("TMenuDAO.selectTMenuList_D", searchVO);
    }

    /**
	 * t_menu 총 갯수를 조회한다.
	 * @param searchMap - 조회할 정보가 담긴 Map
	 * @return t_menu 총 갯수
	 * @exception
	 */
    public int selectTMenuListTotCnt(SearchVO searchVO) {
        return (Integer)select("TMenuDAO.selectTMenuListTotCnt_S", searchVO);
    }
    
    public List<?> selectTMenuTreeList(TMenuVO searchVO) throws Exception {
        return list("TMenuDAO.selectTMenuTreeList", searchVO);
    }

}
