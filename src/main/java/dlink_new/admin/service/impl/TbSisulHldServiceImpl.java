package dlink_new.admin.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import dlink_new.admin.dao.TbSisulHldDAO;
import dlink_new.admin.service.TbSisulHldService;
import dlink_new.admin.vo.TbSisulHldDefaultVO;
import dlink_new.admin.vo.TbSisulHldVO;
import dlink_new.admin.vo.TbSisulVO;
// Vo 객체에 대한 import 구문
// import (vo package).TbSisulHldDefaultVO;
// import (vo package).TbSisulHldVO;
// Dao 객체에 대한 import 구문
// import (dao package).TbSisulHldDAO;
// Mapper 객체에 대한 import 구문
// import (mapper package).TbSisulHldDAO;
/**
 * @Class Name : TbSisulHldServiceImpl.java
 * @Description : TbSisulHld Business Implement class
 * @Modification Information
 *
 * @author 이재욱
 * @since 2023-03-08
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */

@Service("tbSisulHldService")
public class TbSisulHldServiceImpl extends EgovAbstractServiceImpl implements
        TbSisulHldService {
        
    private static final Logger LOGGER = LoggerFactory.getLogger(TbSisulHldServiceImpl.class);

    @Resource(name="tbSisulHldDAO")
    private TbSisulHldDAO tbSisulHldDAO;
    
    //@Resource(name="tbSisulHldDAO")
    //private TbSisulHldDAO tbSisulHldDAO;
    
    /** ID Generation */
    //@Resource(name="{egovTbSisulHldIdGnrService}")    
    //private EgovIdGnrService egovIdGnrService;

	/**
	 * tb_sisul_hld을 등록한다.
	 * @param vo - 등록할 정보가 담긴 TbSisulHldVO
	 * @return 등록 결과
	 * @exception Exception
	 */
    public String insertTbSisulHld(TbSisulHldVO vo) throws Exception {
    	LOGGER.debug(vo.toString());
    	
    	/** ID Generation Service */
    	//TODO 해당 테이블 속성에 따라 ID 제너레이션 서비스 사용
    	//String id = egovIdGnrService.getNextStringId();
    	//vo.setId(id);
    	LOGGER.debug(vo.toString());
    	
    	tbSisulHldDAO.insertTbSisulHld(vo);
    	//TODO 해당 테이블 정보에 맞게 수정    	
        return null;
    }

    /**
	 * tb_sisul_hld을 수정한다.
	 * @param vo - 수정할 정보가 담긴 TbSisulHldVO
	 * @return void형
	 * @exception Exception
	 */
    public void updateTbSisulHld(TbSisulHldVO vo) throws Exception {
        tbSisulHldDAO.updateTbSisulHld(vo);
    }

    /**
	 * tb_sisul_hld을 삭제한다.
	 * @param vo - 삭제할 정보가 담긴 TbSisulHldVO
	 * @return void형 
	 * @exception Exception
	 */
    public void deleteTbSisulHld(TbSisulHldVO vo) throws Exception {
        tbSisulHldDAO.deleteTbSisulHld(vo);
    }

    /**
	 * tb_sisul_hld을 조회한다.
	 * @param vo - 조회할 정보가 담긴 TbSisulHldVO
	 * @return 조회한 tb_sisul_hld
	 * @exception Exception
	 */
    public List<?> selectTbSisulHld(TbSisulHldDefaultVO searchVO) throws Exception{
    	return tbSisulHldDAO.selectTbSisulHld(searchVO);
    }

    public List<?> selectTbSisulHld_L(TbSisulHldDefaultVO searchVO) throws Exception{
    	return tbSisulHldDAO.selectTbSisulHld_L(searchVO);
    }
    
    public TbSisulHldVO selectTbSisulHldDetail(TbSisulHldVO vo) throws Exception{
    	TbSisulHldVO resultVO = tbSisulHldDAO.selectTbSisulHldDetail(vo);
        if (resultVO == null)
            throw processException("info.nodata.msg");
        return resultVO;
    }
    
    /**
	 * tb_sisul_hld 목록을 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return tb_sisul_hld 목록
	 * @exception Exception
	 */
    public List<?> selectTbSisulHldList(TbSisulHldDefaultVO searchVO) throws Exception {
        return tbSisulHldDAO.selectTbSisulHldList(searchVO);
    }

    /**
	 * tb_sisul_hld 총 갯수를 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return tb_sisul_hld 총 갯수
	 * @exception
	 */
    public int selectTbSisulHldListTotCnt(TbSisulHldDefaultVO searchVO) {
		return tbSisulHldDAO.selectTbSisulHldListTotCnt(searchVO);
	}
    
}
