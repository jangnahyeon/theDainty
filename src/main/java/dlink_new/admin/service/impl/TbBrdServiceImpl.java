package dlink_new.admin.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import dlink_new.admin.dao.TbBrdDAO;
import dlink_new.admin.service.TbBrdService;
import dlink_new.admin.vo.TbBrdDefaultVO;
import dlink_new.admin.vo.TbBrdVO;
// Vo 객체에 대한 import 구문
// import (vo package).TbBrdDefaultVO;
// import (vo package).TbBrdVO;
// Dao 객체에 대한 import 구문
// import (dao package).TbBrdDAO;
// Mapper 객체에 대한 import 구문
// import (mapper package).TbBrdMapper;
/**
 * @Class Name : TbBrdServiceImpl.java
 * @Description : TbBrd Business Implement class
 * @Modification Information
 *
 * @author 김현재
 * @since 2023-01-25
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */

@Service("tbBrdService")
public class TbBrdServiceImpl extends EgovAbstractServiceImpl implements
        TbBrdService {
        
    private static final Logger LOGGER = LoggerFactory.getLogger(TbBrdServiceImpl.class);

//    @Resource(name="tbBrdMapper")
//    private TbBrdMapper tbBrdDAO;
    
    @Resource(name="tbBrdDAO")
    private TbBrdDAO tbBrdDAO;
    
    /** ID Generation */
    //@Resource(name="{egovTbBrdIdGnrService}")    
    //private EgovIdGnrService egovIdGnrService;

	/**
	 * tb_brd을 등록한다.
	 * @param vo - 등록할 정보가 담긴 TbBrdVO
	 * @return 등록 결과
	 * @exception Exception
	 */
    public int insertTbBrd(TbBrdVO vo) throws Exception {
    	LOGGER.debug(vo.toString());
    	
    	/** ID Generation Service */
    	//TODO 해당 테이블 속성에 따라 ID 제너레이션 서비스 사용
    	//String id = egovIdGnrService.getNextStringId();
    	//vo.setId(id);
    	LOGGER.debug(vo.toString());
    	
    	int brdSeq = tbBrdDAO.insertTbBrd(vo);
    	//TODO 해당 테이블 정보에 맞게 수정    	
        return brdSeq;
    }

    /**
	 * tb_brd을 수정한다.
	 * @param vo - 수정할 정보가 담긴 TbBrdVO
	 * @return void형
	 * @exception Exception
	 */
    public void updateTbBrd(TbBrdVO vo) throws Exception {
        tbBrdDAO.updateTbBrd(vo);
    }

    /**
	 * tb_brd을 삭제한다.
	 * @param vo - 삭제할 정보가 담긴 TbBrdVO
	 * @return void형 
	 * @exception Exception
	 */
    public void deleteTbBrd(TbBrdVO vo) throws Exception {
        tbBrdDAO.deleteTbBrd(vo);
    }

    /**
	 * tb_brd을 조회한다.
	 * @param vo - 조회할 정보가 담긴 TbBrdVO
	 * @return 조회한 tb_brd
	 * @exception Exception
	 */
    public TbBrdVO selectTbBrd(TbBrdVO vo) throws Exception {
        TbBrdVO resultVO = tbBrdDAO.selectTbBrd(vo);
//        if (resultVO == null)
//            throw processException("info.nodata.msg");
        return resultVO;
    }

    /**
	 * tb_brd 목록을 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return tb_brd 목록
	 * @exception Exception
	 */
    public List<?> selectTbBrdList(TbBrdDefaultVO searchVO) throws Exception {
        return tbBrdDAO.selectTbBrdList(searchVO);
    }

    /**
	 * tb_brd 총 갯수를 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return tb_brd 총 갯수
	 * @exception
	 */
    public int selectTbBrdListTotCnt(TbBrdDefaultVO searchVO) {
		return tbBrdDAO.selectTbBrdListTotCnt(searchVO);
	}
    
    /**
	 * tb_brd 공지사항 마지막을 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return tb_brd 목록
	 * @exception Exception
	 */
    public TbBrdVO selectTbBrdLast(TbBrdVO vo) throws Exception {
        TbBrdVO resultVO = tbBrdDAO.selectTbBrdLast(vo);
        if (resultVO == null)
            throw processException("info.nodata.msg");
        return resultVO;
    }
}
