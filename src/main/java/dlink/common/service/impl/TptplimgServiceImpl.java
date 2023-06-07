package dlink.common.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import dlink.common.service.TptplimgService;
import dlink.common.vo.TPtplimgVO;
import dlink.common.dao.TptplimgDAO;

/**
 * @Class Name : TAttfileServiceImpl.java
 * @Description : TAttfile Business Implement class
 * @Modification Information
 *
 * @author 이효진
 * @since 2022-04-15
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */

@Service("TptplimgService")
public class TptplimgServiceImpl extends EgovAbstractServiceImpl implements
TptplimgService {
        
    private static final Logger LOGGER = LoggerFactory.getLogger(TAttfileServiceImpl.class);

    @Resource(name="TptplimgDAO")
    private TptplimgDAO TptplimgDAO; 
    
    /** ID Generation */
    //@Resource(name="{egovTAttfileIdGnrService}")    
    //private EgovIdGnrService egovIdGnrService;

	
    /**
	 * TPtplimgVO 목록을 조회한다.
	 * @param TPtplimgVO - 조회할 정보가 담긴 VO
	 * @return t_ptpl_img 목록
	 * @exception Exception
	 */
    public List<?> selectTptplimgList(TPtplimgVO vo) throws Exception {
        return TptplimgDAO.selectTptplimgList(vo);
    }

}
