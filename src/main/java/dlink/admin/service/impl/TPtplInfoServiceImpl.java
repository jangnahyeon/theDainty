package dlink.admin.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


import dlink.admin.service.TPtplInfoService;
import dlink.admin.vo.SearchVO;
import dlink.admin.vo.TPtplInfoVO;
import dlink.admin.dao.TPtplInfoDAO;

/**
 * @Class Name : TPtplInfoServiceImpl.java
 * @Description : TPtplInfo Business Implement class
 * @Modification Information
 *
 * @author 장나현
 * @since 2022-03-30
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */

@Service("TPtplInfoService")
public class TPtplInfoServiceImpl extends EgovAbstractServiceImpl implements
        TPtplInfoService {
        
    private static final Logger LOGGER = LoggerFactory.getLogger(TPtplInfoServiceImpl.class);

    @Resource(name="TPtplInfoDAO")
    private TPtplInfoDAO TPtplInfoDAO;
    
    /** ID Generation */
    //@Resource(name="{egovTPtplInfoIdGnrService}")    
    //private EgovIdGnrService egovIdGnrService;

	/**
	 * t_ptpl_info을 등록한다.
	 * @param vo - 등록할 정보가 담긴 TPtplInfoVO
	 * @return 등록 결과
	 * @exception Exception
	 */
    public String insertTPtplInfo(TPtplInfoVO vo) throws Exception {
    	LOGGER.debug(vo.toString());
    	
    	/** ID Generation Service */
    	//TODO 해당 테이블 속성에 따라 ID 제너레이션 서비스 사용
    	//String id = egovIdGnrService.getNextStringId();
    	//vo.setId(id);
    	LOGGER.debug(vo.toString());
    	
    	TPtplInfoDAO.insertTPtplInfo(vo);
    	//TODO 해당 테이블 정보에 맞게 수정    	
        return null;
    }

    /**
	 * t_ptpl_info을 수정한다.
	 * @param vo - 수정할 정보가 담긴 TPtplInfoVO
	 * @return void형
	 * @exception Exception
	 */
    public void updateTPtplInfo(TPtplInfoVO vo) throws Exception {
        TPtplInfoDAO.updateTPtplInfo(vo);
    }

    /**
	 * t_ptpl_info을 삭제한다.
	 * @param vo - 삭제할 정보가 담긴 TPtplInfoVO
	 * @return void형 
	 * @exception Exception
	 */
    public void deleteTPtplInfo(TPtplInfoVO vo) throws Exception {
        TPtplInfoDAO.deleteTPtplInfo(vo);
    }
    public void deleteTPtplInfoImg(TPtplInfoVO vo) throws Exception {
        TPtplInfoDAO.deleteTPtplInfoImg(vo);
    }

    /**
	 * t_ptpl_info을 조회한다.
	 * @param vo - 조회할 정보가 담긴 TPtplInfoVO
	 * @return 조회한 t_ptpl_info
	 * @exception Exception
	 */
    public TPtplInfoVO selectTPtplInfo(TPtplInfoVO vo) throws Exception {
        TPtplInfoVO resultVO = TPtplInfoDAO.selectTPtplInfo(vo);
        if (resultVO == null)
            throw processException("info.nodata.msg");
        return resultVO;
    }

    /**
	 * t_ptpl_info 목록을 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return t_ptpl_info 목록
	 * @exception Exception
	 */
    public List<?> selectTPtplInfoList(SearchVO searchVO) throws Exception {
        return TPtplInfoDAO.selectTPtplInfoList(searchVO);
    }
    
    public List<TPtplInfoVO> selectTPtplInfoImgList(TPtplInfoVO searchVO) throws Exception {
        return TPtplInfoDAO.selectTPtplInfoImgList(searchVO);
    }

    /**
	 * t_ptpl_info 총 갯수를 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return t_ptpl_info 총 갯수
	 * @exception
	 */
    public int selectTPtplInfoListTotCnt(SearchVO searchVO) {
		return TPtplInfoDAO.selectTPtplInfoListTotCnt(searchVO);
	}
    
}
