package dlink_new.admin.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import dlink_new.admin.dao.TbMenuAdminDAO;
import dlink_new.admin.service.TbMenuAdminService;
import dlink_new.admin.vo.TbMenuAdminDefaultVO;
import dlink_new.admin.vo.TbMenuAdminVO;
// Vo 객체에 대한 import 구문
// import (vo package).TbMenuAdminDefaultVO;
// import (vo package).TbMenuAdminVO;
// Dao 객체에 대한 import 구문
// import (dao package).TbMenuAdminDAO;
// Mapper 객체에 대한 import 구문
// import (mapper package).TbMenuAdminMapper;
/**
 * @Class Name : TbMenuAdminServiceImpl.java
 * @Description : TbMenuAdmin Business Implement class
 * @Modification Information
 *
 * @author 김현재
 * @since 2023.01.16
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */

@Service("TbMenuAdminService")
public class TbMenuAdminServiceImpl extends EgovAbstractServiceImpl implements
        TbMenuAdminService {
        
    private static final Logger LOGGER = LoggerFactory.getLogger(TbMenuAdminServiceImpl.class);

    //@Resource(name="TbMenuAdminMapper")
    //private TbMenuAdminMapper TbMenuAdminDAO;
    
    @Resource(name="TbMenuAdminDAO")
    private TbMenuAdminDAO TbMenuAdminDAO;
    
    /** ID Generation */
    //@Resource(name="{egovTbMenuAdminIdGnrService}")    
    //private EgovIdGnrService egovIdGnrService;

	/**
	 * t_menu_admin을 등록한다.
	 * @param vo - 등록할 정보가 담긴 TbMenuAdminVO
	 * @return 등록 결과
	 * @exception Exception
	 */
    public String insertTbMenuAdmin(TbMenuAdminVO vo) throws Exception {
    	LOGGER.debug(vo.toString());
    	
    	/** ID Generation Service */
    	//TODO 해당 테이블 속성에 따라 ID 제너레이션 서비스 사용
    	//String id = egovIdGnrService.getNextStringId();
    	//vo.setId(id);
    	LOGGER.debug(vo.toString());
    	
    	TbMenuAdminDAO.insertTbMenuAdmin(vo);
    	//TODO 해당 테이블 정보에 맞게 수정    	
        return null;
    }

    /**
	 * t_menu_admin을 수정한다.
	 * @param vo - 수정할 정보가 담긴 TbMenuAdminVO
	 * @return void형
	 * @exception Exception
	 */
    public void updateTbMenuAdmin(TbMenuAdminVO vo) throws Exception {
        TbMenuAdminDAO.updateTbMenuAdmin(vo);
    }

    /**
	 * t_menu_admin을 삭제한다.
	 * @param vo - 삭제할 정보가 담긴 TbMenuAdminVO
	 * @return void형 
	 * @exception Exception
	 */
    public void deleteTbMenuAdmin(TbMenuAdminVO vo) throws Exception {
        TbMenuAdminDAO.deleteTbMenuAdmin(vo);
    }

    /**
	 * t_menu_admin을 조회한다.
	 * @param vo - 조회할 정보가 담긴 TbMenuAdminVO
	 * @return 조회한 t_menu_admin
	 * @exception Exception
	 */
    public TbMenuAdminVO selectTbMenuAdmin(TbMenuAdminVO vo) throws Exception {
        TbMenuAdminVO resultVO = TbMenuAdminDAO.selectTbMenuAdmin(vo);
        if (resultVO == null)
            throw processException("info.nodata.msg");
        return resultVO;
    }

    /**
	 * t_menu_admin 목록을 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return t_menu_admin 목록
	 * @exception Exception
	 */
    public List<?> selectTbMenuAdminList(TbMenuAdminDefaultVO searchVO) throws Exception {
        return TbMenuAdminDAO.selectTbMenuAdminList(searchVO);
    }

    /**
	 * t_menu_admin 총 갯수를 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return t_menu_admin 총 갯수
	 * @exception
	 */
    public int selectTbMenuAdminListTotCnt(TbMenuAdminDefaultVO searchVO) {
		return TbMenuAdminDAO.selectTbMenuAdminListTotCnt(searchVO);
	}
    
}
