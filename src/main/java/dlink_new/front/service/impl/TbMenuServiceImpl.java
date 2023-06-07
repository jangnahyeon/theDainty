package dlink_new.front.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import dlink_new.front.dao.TbMenuDAO;
import dlink_new.front.service.TbMenuService;
import dlink_new.front.vo.TbMenuDefaultVO;
import dlink_new.front.vo.TbMenuVO;
// Vo 객체에 대한 import 구문
// import (vo package).TbMenuDefaultVO;
// import (vo package).TbMenuVO;
// Dao 객체에 대한 import 구문
// import (dao package).TbMenuDAO;
// Mapper 객체에 대한 import 구문
// import (mapper package).TbMenuMapper;
/**
 * @Class Name : TbMenuServiceImpl.java
 * @Description : TbMenu Business Implement class
 * @Modification Information
 *
 * @author 김현재
 * @since 2023-01-19
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */

@Service("tbMenuService")
public class TbMenuServiceImpl extends EgovAbstractServiceImpl implements
        TbMenuService {
        
    private static final Logger LOGGER = LoggerFactory.getLogger(TbMenuServiceImpl.class);

//    @Resource(name="tbMenuMapper")
//    private TbMenuMapper tbMenuDAO;
    
    @Resource(name="tbMenuDAO")
    private TbMenuDAO tbMenuDAO;
    
    /** ID Generation */
    //@Resource(name="{egovTbMenuIdGnrService}")    
    //private EgovIdGnrService egovIdGnrService;

	/**
	 * tb_menu을 등록한다.
	 * @param vo - 등록할 정보가 담긴 TbMenuVO
	 * @return 등록 결과
	 * @exception Exception
	 */
    public String insertTbMenu(TbMenuVO vo) throws Exception {
    	LOGGER.debug(vo.toString());
    	
    	/** ID Generation Service */
    	//TODO 해당 테이블 속성에 따라 ID 제너레이션 서비스 사용
    	//String id = egovIdGnrService.getNextStringId();
    	//vo.setId(id);
    	LOGGER.debug(vo.toString());
    	
    	tbMenuDAO.insertTbMenu(vo);
    	//TODO 해당 테이블 정보에 맞게 수정    	
        return null;
    }

    /**
	 * tb_menu을 수정한다.
	 * @param vo - 수정할 정보가 담긴 TbMenuVO
	 * @return void형
	 * @exception Exception
	 */
    public void updateTbMenu(TbMenuVO vo) throws Exception {
        tbMenuDAO.updateTbMenu(vo);
    }

    /**
	 * tb_menu을 삭제한다.
	 * @param vo - 삭제할 정보가 담긴 TbMenuVO
	 * @return void형 
	 * @exception Exception
	 */
    public void deleteTbMenu(TbMenuVO vo) throws Exception {
        tbMenuDAO.deleteTbMenu(vo);
    }

    /**
	 * tb_menu을 조회한다.
	 * @param vo - 조회할 정보가 담긴 TbMenuVO
	 * @return 조회한 tb_menu
	 * @exception Exception
	 */
    public TbMenuVO selectTbMenu(TbMenuVO vo) throws Exception {
        TbMenuVO resultVO = tbMenuDAO.selectTbMenu(vo);
        if (resultVO == null)
            throw processException("info.nodata.msg");
        return resultVO;
    }

    /**
	 * tb_menu 목록을 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return tb_menu 목록
	 * @exception Exception
	 */
    public List<?> selectTbMenuList(TbMenuVO searchVO) throws Exception {
        return tbMenuDAO.selectTbMenuList(searchVO);
    }

    /**
	 * tb_menu 총 갯수를 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return tb_menu 총 갯수
	 * @exception
	 */
    public int selectTbMenuListTotCnt(TbMenuVO searchVO) {
		return tbMenuDAO.selectTbMenuListTotCnt(searchVO);
	}
    
}
