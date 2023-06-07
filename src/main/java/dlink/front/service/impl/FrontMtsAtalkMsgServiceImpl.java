package dlink.front.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import dlink.front.service.FrontMtsAtalkMsgService;
import dlink.front.vo.MtsAtalkMsgDefaultVO;
import dlink.front.vo.MtsAtalkMsgVO;
import dlink.front.dao.FrontMtsAtalkMsgDAO;

/**
 * @Class Name : MtsAtalkMsgServiceImpl.java
 * @Description : MtsAtalkMsg Business Implement class
 * @Modification Information
 *
 * @author 이효진
 * @since 2022-04-07
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */

@Service("mtsAtalkMsgService")
public class FrontMtsAtalkMsgServiceImpl extends EgovAbstractServiceImpl implements
        FrontMtsAtalkMsgService {
        
    private static final Logger LOGGER = LoggerFactory.getLogger(FrontMtsAtalkMsgServiceImpl.class);

    @Resource(name="mtsAtalkMsgDAO")
    private FrontMtsAtalkMsgDAO mtsAtalkMsgDAO;
    
    /** ID Generation */
    //@Resource(name="{egovMtsAtalkMsgIdGnrService}")    
    //private EgovIdGnrService egovIdGnrService;

	/**
	 * mts_atalk_msg을 등록한다.
	 * @param vo - 등록할 정보가 담긴 MtsAtalkMsgVO
	 * @return 등록 결과
	 * @exception Exception
	 */
    public String insertMtsAtalkMsg(MtsAtalkMsgVO vo) throws Exception {
    	LOGGER.debug(vo.toString());
    	
    	/** ID Generation Service */
    	//TODO 해당 테이블 속성에 따라 ID 제너레이션 서비스 사용
    	//String id = egovIdGnrService.getNextStringId();
    	//vo.setId(id);
    	LOGGER.debug(vo.toString());
    	
    	mtsAtalkMsgDAO.insertMtsAtalkMsg(vo);
    	//TODO 해당 테이블 정보에 맞게 수정    	
        return null;
    }

    /**
	 * mts_atalk_msg을 수정한다.
	 * @param vo - 수정할 정보가 담긴 MtsAtalkMsgVO
	 * @return void형
	 * @exception Exception
	 */
    public void updateMtsAtalkMsg(MtsAtalkMsgVO vo) throws Exception {
        mtsAtalkMsgDAO.updateMtsAtalkMsg(vo);
    }

    /**
	 * mts_atalk_msg을 삭제한다.
	 * @param vo - 삭제할 정보가 담긴 MtsAtalkMsgVO
	 * @return void형 
	 * @exception Exception
	 */
    public void deleteMtsAtalkMsg(MtsAtalkMsgVO vo) throws Exception {
        mtsAtalkMsgDAO.deleteMtsAtalkMsg(vo);
    }

    /**
	 * mts_atalk_msg을 조회한다.
	 * @param vo - 조회할 정보가 담긴 MtsAtalkMsgVO
	 * @return 조회한 mts_atalk_msg
	 * @exception Exception
	 */
    public MtsAtalkMsgVO selectMtsAtalkMsg(MtsAtalkMsgVO vo) throws Exception {
        MtsAtalkMsgVO resultVO = mtsAtalkMsgDAO.selectMtsAtalkMsg(vo);
        if (resultVO == null)
            throw processException("info.nodata.msg");
        return resultVO;
    }

    /**
	 * mts_atalk_msg 목록을 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return mts_atalk_msg 목록
	 * @exception Exception
	 */
    public List<?> selectMtsAtalkMsgList(MtsAtalkMsgDefaultVO searchVO) throws Exception {
        return mtsAtalkMsgDAO.selectMtsAtalkMsgList(searchVO);
    }

    /**
	 * mts_atalk_msg 총 갯수를 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return mts_atalk_msg 총 갯수
	 * @exception
	 */
    public int selectMtsAtalkMsgListTotCnt(MtsAtalkMsgDefaultVO searchVO) {
		return mtsAtalkMsgDAO.selectMtsAtalkMsgListTotCnt(searchVO);
	}
    
}
