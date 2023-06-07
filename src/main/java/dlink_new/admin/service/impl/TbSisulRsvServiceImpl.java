package dlink_new.admin.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import dlink_new.admin.dao.TbSisulRsvDAO;
import dlink_new.admin.service.TbSisulRsvService;
import dlink_new.admin.vo.TImgInfo;
import dlink_new.admin.vo.TbSisulRsvDefaultVO;
import dlink_new.admin.vo.TbSisulRsvVO;
// Vo 객체에 대한 import 구문
// import (vo package).TbSisulRsvDefaultVO;
// import (vo package).TbSisulRsvVO;
// Dao 객체에 대한 import 구문
// import (dao package).TbSisulRsvDAO;
// Mapper 객체에 대한 import 구문
// import (mapper package).TbSisulRsvMapper;
/**
 * @Class Name : TbSisulRsvServiceImpl.java
 * @Description : TbSisulRsv Business Implement class
 * @Modification Information
 *
 * @author 김현재
 * @since 2023-01-21
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */

@Service("tbSisulRsvService")
public class TbSisulRsvServiceImpl extends EgovAbstractServiceImpl implements
        TbSisulRsvService {
        
    private static final Logger LOGGER = LoggerFactory.getLogger(TbSisulRsvServiceImpl.class);

//    @Resource(name="tbSisulRsvMapper")
//    private TbSisulRsvMapper tbSisulRsvDAO;
    
    @Resource(name="tbSisulRsvDAO")
    private TbSisulRsvDAO tbSisulRsvDAO;
    
    /** ID Generation */
    //@Resource(name="{egovTbSisulRsvIdGnrService}")    
    //private EgovIdGnrService egovIdGnrService;

	/**
	 * tb_sisul_rsv을 등록한다.
	 * @param vo - 등록할 정보가 담긴 TbSisulRsvVO
	 * @return 등록 결과
	 * @exception Exception
	 */
    public String insertTbSisulRsv(TbSisulRsvVO vo) throws Exception {
    	LOGGER.debug(vo.toString());
    	
    	/** ID Generation Service */
    	//TODO 해당 테이블 속성에 따라 ID 제너레이션 서비스 사용
    	//String id = egovIdGnrService.getNextStringId();
    	//vo.setId(id);
    	LOGGER.debug(vo.toString());
    	
    	tbSisulRsvDAO.insertTbSisulRsv(vo);
    	//TODO 해당 테이블 정보에 맞게 수정    	
        return null;
    }

    /**
	 * tb_sisul_rsv을 수정한다.
	 * @param vo - 수정할 정보가 담긴 TbSisulRsvVO
	 * @return void형
	 * @exception Exception
	 */
    public void updateTbSisulRsv(TbSisulRsvVO vo) throws Exception {
        tbSisulRsvDAO.updateTbSisulRsv(vo);
    }

    /**
	 * tb_sisul_rsv을 삭제한다.
	 * @param vo - 삭제할 정보가 담긴 TbSisulRsvVO
	 * @return void형 
	 * @exception Exception
	 */
    public void deleteTbSisulRsv(TbSisulRsvVO vo) throws Exception {
        tbSisulRsvDAO.deleteTbSisulRsv(vo);
    }

    /**
	 * tb_sisul_rsv을 조회한다.
	 * @param vo - 조회할 정보가 담긴 TbSisulRsvVO
	 * @return 조회한 tb_sisul_rsv
	 * @exception Exception
	 */
    public TbSisulRsvVO selectTbSisulRsv(TbSisulRsvVO vo) throws Exception {
        TbSisulRsvVO resultVO = tbSisulRsvDAO.selectTbSisulRsv(vo);
        if (resultVO == null)
            throw processException("info.nodata.msg");
        return resultVO;
    }
    
    public List<?> selectTbSisulRsvReply(TbSisulRsvVO vo) throws Exception {
        return tbSisulRsvDAO.selectTbSisulRsvReply(vo);
    }

    /**
	 * tb_sisul_rsv 목록을 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return tb_sisul_rsv 목록
	 * @exception Exception
	 */
    public List<?> selectTbSisulRsvList(TbSisulRsvVO searchVO) throws Exception {
        return tbSisulRsvDAO.selectTbSisulRsvList(searchVO);
    }

    /**
	 * tb_sisul_rsv 총 갯수를 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return tb_sisul_rsv 총 갯수
	 * @exception
	 */
    public int selectTbSisulRsvListTotCnt(TbSisulRsvVO searchVO) {
		return tbSisulRsvDAO.selectTbSisulRsvListTotCnt(searchVO);
	}
    
    public void insertRsvReply(TbSisulRsvVO searchVO) throws Exception {
    	tbSisulRsvDAO.insertRsvReply(searchVO);
	}
    
    public void updateRsvReply(TbSisulRsvVO vo) throws Exception {
        tbSisulRsvDAO.updateRsvReply(vo);
    }
    
    public void deleteRsvReply(TbSisulRsvVO vo) throws Exception {
        tbSisulRsvDAO.deleteRsvReply(vo);
    }
    
    public void updateTbSisulRsvAccept(TbSisulRsvVO vo) throws Exception {
        tbSisulRsvDAO.updateTbSisulRsvAccept(vo);
    }
    
    public List<?> selectTbSisulRsvFileList(TbSisulRsvVO vo) throws Exception {
        return tbSisulRsvDAO.selectTbSisulRsvFileList(vo);
    }
    
    public List<?> selectSmBizFileList(TbSisulRsvVO vo) throws Exception {
        return tbSisulRsvDAO.selectSmBizFileList(vo);
    }
    
    public void updateRsvDt(TbSisulRsvVO vo) throws Exception {
        tbSisulRsvDAO.updateRsvDt(vo);
    }
    public void updateZipFile(TbSisulRsvVO vo) throws Exception {
        tbSisulRsvDAO.updateZipFile(vo);
    }
    
    public List<?> selectTbSisulRsvListExcel(TbSisulRsvVO searchVO) throws Exception {
        return tbSisulRsvDAO.selectTbSisulRsvListExcel(searchVO);
    }
    
    
}
