package dlink.admin.service.impl;

import java.math.BigDecimal;
import java.util.List;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import dlink.admin.service.TSpecReqComService;
import dlink.admin.vo.SearchVO;
import dlink.admin.vo.TMemComVO;
import dlink.admin.vo.TSpecReqComVO;
import dlink.admin.dao.TSpecReqComDAO;

/**
 * @Class Name : TSpecReqComServiceImpl.java
 * @Description : TSpecReqCom Business Implement class
 * @Modification Information
 *
 * @author 이은지
 * @since 2022-04-07
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */

@Service("TSpecReqComService")
public class TSpecReqComServiceImpl extends EgovAbstractServiceImpl implements
        TSpecReqComService {
        
    private static final Logger LOGGER = LoggerFactory.getLogger(TSpecReqComServiceImpl.class);

    @Resource(name="TSpecReqComDAO")
    private TSpecReqComDAO TSpecReqComDAO;
    
    /** ID Generation */
    //@Resource(name="{egovTSpecReqComIdGnrService}")    
    //private EgovIdGnrService egovIdGnrService;

	/**
	 * t_spec_req_com을 등록한다.
	 * @param vo - 등록할 정보가 담긴 TSpecReqComVO
	 * @return 등록 결과
	 * @exception Exception
	 */
    public String insertTSpecReqCom(TSpecReqComVO vo) throws Exception {
    	LOGGER.debug(vo.toString());
    	
    	/** ID Generation Service */
    	//TODO 해당 테이블 속성에 따라 ID 제너레이션 서비스 사용
    	//String id = egovIdGnrService.getNextStringId();
    	//vo.setId(id);
    	LOGGER.debug(vo.toString());
    	
    	TSpecReqComDAO.insertTSpecReqCom(vo);
    	//TODO 해당 테이블 정보에 맞게 수정    	
        return null;
    }

    /* 전문회사 인력현황*/
	public String insertTSpecReqMem(TSpecReqComVO vo) throws Exception {
		TSpecReqComDAO.insertTSpecReqMem(vo);
	    return null;
	}
	/*public String insertTSpecReqMem(TSpecReqComVO vo) throws Exception {
		TSpecReqComDAO.insertTSpecReqMem(vo);
	    return null;
	}*/
	public java.math.BigDecimal selectTSpecReqComReqNo(TSpecReqComVO vo) throws Exception {
    	
	    return TSpecReqComDAO.selectTSpecReqComReqNo(vo);
	}
	/*public java.math.BigDecimal selectTSpecReqMemSeq(TSpecReqComVO vo) throws Exception {
    	
	    return TSpecReqComDAO.selectTSpecReqMemSeq(vo);
	}*/

	
	
      
    
    
    /**
	 * t_spec_req_com을 수정한다.
	 * @param vo - 수정할 정보가 담긴 TSpecReqComVO
	 * @return void형
	 * @exception Exception
	 */
    public void updateTSpecReqCom(TSpecReqComVO vo) throws Exception {
        TSpecReqComDAO.updateTSpecReqCom(vo);
    }

    /**
	 * t_spec_req_com을 삭제한다.
	 * @param vo - 삭제할 정보가 담긴 TSpecReqComVO
	 * @return void형 
	 * @exception Exception
	 */
    public void deleteTSpecReqCom(TSpecReqComVO vo) throws Exception {
        TSpecReqComDAO.deleteTSpecReqCom(vo);
    }

    /**
	 * t_spec_req_com을 조회한다.
	 * @param vo - 조회할 정보가 담긴 TSpecReqComVO
	 * @return 조회한 t_spec_req_com
	 * @exception Exception
	 */
    public TSpecReqComVO selectTSpecReqCom(TSpecReqComVO vo) throws Exception {
        TSpecReqComVO resultVO = TSpecReqComDAO.selectTSpecReqCom(vo);
        if (resultVO == null)
            throw processException("info.nodata.msg");
        return resultVO;
    }

    /**
	 * t_spec_req_com 목록을 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return t_spec_req_com 목록
	 * @exception Exception
	 */
    public List<?> selectTSpecReqComList(SearchVO searchVO) throws Exception {
        return TSpecReqComDAO.selectTSpecReqComList(searchVO);
    }

    /**
	 * t_spec_req_com 총 갯수를 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return t_spec_req_com 총 갯수
	 * @exception
	 */
    public int selectTSpecReqComListTotCnt(SearchVO searchVO) {
		return TSpecReqComDAO.selectTSpecReqComListTotCnt(searchVO);
	}
    
    
    /**
	 * t_spec_req_com을 관리자 승인,반려 한다.
	 * @param vo - 관리자 승인,반려할 정보가 담긴 TSpecReqComVO
	 * @return void형
	 * @exception Exception
	 */
    public void updateAcceptTSpecReqCom(TSpecReqComVO vo) throws Exception {
        TSpecReqComDAO.updateAcceptTSpecReqCom(vo);
    }
    
    
    /**
	 * t_spec_req_com을 등록한다.
	 * @param vo - 등록할 정보가 담긴 TSpecReqComVO
	 * @return 등록 결과
	 * @exception Exception
	 */
    public String insertTSpecCom(TSpecReqComVO vo) throws Exception {
    	LOGGER.debug(vo.toString());
    	
    	/** ID Generation Service */
    	//TODO 해당 테이블 속성에 따라 ID 제너레이션 서비스 사용
    	//String id = egovIdGnrService.getNextStringId();
    	//vo.setId(id);
    	LOGGER.debug(vo.toString());
    	
    	TSpecReqComDAO.insertTSpecCom(vo);
    	//TODO 해당 테이블 정보에 맞게 수정    	
        return null;
    }
    
    
    /**
   	 * t_spec_req_mem 목록을 조회한다.
   	 * @param searchVO - 조회할 정보가 담긴 VO
   	 * @return t_spec_req_mem 목록
   	 * @exception Exception
   	 */
       public List<?> selectAdminTSpecReqMem(TSpecReqComVO vo) throws Exception {
           return TSpecReqComDAO.selectAdminTSpecReqMem(vo);
       }
       
       
       /**
   	 * t_spec_req_com을 삭제한다.
   	 * @param vo - 삭제할 정보가 담긴 TSpecReqComVO
   	 * @return void형 
   	 * @exception Exception
   	 */
       public void deleteTSpecReqMem(TSpecReqComVO vo) throws Exception {
           TSpecReqComDAO.deleteTSpecReqMem(vo);
       }
}
