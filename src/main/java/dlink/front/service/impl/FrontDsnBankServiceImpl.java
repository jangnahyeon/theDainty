package dlink.front.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


import dlink.front.dao.FrontDsnBankDAO;
import dlink.front.service.FrontDsnBankService;
import dlink.front.vo.FrontDsnBankVO;

/**
 * @Class Name : TDsnBankServiceImpl.java
 * @Description : TDsnBank Business Implement class
 * @Modification Information
 *
 * @author 안성찬
 * @since 2022-04-11
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */

@Service("FrontDsnBankService")
public class FrontDsnBankServiceImpl extends EgovAbstractServiceImpl implements
        FrontDsnBankService {
        
    private static final Logger LOGGER = LoggerFactory.getLogger(FrontDsnBankServiceImpl.class);

    @Resource(name="FrontDsnBankDAO")
    private FrontDsnBankDAO FrontDsnBankDAO;
    
    /** ID Generation */
    //@Resource(name="{egovTDsnBankIdGnrService}")    
    //private EgovIdGnrService egovIdGnrService;

	/**
	 * t_dsn_bank을 등록한다.
	 * @param vo - 등록할 정보가 담긴 FrontDsnBankVO
	 * @return 등록 결과
	 * @exception Exception
	 */
    public void insertDsnBank(FrontDsnBankVO vo) throws Exception {
    	LOGGER.debug(vo.toString());
    	
    	FrontDsnBankDAO.insertDsnBank(vo);
    	//TODO 해당 테이블 정보에 맞게 수정    	
    }


    /**
	 * t_dsn_bank을 삭제한다.
	 * @param vo - 삭제할 정보가 담긴 FrontDsnBankVO
	 * @return void형 
	 * @exception Exception
	 */
    public void deleteDsnBank(FrontDsnBankVO vo) throws Exception {
        FrontDsnBankDAO.deleteDsnBank(vo);
    }


    /**
	 * t_dsn_bank 목록을 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return t_dsn_bank 목록
	 * @exception Exception
	 */
    public List<?> selectDsnBankList(FrontDsnBankVO searchVO) throws Exception {
        return FrontDsnBankDAO.selectDsnBankList(searchVO);
    }

    /**
	 * t_dsn_bank 총 갯수를 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return t_dsn_bank 총 갯수
	 * @exception
	 */
    public int selectDsnBankListTotCnt(FrontDsnBankVO searchVO) {
		return FrontDsnBankDAO.selectDsnBankListTotCnt(searchVO);
	}
    
    
    public void createTable(FrontDsnBankVO vo) throws Exception {
        FrontDsnBankDAO.createTable(vo);
    }
    
    public int selectDsnBankFavoriteCnt(FrontDsnBankVO searchVO) {
		return FrontDsnBankDAO.selectDsnBankFavoriteCnt(searchVO);
	}
    
    
    
    
    /**
   	 * 관심정보 > 이미지 정보
   	 */
       public List<?> selectInterestDsnBankList(FrontDsnBankVO searchVO) throws Exception {
           return FrontDsnBankDAO.selectInterestDsnBankList(searchVO);
       }

     
       public int selectInterestDsnBankListTotCnt(FrontDsnBankVO searchVO) {
   		return FrontDsnBankDAO.selectInterestDsnBankListTotCnt(searchVO);
   	}
       
}
