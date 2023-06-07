package dlink_new.admin.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import dlink_new.admin.dao.TbPortfDAO;
import dlink_new.admin.service.TbPortfService;
import dlink_new.admin.vo.TbPortfDefaultVO;
import dlink_new.admin.vo.TbPortfVO;
// Vo 객체에 대한 import 구문
// import (vo package).TbPortfDefaultVO;
// import (vo package).TbPortfVO;
// Dao 객체에 대한 import 구문
// import (dao package).TbPortfDAO;
// Mapper 객체에 대한 import 구문
// import (mapper package).TbPortfMapper;
/**
 * @Class Name : TbPortfServiceImpl.java
 * @Description : TbPortf Business Implement class
 * @Modification Information
 *
 * @author 김현재
 * @since 2023-01-21
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */

@Service("tbPortfService")
public class TbPortfServiceImpl extends EgovAbstractServiceImpl implements
        TbPortfService {
        
    private static final Logger LOGGER = LoggerFactory.getLogger(TbPortfServiceImpl.class);

//    @Resource(name="tbPortfMapper")
//    private TbPortfMapper tbPortfDAO;
    
    @Resource(name="tbPortfDAO")
    private TbPortfDAO tbPortfDAO;
    
    /** ID Generation */
    //@Resource(name="{egovTbPortfIdGnrService}")    
    //private EgovIdGnrService egovIdGnrService;

	/**
	 * tb_portf을 등록한다.
	 * @param vo - 등록할 정보가 담긴 TbPortfVO
	 * @return 등록 결과
	 * @exception Exception
	 */
    public String insertTbPortf(TbPortfVO vo) throws Exception {
    	LOGGER.debug(vo.toString());
    	
    	/** ID Generation Service */
    	//TODO 해당 테이블 속성에 따라 ID 제너레이션 서비스 사용
    	//String id = egovIdGnrService.getNextStringId();
    	//vo.setId(id);
    	LOGGER.debug(vo.toString());
    	
    	tbPortfDAO.insertTbPortf(vo);
    	//TODO 해당 테이블 정보에 맞게 수정    	
        return null;
    }

    /**
	 * tb_portf을 수정한다.
	 * @param vo - 수정할 정보가 담긴 TbPortfVO
	 * @return void형
	 * @exception Exception
	 */
    public void updateTbPortf(TbPortfVO vo) throws Exception {
        tbPortfDAO.updateTbPortf(vo);
    }

    /**
	 * tb_portf을 삭제한다.
	 * @param vo - 삭제할 정보가 담긴 TbPortfVO
	 * @return void형 
	 * @exception Exception
	 */
    public void deleteTbPortf(TbPortfVO vo) throws Exception {
        tbPortfDAO.deleteTbPortf(vo);
    }

    /**
	 * tb_portf을 조회한다.
	 * @param vo - 조회할 정보가 담긴 TbPortfVO
	 * @return 조회한 tb_portf
	 * @exception Exception
	 */
    public TbPortfVO selectTbPortf(TbPortfVO vo) throws Exception {
        TbPortfVO resultVO = tbPortfDAO.selectTbPortf(vo);
        if (resultVO == null)
            throw processException("info.nodata.msg");
        return resultVO;
    }

    /**
	 * tb_portf 목록을 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return tb_portf 목록
	 * @exception Exception
	 */
    public List<?> selectTbPortfList(TbPortfVO searchVO) throws Exception {
        return tbPortfDAO.selectTbPortfList(searchVO);
    }
    
    public List<?> selectOrderNoList(TbPortfVO searchVO) throws Exception{
    	return tbPortfDAO.selectOrderNoList(searchVO);
    }

    /**
	 * tb_portf 총 갯수를 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return tb_portf 총 갯수
	 * @exception
	 */
    public int selectTbPortfListTotCnt(TbPortfVO searchVO) {
		return tbPortfDAO.selectTbPortfListTotCnt(searchVO);
	}
    
}
