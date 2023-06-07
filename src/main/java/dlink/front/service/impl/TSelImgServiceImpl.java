package dlink.front.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import dlink.front.service.TSelImgService;
import dlink.front.vo.FrontDsnBankVO;
import dlink.front.vo.TSelImgVO;
import dlink.admin.vo.SearchVO;
import dlink.front.dao.TSelImgDAO;

/**
 * @Class Name : TSelImgServiceImpl.java
 * @Description : TSelImg Business Implement class
 * @Modification Information
 *
 * @author 이효진
 * @since 2022-04-14
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */

@Service("TSelImgService")
public class TSelImgServiceImpl extends EgovAbstractServiceImpl implements
        TSelImgService {
        
    private static final Logger LOGGER = LoggerFactory.getLogger(TSelImgServiceImpl.class);

    @Resource(name="TSelImgDAO")
    private TSelImgDAO TSelImgDAO;
    
    /** ID Generation */
    //@Resource(name="{egovTSelImgIdGnrService}")    
    //private EgovIdGnrService egovIdGnrService;

	/**
	 * t_sel_img을 등록한다.
	 * @param vo - 등록할 정보가 담긴 TSelImgVO
	 * @return 등록 결과
	 * @exception Exception
	 */
    public String insertTSelImg(TSelImgVO vo) throws Exception {
    	LOGGER.debug(vo.toString());
    	
    	/** ID Generation Service */
    	//TODO 해당 테이블 속성에 따라 ID 제너레이션 서비스 사용
    	//String id = egovIdGnrService.getNextStringId();
    	//vo.setId(id);
    	LOGGER.debug(vo.toString());
    	
    	TSelImgDAO.insertTSelImg(vo);
    	//TODO 해당 테이블 정보에 맞게 수정    	
        return null;
    }

    /**
	 * t_sel_img을 수정한다.
	 * @param vo - 수정할 정보가 담긴 TSelImgVO
	 * @return void형
	 * @exception Exception
	 */
    public void updateTSelImg(TSelImgVO vo) throws Exception {
        TSelImgDAO.updateTSelImg(vo);
    }

    /**
	 * t_sel_img을 삭제한다.
	 * @param vo - 삭제할 정보가 담긴 TSelImgVO
	 * @return void형 
	 * @exception Exception
	 */
    public void deleteTSelImg(TSelImgVO vo) throws Exception {
        TSelImgDAO.deleteTSelImg(vo);
    }

    /**
	 * t_sel_img을 조회한다.
	 * @param vo - 조회할 정보가 담긴 TSelImgVO
	 * @return 조회한 t_sel_img
	 * @exception Exception
	 */
    public TSelImgVO selectTSelImg(TSelImgVO vo) throws Exception {
        TSelImgVO resultVO = TSelImgDAO.selectTSelImg(vo);
        if (resultVO == null)
            throw processException("info.nodata.msg");
        return resultVO;
    }

    /**
	 * t_sel_img 목록을 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return t_sel_img 목록
	 * @exception Exception
	 */
    public List<?> selectTSelImgList(SearchVO searchVO) throws Exception {
        return TSelImgDAO.selectTSelImgList(searchVO);
    }

    /**
	 * t_sel_img 총 갯수를 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return t_sel_img 총 갯수
	 * @exception
	 */
    public int selectTSelImgListTotCnt(SearchVO searchVO) {
		return TSelImgDAO.selectTSelImgListTotCnt(searchVO);
	}
    
    public int selectTSelImgFavoriteCnt(TSelImgVO searchVO) {
		return TSelImgDAO.selectTSelImgFavoriteCnt(searchVO);
	}
}
