package dlink.front.service;

import java.util.List;

import dlink.admin.vo.SearchVO;
import dlink.front.vo.FrontDsnBankVO;
import dlink.front.vo.TSelImgVO;

/**
 * @Class Name : TSelImgService.java
 * @Description : TSelImg Business class
 * @Modification Information
 *
 * @author 이효진
 * @since 2022-04-14
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */
public interface TSelImgService {
	
	/**
	 * t_sel_img을 등록한다.
	 * @param vo - 등록할 정보가 담긴 TSelImgVO
	 * @return 등록 결과
	 * @exception Exception
	 */
    String insertTSelImg(TSelImgVO vo) throws Exception;
    
    /**
	 * t_sel_img을 수정한다.
	 * @param vo - 수정할 정보가 담긴 TSelImgVO
	 * @return void형
	 * @exception Exception
	 */
    void updateTSelImg(TSelImgVO vo) throws Exception;
    
    /**
	 * t_sel_img을 삭제한다.
	 * @param vo - 삭제할 정보가 담긴 TSelImgVO
	 * @return void형 
	 * @exception Exception
	 */
    void deleteTSelImg(TSelImgVO vo) throws Exception;
    
    /**
	 * t_sel_img을 조회한다.
	 * @param vo - 조회할 정보가 담긴 TSelImgVO
	 * @return 조회한 t_sel_img
	 * @exception Exception
	 */
    TSelImgVO selectTSelImg(TSelImgVO vo) throws Exception;
    
    /**
	 * t_sel_img 목록을 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return t_sel_img 목록
	 * @exception Exception
	 */
    List selectTSelImgList(SearchVO searchVO) throws Exception;
    
    /**
	 * t_sel_img 총 갯수를 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return t_sel_img 총 갯수
	 * @exception
	 */
    int selectTSelImgListTotCnt(SearchVO searchVO);
    
    /** 관심정보 > 전문업체 */
    int selectTSelImgFavoriteCnt(TSelImgVO searchVO);
   
}
