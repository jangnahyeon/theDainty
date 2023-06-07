package dlink_new.admin.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.egovframe.rte.fdl.idgnr.EgovIdGnrService;

import dlink_new.admin.dao.TbMemDAO;
import dlink_new.admin.service.TbMemService;
import dlink_new.admin.vo.TbMemDefaultVO;
import dlink_new.admin.vo.TbMemVO;
// Vo 객체에 대한 import 구문
// import (vo package).TbMemDefaultVO;
// import (vo package).TbMemVO;
// Dao 객체에 대한 import 구문
// import (dao package).TbMemDAO;
// Mapper 객체에 대한 import 구문
// import (mapper package).TbMemMapper;
/**
 * @Class Name : TbMemServiceImpl.java
 * @Description : TbMem Business Implement class
 * @Modification Information
 *
 * @author 김현재
 * @since 2023-01-18
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */

@Service("tbMemService")
public class TbMemServiceImpl extends EgovAbstractServiceImpl implements
        TbMemService {
        
    private static final Logger LOGGER = LoggerFactory.getLogger(TbMemServiceImpl.class);

//    @Resource(name="tbMemMapper")
//    private TbMemMapper tbMemDAO;
    
    @Resource(name="tbMemDAO")
    private TbMemDAO tbMemDAO;
    
    /** ID Generation */
    //@Resource(name="{egovTbMemIdGnrService}")    
    //private EgovIdGnrService egovIdGnrService;

	/**
	 * tb_mem을 등록한다.
	 * @param vo - 등록할 정보가 담긴 TbMemVO
	 * @return 등록 결과
	 * @exception Exception
	 */
    public java.lang.Integer insertTbMem(TbMemVO vo) throws Exception {
    	LOGGER.debug(vo.toString());
    	
    	/** ID Generation Service */
    	//TODO 해당 테이블 속성에 따라 ID 제너레이션 서비스 사용
    	//String id = egovIdGnrService.getNextStringId();
    	//vo.setId(id);
    	LOGGER.debug(vo.toString());
    	
    	java.lang.Integer memSeq = tbMemDAO.insertTbMem(vo);
    	//TODO 해당 테이블 정보에 맞게 수정    	
        return memSeq;
    }

    /**
	 * tb_mem을 수정한다.
	 * @param vo - 수정할 정보가 담긴 TbMemVO
	 * @return void형
	 * @exception Exception
	 */
    public void updateTbMem(TbMemVO vo) throws Exception {
        tbMemDAO.updateTbMem(vo);
    }

    /**
	 * tb_mem을 삭제한다.
	 * @param vo - 삭제할 정보가 담긴 TbMemVO
	 * @return void형 
	 * @exception Exception
	 */
    public void deleteTbMem(TbMemVO vo) throws Exception {
        tbMemDAO.deleteTbMem(vo);
    }

    /**
	 * tb_mem을 조회한다.
	 * @param vo - 조회할 정보가 담긴 TbMemVO
	 * @return 조회한 tb_mem
	 * @exception Exception
	 */
    public TbMemVO selectTbMem(TbMemVO vo) throws Exception {
        TbMemVO resultVO = tbMemDAO.selectTbMem(vo);
//        if (resultVO == null)
//            throw processException("info.nodata.msg");
        return resultVO;
    }

    /**
	 * tb_mem 목록을 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return tb_mem 목록
	 * @exception Exception
	 */
    public List<?> selectTbMemList(TbMemDefaultVO searchVO) throws Exception {
        return tbMemDAO.selectTbMemList(searchVO);
    }

    /**
	 * tb_mem 총 갯수를 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return tb_mem 총 갯수
	 * @exception
	 */
    public int selectTbMemListTotCnt(TbMemDefaultVO searchVO) {
		return tbMemDAO.selectTbMemListTotCnt(searchVO);
	}
    
    public void tbMemAcceotUpdate(TbMemVO vo) throws Exception {
        tbMemDAO.tbMemAcceotUpdate(vo);
    }
    
}
