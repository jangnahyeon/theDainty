package dlink_new.admin.dao;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.EgovAbstractDAO;
import org.springframework.stereotype.Repository;

import dlink_new.admin.vo.TbSisulHldDefaultVO;
import dlink_new.admin.vo.TbSisulHldVO;
import dlink_new.admin.vo.TbSisulVO;

/**
 * @Class Name : TbSisulHldDAO.java
 * @Description : TbSisulHld DAO Class
 * @Modification Information
 *
 * @author 이재욱
 * @since 2023-03-08
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */

@Repository("tbSisulHldDAO")
public class TbSisulHldDAO extends EgovAbstractDAO {

	/**
	 * tb_sisul_hld을 등록한다.
	 * @param vo - 등록할 정보가 담긴 TbSisulHldVO
	 * @return 등록 결과
	 * @exception Exception
	 */
    public String insertTbSisulHld(TbSisulHldVO vo) throws Exception {
        return (String)insert("tbSisulHldDAO.insertTbSisulHld_S", vo);
    }

    /**
	 * tb_sisul_hld을 수정한다.
	 * @param vo - 수정할 정보가 담긴 TbSisulHldVO
	 * @return void형
	 * @exception Exception
	 */
    public void updateTbSisulHld(TbSisulHldVO vo) throws Exception {
        update("tbSisulHldDAO.updateTbSisulHld_S", vo);
    }

    /**
	 * tb_sisul_hld을 삭제한다.
	 * @param vo - 삭제할 정보가 담긴 TbSisulHldVO
	 * @return void형 
	 * @exception Exception
	 */
    public void deleteTbSisulHld(TbSisulHldVO vo) throws Exception {
        delete("tbSisulHldDAO.deleteTbSisulHld_S", vo);
    }

    /**
	 * tb_sisul_hld을 조회한다.
	 * @param vo - 조회할 정보가 담긴 TbSisulHldVO
	 * @return 조회한 tb_sisul_hld
	 * @exception Exception
	 */
    public List<?> selectTbSisulHld(TbSisulHldDefaultVO searchVO) throws Exception{
    	return list("tbSisulHldDAO.selectTbSisulHld_S", searchVO);
    }
    
    public List<?> selectTbSisulHld_L(TbSisulHldDefaultVO searchVO) throws Exception{
    	return list("tbSisulHldDAO.selectTbSisulHld_L", searchVO);
    }
    
    public TbSisulHldVO selectTbSisulHldDetail(TbSisulHldVO vo) throws Exception{
    	return (TbSisulHldVO) select("tbSisulHldDAO.selectTbSisulHldDetail", vo);
    }

    /**
	 * tb_sisul_hld 목록을 조회한다.
	 * @param searchMap - 조회할 정보가 담긴 Map
	 * @return tb_sisul_hld 목록
	 * @exception Exception
	 */
    public List<?> selectTbSisulHldList(TbSisulHldDefaultVO searchVO) throws Exception {
        return list("tbSisulHldDAO.selectTbSisulHldList_D", searchVO);
    }

    /**
	 * tb_sisul_hld 총 갯수를 조회한다.
	 * @param searchMap - 조회할 정보가 담긴 Map
	 * @return tb_sisul_hld 총 갯수
	 * @exception
	 */
    public int selectTbSisulHldListTotCnt(TbSisulHldDefaultVO searchVO) {
        return (Integer)select("tbSisulHldDAO.selectTbSisulHldListTotCnt_S", searchVO);
    }

}
