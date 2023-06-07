package dlink.front.dao;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.EgovAbstractDAO;
import org.egovframe.rte.psl.dataaccess.util.EgovMap;
import org.springframework.stereotype.Repository;


import dlink.front.vo.TPtplInfoVO;

/**
 * @Class Name : FrontTPtplInfoDAO.java
 * @Description : TPtplInfo DAO Class
 * @Modification Information
 *
 * @author 장나현
 * @since 2022-03-31
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */

@Repository("FrontTPtplInfoDAO")
public class FrontTPtplInfoDAO extends EgovAbstractDAO {

	/**
	 * t_ptpl_info을 등록한다.
	 * @param vo - 등록할 정보가 담긴 TPtplInfoVO
	 * @return 등록 결과
	 * @exception Exception
	 */
    public void insertTPtplInfo(TPtplInfoVO vo) throws Exception {
        insert("FrontTPtplInfoDAO.insertTPtplInfo_S", vo);
    }
    public void insertTPtplInfoImg(TPtplInfoVO vo) throws Exception {
        insert("FrontTPtplInfoDAO.insertTPtplInfoImg", vo);
    }
    public void insertTPtplInfoMultiImg(TPtplInfoVO vo) throws Exception {
        insert("FrontTPtplInfoDAO.insertTPtplInfoMultiImg", vo);
    }
    
    

    /**
	 * t_ptpl_info을 수정한다.
	 * @param vo - 수정할 정보가 담긴 TPtplInfoVO
	 * @return void형
	 * @exception Exception
	 */
    public void updateTPtplInfo(TPtplInfoVO vo) throws Exception {
        update("FrontTPtplInfoDAO.updateTPtplInfo_S", vo);
    }

    /**
	 * t_ptpl_info을 삭제한다.
	 * @param vo - 삭제할 정보가 담긴 TPtplInfoVO
	 * @return void형 
	 * @exception Exception
	 */
    public void deleteTPtplInfo(TPtplInfoVO vo) throws Exception {
        delete("FrontTPtplInfoDAO.deleteTPtplInfo_S", vo);
    }
    public void deleteTPtplInfoImg(TPtplInfoVO vo) throws Exception {
        delete("FrontTPtplInfoDAO.deleteTPtplInfoImg", vo);
    }

    /**
	 * t_ptpl_info을 조회한다.
	 * @param vo - 조회할 정보가 담긴 TPtplInfoVO
	 * @return 조회한 t_ptpl_info
	 * @exception Exception
	 */
    public TPtplInfoVO selectTPtplInfo(TPtplInfoVO vo) throws Exception {
        return (TPtplInfoVO) select("FrontTPtplInfoDAO.selectTPtplInfo_S", vo);
    }

    /**
	 * t_ptpl_info 목록을 조회한다.
	 * @param searchMap - 조회할 정보가 담긴 Map
	 * @return t_ptpl_info 목록
	 * @exception Exception
	 */
    public List<?> selectTPtplInfoList(TPtplInfoVO searchVO) throws Exception {
        return list("FrontTPtplInfoDAO.selectTPtplInfoList_D", searchVO);
    }

    /**
	 * t_ptpl_info 총 갯수를 조회한다.
	 * @param searchMap - 조회할 정보가 담긴 Map
	 * @return t_ptpl_info 총 갯수
	 * @exception
	 */
    public int selectTPtplInfoListTotCnt(TPtplInfoVO searchVO) {
        return (Integer)select("FrontTPtplInfoDAO.selectTPtplInfoListTotCnt_S", searchVO);
    }
    
	public List<?> selectCategoryNm(EgovMap vo) {
		return list ("FrontTPtplInfoDAO.selectCategoryNm", vo);
	}

	public List<EgovMap> searchPortfolio(TPtplInfoVO vo) {
		return (List<EgovMap>) list ("FrontTPtplInfoDAO.searchPortfolio", vo);
	}
	
	public int selectPtplFavoriteCnt(TPtplInfoVO searchVO) {
		return (Integer)select("FrontTPtplInfoDAO.selectPtplFavoriteCnt", searchVO);
	}
	 
	public void insertPtplFavorite(TPtplInfoVO vo) throws Exception {
		insert("FrontTPtplInfoDAO.insertPtplFavorite", vo);
	}

	public void deleteTPtplFavorite(TPtplInfoVO vo) throws Exception {
        delete("FrontTPtplInfoDAO.deleteTPtplFavorite", vo);
    }
	
	
	 /**
 	 * 관심정보 포트폴리오 조회
 	 */
	    public List<?> selectInterestPtplList(TPtplInfoVO searchVO) throws Exception {
	        return list("FrontTPtplInfoDAO.selectInterestPtplList", searchVO);
	    }

	    /**
	  	 * 관심정보 포트폴리오 총 갯수
	  	 */
	    public int selectInterestPtplListTotCnt(TPtplInfoVO searchVO) {
	        return (Integer)select("FrontTPtplInfoDAO.selectInterestPtplListTotCnt", searchVO);
	    }
	    
}
