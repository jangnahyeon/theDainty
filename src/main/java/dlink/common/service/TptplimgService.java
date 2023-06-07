package dlink.common.service;

import java.util.List;

import dlink.common.vo.TPtplimgVO;

/**
 * @Class Name : TAttfileService.java
 * @Description : TAttfile Business class
 * @Modification Information
 *
 * @author 안성찬
 * @since 2022-04-08
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */
public interface TptplimgService {
	
	   
    /**
 	 * TPtplimgVO 목록을 조회한다.
 	 * @param TPtplimgVO - 조회할 정보가 담긴 VO
 	 * @return t_ptpl_img 목록
 	 * @exception Exception
 	 */
     List<?> selectTptplimgList(TPtplimgVO vo) throws Exception;
     
    
}
