package dlink_new.admin.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import org.egovframe.rte.psl.dataaccess.EgovAbstractDAO;
import dlink_new.admin.vo.TbSisulRsvVO;
import dlink_new.admin.vo.TbSisulRsvDefaultVO;

/**
 * @Class Name : TbSisulRsvDAO.java
 * @Description : TbSisulRsv DAO Class
 * @Modification Information
 *
 * @author 김현재
 * @since 2023-01-21
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */

@Repository("tbSisulRsvDAO")
public class TbSisulRsvDAO extends EgovAbstractDAO {

	/**
	 * tb_sisul_rsv을 등록한다.
	 * @param vo - 등록할 정보가 담긴 TbSisulRsvVO
	 * @return 등록 결과
	 * @exception Exception
	 */
    public String insertTbSisulRsv(TbSisulRsvVO vo) throws Exception {
        return (String)insert("tbSisulRsvDAO.insertTbSisulRsv_S", vo);
    }

    /**
	 * tb_sisul_rsv을 수정한다.
	 * @param vo - 수정할 정보가 담긴 TbSisulRsvVO
	 * @return void형
	 * @exception Exception
	 */
    public void updateTbSisulRsv(TbSisulRsvVO vo) throws Exception {
        update("tbSisulRsvDAO.updateTbSisulRsv_S", vo);
    }

    /**
	 * tb_sisul_rsv을 삭제한다.
	 * @param vo - 삭제할 정보가 담긴 TbSisulRsvVO
	 * @return void형 
	 * @exception Exception
	 */
    public void deleteTbSisulRsv(TbSisulRsvVO vo) throws Exception {
        delete("tbSisulRsvDAO.deleteTbSisulRsv_S", vo);
    }

    /**
	 * tb_sisul_rsv을 조회한다.
	 * @param vo - 조회할 정보가 담긴 TbSisulRsvVO
	 * @return 조회한 tb_sisul_rsv
	 * @exception Exception
	 */
    public TbSisulRsvVO selectTbSisulRsv(TbSisulRsvVO vo) throws Exception {
        return (TbSisulRsvVO) select("tbSisulRsvDAO.selectTbSisulRsv_S", vo);
    }
    
    public List<?> selectTbSisulRsvReply(TbSisulRsvVO vo) {
    	return list("tbSisulRsvDAO.selectTbSisulRsvReply", vo);
	}


    /**
	 * tb_sisul_rsv 목록을 조회한다.
	 * @param searchMap - 조회할 정보가 담긴 Map
	 * @return tb_sisul_rsv 목록
	 * @exception Exception
	 */
    public List<?> selectTbSisulRsvList(TbSisulRsvVO searchVO) throws Exception {
        return list("tbSisulRsvDAO.selectTbSisulRsvList_D", searchVO);
    }

    /**
	 * tb_sisul_rsv 총 갯수를 조회한다.
	 * @param searchMap - 조회할 정보가 담긴 Map
	 * @return tb_sisul_rsv 총 갯수
	 * @exception
	 */
    public int selectTbSisulRsvListTotCnt(TbSisulRsvVO searchVO) {
        return (Integer)select("tbSisulRsvDAO.selectTbSisulRsvListTotCnt_S", searchVO);
    }

	public void insertRsvReply(TbSisulRsvVO searchVO) {
		insert("tbSisulRsvDAO.insertRsvReply", searchVO);
		
	}

	public void updateRsvReply(TbSisulRsvVO vo) {
		update("tbSisulRsvDAO.updateRsvReply", vo);
	}

	public void deleteRsvReply(TbSisulRsvVO vo) {
		delete("tbSisulRsvDAO.deleteRsvReply", vo);
	}

	public void updateTbSisulRsvAccept(TbSisulRsvVO vo) {
		update("tbSisulRsvDAO.updateTbSisulRsvAccept", vo);
		
	}

	public List<?> selectTbSisulRsvFileList(TbSisulRsvVO searchVO) throws Exception {
        return list("tbSisulRsvDAO.selectTbSisulRsvFileList", searchVO);
    }
	
	public List<?> selectSmBizFileList(TbSisulRsvVO searchVO) throws Exception {
        return list("tbSisulRsvDAO.selectSmBizFileList", searchVO);
    }

	public void updateRsvDt(TbSisulRsvVO vo) {
		update("tbSisulRsvDAO.updateRsvDt", vo);
		
	}

	public void updateZipFile(TbSisulRsvVO vo) {
		update("tbSisulRsvDAO.updateZipFile", vo);
		
	}

	public List<?> selectTbSisulRsvListExcel(TbSisulRsvVO searchVO) {
		return list("tbSisulRsvDAO.selectTbSisulRsvListExcel", searchVO);
	}


}
