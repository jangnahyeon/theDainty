package dlink_new.front.dao;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.EgovAbstractDAO;
import org.springframework.stereotype.Repository;

import dlink_new.front.vo.TbSisulRsvDefaultVO;
import dlink_new.front.vo.TbSisulRsvFileVO;
import dlink_new.front.vo.TbSisulRsvVO;

/**
 * @Class Name : frontDsnStdDAO.java
 * @Description : TbSisulRsv DAO Class
 * @Modification Information
 *
 * @author 이재욱
 * @since 2023-01-16
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */

@Repository("frontDsnStdDAO")
public class FrontDsnStdDAO extends EgovAbstractDAO {

	/**
	 * tb_sisul_rsv을 등록한다.
	 * @param vo - 등록할 정보가 담긴 TbSisulRsvVO
	 * @return 등록 결과
	 * @exception Exception
	 */
    public int insertTbSisulRsvForm(TbSisulRsvVO vo) throws Exception{
    	return (Integer)insert("frontDsnStdDAO.insertTbSisulRsvForm", vo);
    }
    
    
    public void insertTbSisulRsvImgInfo(TbSisulRsvVO vo) throws Exception {
        insert("frontDsnStdDAO.insertTbSisulRsvImgInfo", vo);
    }

    public void insertTbSisulRsvMultiImg(TbSisulRsvVO vo) throws Exception{
    	insert("frontDsnStdDAO.insertTbSisulRsvMultImg", vo);
    }
    
    /**
	 * tb_sisul_rsv을 수정한다.
	 * @param vo - 수정할 정보가 담긴 TbSisulRsvVO
	 * @return void형
	 * @exception Exception
	 */
    public void updateTbSisulRsv(TbSisulRsvVO vo) throws Exception {
        update("frontDsnStdDAO.updateTbSisulRsv_S", vo);
    }

    /**
	 * tb_sisul_rsv을 삭제한다.
	 * @param vo - 삭제할 정보가 담긴 TbSisulRsvVO
	 * @return void형 
	 * @exception Exception
	 */
    public void deleteTbSisulRsv(TbSisulRsvVO vo) throws Exception {
        delete("frontDsnStdDAO.deleteTbSisulRsv_S", vo);
    }

    /**
	 * tb_sisul_rsv을 조회한다.
	 * @param vo - 조회할 정보가 담긴 TbSisulRsvVO
	 * @return 조회한 tb_sisul_rsv
	 * @exception Exception
	 */
    public List<?> selectTbSisulRsv(TbSisulRsvVO vo) throws Exception {
		return list("frontDsnStdDAO.selectTbSisulRsv_S", vo);
    }

    public List<?> selectTbSisulRsv_L(TbSisulRsvVO vo) throws Exception {
		return list("frontDsnStdDAO.selectTbSisulRsv_L", vo);
    }
    /**
	 * tb_sisul_rsv 목록을 조회한다.
	 * @param searchMap - 조회할 정보가 담긴 Map
	 * @return tb_sisul_rsv 목록
	 * @exception Exception
	 */
    public List<?> selectTbSisulRsvList_D(TbSisulRsvVO searchVO) throws Exception {
        return list("frontDsnStdDAO.selectTbSisulRsvList_D", searchVO);
    }

	
	public List<?> selectTbSisulRsvList_M(TbSisulRsvVO vo) throws Exception{
    	return list("frontDsnStdDAO.selectTbSisulRsvList_M", vo);
	}
    /**
	 * tb_sisul_rsv 총 갯수를 조회한다.
	 * @param searchMap - 조회할 정보가 담긴 Map
	 * @return tb_sisul_rsv 총 갯수
	 * @exception
	 */
    public int selectTbSisulRsvListTotCnt(TbSisulRsvVO searchVO) {
        return (Integer)select("frontDsnStdDAO.selectTbSisulRsvListTotCnt_S", searchVO);
    }
    
    public int selectTbSisulRsvListTotCnt_M(TbSisulRsvVO searchVO) {
        return (Integer)select("frontDsnStdDAO.selectTbSisulRsvListTotCnt_M", searchVO);
    }
    /**
	 * tb_sisul_rsv 예약번호를 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return tb_sisul_rsv 예약번호와 같은 정보
	 * @exception
	 */
    public TbSisulRsvVO selectTbSisulRsvSeq(TbSisulRsvVO vo) throws Exception{
    	return (TbSisulRsvVO) select("frontDsnStdDAO.selectTbSisulRsvSeq", vo);
    }

    /**
	 * tb_sisul_rsv_file 예약번호를 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return tb_sisul_rsv_file 예약번호와 같은 정보
	 * @exception
	 */
	public List<?> selectTbSisulRsvSeqList(TbSisulRsvFileVO vo) throws Exception{
    	return list("frontDsnStdDAO.selectTbSisulRsvSeqList", vo);
	}
    /**
	 * tb_sisul_rsv 수정한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return tb_sisul_rsv 수정
	 * @exception
	 */
	public void updateSisulRsvReadCnt(TbSisulRsvVO vo)throws Exception{
		update("frontDsnStdDAO.updateSisulRsvReadCnt", vo);
	}


	public List<?> selectTbSisulRsvReply(TbSisulRsvVO vo) throws Exception{
		return list("frontDsnStdDAO.selectTbSisulRsvReply", vo);
	}


	public void sisulRsvCancle(TbSisulRsvVO vo) throws Exception{
		update("frontDsnStdDAO.sisulRsvCancle", vo);
	}
}
