package dlink.admin.service;

import java.util.List;

import dlink.admin.vo.SearchVO;
import dlink.admin.vo.TBannerVO;

/**
 * @Class Name : TBannerService.java
 * @Description : TBanner Business class
 * @Modification Information
 *
 * @author 안성찬
 * @since 2022-03-30
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */
public interface TBannerService {
	
	/**
	 * t_banner을 등록한다.
	 * @param vo - 등록할 정보가 담긴 TBannerVO
	 * @return 등록 결과
	 * @exception Exception
	 */
    String insertTBanner(TBannerVO vo) throws Exception;
    
    /**
	 * t_banner을 수정한다.
	 * @param vo - 수정할 정보가 담긴 TBannerVO
	 * @return void형
	 * @exception Exception
	 */
    void updateTBanner(TBannerVO vo) throws Exception;
    
    /**
	 * t_banner을 삭제한다.
	 * @param vo - 삭제할 정보가 담긴 TBannerVO
	 * @return void형 
	 * @exception Exception
	 */
    void deleteTBanner(TBannerVO vo) throws Exception;
    
    /**
	 * t_banner을 조회한다.
	 * @param vo - 조회할 정보가 담긴 TBannerVO
	 * @return 조회한 t_banner
	 * @exception Exception
	 */
    TBannerVO selectTBanner(TBannerVO vo) throws Exception;
    
    /**
	 * t_banner 목록을 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return t_banner 목록
	 * @exception Exception
	 */
    List selectTBannerList(TBannerVO searchVO) throws Exception;
    
    /**
	 * t_banner 총 갯수를 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return t_banner 총 갯수
	 * @exception
	 */
    int selectTBannerListTotCnt(TBannerVO searchVO);
    
}
