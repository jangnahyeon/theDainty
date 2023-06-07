package dlink_new.admin.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import org.egovframe.rte.psl.dataaccess.EgovAbstractDAO;
import dlink_new.admin.vo.TbMenuAdminVO;
import dlink_new.admin.vo.TbMenuAdminDefaultVO;

/**
 * @Class Name : TbMenuAdminDAO.java
 * @Description : TbMenuAdmin DAO Class
 * @Modification Information
 *
 * @author 김현재
 * @since 2023.01.16
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */

@Repository("TbMenuAdminDAO")
public class TbMenuAdminDAO extends EgovAbstractDAO {

	/**
	 * t_menu_admin을 등록한다.
	 * @param vo - 등록할 정보가 담긴 TbMenuAdminVO
	 * @return 등록 결과
	 * @exception Exception
	 */
    public String insertTbMenuAdmin(TbMenuAdminVO vo) throws Exception {
        return (String)insert("TbMenuAdminDAO.insertTbMenuAdmin_S", vo);
    }

    /**
	 * t_menu_admin을 수정한다.
	 * @param vo - 수정할 정보가 담긴 TbMenuAdminVO
	 * @return void형
	 * @exception Exception
	 */
    public void updateTbMenuAdmin(TbMenuAdminVO vo) throws Exception {
        update("TbMenuAdminDAO.updateTbMenuAdmin_S", vo);
    }

    /**
	 * t_menu_admin을 삭제한다.
	 * @param vo - 삭제할 정보가 담긴 TbMenuAdminVO
	 * @return void형 
	 * @exception Exception
	 */
    public void deleteTbMenuAdmin(TbMenuAdminVO vo) throws Exception {
        delete("TbMenuAdminDAO.deleteTbMenuAdmin_S", vo);
    }

    /**
	 * t_menu_admin을 조회한다.
	 * @param vo - 조회할 정보가 담긴 TbMenuAdminVO
	 * @return 조회한 t_menu_admin
	 * @exception Exception
	 */
    public TbMenuAdminVO selectTbMenuAdmin(TbMenuAdminVO vo) throws Exception {
        return (TbMenuAdminVO) select("TbMenuAdminDAO.selectTbMenuAdmin_S", vo);
    }

    /**
	 * t_menu_admin 목록을 조회한다.
	 * @param searchMap - 조회할 정보가 담긴 Map
	 * @return t_menu_admin 목록
	 * @exception Exception
	 */
    public List<?> selectTbMenuAdminList(TbMenuAdminDefaultVO searchVO) throws Exception {
        return list("TbMenuAdminDAO.selectTbMenuAdminList_D", searchVO);
    }

    /**
	 * t_menu_admin 총 갯수를 조회한다.
	 * @param searchMap - 조회할 정보가 담긴 Map
	 * @return t_menu_admin 총 갯수
	 * @exception
	 */
    public int selectTbMenuAdminListTotCnt(TbMenuAdminDefaultVO searchVO) {
        return (Integer)select("TbMenuAdminDAO.selectTbMenuAdminListTotCnt_S", searchVO);
    }

}
