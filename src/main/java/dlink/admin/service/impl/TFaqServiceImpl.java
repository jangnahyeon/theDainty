package dlink.admin.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import dlink.admin.service.TFaqService;
import dlink.admin.vo.SearchVO;
import dlink.admin.vo.TFaqVO;
import dlink.admin.dao.TFaqDAO;

/**
 * @Class Name : TFaqServiceImpl.java
 * @Description : TFaq Business Implement class
 * @Modification Information
 *
 * @author 이효진
 * @since 2022-03-30
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */

@Service("TFaqService")
public class TFaqServiceImpl extends EgovAbstractServiceImpl implements
        TFaqService {
        
    private static final Logger LOGGER = LoggerFactory.getLogger(TFaqServiceImpl.class);

    @Resource(name="TFaqDAO")
    private TFaqDAO TFaqDAO;
    
    /** ID Generation */
    //@Resource(name="{egovTFaqIdGnrService}")    
    //private EgovIdGnrService egovIdGnrService;

	/**
	 * t_faq을 등록한다.
	 * @param vo - 등록할 정보가 담긴 TFaqVO
	 * @return 등록 결과
	 * @exception Exception
	 */
    public String insertTFaq(TFaqVO vo) throws Exception {
    	LOGGER.debug(vo.toString());
    	
    	/** ID Generation Service */
    	//TODO 해당 테이블 속성에 따라 ID 제너레이션 서비스 사용
    	//String id = egovIdGnrService.getNextStringId();
    	//vo.setId(id);
    	LOGGER.debug(vo.toString());
    	
    	TFaqDAO.insertTFaq(vo);
    	//TODO 해당 테이블 정보에 맞게 수정    	
        return null;
    }

    /**
	 * t_faq을 수정한다.
	 * @param vo - 수정할 정보가 담긴 TFaqVO
	 * @return void형
	 * @exception Exception
	 */
    public void updateTFaq(TFaqVO vo) throws Exception {
        TFaqDAO.updateTFaq(vo);
    }

    /**
	 * t_faq을 삭제한다.
	 * @param vo - 삭제할 정보가 담긴 TFaqVO
	 * @return void형 
	 * @exception Exception
	 */
    public void deleteTFaq(TFaqVO vo) throws Exception {
        TFaqDAO.deleteTFaq(vo);
    }

    /**
	 * t_faq을 조회한다.
	 * @param vo - 조회할 정보가 담긴 TFaqVO
	 * @return 조회한 t_faq
	 * @exception Exception
	 */
    public TFaqVO selectTFaq(TFaqVO vo) throws Exception {
        TFaqVO resultVO = TFaqDAO.selectTFaq(vo);
        if (resultVO == null)
            throw processException("info.nodata.msg");
        return resultVO;
    }

    /**
	 * t_faq 목록을 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return t_faq 목록
	 * @exception Exception
	 */
    public List<?> selectTFaqList(SearchVO searchVO) throws Exception {
        return TFaqDAO.selectTFaqList(searchVO);
    }

    /**
	 * t_faq 총 갯수를 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return t_faq 총 갯수
	 * @exception
	 */
    public int selectTFaqListTotCnt(SearchVO searchVO) {
		return TFaqDAO.selectTFaqListTotCnt(searchVO);
	}

	@Override
	public int selectForInsertCd(TFaqVO vo) throws Exception {
		return TFaqDAO.selectForInsertCd(vo);
	}
    
}
