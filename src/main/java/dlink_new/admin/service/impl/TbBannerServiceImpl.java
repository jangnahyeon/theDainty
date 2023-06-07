package dlink_new.admin.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.egovframe.rte.fdl.idgnr.EgovIdGnrService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import dlink_new.admin.dao.TbBannerDAO;
import dlink_new.admin.service.TbBannerService;
import dlink_new.admin.vo.TbBannerDefaultVO;
import dlink_new.admin.vo.TbBannerVO;
// Vo 객체에 대한 import 구문
// import (vo package).TbPopupDefaultVO;
// import (vo package).TbBannerVO;
// Dao 객체에 대한 import 구문
// import (dao package).tbBannerDAO;
// Mapper 객체에 대한 import 구문
// import (mapper package).TbPopupMapper;
/**
 * @Class Name : TbPopupServiceImpl.java
 * @Description : TbPopup Business Implement class
 * @Modification Information
 *
 * @author 김준영
 * @since 2023-03-23
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */

@Service("tbBannerService")
public class TbBannerServiceImpl extends EgovAbstractServiceImpl implements
        TbBannerService {
        
    private static final Logger LOGGER = LoggerFactory.getLogger(TbBannerServiceImpl.class);

    @Resource(name="tbBannerDAO")
    private TbBannerDAO tbBannerDAO;
    
    /** ID Generation */
//    @Resource(name="{egovTbPopupIdGnrService}")    
//    private EgovIdGnrService egovIdGnrService;

	/**
	 * tb_popup을 등록한다.
	 * @param vo - 등록할 정보가 담긴 TbBannerVO
	 * @return 등록 결과
	 * @exception Exception
	 */
    public String insertTbBanner(TbBannerVO vo) throws Exception {
    	LOGGER.debug(vo.toString());
    	
    	/** ID Generation Service */
    	//TODO 해당 테이블 속성에 따라 ID 제너레이션 서비스 사용
    	//String id = egovIdGnrService.getNextStringId();
    	//vo.setId(id);
    	LOGGER.debug(vo.toString());
    	
    	tbBannerDAO.insertTbBanner(vo);
    	//TODO 해당 테이블 정보에 맞게 수정    	
        return null;
    }

    /**
	 * tb_popup을 수정한다.
	 * @param vo - 수정할 정보가 담긴 TbBannerVO
	 * @return void형
	 * @exception Exception
	 */
    public void updateTbBanner(TbBannerVO vo) throws Exception {
        tbBannerDAO.updateTbPopup(vo);
    }

    /**
	 * tb_popup을 삭제한다.
	 * @param vo - 삭제할 정보가 담긴 TbBannerVO
	 * @return void형 
	 * @exception Exception
	 */
    public void deleteTbBanner(TbBannerVO vo) throws Exception {
        tbBannerDAO.deleteTbPopup(vo);
    }

    /**
	 * tb_popup을 조회한다.
	 * @param vo - 조회할 정보가 담긴 TbBannerVO
	 * @return 조회한 tb_popup
	 * @exception Exception
	 */
    public TbBannerVO selectTbPopup(TbBannerVO vo) throws Exception {
        TbBannerVO resultVO = tbBannerDAO.selectTbPopup(vo);
        if (resultVO == null)
            throw processException("info.nodata.msg");
        return resultVO;
    }

    /**
	 * tb_popup 목록을 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return tb_popup 목록
	 * @exception Exception
	 */
    public List<?> selectTbBannerList(TbBannerDefaultVO searchVO) throws Exception {
        return tbBannerDAO.selectTbBannerList(searchVO);
    }

    /**
	 * tb_popup 총 갯수를 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return tb_popup 총 갯수
	 * @exception
	 */
    public int selectTbPopupListTotCnt(TbBannerDefaultVO searchVO) throws Exception {
		return tbBannerDAO.selectTbPopupListTotCnt(searchVO);
	}
    
    public List<?> selectMainBannerList(TbBannerVO searchVO) throws Exception {
        return tbBannerDAO.selectMainBannerList(searchVO);
    }
    
}
