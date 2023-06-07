package dlink_new.admin.service;

import java.util.List;
// Vo 객체에 대한 import 구문
// import (vo package).TbPopupDefaultVO;
// import (vo package).TbBannerVO;

import dlink_new.admin.vo.TbBannerDefaultVO;
import dlink_new.admin.vo.TbBannerVO;

/**
 * @Class Name : TbPopupService.java
 * @Description : TbPopup Business class
 * @Modification Information
 *
 * @author 김준영
 * @since 2023-03-23
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */
public interface TbBannerService {
	
	/**
	 * tb_popup을 등록한다.
	 * @param vo - 등록할 정보가 담긴 TbBannerVO
	 * @return 등록 결과
	 * @exception Exception
	 */
    String insertTbBanner(TbBannerVO vo) throws Exception;
    
    /**
	 * tb_popup을 수정한다.
	 * @param vo - 수정할 정보가 담긴 TbBannerVO
	 * @return void형
	 * @exception Exception
	 */
    void updateTbBanner(TbBannerVO vo) throws Exception;
//    
//    /**
//	 * tb_popup을 삭제한다.
//	 * @param vo - 삭제할 정보가 담긴 TbBannerVO
//	 * @return void형 
//	 * @exception Exception
//	 */
    void deleteTbBanner(TbBannerVO vo) throws Exception;
//    
//    /**
//	 * tb_popup을 조회한다.
//	 * @param vo - 조회할 정보가 담긴 TbBannerVO
//	 * @return 조회한 tb_popup
//	 * @exception Exception
//	 */
	TbBannerVO selectTbPopup(TbBannerVO vo) throws Exception;
//    
//    /**
//	 * tb_popup 목록을 조회한다.
//	 * @param searchVO - 조회할 정보가 담긴 VO
//	 * @return tb_popup 목록
//	 * @exception Exception
//	 */
    List selectTbBannerList(TbBannerDefaultVO searchVO) throws Exception;
//    
//    /**
//	 * tb_popup 총 갯수를 조회한다.
//	 * @param searchVO - 조회할 정보가 담긴 VO
//	 * @return tb_popup 총 갯수
//	 * @exception
//	 */
    int selectTbPopupListTotCnt(TbBannerDefaultVO searchVO) throws Exception;

	List<?> selectMainBannerList(TbBannerVO bannerVO)throws Exception;
    
}
