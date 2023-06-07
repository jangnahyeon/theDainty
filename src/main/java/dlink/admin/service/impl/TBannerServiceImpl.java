package dlink.admin.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import dlink.admin.service.TBannerService;
import dlink.admin.vo.SearchVO;
import dlink.admin.vo.TBannerVO;
import dlink.admin.dao.TBannerDAO;

/**
 * @Class Name : TBannerServiceImpl.java
 * @Description : TBanner Business Implement class
 * @Modification Information
 *
 * @author 안성찬
 * @since 2022-03-30
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */

@Service("TBannerService")
public class TBannerServiceImpl extends EgovAbstractServiceImpl implements
        TBannerService {
        
    private static final Logger LOGGER = LoggerFactory.getLogger(TBannerServiceImpl.class);

    @Resource(name="TBannerDAO")
    private TBannerDAO TBannerDAO;
    
    /** ID Generation */
    //@Resource(name="{egovTBannerIdGnrService}")    
    //private EgovIdGnrService egovIdGnrService;

	/**
	 * t_banner을 등록한다.
	 * @param vo - 등록할 정보가 담긴 TBannerVO
	 * @return 등록 결과
	 * @exception Exception
	 */
    public String insertTBanner(TBannerVO vo) throws Exception {
    	LOGGER.debug(vo.toString());
    	
    	/** ID Generation Service */
    	//TODO 해당 테이블 속성에 따라 ID 제너레이션 서비스 사용
    	//String id = egovIdGnrService.getNextStringId();
    	//vo.setId(id);
    	LOGGER.debug(vo.toString());
    	
    	TBannerDAO.insertTBanner(vo);
    	//TODO 해당 테이블 정보에 맞게 수정    	
        return null;
    }

    /**
	 * t_banner을 수정한다.
	 * @param vo - 수정할 정보가 담긴 TBannerVO
	 * @return void형
	 * @exception Exception
	 */
    public void updateTBanner(TBannerVO vo) throws Exception {
        TBannerDAO.updateTBanner(vo);
    }

    /**
	 * t_banner을 삭제한다.
	 * @param vo - 삭제할 정보가 담긴 TBannerVO
	 * @return void형 
	 * @exception Exception
	 */
    public void deleteTBanner(TBannerVO vo) throws Exception {
        TBannerDAO.deleteTBanner(vo);
    }

    /**
	 * t_banner을 조회한다.
	 * @param vo - 조회할 정보가 담긴 TBannerVO
	 * @return 조회한 t_banner
	 * @exception Exception
	 */
    public TBannerVO selectTBanner(TBannerVO vo) throws Exception {
        TBannerVO resultVO = TBannerDAO.selectTBanner(vo);
        if (resultVO == null)
            throw processException("info.nodata.msg");
        return resultVO;
    }

    /**
	 * t_banner 목록을 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return t_banner 목록
	 * @exception Exception
	 */
    public List<?> selectTBannerList(TBannerVO searchVO) throws Exception {
        return TBannerDAO.selectTBannerList(searchVO);
    }

    /**
	 * t_banner 총 갯수를 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return t_banner 총 갯수
	 * @exception
	 */
    public int selectTBannerListTotCnt(TBannerVO searchVO) {
		return TBannerDAO.selectTBannerListTotCnt(searchVO);
	}
    
}
