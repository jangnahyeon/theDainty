package dlink.admin.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


import dlink.admin.service.TCommutyService;
import dlink.admin.vo.SearchVO;
import dlink.admin.vo.TCommutyVO;
import dlink.admin.dao.TCommutyDAO;

/**
 * @Class Name : TCommutyServiceImpl.java
 * @Description : TCommuty Business Implement class
 * @Modification Information
 *
 * @author 이효진
 * @since 2022-03-30
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */

@Service("TCommutyService")
public class TCommutyServiceImpl extends EgovAbstractServiceImpl implements
        TCommutyService {
        
    private static final Logger LOGGER = LoggerFactory.getLogger(TCommutyServiceImpl.class);

    @Resource(name="TCommutyDAO")
    private TCommutyDAO TCommutyDAO;
    
    /** ID Generation */
    //@Resource(name="{egovTCommutyIdGnrService}")    
    //private EgovIdGnrService egovIdGnrService;

	/**
	 * t_commuty을 등록한다.
	 * @param vo - 등록할 정보가 담긴 TCommutyVO
	 * @return 등록 결과
	 * @exception Exception
	 */
    public String insertTCommuty(TCommutyVO vo) throws Exception {
    	LOGGER.debug(vo.toString());
    	
    	/** ID Generation Service */
    	//TODO 해당 테이블 속성에 따라 ID 제너레이션 서비스 사용
    	//String id = egovIdGnrService.getNextStringId();
    	//vo.setId(id);
    	LOGGER.debug(vo.toString());
    	
    	TCommutyDAO.insertTCommuty(vo);
    	//TODO 해당 테이블 정보에 맞게 수정    	
        return null;
    }

    /**
	 * t_commuty을 수정한다.
	 * @param vo - 수정할 정보가 담긴 TCommutyVO
	 * @return void형
	 * @exception Exception
	 */
    public void updateTCommuty(TCommutyVO vo) throws Exception {
        TCommutyDAO.updateTCommuty(vo);
    }

    /**
	 * t_commuty을 삭제한다.
	 * @param vo - 삭제할 정보가 담긴 TCommutyVO
	 * @return void형 
	 * @exception Exception
	 */
    public void deleteTCommuty(TCommutyVO vo) throws Exception {
        TCommutyDAO.deleteTCommuty(vo);
    }

    /**
	 * t_commuty을 조회한다.
	 * @param vo - 조회할 정보가 담긴 TCommutyVO
	 * @return 조회한 t_commuty
	 * @exception Exception
	 */
    public TCommutyVO selectTCommuty(TCommutyVO vo) throws Exception {
        TCommutyVO resultVO = TCommutyDAO.selectTCommuty(vo);
        if (resultVO == null)
            throw processException("info.nodata.msg");
        return resultVO;
    }

    /**
	 * t_commuty 목록을 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return t_commuty 목록
	 * @exception Exception
	 */
    public List<?> selectTCommutyList(SearchVO searchVO) throws Exception {
        return TCommutyDAO.selectTCommutyList(searchVO);
    }

    /**
	 * t_commuty 총 갯수를 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return t_commuty 총 갯수
	 * @exception
	 */
    public int selectTCommutyListTotCnt(SearchVO searchVO) {
		return TCommutyDAO.selectTCommutyListTotCnt(searchVO);
	}

	@Override
	public int selectForInsertPostNo(TCommutyVO vo) throws Exception {
		return TCommutyDAO.selectForInsertPostNo(vo);
	}

	@Override
	public int selectForInsertSeq(TCommutyVO vo) throws Exception {
		return TCommutyDAO.selectForInsertSeq(vo);
	}

	public List<?> selectCommentsTCommutyList(TCommutyVO vo) throws Exception {
		return TCommutyDAO.selectCommentsTCommutyList(vo);
      
    }

	@Override
	public String insertCommentsTCommuty(TCommutyVO vo) throws Exception {
		return TCommutyDAO.insertCommentsTCommuty(vo);
	}
	
	@Override
	public void updateCommentsTCommuty(TCommutyVO vo) throws Exception {
		 TCommutyDAO.updateCommentsTCommuty(vo);		
	}
	
    /**
     * 메인 공지사항
     * */
    public List<?> selectMainTCommutyList(TCommutyVO TCommutyVO) throws Exception {
        return TCommutyDAO.selectMainTCommutyList(TCommutyVO);
    }
    
    /**
	 * t_commuty_file을 등록한다.
	 * @param vo - 등록할 정보가 담긴 TCommutyVO
	 * @return 등록 결과
	 * @exception Exception
	 */
    public String insertTCommutyFileS(TCommutyVO vo) throws Exception {
    	LOGGER.debug(vo.toString());
    	
    	/** ID Generation Service */
    	//TODO 해당 테이블 속성에 따라 ID 제너레이션 서비스 사용
    	//String id = egovIdGnrService.getNextStringId();
    	//vo.setId(id);
    	LOGGER.debug(vo.toString());
    	
    	TCommutyDAO.insertTCommutyFileS(vo);
    	//TODO 해당 테이블 정보에 맞게 수정    	
        return null;
    }

    /**
	 * t_commuty_file을 수정한다.
	 * @param vo - 수정할 정보가 담긴 TCommutyVO
	 * @return void형
	 * @exception Exception
	 */
    public void updateTCommutyFile(TCommutyVO vo) throws Exception {
        TCommutyDAO.updateTCommutyFile(vo);
    }

    /**
	 * t_commuty_file을 삭제한다.
	 * @param vo - 삭제할 정보가 담긴 TCommutyVO
	 * @return void형 
	 * @exception Exception
	 */
    public void deleteTCommutyFile(TCommutyVO vo) throws Exception {
        TCommutyDAO.deleteTCommutyFile(vo);
    }
    
    /**
   	 * t_commuty_file을 조회한다.
   	 * @param vo - 조회할 정보가 담긴 TCommutyVO
   	 * @return void형 
   	 * @exception Exception
   	 */
	public List<?> selectTCommutyFileList(TCommutyVO vo) throws Exception {
		return TCommutyDAO.selectTCommutyFileList(vo);
      
    }
}
