package dlink.common.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import dlink.common.service.MtsAtalkAuthService;
import dlink.common.vo.MtsAtalkAuthVO;
import dlink.common.vo.SearchVO;
import dlink.common.dao.MtsAtalkAuthDAO;

/**
 * @Class Name : MtsAtalkAuthServiceImpl.java
 * @Description : MtsAtalkAuth Business Implement class
 * @Modification Information
 *
 * @author 이은지
 * @since 2022-05-03
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */

@Service("MtsAtalkAuthService")
public class MtsAtalkAuthServiceImpl extends EgovAbstractServiceImpl implements
MtsAtalkAuthService {
        
    private static final Logger LOGGER = LoggerFactory.getLogger(MtsAtalkAuthServiceImpl.class);

    @Resource(name="mtsAtalkAuthDAO")
    private MtsAtalkAuthDAO mtsAtalkAuthDAO;
    
    /** ID Generation */
    //@Resource(name="{egovMtsAtalkAuthIdGnrService}")    
    //private EgovIdGnrService egovIdGnrService;

	/**
	 * mts_atalk_auth을 등록한다.
	 * @param vo - 등록할 정보가 담긴 MtsAtalkAuthVO
	 * @return 등록 결과
	 * @exception Exception
	 */
    public String insertMtsAtalkAuth(MtsAtalkAuthVO vo) throws Exception {
    	LOGGER.debug(vo.toString());
    	
    	/** ID Generation Service */
    	//TODO 해당 테이블 속성에 따라 ID 제너레이션 서비스 사용
    	//String id = egovIdGnrService.getNextStringId();
    	//vo.setId(id);
    	LOGGER.debug(vo.toString());
    	
    	String suc = mtsAtalkAuthDAO.insertMtsAtalkAuth(vo);
    	//TODO 해당 테이블 정보에 맞게 수정    	
        return null;
    }
	  
    /**
	 * mts_atalk_auth을 수정한다.
	 * @param vo - 수정할 정보가 담긴 MtsAtalkAuthVO
	 * @return void형
	 * @exception Exception
	 */
    public void updateMtsAtalkAuth(MtsAtalkAuthVO vo) throws Exception {
        mtsAtalkAuthDAO.updateMtsAtalkAuth(vo);
    }

    /**
	 * mts_atalk_auth을 삭제한다.
	 * @param vo - 삭제할 정보가 담긴 MtsAtalkAuthVO
	 * @return void형 
	 * @exception Exception
	 */
    public void deleteMtsAtalkAuth(MtsAtalkAuthVO vo) throws Exception {
        mtsAtalkAuthDAO.deleteMtsAtalkAuth(vo);
    }

    /**
	 * mts_atalk_auth을 조회한다.
	 * @param vo - 조회할 정보가 담긴 MtsAtalkAuthVO
	 * @return 조회한 mts_atalk_auth
	 * @exception Exception
	 */
    public MtsAtalkAuthVO selectMtsAtalkAuth(MtsAtalkAuthVO vo) throws Exception {
        MtsAtalkAuthVO resultVO = mtsAtalkAuthDAO.selectMtsAtalkAuth(vo);
        if (resultVO == null)
            throw processException("info.nodata.msg");
        return resultVO;
    }

    /**
	 * mts_atalk_auth 목록을 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return mts_atalk_auth 목록
	 * @exception Exception
	 */
    public List<?> selectMtsAtalkAuthList(SearchVO searchVO) throws Exception {
        return mtsAtalkAuthDAO.selectMtsAtalkAuthList(searchVO);
    }

    /**
	 * mts_atalk_auth 총 갯수를 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return mts_atalk_auth 총 갯수
	 * @exception
	 */
    public int selectMtsAtalkAuthListTotCnt(MtsAtalkAuthVO vo) {
		return mtsAtalkAuthDAO.selectMtsAtalkAuthListTotCnt(vo);
	}

	
    
}
