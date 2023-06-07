package dlink.admin.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


import dlink.admin.service.TDsnBankService;
import dlink.admin.vo.TDsnBankVO;
import dlink.admin.dao.TDsnBankDAO;

/**
 * @Class Name : TDsnBankServiceImpl.java
 * @Description : TDsnBank Business Implement class
 * @Modification Information
 *
 * @author 장나현
 * @since 2022-04-11
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */

@Service("TDsnBankService")
public class TDsnBankServiceImpl extends EgovAbstractServiceImpl implements
        TDsnBankService {
        
    private static final Logger LOGGER = LoggerFactory.getLogger(TDsnBankServiceImpl.class);

    @Resource(name="TDsnBankDAO")
    private TDsnBankDAO TDsnBankDAO;
    
    /** ID Generation */
    //@Resource(name="{egovTDsnBankIdGnrService}")    
    //private EgovIdGnrService egovIdGnrService;

	/**
	 * t_dsn_bank을 등록한다.
	 * @param vo - 등록할 정보가 담긴 TDsnBankVO
	 * @return 등록 결과
	 * @exception Exception
	 */
    public String insertTDsnBank(TDsnBankVO vo) throws Exception {
    	LOGGER.debug(vo.toString());
    	
    	/** ID Generation Service */
    	//TODO 해당 테이블 속성에 따라 ID 제너레이션 서비스 사용
    	//String id = egovIdGnrService.getNextStringId();
    	//vo.setId(id);
    	LOGGER.debug(vo.toString());
    	
    	TDsnBankDAO.insertTDsnBank(vo);
    	//TODO 해당 테이블 정보에 맞게 수정    	
        return null;
    }

    /**
	 * t_dsn_bank을 수정한다.
	 * @param vo - 수정할 정보가 담긴 TDsnBankVO
	 * @return void형
	 * @exception Exception
	 */
    public void updateTDsnBank(TDsnBankVO vo) throws Exception {
        TDsnBankDAO.updateTDsnBank(vo);
    }

    /**
	 * t_dsn_bank을 삭제한다.
	 * @param vo - 삭제할 정보가 담긴 TDsnBankVO
	 * @return void형 
	 * @exception Exception
	 */
    public void deleteTDsnBank(TDsnBankVO vo) throws Exception {
        TDsnBankDAO.deleteTDsnBank(vo);
    }

    /**
	 * t_dsn_bank을 조회한다.
	 * @param vo - 조회할 정보가 담긴 TDsnBankVO
	 * @return 조회한 t_dsn_bank
	 * @exception Exception
	 */
    public TDsnBankVO selectTDsnBank(TDsnBankVO vo) throws Exception {
        TDsnBankVO resultVO = TDsnBankDAO.selectTDsnBank(vo);
        if (resultVO == null)
            throw processException("info.nodata.msg");
        return resultVO;
    }

    /**
	 * t_dsn_bank 목록을 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return t_dsn_bank 목록
	 * @exception Exception
	 */
    public List<?> selectTDsnBankList(TDsnBankVO searchVO) throws Exception {
        return TDsnBankDAO.selectTDsnBankList(searchVO);
    }

    /**
	 * t_dsn_bank 총 갯수를 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return t_dsn_bank 총 갯수
	 * @exception
	 */
    public int selectTDsnBankListTotCnt(TDsnBankVO searchVO) {
		return TDsnBankDAO.selectTDsnBankListTotCnt(searchVO);
	}
    
}
