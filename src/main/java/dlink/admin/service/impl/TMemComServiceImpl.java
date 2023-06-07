package dlink.admin.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import dlink.admin.service.TMemComService;
import dlink.admin.vo.SearchVO;
import dlink.admin.vo.TMemComFileVO;
import dlink.admin.vo.TMemComVO;
import dlink.admin.dao.TMemComDAO;

/**
 * @Class Name : TMemComServiceImpl.java
 * @Description : TMemCom Business Implement class
 * @Modification Information
 *
 * @author 이은지
 * @since 2022-03-30
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */

@Service("TMemComService")
public class TMemComServiceImpl extends EgovAbstractServiceImpl implements
	TMemComService {

	private static final Logger LOGGER = LoggerFactory.getLogger(TMemComServiceImpl.class);

    @Resource(name="TMemComDAO")
    private TMemComDAO TMemComDAO;
    
    
    /** ID Generation */
    //@Resource(name="{egovTMemComIdGnrService}")    
    //private EgovIdGnrService egovIdGnrService;

	/**
	 * t_mem_com을 등록한다.
	 * @param vo - 등록할 정보가 담긴 TMemComVO
	 * @return 등록 결과
	 * @exception Exception
	 */
   
    public String insertTMemCom(TMemComVO vo) throws Exception {
    	
    	
    	TMemComDAO.insertTMemCom(vo);
    	//TODO 해당 테이블 정보에 맞게 수정    	
        return null;
    }
    
   /* 파일첨부*/
    public void insertTMemComFile(TMemComFileVO vo) throws Exception {
    	
    	TMemComDAO.insertTMemComFile(vo);
    	//TODO 해당 테이블 정보에 맞게 수정    	
        return;
    }
             
    
    
   
    /**
	 * t_mem_com을 수정한다.
	 * @param vo - 수정할 정보가 담긴 TMemComVO
	 * @return void형
	 * @exception Exception
	 */
    public void updateTMemCom(TMemComVO vo) throws Exception {
        TMemComDAO.updateTMemCom(vo);
    }

    /**
	 * t_mem_com을 삭제한다.
	 * @param vo - 삭제할 정보가 담긴 TMemComVO
	 * @return void형 
	 * @exception Exception
	 */
    public void deleteTMemCom(TMemComVO vo) throws Exception {
        TMemComDAO.deleteTMemCom(vo);
    }

    /**
	 * t_mem_com을 조회한다.
	 * @param vo - 조회할 정보가 담긴 TMemComVO
	 * @return 조회한 t_mem_com
	 * @exception Exception
	 */
    public TMemComVO selectTMemCom(TMemComVO vo) throws Exception {
        TMemComVO resultVO = TMemComDAO.selectTMemCom(vo);
       if (resultVO == null)
            throw processException("info.nodata.msg");
        return resultVO;
    }
        
    /**
	 * t_mem_com 목록을 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return t_mem_com 목록
	 * @exception Exception
	 */
    public List<?> selectTMemComList(SearchVO searchVO) throws Exception {
        return TMemComDAO.selectTMemComList(searchVO);
    }

    /**
	 * t_mem_com 총 갯수를 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return t_mem_com 총 갯수
	 * @exception
	 */
    public int selectTMemComListTotCnt(SearchVO searchVO) {
		return TMemComDAO.selectTMemComListTotCnt(searchVO);
	}
    
    /**
 	 * t_mem_com 목록을 전문업체 조회한다.
 	 * @param searchVO - 조회할 정보가 담긴 VO
 	 * @return t_mem_com 목록
 	 * @exception Exception
 	 */
     public List<?> selectagSearchList(SearchVO searchVO) throws Exception {
         return TMemComDAO.selectagSearchList(searchVO);
     }
     
     /**
 	 * t_mem_com 총 갯수를 전문업체 조회한다.
 	 * @param searchVO - 조회할 정보가 담긴 VO
 	 * @return t_mem_com 총 갯수
 	 * @exception
 	 */
     public int selectagSearchListTotCnt(SearchVO searchVO) {
 		return TMemComDAO.selectagSearchListTotCnt(searchVO);
 	}
     
     public String insertMemAccpt(TMemComVO vo) throws Exception {
     	LOGGER.debug(vo.toString());
     	
     	/** ID Generation Service */
     	//TODO 해당 테이블 속성에 따라 ID 제너레이션 서비스 사용
     	//String id = egovIdGnrService.getNextStringId();
     	//vo.setId(id);
     	LOGGER.debug(vo.toString());
     	
     	TMemComDAO.insertMemAccpt(vo);
     	//TODO 해당 테이블 정보에 맞게 수정    	
         return null;
     }
     
     public String insertReqMemToTMemCom(TMemComVO vo) throws Exception {
     	LOGGER.debug(vo.toString());
     	
     	/** ID Generation Service */
     	//TODO 해당 테이블 속성에 따라 ID 제너레이션 서비스 사용
     	//String id = egovIdGnrService.getNextStringId();
     	//vo.setId(id);
     	LOGGER.debug(vo.toString());
     	
     	TMemComDAO.insertReqMemToTMemCom(vo);
     	//TODO 해당 테이블 정보에 맞게 수정    	
         return null;
     }

	
	
    /**
	 * t_mem_com의 SpecYn을 수정한다.
	 * @param vo - 수정할 정보가 담긴 TMemComVO
	 * @return void형
	 * @exception Exception
	 */
    public void updateSpecYnTMemCom(TMemComVO vo) throws Exception {
        TMemComDAO.updateSpecYnTMemCom(vo);
    }
}
