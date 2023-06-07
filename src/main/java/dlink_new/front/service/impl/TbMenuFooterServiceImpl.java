package dlink_new.front.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import dlink_new.front.dao.TbMenuFooterDAO;
import dlink_new.front.service.TbMenuFooterService;
import dlink_new.front.vo.TbMenuFooterDefaultVO;
import dlink_new.front.vo.TbMenuFooterVO;
// Vo 객체에 대한 import 구문
// import (vo package).TbMenuFooterDefaultVO;
// import (vo package).TbMenuFooterVO;
// Dao 객체에 대한 import 구문
// import (dao package).TbMenuFooterDAO;
// Mapper 객체에 대한 import 구문
// import (mapper package).TbMenuFooterMapper;
/**
 * @Class Name : TbMenuFooterServiceImpl.java
 * @Description : TbMenuFooter Business Implement class
 * @Modification Information
 *
 * @author 김현재
 * @since 2023-01-24
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */

@Service("tbMenuFooterService")
public class TbMenuFooterServiceImpl extends EgovAbstractServiceImpl implements
        TbMenuFooterService {
        
    private static final Logger LOGGER = LoggerFactory.getLogger(TbMenuFooterServiceImpl.class);

//    @Resource(name="tbMenuFooterMapper")
//    private TbMenuFooterMapper tbMenuFooterDAO;
    
    @Resource(name="tbMenuFooterDAO")
    private TbMenuFooterDAO tbMenuFooterDAO;
    
    /** ID Generation */
    //@Resource(name="{egovTbMenuFooterIdGnrService}")    
    //private EgovIdGnrService egovIdGnrService;

	/**
	 * tb_menu_footer을 등록한다.
	 * @param vo - 등록할 정보가 담긴 TbMenuFooterVO
	 * @return 등록 결과
	 * @exception Exception
	 */
    public String insertTbMenuFooter(TbMenuFooterVO vo) throws Exception {
    	LOGGER.debug(vo.toString());
    	
    	/** ID Generation Service */
    	//TODO 해당 테이블 속성에 따라 ID 제너레이션 서비스 사용
    	//String id = egovIdGnrService.getNextStringId();
    	//vo.setId(id);
    	LOGGER.debug(vo.toString());
    	
    	tbMenuFooterDAO.insertTbMenuFooter(vo);
    	//TODO 해당 테이블 정보에 맞게 수정    	
        return null;
    }

    /**
	 * tb_menu_footer을 수정한다.
	 * @param vo - 수정할 정보가 담긴 TbMenuFooterVO
	 * @return void형
	 * @exception Exception
	 */
    public void updateTbMenuFooter(TbMenuFooterVO vo) throws Exception {
        tbMenuFooterDAO.updateTbMenuFooter(vo);
    }

    /**
	 * tb_menu_footer을 삭제한다.
	 * @param vo - 삭제할 정보가 담긴 TbMenuFooterVO
	 * @return void형 
	 * @exception Exception
	 */
    public void deleteTbMenuFooter(TbMenuFooterVO vo) throws Exception {
        tbMenuFooterDAO.deleteTbMenuFooter(vo);
    }

    /**
	 * tb_menu_footer을 조회한다.
	 * @param vo - 조회할 정보가 담긴 TbMenuFooterVO
	 * @return 조회한 tb_menu_footer
	 * @exception Exception
	 */
    public TbMenuFooterVO selectTbMenuFooter(TbMenuFooterVO vo) throws Exception {
        TbMenuFooterVO resultVO = tbMenuFooterDAO.selectTbMenuFooter(vo);
        if (resultVO == null)
            throw processException("info.nodata.msg");
        return resultVO;
    }

    /**
	 * tb_menu_footer 목록을 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return tb_menu_footer 목록
	 * @exception Exception
	 */
    public List<?> selectTbMenuFooterList(TbMenuFooterVO searchVO) throws Exception {
        return tbMenuFooterDAO.selectTbMenuFooterList(searchVO);
    }

    /**
	 * tb_menu_footer 총 갯수를 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return tb_menu_footer 총 갯수
	 * @exception
	 */
    public int selectTbMenuFooterListTotCnt(TbMenuFooterVO searchVO) {
		return tbMenuFooterDAO.selectTbMenuFooterListTotCnt(searchVO);
	}
    
}
