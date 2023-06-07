package dlink.admin.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import dlink.admin.service.TMemAccptService;
import dlink.admin.vo.SearchVO;
import dlink.admin.vo.TMemAccptVO;
import dlink.admin.dao.TMemAccptDAO;

/**
 * @Class Name : TMemAccptServiceImpl.java
 * @Description : TMemAccpt Business Implement class
 * @Modification Information
 *
 * @author 이은지
 * @since 2022-03-30
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */

@Service("TMemAccptService")
public class TMemAccptServiceImpl extends EgovAbstractServiceImpl implements
        TMemAccptService {
        
    private static final Logger LOGGER = LoggerFactory.getLogger(TMemAccptServiceImpl.class);

    @Resource(name="TMemAccptDAO")
    private TMemAccptDAO TMemAccptDAO;
    
    /** ID Generation */
    //@Resource(name="{egovTMemAccptIdGnrService}")    
    //private EgovIdGnrService egovIdGnrService;

	/**
	 * t_mem_accpt을 등록한다.
	 * @param vo - 등록할 정보가 담긴 TMemAccptVO
	 * @return 등록 결과
	 * @exception Exception
	 */
    public String insertTMemAccpt(TMemAccptVO vo) throws Exception {
    	LOGGER.debug(vo.toString());
    	
    	/** ID Generation Service */
    	//TODO 해당 테이블 속성에 따라 ID 제너레이션 서비스 사용
    	//String id = egovIdGnrService.getNextStringId();
    	//vo.setId(id);
    	LOGGER.debug(vo.toString());
    	
    	TMemAccptDAO.insertTMemAccpt(vo);
    	//TODO 해당 테이블 정보에 맞게 수정    	
        return null;
    }

    /**
	 * t_mem_accpt을 수정한다.
	 * @param vo - 수정할 정보가 담긴 TMemAccptVO
	 * @return void형
	 * @exception Exception
	 */
    public void updateTMemAccpt(TMemAccptVO vo) throws Exception {
        TMemAccptDAO.updateTMemAccpt(vo);
    }

    /**
	 * t_mem_accpt을 삭제한다.
	 * @param vo - 삭제할 정보가 담긴 TMemAccptVO
	 * @return void형 
	 * @exception Exception
	 */
    public void deleteTMemAccpt(TMemAccptVO vo) throws Exception {
        TMemAccptDAO.deleteTMemAccpt(vo);
    }

    /**
	 * t_mem_accpt을 조회한다.
	 * @param vo - 조회할 정보가 담긴 TMemAccptVO
	 * @return 조회한 t_mem_accpt
	 * @exception Exception
	 */
    public TMemAccptVO selectTMemAccpt(TMemAccptVO vo) throws Exception {
        TMemAccptVO resultVO = TMemAccptDAO.selectTMemAccpt(vo);
        if (resultVO == null)
            throw processException("info.nodata.msg");
        return resultVO;
    }

    /**
	 * t_mem_accpt 목록을 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return t_mem_accpt 목록
	 * @exception Exception
	 */
    public List<?> selectTMemAccptList(SearchVO searchVO) throws Exception {
        return TMemAccptDAO.selectTMemAccptList(searchVO);
    }

    /**
	 * t_mem_accpt 총 갯수를 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return t_mem_accpt 총 갯수
	 * @exception
	 */
    public int selectTMemAccptListTotCnt(SearchVO searchVO) {
		return TMemAccptDAO.selectTMemAccptListTotCnt(searchVO);
	}
    
    //로그인
    public TMemAccptVO selectLogin(TMemAccptVO vo) throws Exception {
        return TMemAccptDAO.selectLogin(vo);
    }
    
    /**
	 * t_mem_accpt을 수정한다.
	 * @param vo - 수정할 정보가 담긴 LoginVO
	 * @return void형
	 * @exception Exception
	 */
    public void updateUserPsw(TMemAccptVO vo) throws Exception{
    	TMemAccptDAO.updateUserPsw(vo);
    }
    
  //아이디중복확인
    public int pwCheck(TMemAccptVO vo) {
        int cnt = TMemAccptDAO.pwCheck(vo);
        return cnt;
    }
   
    
}
