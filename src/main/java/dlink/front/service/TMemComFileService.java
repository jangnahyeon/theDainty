package dlink.front.service;

import java.util.List;

import dlink.admin.vo.TMemComFileVO;
import dlink.common.vo.SearchVO;


/**
 * @Class Name : TMemComFileService.java
 * @Description : TMemComFile Business class
 * @Modification Information
 *
 * @author 이효진
 * @since 2022-04-28
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */
public interface TMemComFileService {
	
    /**
	 * t_mem_com_file을 수정한다.
	 * @param vo - 수정할 정보가 담긴 TMemComFileVO
	 * @return void형
	 * @exception Exception
	 */
    void updateTMemComFile(TMemComFileVO vo) throws Exception;
    
    /**
	 * t_mem_com_file을 삭제한다.
	 * @param vo - 삭제할 정보가 담긴 TMemComFileVO
	 * @return void형 
	 * @exception Exception
	 */
    void deleteTMemComFile(TMemComFileVO vo) throws Exception;
    
    /**
	 * t_mem_com_file을 조회한다.
	 * @param vo - 조회할 정보가 담긴 TMemComFileVO
	 * @return 조회한 t_mem_com_file
	 * @exception Exception
	 */
    TMemComFileVO selectTMemComFile(TMemComFileVO vo) throws Exception;
    
    /**
	 * t_mem_com_file 목록을 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return t_mem_com_file 목록
	 * @exception Exception
	 */
    List<?> selectTMemComFileList(TMemComFileVO vo) throws Exception;
    
    /**
	 * t_mem_com_file 총 갯수를 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return t_mem_com_file 총 갯수
	 * @exception
	 */
    int selectTMemComFileListTotCnt(SearchVO searchVO);
    

	
}
