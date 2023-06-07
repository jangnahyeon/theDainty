package dlink.admin.service;

import java.util.List;
import dlink.admin.vo.SearchVO;
import dlink.admin.vo.TMemUserVO;

/**
 * @Class Name : TMemUserService.java
 * @Description : TMemUser Business class
 * @Modification Information
 *
 * @author 이은지
 * @since 2022-04-06
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */
public interface TMemUserService {
	
	/**
	 * t_mem_user을 등록한다.
	 * @param vo - 등록할 정보가 담긴 TMemUserVO
	 * @return 등록 결과
	 * @exception Exception
	 */
    String insertTMemUser(TMemUserVO vo) throws Exception;
    String insertMemAccpt(TMemUserVO vo) throws Exception;
    String insertReqMemToTMemUser(TMemUserVO vo) throws Exception;
    /**
	 * t_mem_user을 수정한다.
	 * @param vo - 수정할 정보가 담긴 TMemUserVO
	 * @return void형
	 * @exception Exception
	 */
    void updateTMemUser(TMemUserVO vo) throws Exception;
    
    /**
	 * t_mem_user을 삭제한다.
	 * @param vo - 삭제할 정보가 담긴 TMemUserVO
	 * @return void형 
	 * @exception Exception
	 */
    void deleteTMemUser(TMemUserVO vo) throws Exception;
    
    /**
	 * t_mem_user을 조회한다.
	 * @param vo - 조회할 정보가 담긴 TMemUserVO
	 * @return 조회한 t_mem_user
	 * @exception Exception
	 */
    TMemUserVO selectTMemUser(TMemUserVO vo) throws Exception;
    
    /**
	 * t_mem_user 목록을 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return t_mem_user 목록
	 * @exception Exception
	 */
    List selectTMemUserList(SearchVO searchVO) throws Exception;
    
    /**
	 * t_mem_user 총 갯수를 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return t_mem_user 총 갯수
	 * @exception
	 */
    int selectTMemUserListTotCnt(SearchVO searchVO);
    
}
