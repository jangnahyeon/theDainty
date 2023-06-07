package dlink_new.admin.dao;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.EgovAbstractDAO;
import org.springframework.stereotype.Repository;

import dlink_new.admin.vo.TbBannerDefaultVO;
import dlink_new.admin.vo.TbBannerVO;

/**
 * @Class Name : TbPopupDAO.java
 * @Description : TbPopup DAO Class
 * @Modification Information
 *
 * @author 김준영
 * @since 2023-03-23
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */

@Repository("tbBannerDAO")
public class TbBannerDAO extends EgovAbstractDAO {

	/**
	 * tb_popup을 등록한다.
	 * @param vo - 등록할 정보가 담긴 TbBannerVO
	 * @return 등록 결과
	 * @exception Exception
	 */
    public String insertTbBanner(TbBannerVO vo) throws Exception {
        return (String)insert("tbPopupDAO.insertTbBanner", vo);
    }

    /**
	 * tb_popup을 수정한다.
	 * @param vo - 수정할 정보가 담긴 TbBannerVO
	 * @return void형
	 * @exception Exception
	 */
    public void updateTbPopup(TbBannerVO vo) throws Exception {
        update("tbPopupDAO.updateTbPopup_S", vo);
    }

    /**
	 * tb_popup을 삭제한다.
	 * @param vo - 삭제할 정보가 담긴 TbBannerVO
	 * @return void형 
	 * @exception Exception
	 */
    public void deleteTbPopup(TbBannerVO vo) throws Exception {
        delete("tbPopupDAO.deleteTbPopup_S", vo);
    }

    /**
	 * tb_popup을 조회한다.
	 * @param vo - 조회할 정보가 담긴 TbBannerVO
	 * @return 조회한 tb_popup
	 * @exception Exception
	 */
    public TbBannerVO selectTbPopup(TbBannerVO vo) throws Exception {
        return (TbBannerVO) select("tbPopupDAO.selectTbPopup_S", vo);
    }

    /**
	 * tb_popup 목록을 조회한다.
	 * @param searchMap - 조회할 정보가 담긴 Map
	 * @return tb_popup 목록
	 * @exception Exception
	 */
    public List<?> selectTbBannerList(TbBannerDefaultVO searchVO) throws Exception {
        return list("tbPopupDAO.selectTbBannerList_D", searchVO);
    }

    /**
	 * tb_popup 총 갯수를 조회한다.
	 * @param searchMap - 조회할 정보가 담긴 Map
	 * @return tb_popup 총 갯수
	 * @exception
	 */
    public int selectTbPopupListTotCnt(TbBannerDefaultVO searchVO) {
        return (Integer)select("tbPopupDAO.selectTbPopupListTotCnt_S", searchVO);
    }

	public List<?> selectMainBannerList(TbBannerVO searchVO) {
		return list("tbPopupDAO.selectMainBannerList", searchVO);
	}

}
