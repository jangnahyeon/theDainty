package dlink.admin.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import dlink.admin.service.TMemUserService;
import dlink.admin.vo.SearchVO;
import dlink.admin.vo.TMemAccptVO;
import dlink.admin.vo.TMemUserVO;
import dlink.admin.dao.TMemUserDAO;

/**
 * @Class Name : TMemUserServiceImpl.java
 * @Description : TMemUser Business Implement class
 * @Modification Information
 *
 * @author 이은지
 * @since 2022-04-06
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */

@Service("TMemUserService")
public class TMemUserServiceImpl extends EgovAbstractServiceImpl implements
        TMemUserService {
        
    private static final Logger LOGGER = LoggerFactory.getLogger(TMemUserServiceImpl.class);

    @Resource(name="TMemUserDAO")
    private TMemUserDAO TMemUserDAO;
    
    /** ID Generation */
    //@Resource(name="{egovTMemUserIdGnrService}")    
    //private EgovIdGnrService egovIdGnrService;

	/**
	 * t_mem_user을 등록한다.
	 * @param vo - 등록할 정보가 담긴 TMemUserVO
	 * @return 등록 결과
	 * @exception Exception
	 */
    public String insertTMemUser(TMemAccptVO vo) throws Exception {
    	LOGGER.debug(vo.toString());
    	
    	/** ID Generation Service */
    	//TODO 해당 테이블 속성에 따라 ID 제너레이션 서비스 사용
    	//String id = egovIdGnrService.getNextStringId();
    	//vo.setId(id);
    	LOGGER.debug(vo.toString());
    	
    	TMemUserDAO.insertTMemUser(vo);
    	//TODO 해당 테이블 정보에 맞게 수정    	
        return null;
    }

    /**
	 * t_mem_user을 수정한다.
	 * @param vo - 수정할 정보가 담긴 TMemUserVO
	 * @return void형
	 * @exception Exception
	 */
    public void updateTMemUser(TMemUserVO vo) throws Exception {
        TMemUserDAO.updateTMemUser(vo);
    }

    /**
	 * t_mem_user을 삭제한다.
	 * @param vo - 삭제할 정보가 담긴 TMemUserVO
	 * @return void형 
	 * @exception Exception
	 */
    public void deleteTMemUser(TMemUserVO vo) throws Exception {
        TMemUserDAO.deleteTMemUser(vo);
    }

    /**
	 * t_mem_user을 조회한다.
	 * @param vo - 조회할 정보가 담긴 TMemUserVO
	 * @return 조회한 t_mem_user
	 * @exception Exception
	 */
    public TMemUserVO selectTMemUser(TMemUserVO vo) throws Exception {
        TMemUserVO resultVO = TMemUserDAO.selectTMemUser(vo);
        if (resultVO == null)
            throw processException("info.nodata.msg");
        return resultVO;
    }
    
    /**
	 * t_mem_user 목록을 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return t_mem_user 목록
	 * @exception Exception
	 */
    public List<?> selectTMemUserList(SearchVO searchVO) throws Exception {
        return TMemUserDAO.selectTMemUserList(searchVO);
    }
    
    /**
	 * t_mem_user 총 갯수를 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return t_mem_user 총 갯수
	 * @exception
	 */
    public int selectTMemUserListTotCnt(SearchVO searchVO) {
		return TMemUserDAO.selectTMemUserListTotCnt(searchVO);
	}
    
    public String insertMemAccpt(TMemUserVO vo) throws Exception {
    	LOGGER.debug(vo.toString());
    	
    	/** ID Generation Service */
    	//TODO 해당 테이블 속성에 따라 ID 제너레이션 서비스 사용
    	//String id = egovIdGnrService.getNextStringId();
    	//vo.setId(id);
    	LOGGER.debug(vo.toString());
    	
    	TMemUserDAO.insertMemAccpt(vo);
    	//TODO 해당 테이블 정보에 맞게 수정    	
        return null;
    }
    
    public String insertReqMemToTMemUser(TMemUserVO vo) throws Exception {
    	LOGGER.debug(vo.toString());
    	
    	/** ID Generation Service */
    	//TODO 해당 테이블 속성에 따라 ID 제너레이션 서비스 사용
    	//String id = egovIdGnrService.getNextStringId();
    	//vo.setId(id);
    	LOGGER.debug(vo.toString());
    	
    	TMemUserDAO.insertReqMemToTMemUser(vo);
    	//TODO 해당 테이블 정보에 맞게 수정    	
        return null;
    }

	@Override
	public String insertTMemUser(TMemUserVO vo) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
    
    
 
    }
