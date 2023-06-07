package dlink.front.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.egovframe.rte.psl.dataaccess.util.EgovMap;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import dlink.front.service.TReqComService;
import dlink.front.vo.FrontSearchVO;
import dlink.front.vo.TReqComFileVO;
import dlink.front.vo.TReqComVO;
import dlink.admin.vo.TMemComFileVO;
import dlink.front.dao.TReqComDAO;

/**
 * @Class Name : TReqComServiceImpl.java
 * @Description : TReqCom Business Implement class
 * @Modification Information
 *
 * @author 이은지
 * @since 2022-04-13
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */

@Service("TReqComService")
public class TReqComServiceImpl extends EgovAbstractServiceImpl implements
        TReqComService {
        
    private static final Logger LOGGER = LoggerFactory.getLogger(TReqComServiceImpl.class);

    @Resource(name="TReqComDAO")
    private TReqComDAO TReqComDAO;
    
    /** ID Generation */
    //@Resource(name="{egovTReqComIdGnrService}")    
    //private EgovIdGnrService egovIdGnrService;

	/**
	 * t_req_com을 등록한다.
	 * @param vo - 등록할 정보가 담긴 TReqComVO
	 * @return 등록 결과
	 * @exception Exception
	 */
    public String insertTReqCom(TReqComVO vo) throws Exception {
    	LOGGER.debug(vo.toString());
    	
    	/** ID Generation Service */
    	//TODO 해당 테이블 속성에 따라 ID 제너레이션 서비스 사용
    	//String id = egovIdGnrService.getNextStringId();
    	//vo.setId(id);
    	LOGGER.debug(vo.toString());
    	
    	TReqComDAO.insertTReqCom(vo);
    	//TODO 해당 테이블 정보에 맞게 수정    	
        return null;
    }
    /* 파일첨부*/
    public void insertTMemComFile(TReqComFileVO vo) throws Exception {
    	
    	TReqComDAO.insertTMemComFile(vo);
    	//TODO 해당 테이블 정보에 맞게 수정    	
        return;
    }
    
       

    /**
	 * t_req_com을 수정한다.
	 * @param vo - 수정할 정보가 담긴 TReqComVO
	 * @return void형
	 * @exception Exception
	 */
    public void updateTReqCom(TReqComVO vo) throws Exception {
        TReqComDAO.updateTReqCom(vo);
    }

    /**
	 * t_req_com을 삭제한다.
	 * @param vo - 삭제할 정보가 담긴 TReqComVO
	 * @return void형 
	 * @exception Exception
	 */
    public void deleteTReqCom(TReqComVO vo) throws Exception {
        TReqComDAO.deleteTReqCom(vo);
    }

    /**
	 * t_req_com을 조회한다.
	 * @param vo - 조회할 정보가 담긴 TReqComVO
	 * @return 조회한 t_req_com
	 * @exception Exception
	 */
    public TReqComVO selectTReqCom(TReqComVO vo) throws Exception {
        TReqComVO resultVO = TReqComDAO.selectTReqCom(vo);
        if (resultVO == null)
            throw processException("info.nodata.msg");
        return resultVO;
    }

    /**
	 * t_req_com 목록을 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return t_req_com 목록
	 * @exception Exception
	 */
    public List<?> selectTReqComList(FrontSearchVO searchVO) throws Exception {
        return TReqComDAO.selectTReqComList(searchVO);
    }

    /**
	 * t_req_com 총 갯수를 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return t_req_com 총 갯수
	 * @exception
	 */
    public int selectTReqComListTotCnt(FrontSearchVO searchVO) {
		return TReqComDAO.selectTReqComListTotCnt(searchVO);
	}
    
  //아이디중복확인
    public int comIdCheck(String comId) {
        int cnt = TReqComDAO.comIdCheck(comId);
        return cnt;
        
    }
    
    
    public List<?> selectReqComFileList(TReqComVO vo) throws Exception {
        return TReqComDAO.selectReqComFileList(vo);
    }

	@Override
	public void updateTReqComAccept(TReqComVO vo) throws Exception {
		TReqComDAO.updateTReqComAccept(vo);
	}

	@Override
	public void insertMemAccpt(TReqComVO vo) throws Exception {
		TReqComDAO.insertMemAccpt(vo);
	}

	@Override
	public void insertMemCom(TReqComVO vo) throws Exception {
		TReqComDAO.insertMemCom(vo);
	}

	@Override
	public void insertMemComFile(TReqComVO vo) throws Exception {
		TReqComDAO.insertMemComFile(vo);
	}
   
}
