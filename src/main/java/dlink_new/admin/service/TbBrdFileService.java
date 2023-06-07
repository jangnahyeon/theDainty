package dlink_new.admin.service;

import java.util.List;
// Vo 객체에 대한 import 구문
// import (vo package).TbBrdFileDefaultVO;
// import (vo package).TbBrdFileVO;

import dlink_new.admin.vo.TbBrdFileDefaultVO;
import dlink_new.admin.vo.TbBrdFileVO;

/**
 * @Class Name : TbBrdFileService.java
 * @Description : TbBrdFile Business class
 * @Modification Information
 *
 * @author 김현재
 * @since 2023-02-02
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */
public interface TbBrdFileService {
	
	/**
	 * tb_brd_file을 등록한다.
	 * @param vo - 등록할 정보가 담긴 TbBrdFileVO
	 * @return 등록 결과
	 * @exception Exception
	 */
    int insertTbBrdFile(TbBrdFileVO vo) throws Exception;
    
    /**
	 * tb_brd_file을 수정한다.
	 * @param vo - 수정할 정보가 담긴 TbBrdFileVO
	 * @return void형
	 * @exception Exception
	 */
    void updateTbBrdFile(TbBrdFileVO vo) throws Exception;
    
    /**
	 * tb_brd_file을 삭제한다.
	 * @param vo - 삭제할 정보가 담긴 TbBrdFileVO
	 * @return void형 
	 * @exception Exception
	 */
    void deleteTbBrdFile(TbBrdFileVO vo) throws Exception;
    
    /**
	 * tb_brd_file을 조회한다.
	 * @param vo - 조회할 정보가 담긴 TbBrdFileVO
	 * @return 조회한 tb_brd_file
	 * @exception Exception
	 */
    TbBrdFileVO selectTbBrdFile(TbBrdFileVO vo) throws Exception;
    
    /**
	 * tb_brd_file 목록을 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return tb_brd_file 목록
	 * @exception Exception
	 */
    List selectTbBrdFileList(TbBrdFileDefaultVO searchVO) throws Exception;
    
    /**
	 * tb_brd_file 총 갯수를 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return tb_brd_file 총 갯수
	 * @exception
	 */
    int selectTbBrdFileListTotCnt(TbBrdFileDefaultVO searchVO);
    
}
