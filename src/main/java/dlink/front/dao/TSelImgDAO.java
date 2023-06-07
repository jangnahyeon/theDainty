package dlink.front.dao;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.EgovAbstractDAO;
import org.springframework.stereotype.Repository;

import dlink.admin.vo.SearchVO;
import dlink.front.vo.FrontDsnBankVO;
import dlink.front.vo.TSelImgVO;


/**
 * @Class Name : TSelImgDAO.java
 * @Description : TSelImg DAO Class
 * @Modification Information
 *
 * @author 이효진
 * @since 2022-04-14
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */

@Repository("TSelImgDAO")
public class TSelImgDAO extends EgovAbstractDAO {

	/**
	 * t_sel_img을 등록한다.
	 * @param vo - 등록할 정보가 담긴 TSelImgVO
	 * @return 등록 결과
	 * @exception Exception
	 */
    public String insertTSelImg(TSelImgVO vo) throws Exception {
        return (String)insert("TSelImgDAO.insertTSelImg_S", vo);
    }

    /**
	 * t_sel_img을 수정한다.
	 * @param vo - 수정할 정보가 담긴 TSelImgVO
	 * @return void형
	 * @exception Exception
	 */
    public void updateTSelImg(TSelImgVO vo) throws Exception {
        update("TSelImgDAO.updateTSelImg_S", vo);
    }

    /**
	 * t_sel_img을 삭제한다.
	 * @param vo - 삭제할 정보가 담긴 TSelImgVO
	 * @return void형 
	 * @exception Exception
	 */
    public void deleteTSelImg(TSelImgVO vo) throws Exception {
        delete("TSelImgDAO.deleteTSelImg_S", vo);
    }

    /**
	 * t_sel_img을 조회한다.
	 * @param vo - 조회할 정보가 담긴 TSelImgVO
	 * @return 조회한 t_sel_img
	 * @exception Exception
	 */
    public TSelImgVO selectTSelImg(TSelImgVO vo) throws Exception {
        return (TSelImgVO) select("TSelImgDAO.selectTSelImg_S", vo);
    }

    /**
	 * t_sel_img 목록을 조회한다.
	 * @param searchMap - 조회할 정보가 담긴 Map
	 * @return t_sel_img 목록
	 * @exception Exception
	 */
    public List<?> selectTSelImgList(SearchVO searchVO) throws Exception {
        return list("TSelImgDAO.selectTSelImgList_D", searchVO);
    }

    /**
	 * t_sel_img 총 갯수를 조회한다.
	 * @param searchMap - 조회할 정보가 담긴 Map
	 * @return t_sel_img 총 갯수
	 * @exception
	 */
    public int selectTSelImgListTotCnt(SearchVO searchVO) {
        return (Integer)select("TSelImgDAO.selectTSelImgListTotCnt_S", searchVO);
    }
    
    public int selectTSelImgFavoriteCnt(TSelImgVO searchVO) {
        return (Integer)select("TSelImgDAO.selectTSelImgFavoriteCnt", searchVO);
    }

}
