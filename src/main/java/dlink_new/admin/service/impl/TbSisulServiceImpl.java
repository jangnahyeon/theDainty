package dlink_new.admin.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import dlink_new.admin.dao.TbSisulDAO;
import dlink_new.admin.service.TbSisulService;
import dlink_new.admin.vo.TbSisulDefaultVO;
import dlink_new.admin.vo.TbSisulVO;
// Vo 객체에 대한 import 구문
// import (vo package).TbSisulDefaultVO;
// import (vo package).TbSisulVO;
// Dao 객체에 대한 import 구문
// import (dao package).TbSisulDAO;
// Mapper 객체에 대한 import 구문
// import (mapper package).TbSisulMapper;
/**
 * @Class Name : TbSisulServiceImpl.java
 * @Description : TbSisul Business Implement class
 * @Modification Information
 *
 * @author 김현재
 * @since 2023-01-21
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */

@Service("tbSisulService")
public class TbSisulServiceImpl extends EgovAbstractServiceImpl implements
        TbSisulService {
        
    private static final Logger LOGGER = LoggerFactory.getLogger(TbSisulServiceImpl.class);

//    @Resource(name="tbSisulMapper")
//    private TbSisulMapper tbSisulDAO;
    
    @Resource(name="tbSisulDAO")
    private TbSisulDAO tbSisulDAO;
    
    /** ID Generation */
    //@Resource(name="{egovTbSisulIdGnrService}")    
    //private EgovIdGnrService egovIdGnrService;

	/**
	 * tb_sisul을 등록한다.
	 * @param vo - 등록할 정보가 담긴 TbSisulVO
	 * @return 등록 결과
	 * @exception Exception
	 */
    public String insertTbSisul(TbSisulVO vo) throws Exception {
    	LOGGER.debug(vo.toString());
    	
    	/** ID Generation Service */
    	//TODO 해당 테이블 속성에 따라 ID 제너레이션 서비스 사용
    	//String id = egovIdGnrService.getNextStringId();
    	//vo.setId(id);
    	LOGGER.debug(vo.toString());
    	
    	tbSisulDAO.insertTbSisul(vo);
    	//TODO 해당 테이블 정보에 맞게 수정    	
        return null;
    }

    /**
	 * tb_sisul을 수정한다.
	 * @param vo - 수정할 정보가 담긴 TbSisulVO
	 * @return void형
	 * @exception Exception
	 */
    public void updateTbSisul(TbSisulVO vo) throws Exception {
        tbSisulDAO.updateTbSisul(vo);
    }

    /**
	 * tb_sisul을 삭제한다.
	 * @param vo - 삭제할 정보가 담긴 TbSisulVO
	 * @return void형 
	 * @exception Exception
	 */
    public void deleteTbSisul(TbSisulVO vo) throws Exception {
        tbSisulDAO.deleteTbSisul(vo);
    }

    /**
	 * tb_sisul을 조회한다.
	 * @param vo - 조회할 정보가 담긴 TbSisulVO
	 * @return 조회한 tb_sisul
	 * @exception Exception
	 */
    public TbSisulVO selectTbSisul(TbSisulVO vo) throws Exception {
        TbSisulVO resultVO = tbSisulDAO.selectTbSisul(vo);
        if (resultVO == null)
            throw processException("info.nodata.msg");
        return resultVO;
    }

    /**
	 * tb_sisul 목록을 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return tb_sisul 목록
	 * @exception Exception
	 */
    public List<?> selectTbSisulList(TbSisulDefaultVO searchVO) throws Exception {
        return tbSisulDAO.selectTbSisulList(searchVO);
    }

    /**
	 * tb_sisul 총 갯수를 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return tb_sisul 총 갯수
	 * @exception
	 */
    public int selectTbSisulListTotCnt(TbSisulDefaultVO searchVO) {
		return tbSisulDAO.selectTbSisulListTotCnt(searchVO);
	}
    
}
