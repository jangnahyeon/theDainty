package dlink_new.front.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import dlink_new.front.dao.FrontDsnStdDAO;
import dlink_new.front.service.FrontDsnStdService;
import dlink_new.front.vo.TbSisulRsvDefaultVO;
import dlink_new.front.vo.TbSisulRsvFileVO;
import dlink_new.front.vo.TbSisulRsvVO;

// Vo 객체에 대한 import 구문
// import (vo package).TbSisulRsvDefaultVO;
// import (vo package).TbSisulRsvVO;
// Dao 객체에 대한 import 구문
// import (dao package).frontDsnStdDAO;
// Mapper 객체에 대한 import 구문
// import (mapper package).TbSisulRsvMapper;
/**
 * @Class Name : TbSisulRsvServiceImpl.java
 * @Description : TbSisulRsv Business Implement class
 * @Modification Information
 *
 * @author 이재욱
 * @since 2023-01-16
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */

@Service("frontDsnStdService")
public class FrontDsnStdServiceImpl extends EgovAbstractServiceImpl implements
        FrontDsnStdService {
        
    private static final Logger LOGGER = LoggerFactory.getLogger(FrontDsnStdServiceImpl.class);

    @Resource(name="frontDsnStdDAO")
    private FrontDsnStdDAO frontDsnStdDAO;
    
    //@Resource(name="frontDsnStdDAO")
    //private frontDsnStdDAO frontDsnStdDAO;
    
    /** ID Generation */
    //@Resource(name="{egovTbSisulRsvIdGnrService}")    
    //private EgovIdGnrService egovIdGnrService;

	/**
	 * tb_sisul_rsv을 등록한다.
	 * @param vo - 등록할 정보가 담긴 TbSisulRsvVO
	 * @return 등록 결과
	 * @exception Exception
	 */
    public void insertTbSisulRsvImgInfo(TbSisulRsvVO vo) throws Exception {
    	LOGGER.debug(vo.toString());
    	
    	/** ID Generation Service */
    	//TODO 해당 테이블 속성에 따라 ID 제너레이션 서비스 사용
    	//String id = egovIdGnrService.getNextStringId();
    	//vo.setId(id);
    	LOGGER.debug(vo.toString());
    	
    	frontDsnStdDAO.insertTbSisulRsvImgInfo(vo);
    	//TODO 해당 테이블 정보에 맞게 수정    	
        return;
    }
    public int insertTbSisulRsvForm(TbSisulRsvVO vo) throws Exception{
    	
    	return frontDsnStdDAO.insertTbSisulRsvForm(vo);
    	//TODO 해당 테이블 정보에 맞게 수정
    	
    }
    public void insertTbSisulRsvMultiImg(TbSisulRsvVO vo) throws Exception{
    	
    	frontDsnStdDAO.insertTbSisulRsvMultiImg(vo);
    	//TODO 해당 테이블 정보에 맞게 수정
    	return;
    }

    /**
	 * tb_sisul_rsv을 수정한다.
	 * @param vo - 수정할 정보가 담긴 TbSisulRsvVO
	 * @return void형
	 * @exception Exception
	 */
    public void updateTbSisulRsv(TbSisulRsvVO vo) throws Exception {
        frontDsnStdDAO.updateTbSisulRsv(vo);
    }

    /**
	 * tb_sisul_rsv을 삭제한다.
	 * @param vo - 삭제할 정보가 담긴 TbSisulRsvVO
	 * @return void형 
	 * @exception Exception
	 */
    public void deleteTbSisulRsv(TbSisulRsvVO vo) throws Exception {
        frontDsnStdDAO.deleteTbSisulRsv(vo);
    }

    /**
	 * tb_sisul_rsv을 조회한다.
	 * @param vo - 조회할 정보가 담긴 TbSisulRsvVO
	 * @return 조회한 tb_sisul_rsv
	 * @exception Exception
	 */
    public List<?> selectTbSisulRsv(TbSisulRsvVO vo) throws Exception {
        return frontDsnStdDAO.selectTbSisulRsv(vo);
    }
    public List<?> selectTbSisulRsv_L(TbSisulRsvVO vo) throws Exception {
        return frontDsnStdDAO.selectTbSisulRsv_L(vo);
    }

    /**
	 * tb_sisul_rsv 목록을 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return tb_sisul_rsv 목록
	 * @exception Exception
	 */
    public List<?> selectTbSisulRsvList(TbSisulRsvVO searchVO) throws Exception {
        return frontDsnStdDAO.selectTbSisulRsvList_D(searchVO);
    }

    public List<?> selectTbSisulRsvList_M(TbSisulRsvVO searchVO) throws Exception {
        return frontDsnStdDAO.selectTbSisulRsvList_M(searchVO);
    }
    /**
	 * tb_sisul_rsv 총 갯수를 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return tb_sisul_rsv 총 갯수
	 * @exception
	 */
    public int selectTbSisulRsvListTotCnt(TbSisulRsvVO searchVO) {
		return frontDsnStdDAO.selectTbSisulRsvListTotCnt(searchVO);
	}
    
    public int selectTbSisulRsvListTotCnt_M(TbSisulRsvVO searchVO) {
		return frontDsnStdDAO.selectTbSisulRsvListTotCnt_M(searchVO);
	}
    /**
	 * tb_sisul_rsv 예약번호를 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return tb_sisul_rsv 예약번호와 같은 정보
	 * @exception
	 */
    public TbSisulRsvVO selectTbSisulRsvSeq(TbSisulRsvVO vo) throws Exception{
    		TbSisulRsvVO tbSisulRsvVO = frontDsnStdDAO.selectTbSisulRsvSeq(vo);
			if(tbSisulRsvVO == null)
			throw processException("info.nodata.msg");
		return tbSisulRsvVO;
    }
    /**
	 * tb_sisul_rsv_file 예약번호를 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return tb_sisul_rsv_file 예약번호와 같은 정보
	 * @exception
	 */
    public List<?> selectTbSisulRsvSeqList(TbSisulRsvFileVO vo) throws Exception{
    	return frontDsnStdDAO.selectTbSisulRsvSeqList(vo);
    }
    /**
	 * tb_sisul_rsv 수정한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return tb_sisul_rsv 수정
	 * @exception
	 */
    public void updateSisulRsvReadCnt(TbSisulRsvVO vo) throws Exception{
    	frontDsnStdDAO.updateSisulRsvReadCnt(vo);
    }
    
    public List<?> selectTbSisulRsvReply(TbSisulRsvVO vo) throws Exception{
    	return frontDsnStdDAO.selectTbSisulRsvReply(vo);
    }
    
 public void sisulRsvCancle(TbSisulRsvVO vo) throws Exception{
    	frontDsnStdDAO.sisulRsvCancle(vo);
    }
}
