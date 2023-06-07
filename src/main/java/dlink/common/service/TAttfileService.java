package dlink.common.service;

import java.util.List;

import dlink.admin.vo.SearchVO;
import dlink.common.vo.TAttfileVO;

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
public interface TAttfileService {
	
	/**
	 * t_attfile을 등록한다.
	 * @param vo - 등록할 정보가 담긴 TAttfileVO
	 * @return 등록 결과
	 * @exception Exception
	 */
    String insertTAttfile(TAttfileVO vo) throws Exception;
    
    /**
	 * t_attfile을 수정한다.
	 * @param vo - 수정할 정보가 담긴 TAttfileVO
	 * @return void형
	 * @exception Exception
	 */
    void updateTAttfile(TAttfileVO vo) throws Exception;
    
    /**
	 * t_attfile을 삭제한다.
	 * @param vo - 삭제할 정보가 담긴 TAttfileVO
	 * @return void형 
	 * @exception Exception
	 */
    void deleteTAttfile(TAttfileVO vo) throws Exception;
    
    
    /**
	 * t_attfile을 조회한다.
	 * @param vo - 조회할 정보가 담긴 TAttfileVO
	 * @return 조회한 t_attfile
	 * @exception Exception
	 */
    TAttfileVO selectTAttfile(TAttfileVO vo) throws Exception;
    
    //첨부파일 pk값 찾기
    int selectFileSeq(TAttfileVO vo) throws Exception;
    
    /**
 	 * t_attfile 목록을 조회한다.
 	 * @param TAttfileVO - 조회할 정보가 담긴 VO
 	 * @return t_attfile 목록
 	 * @exception Exception
 	 */
     List<?> selectTAttfileList(TAttfileVO vo) throws Exception;
     
    
}
