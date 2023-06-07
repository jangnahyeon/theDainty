package dlink_new.admin.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.egovframe.rte.fdl.idgnr.EgovIdGnrService;

import dlink_new.admin.dao.TbCodeDAO;
import dlink_new.admin.service.TbCodeService;
import dlink_new.admin.vo.TbCodeDefaultVO;
import dlink_new.admin.vo.TbCodeVO;
// Vo 객체에 대한 import 구문
// import (vo package).TbCodeDefaultVO;
// import (vo package).TbCodeVO;
// Dao 객체에 대한 import 구문
// import (dao package).TbCodeDAO;
// Mapper 객체에 대한 import 구문
// import (mapper package).TbCodeMapper;
/**
 * @Class Name : TbCodeServiceImpl.java
 * @Description : TbCode Business Implement class
 * @Modification Information
 *
 * @author 김현재
 * @since 2023-01-18
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */

@Service("tbCodeService")
public class TbCodeServiceImpl extends EgovAbstractServiceImpl implements
        TbCodeService {
        
    private static final Logger LOGGER = LoggerFactory.getLogger(TbCodeServiceImpl.class);

    //@Resource(name="tbCodeMapper")
    //private TbCodeMapper tbCodeDAO;
    
    @Resource(name="tbCodeDAO")
    private TbCodeDAO tbCodeDAO;
    
    /** ID Generation */
    //@Resource(name="{egovTbCodeIdGnrService}")    
    //private EgovIdGnrService egovIdGnrService;

	/**
	 * tb_code을 등록한다.
	 * @param vo - 등록할 정보가 담긴 TbCodeVO
	 * @return 등록 결과
	 * @exception Exception
	 */
    public String insertTbCode(TbCodeVO vo) throws Exception {
    	LOGGER.debug(vo.toString());
    	
    	/** ID Generation Service */
    	//TODO 해당 테이블 속성에 따라 ID 제너레이션 서비스 사용
    	//String id = egovIdGnrService.getNextStringId();
    	//vo.setId(id);
    	LOGGER.debug(vo.toString());
    	
    	tbCodeDAO.insertTbCode(vo);
    	//TODO 해당 테이블 정보에 맞게 수정    	
        return null;
    }

    /**
	 * tb_code을 수정한다.
	 * @param vo - 수정할 정보가 담긴 TbCodeVO
	 * @return void형
	 * @exception Exception
	 */
    public void updateTbCode(TbCodeVO vo) throws Exception {
        tbCodeDAO.updateTbCode(vo);
    }

    /**
	 * tb_code을 삭제한다.
	 * @param vo - 삭제할 정보가 담긴 TbCodeVO
	 * @return void형 
	 * @exception Exception
	 */
    public void deleteTbCode(TbCodeVO vo) throws Exception {
        tbCodeDAO.deleteTbCode(vo);
    }

    /**
	 * tb_code을 조회한다.
	 * @param vo - 조회할 정보가 담긴 TbCodeVO
	 * @return 조회한 tb_code
	 * @exception Exception
	 */
    public TbCodeVO selectTbCode(TbCodeVO vo) throws Exception {
        TbCodeVO resultVO = tbCodeDAO.selectTbCode(vo);
        if (resultVO == null)
            throw processException("info.nodata.msg");
        return resultVO;
    }

    /**
	 * tb_code 목록을 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return tb_code 목록
	 * @exception Exception
	 */
    public List<?> selectTbCodeList(TbCodeVO searchVO) throws Exception {
        return tbCodeDAO.selectTbCodeList(searchVO);
    }

    /**
	 * tb_code 총 갯수를 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return tb_code 총 갯수
	 * @exception
	 */
    public int selectTbCodeListTotCnt(TbCodeVO searchVO) {
		return tbCodeDAO.selectTbCodeListTotCnt(searchVO);
	}
    
    public List<?> selectTbCodeListFront(TbCodeVO searchVO) throws Exception {
        return tbCodeDAO.selectTbCodeListFront(searchVO);
    }
    
}
