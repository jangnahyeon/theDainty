package dlink.front.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import dlink.front.service.TReqUserService;
import dlink.front.vo.FrontSearchVO;
import dlink.front.vo.TReqUserVO;
import dlink.admin.vo.SearchVO;
import dlink.front.dao.TReqUserDAO;

/**
 * @Class Name : TReqUserServiceImpl.java
 * @Description : TReqUser Business Implement class
 * @Modification Information
 *
 * @author 이은지
 * @since 2022-04-11
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */

@Service("TReqUserService")
public class TReqUserServiceImpl extends EgovAbstractServiceImpl implements
        TReqUserService {
        
    private static final Logger LOGGER = LoggerFactory.getLogger(TReqUserServiceImpl.class);

    @Resource(name="TReqUserDAO")
    private TReqUserDAO TReqUserDAO;
    
    /** ID Generation */
    //@Resource(name="{egovTReqUserIdGnrService}")    
    //private EgovIdGnrService egovIdGnrService;

	/**
	 * t_req_user을 등록한다.
	 * @param vo - 등록할 정보가 담긴 TReqUserVO
	 * @return 등록 결과
	 * @exception Exception
	 */
    public String insertTReqUser(TReqUserVO vo) throws Exception {
    	LOGGER.debug(vo.toString());
    	
    	/** ID Generation Service */
    	//TODO 해당 테이블 속성에 따라 ID 제너레이션 서비스 사용
    	//String id = egovIdGnrService.getNextStringId();
    	//vo.setId(id);
    	LOGGER.debug(vo.toString());
    	
    	TReqUserDAO.insertTReqUser(vo);
    	//TODO 해당 테이블 정보에 맞게 수정    	
        return null;
    }
    public String insertTMemUser(TReqUserVO vo) throws Exception {
    	LOGGER.debug(vo.toString());
    	
    	/** ID Generation Service */
    	//TODO 해당 테이블 속성에 따라 ID 제너레이션 서비스 사용
    	//String id = egovIdGnrService.getNextStringId();
    	//vo.setId(id);
    	LOGGER.debug(vo.toString());
    	
    	TReqUserDAO.insertTMemUser(vo);
    	//TODO 해당 테이블 정보에 맞게 수정    	
        return null;
    }
    public String insertTAccptUser(TReqUserVO vo) throws Exception {
    	LOGGER.debug(vo.toString());
    	
    	/** ID Generation Service */
    	//TODO 해당 테이블 속성에 따라 ID 제너레이션 서비스 사용
    	//String id = egovIdGnrService.getNextStringId();
    	//vo.setId(id);
    	LOGGER.debug(vo.toString());
    	
    	TReqUserDAO.insertTAccptUser(vo);
    	//TODO 해당 테이블 정보에 맞게 수정    	
        return null;
    }

    /**
	 * t_req_user을 수정한다.
	 * @param vo - 수정할 정보가 담긴 TReqUserVO
	 * @return void형
	 * @exception Exception
	 */
    public void updateTReqUser(TReqUserVO vo) throws Exception {
        TReqUserDAO.updateTReqUser(vo);
    }
    public void updateTReqMemAcceptYn(TReqUserVO vo) throws Exception {
        TReqUserDAO.updateTReqMemAcceptYn(vo);
    }

    /**
	 * t_req_user을 삭제한다.
	 * @param vo - 삭제할 정보가 담긴 TReqUserVO
	 * @return void형 
	 * @exception Exception
	 */
    public void deleteTReqUser(TReqUserVO vo) throws Exception {
        TReqUserDAO.deleteTReqUser(vo);
    }

    /**
	 * t_req_user을 조회한다.
	 * @param vo - 조회할 정보가 담긴 TReqUserVO
	 * @return 조회한 t_req_user
	 * @exception Exception
	 */
    public TReqUserVO selectTReqUser(TReqUserVO vo) throws Exception {
        TReqUserVO resultVO = TReqUserDAO.selectTReqUser(vo);
        if (resultVO == null)
            throw processException("info.nodata.msg");
        return resultVO;
    }

    /**
	 * t_req_user 목록을 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return t_req_user 목록
	 * @exception Exception
	 */
    public List<?> selectTReqUserList(SearchVO searchVO) throws Exception {
        return TReqUserDAO.selectTReqUserList(searchVO);
    }

    /**
	 * t_req_user 총 갯수를 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return t_req_user 총 갯수
	 * @exception
	 */
    public int selectTReqUserListTotCnt(SearchVO searchVO) {
		return TReqUserDAO.selectTReqUserListTotCnt(searchVO);
	}
    
    
    //아이디중복확인
    public int idCheck(String loginId) {
        int cnt = TReqUserDAO.idCheck(loginId);
        return cnt;
    }
    
}
