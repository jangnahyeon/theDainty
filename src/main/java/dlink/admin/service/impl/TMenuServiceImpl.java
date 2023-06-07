package dlink.admin.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import dlink.admin.service.TMenuService;
import dlink.admin.vo.SearchVO;
import dlink.admin.vo.TMenuVO;
import dlink.admin.dao.TMenuDAO;

/**
 * @Class Name : TMenuServiceImpl.java
 * @Description : TMenu Business Implement class
 * @Modification Information
 *
 * @author 안성찬
 * @since 2022-03-31
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */

@Service("TMenuService")
public class TMenuServiceImpl extends org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl implements
        TMenuService {
        
    private static final Logger LOGGER = LoggerFactory.getLogger(TMenuServiceImpl.class);

    @Resource(name="TMenuDAO")
    private TMenuDAO TMenuDAO;
    
    /** ID Generation */
    //@Resource(name="{egovTMenuIdGnrService}")    
    //private EgovIdGnrService egovIdGnrService;

	/**
	 * t_menu을 등록한다.
	 * @param vo - 등록할 정보가 담긴 TMenuVO
	 * @return 등록 결과
	 * @exception Exception
	 */
    public String insertTMenu(TMenuVO vo) throws Exception {
    	LOGGER.debug(vo.toString());
    	
    	/** ID Generation Service */
    	//TODO 해당 테이블 속성에 따라 ID 제너레이션 서비스 사용
    	//String id = egovIdGnrService.getNextStringId();
    	//vo.setId(id);
    	LOGGER.debug(vo.toString());
    	
    	TMenuDAO.insertTMenu(vo);
    	//TODO 해당 테이블 정보에 맞게 수정    	
        return null;
    }

    /**
	 * t_menu을 수정한다.
	 * @param vo - 수정할 정보가 담긴 TMenuVO
	 * @return void형
	 * @exception Exception
	 */
    public void updateTMenu(TMenuVO vo) throws Exception {
        TMenuDAO.updateTMenu(vo);
    }

    /**
	 * t_menu을 삭제한다.
	 * @param vo - 삭제할 정보가 담긴 TMenuVO
	 * @return void형 
	 * @exception Exception
	 */
    public void deleteTMenu(TMenuVO vo) throws Exception {
        TMenuDAO.deleteTMenu(vo);
    }

    /**
	 * t_menu을 조회한다.
	 * @param vo - 조회할 정보가 담긴 TMenuVO
	 * @return 조회한 t_menu
	 * @exception Exception
	 */
    public TMenuVO selectTMenu(TMenuVO vo) throws Exception {
        return TMenuDAO.selectTMenu(vo);
    }

    /**
	 * t_menu 목록을 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return t_menu 목록
	 * @exception Exception
	 */
    public List<?> selectTMenuList(TMenuVO searchVO) throws Exception {
        return TMenuDAO.selectTMenuList(searchVO);
    }

    /**
	 * t_menu 총 갯수를 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return t_menu 총 갯수
	 * @exception
	 */
    public int selectTMenuListTotCnt(SearchVO searchVO) {
		return TMenuDAO.selectTMenuListTotCnt(searchVO);
	}
    
    public List<?> selectTMenuTreeList(TMenuVO searchVO) throws Exception {
        return TMenuDAO.selectTMenuTreeList(searchVO);
    }

    
}
