package dlink_new.admin.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import dlink_new.admin.dao.TbBrdFileDAO;
import dlink_new.admin.service.TbBrdFileService;
import dlink_new.admin.vo.TbBrdFileDefaultVO;
import dlink_new.admin.vo.TbBrdFileVO;
// Vo 객체에 대한 import 구문
// import (vo package).TbBrdFileDefaultVO;
// import (vo package).TbBrdFileVO;
// Dao 객체에 대한 import 구문
// import (dao package).TbBrdFileDAO;
// Mapper 객체에 대한 import 구문
// import (mapper package).TbBrdFileMapper;
/**
 * @Class Name : TbBrdFileServiceImpl.java
 * @Description : TbBrdFile Business Implement class
 * @Modification Information
 *
 * @author 김현재
 * @since 2023-02-02
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */

@Service("tbBrdFileService")
public class TbBrdFileServiceImpl extends EgovAbstractServiceImpl implements
        TbBrdFileService {
        
    private static final Logger LOGGER = LoggerFactory.getLogger(TbBrdFileServiceImpl.class);

//    @Resource(name="tbBrdFileMapper")
//    private TbBrdFileMapper tbBrdFileDAO;
    
    @Resource(name="tbBrdFileDAO")
    private TbBrdFileDAO tbBrdFileDAO;
    
    /** ID Generation */
    //@Resource(name="{egovTbBrdFileIdGnrService}")    
    //private EgovIdGnrService egovIdGnrService;

	/**
	 * tb_brd_file을 등록한다.
	 * @param vo - 등록할 정보가 담긴 TbBrdFileVO
	 * @return 등록 결과
	 * @exception Exception
	 */
    public int insertTbBrdFile(TbBrdFileVO vo) throws Exception {
    	LOGGER.debug(vo.toString());
    	
    	/** ID Generation Service */
    	//TODO 해당 테이블 속성에 따라 ID 제너레이션 서비스 사용
    	//String id = egovIdGnrService.getNextStringId();
    	//vo.setId(id);
    	LOGGER.debug(vo.toString());
    	
    	int brdFileSeq = tbBrdFileDAO.insertTbBrdFile(vo);
    	//TODO 해당 테이블 정보에 맞게 수정    	
        return brdFileSeq;
    }

    /**
	 * tb_brd_file을 수정한다.
	 * @param vo - 수정할 정보가 담긴 TbBrdFileVO
	 * @return void형
	 * @exception Exception
	 */
    public void updateTbBrdFile(TbBrdFileVO vo) throws Exception {
        tbBrdFileDAO.updateTbBrdFile(vo);
    }

    /**
	 * tb_brd_file을 삭제한다.
	 * @param vo - 삭제할 정보가 담긴 TbBrdFileVO
	 * @return void형 
	 * @exception Exception
	 */
    public void deleteTbBrdFile(TbBrdFileVO vo) throws Exception {
        tbBrdFileDAO.deleteTbBrdFile(vo);
    }

    /**
	 * tb_brd_file을 조회한다.
	 * @param vo - 조회할 정보가 담긴 TbBrdFileVO
	 * @return 조회한 tb_brd_file
	 * @exception Exception
	 */
    public TbBrdFileVO selectTbBrdFile(TbBrdFileVO vo) throws Exception {
        TbBrdFileVO resultVO = tbBrdFileDAO.selectTbBrdFile(vo);
        if (resultVO == null)
            throw processException("info.nodata.msg");
        return resultVO;
    }

    /**
	 * tb_brd_file 목록을 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return tb_brd_file 목록
	 * @exception Exception
	 */
    public List<?> selectTbBrdFileList(TbBrdFileDefaultVO searchVO) throws Exception {
        return tbBrdFileDAO.selectTbBrdFileList(searchVO);
    }

    /**
	 * tb_brd_file 총 갯수를 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return tb_brd_file 총 갯수
	 * @exception
	 */
    public int selectTbBrdFileListTotCnt(TbBrdFileDefaultVO searchVO) {
		return tbBrdFileDAO.selectTbBrdFileListTotCnt(searchVO);
	}
    
}
