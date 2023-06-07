package dlink.admin.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import dlink.admin.service.TSpecComService;
import dlink.admin.vo.SearchVO;
import dlink.admin.vo.TSpecComVO;
import dlink.admin.dao.TSpecComDAO;

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

@Service("TSpecComService")
public class TSpecComServiceImpl extends EgovAbstractServiceImpl implements
        TSpecComService {
        
    private static final Logger LOGGER = LoggerFactory.getLogger(TSpecComServiceImpl.class);

    @Resource(name="TSpecComDAO")
    private TSpecComDAO TSpecComDAO;
    
    /** ID Generation */
    //@Resource(name="{egovTSpecReqComIdGnrService}")    
    //private EgovIdGnrService egovIdGnrService;

	/**
	 * t_spec_req_com을 등록한다.
	 * @param vo - 등록할 정보가 담긴 TSpecReqComVO
	 * @return 등록 결과
	 * @exception Exception
	 */
    public String insertTSpecCom(TSpecComVO TSpecComVO) throws Exception {
    	LOGGER.debug(TSpecComVO.toString());
    	
    	/** ID Generation Service */
    	//TODO 해당 테이블 속성에 따라 ID 제너레이션 서비스 사용
    	//String id = egovIdGnrService.getNextStringId();
    	//vo.setId(id);
    	LOGGER.debug(TSpecComVO.toString());
    	
    	TSpecComDAO.insertTSpecCom(TSpecComVO);
    	//TODO 해당 테이블 정보에 맞게 수정    	
        return null;
    }


    
    /**
	 * t_spec_req_com을 등록한다.
	 * @param vo - 등록할 정보가 담긴 TSpecReqComVO
	 * @return 등록 결과
	 * @exception Exception
	 */
    public String insertTSpecMem(TSpecComVO TSpecComVO) throws Exception {
    	LOGGER.debug(TSpecComVO.toString());
    	
    	/** ID Generation Service */
    	//TODO 해당 테이블 속성에 따라 ID 제너레이션 서비스 사용
    	//String id = egovIdGnrService.getNextStringId();
    	//vo.setId(id);
    	LOGGER.debug(TSpecComVO.toString());
    	
    	TSpecComDAO.insertTSpecMem(TSpecComVO);
    	//TODO 해당 테이블 정보에 맞게 수정    	
        return null;
    }
    
    @Override
	public int selectSpecNoInsertCd(TSpecComVO TSpecComVO) throws Exception {
		return TSpecComDAO.selectSpecNoInsertCd(TSpecComVO);
	}
    
    @Override
  	public int selectSeqInsertCd(TSpecComVO TSpecComVO) throws Exception {
  		return TSpecComDAO.selectSeqInsertCd(TSpecComVO);
  	}
    
 
    /**
  	 * t_spec_com 목록을 조회한다.
  	 * @param searchVO - 조회할 정보가 담긴 VO
  	 * @return t_spec_com 목록
  	 * @exception Exception
  	 */
      public List<?> selectTSpecList(SearchVO searchVO) throws Exception {
          return TSpecComDAO.selectTSpecList(searchVO);
      }

      /**
  	 * t_spec_com 총 갯수를 조회한다.
  	 * @param searchVO - 조회할 정보가 담긴 VO
  	 * @return t_spec_com 총 갯수
  	 * @exception
  	 */
      public int selectTSpecListTotCnt(SearchVO searchVO) {
  		return TSpecComDAO.selectTSpecListTotCnt(searchVO);
  	}
      
      /**
  	 * t_spec_com,t_mem_com을 조회한다.
  	 * @param vo - 조회할 정보가 담긴 TSpecComVO
  	 * @return 조회한 t_spec_com,t_mem_com
  	 * @exception Exception
  	 */
      public TSpecComVO selectTSpecCom(TSpecComVO TSpecComVO) throws Exception {
    	  TSpecComVO resultVO = TSpecComDAO.selectTSpecCom(TSpecComVO);
          if (resultVO == null)
              throw processException("info.nodata.msg");
          return resultVO;
      }
      
      /**
     	 * t_spec_mem을 조회한다.
     	 * @param vo - 조회할 정보가 담긴 TSpecComVO
     	 * @return void형 
     	 * @exception Exception
     	 */
  	public List<?> selectTSpecMemList(TSpecComVO TSpecComVO) throws Exception {
  		return TSpecComDAO.selectTSpecMemList(TSpecComVO);
        
      }
  	
    /**
  	 * t_spec_mem을 삭제한다.
  	 * @param vo - 삭제할 정보가 담긴 TSpecReqComVO
  	 * @return void형 
  	 * @exception Exception
  	 */
      public void deleteTSpecMem(TSpecComVO TSpecComVO) throws Exception {
    	  TSpecComDAO.deleteTSpecMem(TSpecComVO);
      }
      
      
      /**
  	 * t_spec_com을 삭제한다.
  	 * @param vo - 삭제할 정보가 담긴 TSpecReqComVO
  	 * @return void형 
  	 * @exception Exception
  	 */
      public void deleteTSpecCom(TSpecComVO TSpecComVO) throws Exception {
    	  TSpecComDAO.deleteTSpecCom(TSpecComVO);
      }



	@Override
	public List<?> selectTMemComFileList(TSpecComVO searchVO) throws Exception {
		return TSpecComDAO.selectTMemComFileList(searchVO);
	}
}
