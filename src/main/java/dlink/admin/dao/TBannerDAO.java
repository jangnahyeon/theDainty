package dlink.admin.dao;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.EgovAbstractDAO;
import org.springframework.stereotype.Repository;


import dlink.admin.vo.TBannerVO;
import dlink.admin.vo.SearchVO;

/**
 * @Class Name : TBannerDAO.java
 * @Description : TBanner DAO Class
 * @Modification Information
 *
 * @author 안성찬
 * @since 2022-03-30
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */

@Repository("TBannerDAO")
public class TBannerDAO extends EgovAbstractDAO {

	/**
	 * t_banner을 등록한다.
	 * @param vo - 등록할 정보가 담긴 TBannerVO
	 * @return 등록 결과
	 * @exception Exception
	 */
    public String insertTBanner(TBannerVO vo) throws Exception {
        return (String)insert("TBannerDAO.insertTBanner_S", vo);
    }

    /**
	 * t_banner을 수정한다.
	 * @param vo - 수정할 정보가 담긴 TBannerVO
	 * @return void형
	 * @exception Exception
	 */
    public void updateTBanner(TBannerVO vo) throws Exception {
        update("TBannerDAO.updateTBanner_S", vo);
    }

    /**
	 * t_banner을 삭제한다.
	 * @param vo - 삭제할 정보가 담긴 TBannerVO
	 * @return void형 
	 * @exception Exception
	 */
    public void deleteTBanner(TBannerVO vo) throws Exception {
        delete("TBannerDAO.deleteTBanner_S", vo);
    }

    /**
	 * t_banner을 조회한다.
	 * @param vo - 조회할 정보가 담긴 TBannerVO
	 * @return 조회한 t_banner
	 * @exception Exception
	 */
    public TBannerVO selectTBanner(TBannerVO vo) throws Exception {
        return (TBannerVO) select("TBannerDAO.selectTBanner_S", vo);
    }

    /**
	 * t_banner 목록을 조회한다.
	 * @param searchMap - 조회할 정보가 담긴 Map
	 * @return t_banner 목록
	 * @exception Exception
	 */
    public List<?> selectTBannerList(TBannerVO searchVO) throws Exception {
        return list("TBannerDAO.selectTBannerList_D", searchVO);
    }

    /**
	 * t_banner 총 갯수를 조회한다.
	 * @param searchMap - 조회할 정보가 담긴 Map
	 * @return t_banner 총 갯수
	 * @exception
	 */
    public int selectTBannerListTotCnt(TBannerVO searchVO) {
        return (Integer)select("TBannerDAO.selectTBannerListTotCnt_S", searchVO);
    }

}
