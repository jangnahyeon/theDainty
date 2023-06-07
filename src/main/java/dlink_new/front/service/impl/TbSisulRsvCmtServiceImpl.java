package dlink_new.front.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import dlink_new.front.dao.TbSisulRsvCmtDAO;
import dlink_new.front.service.TbSisulRsvCmtService;
import dlink_new.front.vo.TbSisulRsvCmtDefaultVO;
import dlink_new.front.vo.TbSisulRsvCmtVO;
// Vo 객체에 대한 import 구문
// import (vo package).TbSisulRsvCmtDefaultVO;
// import (vo package).TbSisulRsvCmtVO;
// Dao 객체에 대한 import 구문
// import (dao package).TbSisulRsvCmtDAO;
// Mapper 객체에 대한 import 구문
// import (mapper package).TbSisulRsvCmtMapper;
/**
 * @Class Name : TbSisulRsvCmtServiceImpl.java
 * @Description : TbSisulRsvCmt Business Implement class
 * @Modification Information
 *
 * @author 이재욱
 * @since 2023-02-07
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */

@Service("tbSisulRsvCmtService")
public class TbSisulRsvCmtServiceImpl extends EgovAbstractServiceImpl implements
        TbSisulRsvCmtService {
        
    private static final Logger LOGGER = LoggerFactory.getLogger(TbSisulRsvCmtServiceImpl.class);

    @Resource(name="tbSisulRsvCmtDAO")
    private TbSisulRsvCmtDAO tbSisulRsvCmtDAO;
    
    //@Resource(name="tbSisulRsvCmtDAO")
    //private TbSisulRsvCmtDAO tbSisulRsvCmtDAO;
    
    /** ID Generation */
    //@Resource(name="{egovTbSisulRsvCmtIdGnrService}")    
    //private EgovIdGnrService egovIdGnrService;

	/**
	 * tb_sisul_rsv_cmt을 등록한다.
	 * @param vo - 등록할 정보가 담긴 TbSisulRsvCmtVO
	 * @return 등록 결과
	 * @exception Exception
	 */
    public String insertTbSisulRsvCmt(TbSisulRsvCmtVO vo) throws Exception {
    	LOGGER.debug(vo.toString());
    	
    	/** ID Generation Service */
    	//TODO 해당 테이블 속성에 따라 ID 제너레이션 서비스 사용
    	//String id = egovIdGnrService.getNextStringId();
    	//vo.setId(id);
    	LOGGER.debug(vo.toString());
    	
    	tbSisulRsvCmtDAO.insertTbSisulRsvCmt(vo);
    	//TODO 해당 테이블 정보에 맞게 수정    	
        return null;
    }

    /**
	 * tb_sisul_rsv_cmt을 수정한다.
	 * @param vo - 수정할 정보가 담긴 TbSisulRsvCmtVO
	 * @return void형
	 * @exception Exception
	 */
    public void updateTbSisulRsvCmt(TbSisulRsvCmtVO vo) throws Exception {
        tbSisulRsvCmtDAO.updateTbSisulRsvCmt(vo);
    }

    /**
	 * tb_sisul_rsv_cmt을 삭제한다.
	 * @param vo - 삭제할 정보가 담긴 TbSisulRsvCmtVO
	 * @return void형 
	 * @exception Exception
	 */
    public void deleteTbSisulRsvCmt(TbSisulRsvCmtVO vo) throws Exception {
        tbSisulRsvCmtDAO.deleteTbSisulRsvCmt(vo);
    }

    /**
	 * tb_sisul_rsv_cmt을 조회한다.
	 * @param vo - 조회할 정보가 담긴 TbSisulRsvCmtVO
	 * @return 조회한 tb_sisul_rsv_cmt
	 * @exception Exception
	 */
    public TbSisulRsvCmtVO selectTbSisulRsvCmt(TbSisulRsvCmtVO vo) throws Exception {
        TbSisulRsvCmtVO resultVO = tbSisulRsvCmtDAO.selectTbSisulRsvCmt(vo);
        if (resultVO == null)
            throw processException("info.nodata.msg");
        return resultVO;
    }

    /**
	 * tb_sisul_rsv_cmt 목록을 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return tb_sisul_rsv_cmt 목록
	 * @exception Exception
	 */
    public List<?> selectTbSisulRsvCmtList(TbSisulRsvCmtDefaultVO searchVO) throws Exception {
        return tbSisulRsvCmtDAO.selectTbSisulRsvCmtList(searchVO);
    }

    /**
	 * tb_sisul_rsv_cmt 총 갯수를 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return tb_sisul_rsv_cmt 총 갯수
	 * @exception
	 */
    public int selectTbSisulRsvCmtListTotCnt(TbSisulRsvCmtDefaultVO searchVO) {
		return tbSisulRsvCmtDAO.selectTbSisulRsvCmtListTotCnt(searchVO);
	}
    
}
