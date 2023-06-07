package dlink.admin.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import dlink.admin.service.TCodeService;
import dlink.admin.vo.SearchVO;
import dlink.admin.vo.TCodeVO;
import dlink.admin.dao.TCodeDAO;

/**
 * @Class Name : TCodeServiceImpl.java
 * @Description : TCode Business Implement class
 * @Modification Information
 *
 * @author 안성찬
 * @since 2022-03-30
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */

@Service("TCodeService")
public class TCodeServiceImpl extends EgovAbstractServiceImpl implements
        TCodeService {
        
    private static final Logger LOGGER = LoggerFactory.getLogger(TCodeServiceImpl.class);

    @Resource(name="TCodeDAO")
    private TCodeDAO TCodeDAO;
    
    /** ID Generation */
    //@Resource(name="{egovTCodeIdGnrService}")    
    //private EgovIdGnrService egovIdGnrService;

	/**
	 * t_code을 등록한다.
	 * @param vo - 등록할 정보가 담긴 TCodeVO
	 * @return 등록 결과
	 * @exception Exception
	 */
    public String insertTCode(TCodeVO vo) throws Exception {
    	LOGGER.debug(vo.toString());
    	
    	/** ID Generation Service */
    	//TODO 해당 테이블 속성에 따라 ID 제너레이션 서비스 사용
    	//String id = egovIdGnrService.getNextStringId();
    	//vo.setId(id);
    	LOGGER.debug(vo.toString());
    	
    	TCodeDAO.insertTCode(vo);
    	//TODO 해당 테이블 정보에 맞게 수정    	
        return null;
    }

    /**
	 * t_code을 수정한다.
	 * @param vo - 수정할 정보가 담긴 TCodeVO
	 * @return void형
	 * @exception Exception
	 */
    public void updateTCode(TCodeVO vo) throws Exception {
        TCodeDAO.updateTCode(vo);
    }

    /**
	 * t_code을 삭제한다.
	 * @param vo - 삭제할 정보가 담긴 TCodeVO
	 * @return void형 
	 * @exception Exception
	 */
    public void deleteTCode(TCodeVO vo) throws Exception {
        TCodeDAO.deleteTCode(vo);
    }

    /**
	 * t_code을 조회한다.
	 * @param vo - 조회할 정보가 담긴 TCodeVO
	 * @return 조회한 t_code
	 * @exception Exception
	 */
    public TCodeVO selectTCode(TCodeVO vo) throws Exception {
        TCodeVO resultVO = TCodeDAO.selectTCode(vo);
        if (resultVO == null)
            throw processException("info.nodata.msg");
        return resultVO;
    }

    /**
	 * t_code 목록을 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return t_code 목록
	 * @exception Exception
	 */
    public List<TCodeVO> selectTCodeList(TCodeVO searchVO) throws Exception {
        return TCodeDAO.selectTCodeList(searchVO);
    }

    /**
	 * t_code 총 갯수를 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return t_code 총 갯수
	 * @exception
	 */
    public int selectTCodeListTotCnt(SearchVO searchVO) {
		return TCodeDAO.selectTCodeListTotCnt(searchVO);
	}
    
}
