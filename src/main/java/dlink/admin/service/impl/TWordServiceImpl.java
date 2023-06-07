package dlink.admin.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


import dlink.admin.service.TWordService;
import dlink.admin.vo.SearchVO;
import dlink.admin.vo.TWordVO;
import dlink.admin.dao.TWordDAO;

/**
 * @Class Name : TWordServiceImpl.java
 * @Description : TWord Business Implement class
 * @Modification Information
 *
 * @author 이효진
 * @since 2022-03-30
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */

@Service("TWordService")
public class TWordServiceImpl extends EgovAbstractServiceImpl implements
        TWordService {
        
    private static final Logger LOGGER = LoggerFactory.getLogger(TWordServiceImpl.class);

    @Resource(name="TWordDAO")
    private TWordDAO TWordDAO;
    
    /** ID Generation */
    //@Resource(name="{egovTWordIdGnrService}")    
    //private EgovIdGnrService egovIdGnrService;

	/**
	 * t_word을 등록한다.
	 * @param vo - 등록할 정보가 담긴 TWordVO
	 * @return 등록 결과
	 * @exception Exception
	 */
    public String insertTWord(TWordVO vo) throws Exception {
    	LOGGER.debug(vo.toString());
    	
    	/** ID Generation Service */
    	//TODO 해당 테이블 속성에 따라 ID 제너레이션 서비스 사용
    	//String id = egovIdGnrService.getNextStringId();
    	//vo.setId(id);
    	LOGGER.debug(vo.toString());
    	
    	TWordDAO.insertTWord(vo);
    	//TODO 해당 테이블 정보에 맞게 수정    	
        return null;
    }

    /**
	 * t_word을 수정한다.
	 * @param vo - 수정할 정보가 담긴 TWordVO
	 * @return void형
	 * @exception Exception
	 */
    public void updateTWord(TWordVO vo) throws Exception {
        TWordDAO.updateTWord(vo);
    }

    /**
	 * t_word을 삭제한다.
	 * @param vo - 삭제할 정보가 담긴 TWordVO
	 * @return void형 
	 * @exception Exception
	 */
    public void deleteTWord(TWordVO vo) throws Exception {
        TWordDAO.deleteTWord(vo);
    }

    /**
	 * t_word을 조회한다.
	 * @param vo - 조회할 정보가 담긴 TWordVO
	 * @return 조회한 t_word
	 * @exception Exception
	 */
    public TWordVO selectTWord(TWordVO vo) throws Exception {
        TWordVO resultVO = TWordDAO.selectTWord(vo);
        if (resultVO == null)
            throw processException("info.nodata.msg");
        return resultVO;
    }

    /**
	 * t_word 목록을 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return t_word 목록
	 * @exception Exception
	 */
    public List<?> selectTWordList(SearchVO searchVO) throws Exception {
        return TWordDAO.selectTWordList(searchVO);
    }

    /**
	 * t_word 총 갯수를 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return t_word 총 갯수
	 * @exception
	 */
    public int selectTWordListTotCnt(SearchVO searchVO) {
		return TWordDAO.selectTWordListTotCnt(searchVO);
	}

	@Override
	public int selectForInsertCd(TWordVO vo) throws Exception {
		return TWordDAO.selectForInsertCd(vo);
	}
    
}
