package dlink_new.admin.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import org.egovframe.rte.psl.dataaccess.EgovAbstractDAO;
import dlink_new.admin.vo.TbPortfVO;
import dlink_new.admin.vo.TbPortfDefaultVO;

/**
 * @Class Name : TbPortfDAO.java
 * @Description : TbPortf DAO Class
 * @Modification Information
 *
 * @author 김현재
 * @since 2023-01-21
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */

@Repository("tbPortfDAO")
public class TbPortfDAO extends EgovAbstractDAO {

	/**
	 * tb_portf을 등록한다.
	 * @param vo - 등록할 정보가 담긴 TbPortfVO
	 * @return 등록 결과
	 * @exception Exception
	 */
    public String insertTbPortf(TbPortfVO vo) throws Exception {
        return (String)insert("tbPortfDAO.insertTbPortf_S", vo);
    }

    /**
	 * tb_portf을 수정한다.
	 * @param vo - 수정할 정보가 담긴 TbPortfVO
	 * @return void형
	 * @exception Exception
	 */
    public void updateTbPortf(TbPortfVO vo) throws Exception {
        update("tbPortfDAO.updateTbPortf_S", vo);
    }

    /**
	 * tb_portf을 삭제한다.
	 * @param vo - 삭제할 정보가 담긴 TbPortfVO
	 * @return void형 
	 * @exception Exception
	 */
    public void deleteTbPortf(TbPortfVO vo) throws Exception {
        delete("tbPortfDAO.deleteTbPortf_S", vo);
    }

    /**
	 * tb_portf을 조회한다.
	 * @param vo - 조회할 정보가 담긴 TbPortfVO
	 * @return 조회한 tb_portf
	 * @exception Exception
	 */
    public TbPortfVO selectTbPortf(TbPortfVO vo) throws Exception {
        return (TbPortfVO) select("tbPortfDAO.selectTbPortf_S", vo);
    }

    /**
	 * tb_portf 목록을 조회한다.
	 * @param searchMap - 조회할 정보가 담긴 Map
	 * @return tb_portf 목록
	 * @exception Exception
	 */
    public List<?> selectTbPortfList(TbPortfVO searchVO) throws Exception {
        return list("tbPortfDAO.selectTbPortfList_D", searchVO);
    }
    
    public List<?> selectOrderNoList(TbPortfVO searchVO) throws Exception{
    	return list("tbPortfDAO.selectOrderNoList", searchVO);
    }

    /**
	 * tb_portf 총 갯수를 조회한다.
	 * @param searchMap - 조회할 정보가 담긴 Map
	 * @return tb_portf 총 갯수
	 * @exception
	 */
    public int selectTbPortfListTotCnt(TbPortfVO searchVO) {
        return (Integer)select("tbPortfDAO.selectTbPortfListTotCnt_S", searchVO);
    }

}
