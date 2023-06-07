package dlink_new.admin.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.egovframe.rte.fdl.idgnr.EgovIdGnrService;

import dlink_new.admin.dao.TbCodeGbDAO;
import dlink_new.admin.service.TbCodeGbService;
import dlink_new.admin.vo.TbCodeGbDefaultVO;
import dlink_new.admin.vo.TbCodeGbVO;
// Vo 객체에 대한 import 구문
// import (vo package).TbCodeGbDefaultVO;
// import (vo package).TbCodeGbVO;
// Dao 객체에 대한 import 구문
// import (dao package).TbCodeGbDAO;
// Mapper 객체에 대한 import 구문
// import (mapper package).TbCodeGbMapper;
/**
 * @Class Name : TbCodeGbServiceImpl.java
 * @Description : TbCodeGb Business Implement class
 * @Modification Information
 *
 * @author 김현재
 * @since 2023-01-17
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */

@Service("tbCodeGbService")
public class TbCodeGbServiceImpl extends EgovAbstractServiceImpl implements
        TbCodeGbService {
        
    private static final Logger LOGGER = LoggerFactory.getLogger(TbCodeGbServiceImpl.class);

    //@Resource(name="tbCodeGbMapper")
    //private TbCodeGbMapper tbCodeGbDAO;
    
    @Resource(name="tbCodeGbDAO")
    private TbCodeGbDAO tbCodeGbDAO;
    
    /** ID Generation */
    //@Resource(name="{egovTbCodeGbIdGnrService}")    
    //private EgovIdGnrService egovIdGnrService;

	/**
	 * tb_code_gb을 등록한다.
	 * @param vo - 등록할 정보가 담긴 TbCodeGbVO
	 * @return 등록 결과
	 * @exception Exception
	 */
    public String insertTbCodeGb(TbCodeGbVO vo) throws Exception {
    	LOGGER.debug(vo.toString());
    	
    	/** ID Generation Service */
    	//TODO 해당 테이블 속성에 따라 ID 제너레이션 서비스 사용
    	//String id = egovIdGnrService.getNextStringId();
    	//vo.setId(id);
    	LOGGER.debug(vo.toString());
    	
    	tbCodeGbDAO.insertTbCodeGb(vo);
    	//TODO 해당 테이블 정보에 맞게 수정    	
        return null;
    }

    /**
	 * tb_code_gb을 수정한다.
	 * @param vo - 수정할 정보가 담긴 TbCodeGbVO
	 * @return void형
	 * @exception Exception
	 */
    public void updateTbCodeGb(TbCodeGbVO vo) throws Exception {
        tbCodeGbDAO.updateTbCodeGb(vo);
    }

    /**
	 * tb_code_gb을 삭제한다.
	 * @param vo - 삭제할 정보가 담긴 TbCodeGbVO
	 * @return void형 
	 * @exception Exception
	 */
    public void deleteTbCodeGb(TbCodeGbVO vo) throws Exception {
        tbCodeGbDAO.deleteTbCodeGb(vo);
    }

    /**
	 * tb_code_gb을 조회한다.
	 * @param vo - 조회할 정보가 담긴 TbCodeGbVO
	 * @return 조회한 tb_code_gb
	 * @exception Exception
	 */
    public TbCodeGbVO selectTbCodeGb(TbCodeGbVO vo) throws Exception {
        TbCodeGbVO resultVO = tbCodeGbDAO.selectTbCodeGb(vo);
        if (resultVO == null)
            throw processException("info.nodata.msg");
        return resultVO;
    }

    /**
	 * tb_code_gb 목록을 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return tb_code_gb 목록
	 * @exception Exception
	 */
    public List<?> selectTbCodeGbList(TbCodeGbDefaultVO searchVO) throws Exception {
        return tbCodeGbDAO.selectTbCodeGbList(searchVO);
    }

    /**
	 * tb_code_gb 총 갯수를 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return tb_code_gb 총 갯수
	 * @exception
	 */
    public int selectTbCodeGbListTotCnt(TbCodeGbDefaultVO searchVO) {
		return tbCodeGbDAO.selectTbCodeGbListTotCnt(searchVO);
	}
    
}
