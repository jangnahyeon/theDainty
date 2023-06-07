package dlink.front.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.egovframe.rte.psl.dataaccess.util.EgovMap;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import dlink.front.dao.FrontTPtplInfoDAO;
import dlink.front.service.FrontTPtplInfoService;
import dlink.front.vo.TPtplInfoVO;


/**
 * @Class Name : TPtplInfoServiceImpl.java
 * @Description : TPtplInfo Business Implement class
 * @Modification Information
 *
 * @author 장나현
 * @since 2022-03-31
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */

@Service("FrontTPtplInfoService")
public class FrontTPtplInfoServiceImpl extends EgovAbstractServiceImpl implements
        FrontTPtplInfoService {
        
    private static final Logger LOGGER = LoggerFactory.getLogger(FrontTPtplInfoServiceImpl.class);

    @Resource(name="FrontTPtplInfoDAO")
    private FrontTPtplInfoDAO frontTPtplInfoDAO;
    
    /** ID Generation */
    //@Resource(name="{egovTPtplInfoIdGnrService}")    
    //private EgovIdGnrService egovIdGnrService;

	/**
	 * t_ptpl_info을 등록한다.
	 * @param vo - 등록할 정보가 담긴 TPtplInfoVO
	 * @return 등록 결과
	 * @exception Exception
	 */
    public void insertTPtplInfo(TPtplInfoVO vo) throws Exception {
    	LOGGER.debug(vo.toString());
    	
    	/** ID Generation Service */
    	//TODO 해당 테이블 속성에 따라 ID 제너레이션 서비스 사용
    	//String id = egovIdGnrService.getNextStringId();
    	//vo.setId(id);
    	LOGGER.debug(vo.toString());
    	
    	frontTPtplInfoDAO.insertTPtplInfo(vo);
    	//TODO 해당 테이블 정보에 맞게 수정    	
        return;
    }
    public void insertTPtplInfoImg(TPtplInfoVO vo) throws Exception {
    	
    	frontTPtplInfoDAO.insertTPtplInfoImg(vo);
    	//TODO 해당 테이블 정보에 맞게 수정    	
        return;
    }
    public void insertTPtplInfoMultiImg(TPtplInfoVO vo) throws Exception {
    	
    	frontTPtplInfoDAO.insertTPtplInfoMultiImg(vo);
    	//TODO 해당 테이블 정보에 맞게 수정    	
        return;
    }

    /**
	 * t_ptpl_info을 수정한다.
	 * @param vo - 수정할 정보가 담긴 TPtplInfoVO
	 * @return void형
	 * @exception Exception
	 */
    public void updateTPtplInfo(TPtplInfoVO vo) throws Exception {
        frontTPtplInfoDAO.updateTPtplInfo(vo);
    }

    /**
	 * t_ptpl_info을 삭제한다.
	 * @param vo - 삭제할 정보가 담긴 TPtplInfoVO
	 * @return void형 
	 * @exception Exception
	 */
    public void deleteTPtplInfo(TPtplInfoVO vo) throws Exception {
        frontTPtplInfoDAO.deleteTPtplInfo(vo);
    }
    public void deleteTPtplInfoImg(TPtplInfoVO vo) throws Exception {
        frontTPtplInfoDAO.deleteTPtplInfoImg(vo);
    }

    /**
	 * t_ptpl_info을 조회한다.
	 * @param vo - 조회할 정보가 담긴 TPtplInfoVO
	 * @return 조회한 t_ptpl_info
	 * @exception Exception
	 */
    public TPtplInfoVO selectTPtplInfo(TPtplInfoVO vo) throws Exception {
    	TPtplInfoVO resultVO = frontTPtplInfoDAO.selectTPtplInfo(vo);
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
    public List<?> selectTPtplInfoList(TPtplInfoVO searchVO) throws Exception {
        return frontTPtplInfoDAO.selectTPtplInfoList(searchVO);
    }

    /**
	 * t_ptpl_info 총 갯수를 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return t_ptpl_info 총 갯수
	 * @exception
	 */
    public int selectTPtplInfoListTotCnt(TPtplInfoVO searchVO) {
		return frontTPtplInfoDAO.selectTPtplInfoListTotCnt(searchVO);
	}
    
    public List<?> selectCategoryNm(EgovMap vo) throws Exception {
        return frontTPtplInfoDAO.selectCategoryNm(vo);
    }
    
    public List<EgovMap> searchPortfolio(TPtplInfoVO vo) throws Exception {
        return frontTPtplInfoDAO.searchPortfolio(vo);
    }
    
    public int selectPtplFavoriteCnt(TPtplInfoVO searchVO) {
		return frontTPtplInfoDAO.selectPtplFavoriteCnt(searchVO);
	}
    
    public void insertPtplFavorite(TPtplInfoVO vo) throws Exception {
    	frontTPtplInfoDAO.insertPtplFavorite(vo);
        return;
    }
    public void deleteTPtplFavorite(TPtplInfoVO vo) throws Exception {
        frontTPtplInfoDAO.deleteTPtplFavorite(vo);
    }
    
    
    
    
    /**
 	 * 관심정보 포트폴리오 조회
 	 */
     public List<?> selectInterestPtplList(TPtplInfoVO searchVO) throws Exception {
         return frontTPtplInfoDAO.selectInterestPtplList(searchVO);
     }
     /**
  	 * 관심정보 포트폴리오 총 갯수
  	 */
     public int selectInterestPtplListTotCnt(TPtplInfoVO searchVO) {
 		return frontTPtplInfoDAO.selectInterestPtplListTotCnt(searchVO);
 	}
     
}
