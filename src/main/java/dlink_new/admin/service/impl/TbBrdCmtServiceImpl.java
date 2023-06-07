package dlink_new.admin.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import dlink_new.admin.dao.TbBrdCmtDAO;
import dlink_new.admin.service.TbBrdCmtService;
import dlink_new.admin.vo.TbBrdCmtDefaultVO;
import dlink_new.admin.vo.TbBrdCmtVO;
// Vo 객체에 대한 import 구문
// import (vo package).TbBrdCmtDefaultVO;
// import (vo package).TbBrdCmtVO;
// Dao 객체에 대한 import 구문
// import (dao package).TbBrdCmtDAO;
// Mapper 객체에 대한 import 구문
// import (mapper package).TbBrdCmtMapper;
/**
 * @Class Name : TbBrdCmtServiceImpl.java
 * @Description : TbBrdCmt Business Implement class
 * @Modification Information
 *
 * @author 김현재
 * @since 2023-02-02
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */

@Service("tbBrdCmtService")
public class TbBrdCmtServiceImpl extends EgovAbstractServiceImpl implements
        TbBrdCmtService {
        
    private static final Logger LOGGER = LoggerFactory.getLogger(TbBrdCmtServiceImpl.class);

//    @Resource(name="tbBrdCmtMapper")
//    private TbBrdCmtMapper tbBrdCmtDAO;
    
    @Resource(name="tbBrdCmtDAO")
    private TbBrdCmtDAO tbBrdCmtDAO;
    
    /** ID Generation */
    //@Resource(name="{egovTbBrdCmtIdGnrService}")    
    //private EgovIdGnrService egovIdGnrService;

	/**
	 * tb_brd_cmt을 등록한다.
	 * @param vo - 등록할 정보가 담긴 TbBrdCmtVO
	 * @return 등록 결과
	 * @exception Exception
	 */
    public int insertTbBrdCmt(TbBrdCmtVO vo) throws Exception {
    	LOGGER.debug(vo.toString());
    	
    	/** ID Generation Service */
    	//TODO 해당 테이블 속성에 따라 ID 제너레이션 서비스 사용
    	//String id = egovIdGnrService.getNextStringId();
    	//vo.setId(id);
    	LOGGER.debug(vo.toString());
    	
    	int cmtSeq = tbBrdCmtDAO.insertTbBrdCmt(vo);
    	//TODO 해당 테이블 정보에 맞게 수정    	
        return cmtSeq;
    }

    /**
	 * tb_brd_cmt을 수정한다.
	 * @param vo - 수정할 정보가 담긴 TbBrdCmtVO
	 * @return void형
	 * @exception Exception
	 */
    public void updateTbBrdCmt(TbBrdCmtVO vo) throws Exception {
        tbBrdCmtDAO.updateTbBrdCmt(vo);
    }

    /**
	 * tb_brd_cmt을 삭제한다.
	 * @param vo - 삭제할 정보가 담긴 TbBrdCmtVO
	 * @return void형 
	 * @exception Exception
	 */
    public void deleteTbBrdCmt(TbBrdCmtVO vo) throws Exception {
        tbBrdCmtDAO.deleteTbBrdCmt(vo);
    }

    /**
	 * tb_brd_cmt을 조회한다.
	 * @param vo - 조회할 정보가 담긴 TbBrdCmtVO
	 * @return 조회한 tb_brd_cmt
	 * @exception Exception
	 */
    public TbBrdCmtVO selectTbBrdCmt(TbBrdCmtVO vo) throws Exception {
        TbBrdCmtVO resultVO = tbBrdCmtDAO.selectTbBrdCmt(vo);
        if (resultVO == null)
            throw processException("info.nodata.msg");
        return resultVO;
    }

    /**
	 * tb_brd_cmt 목록을 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return tb_brd_cmt 목록
	 * @exception Exception
	 */
    public List<?> selectTbBrdCmtList(TbBrdCmtDefaultVO searchVO) throws Exception {
        return tbBrdCmtDAO.selectTbBrdCmtList(searchVO);
    }

    /**
	 * tb_brd_cmt 총 갯수를 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return tb_brd_cmt 총 갯수
	 * @exception
	 */
    public int selectTbBrdCmtListTotCnt(TbBrdCmtDefaultVO searchVO) {
		return tbBrdCmtDAO.selectTbBrdCmtListTotCnt(searchVO);
	}
    
    public void updateBrdCmt(TbBrdCmtVO vo) throws Exception {
        tbBrdCmtDAO.updateBrdCmt(vo);
    }
}
