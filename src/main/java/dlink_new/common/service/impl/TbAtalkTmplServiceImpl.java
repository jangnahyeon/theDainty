package dlink_new.common.service.impl;

import java.math.BigInteger;
import java.util.List;

import javax.annotation.Resource;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import dlink_new.common.dao.MtsAtalkMsgDAO;
import dlink_new.common.dao.TbAtalkTmplDAO;
import dlink_new.common.service.TbAtalkTmplService;
import dlink_new.common.vo.MtsAtalkMsgVO;
import dlink_new.common.vo.TbAtalkTmplDefaultVO;
import dlink_new.common.vo.TbAtalkTmplVO;
// Vo 객체에 대한 import 구문
// import (vo package).TbAtalkTmplDefaultVO;
// import (vo package).TbAtalkTmplVO;
// Dao 객체에 대한 import 구문
// import (dao package).TbAtalkTmplDAO;
// Mapper 객체에 대한 import 구문
// import (mapper package).TbAtalkTmplMapper;
/**
 * @Class Name : TbAtalkTmplServiceImpl.java
 * @Description : TbAtalkTmpl Business Implement class
 * @Modification Information
 *
 * @author 김현재
 * @since 2023-02-07
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */

@Service("tbAtalkTmplService")
public class TbAtalkTmplServiceImpl extends EgovAbstractServiceImpl implements
        TbAtalkTmplService {
        
    private static final Logger LOGGER = LoggerFactory.getLogger(TbAtalkTmplServiceImpl.class);

//    @Resource(name="tbAtalkTmplMapper")
//    private TbAtalkTmplMapper tbAtalkTmplDAO;
    
    @Resource(name="tbAtalkTmplDAO")
    private TbAtalkTmplDAO tbAtalkTmplDAO;
    
    @Resource(name="mtsAtalkMsgDAO")
    private MtsAtalkMsgDAO mtsAtalkMsgDAO;
    
    /** ID Generation */
    //@Resource(name="{egovTbAtalkTmplIdGnrService}")    
    //private EgovIdGnrService egovIdGnrService;

	/**
	 * tb_atalk_tmpl을 등록한다.
	 * @param vo - 등록할 정보가 담긴 TbAtalkTmplVO
	 * @return 등록 결과
	 * @exception Exception
	 */
    public String insertTbAtalkTmpl(TbAtalkTmplVO vo) throws Exception {
    	LOGGER.debug(vo.toString());
    	
    	/** ID Generation Service */
    	//TODO 해당 테이블 속성에 따라 ID 제너레이션 서비스 사용
    	//String id = egovIdGnrService.getNextStringId();
    	//vo.setId(id);
    	LOGGER.debug(vo.toString());
    	
    	tbAtalkTmplDAO.insertTbAtalkTmpl(vo);
    	//TODO 해당 테이블 정보에 맞게 수정    	
        return null;
    }

    /**
	 * tb_atalk_tmpl을 수정한다.
	 * @param vo - 수정할 정보가 담긴 TbAtalkTmplVO
	 * @return void형
	 * @exception Exception
	 */
    public void updateTbAtalkTmpl(TbAtalkTmplVO vo) throws Exception {
        tbAtalkTmplDAO.updateTbAtalkTmpl(vo);
    }

    /**
	 * tb_atalk_tmpl을 삭제한다.
	 * @param vo - 삭제할 정보가 담긴 TbAtalkTmplVO
	 * @return void형 
	 * @exception Exception
	 */
    public void deleteTbAtalkTmpl(TbAtalkTmplVO vo) throws Exception {
        tbAtalkTmplDAO.deleteTbAtalkTmpl(vo);
    }

    /**
	 * tb_atalk_tmpl을 조회한다.
	 * @param vo - 조회할 정보가 담긴 TbAtalkTmplVO
	 * @return 조회한 tb_atalk_tmpl
	 * @exception Exception
	 */
    public TbAtalkTmplVO selectTbAtalkTmpl(TbAtalkTmplVO vo) throws Exception {
        TbAtalkTmplVO resultVO = tbAtalkTmplDAO.selectTbAtalkTmpl(vo);
        if (resultVO == null)
            throw processException("info.nodata.msg");
        return resultVO;
    }

    /**
	 * tb_atalk_tmpl 목록을 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return tb_atalk_tmpl 목록
	 * @exception Exception
	 */
    public List<?> selectTbAtalkTmplList(TbAtalkTmplDefaultVO searchVO) throws Exception {
        return tbAtalkTmplDAO.selectTbAtalkTmplList(searchVO);
    }

    /**
	 * tb_atalk_tmpl 총 갯수를 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return tb_atalk_tmpl 총 갯수
	 * @exception
	 */
    public int selectTbAtalkTmplListTotCnt(TbAtalkTmplDefaultVO searchVO) {
		return tbAtalkTmplDAO.selectTbAtalkTmplListTotCnt(searchVO);
	}
    
    /**
	 * mts_atalk_msg을 등록한다.
	 * @param vo - 등록할 정보가 담긴 MtsAtalkMsgVO
	 * @return 등록 결과
	 * @exception Exception
	 */
    public java.lang.Integer insertMtsAtalkMsg(TbAtalkTmplVO vo) throws Exception {
    	LOGGER.debug(vo.toString());
    	
    	/** ID Generation Service */
    	//TODO 해당 테이블 속성에 따라 ID 제너레이션 서비스 사용
    	//String id = egovIdGnrService.getNextStringId();
    	//vo.setId(id);
    	LOGGER.debug(vo.toString());
    	
    	if( !"Y".equals( vo.getUseYn() ) ) {
    		return 0;
    	}
    	
    	MtsAtalkMsgVO msgVO = new MtsAtalkMsgVO();
    	msgVO.setTranTmplCd(vo.getTmplCd());
    	msgVO.setTranSenderKey(vo.getTranSenderKey());
    	msgVO.setTranPhone(vo.getTranPhone());
    	msgVO.setTranMsg(vo.getTranMsg());
    	msgVO.setTranReplaceMsg(vo.getTranMsg());
    	msgVO.setTranCallback(vo.getTranPhone());
    	
    	java.lang.Integer tranPr = mtsAtalkMsgDAO.insertMtsAtalkMsg(msgVO);
    	//TODO 해당 테이블 정보에 맞게 수정    	
        return tranPr;
    }
    
}
