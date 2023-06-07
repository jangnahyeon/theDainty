package dlink.common.dao;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.EgovAbstractDAO;
import org.springframework.stereotype.Repository;

import dlink.common.vo.TPtplimgVO;

/**
 * @Class Name : TptplimgDAO.java
 * @Description : TptplimgDAO Class
 * @Modification Information
 *
 * @author 이효진
 * @since 2022-04-15
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */


@Repository("TptplimgDAO")
public class TptplimgDAO extends EgovAbstractDAO{
	
	
    /**
	 * TPtplimgVO 목록을 조회한다.
	 * @param searchMap - 조회할 정보가 담긴 Map
	 * @return t_ptpl_img 목록
	 * @exception Exception
	 */
	
    public List<?> selectTptplimgList(TPtplimgVO vo) throws Exception {
        return list("TptplimgDAO.selectTptplimgList", vo);
    }
   
    
    
    
 
}
