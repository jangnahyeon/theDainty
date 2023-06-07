package dlink.front.service;

import java.util.List;

import dlink.admin.vo.SearchVO;
import dlink.front.vo.FrontSearchVO;
import dlink.front.vo.TReqUserVO;

/**
 * @Class Name : TReqUserService.java
 * @Description : TReqUser Business class
 * @Modification Information
 *
 * @author 이은지
 * @since 2022-04-11
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */
public interface TReqUserService {
	
	/**
	 * t_req_user을 등록한다.
	 * @param vo - 등록할 정보가 담긴 TReqUserVO
	 * @return 등록 결과
	 * @exception Exception
	 */
    String insertTReqUser(TReqUserVO vo) throws Exception;
    String insertTMemUser(TReqUserVO vo) throws Exception;
    String insertTAccptUser(TReqUserVO vo) throws Exception;
    
    /**
	 * t_req_user을 수정한다.
	 * @param vo - 수정할 정보가 담긴 TReqUserVO
	 * @return void형
	 * @exception Exception
	 */
    void updateTReqUser(TReqUserVO vo) throws Exception;
    void updateTReqMemAcceptYn(TReqUserVO vo) throws Exception;
    
    /**
	 * t_req_user을 삭제한다.
	 * @param vo - 삭제할 정보가 담긴 TReqUserVO
	 * @return void형 
	 * @exception Exception
	 */
    void deleteTReqUser(TReqUserVO vo) throws Exception;
    
    /**
	 * t_req_user을 조회한다.
	 * @param vo - 조회할 정보가 담긴 TReqUserVO
	 * @return 조회한 t_req_user
	 * @exception Exception
	 */
    TReqUserVO selectTReqUser(TReqUserVO vo) throws Exception;
    
    /**
	 * t_req_user 목록을 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return t_req_user 목록
	 * @exception Exception
	 */
    List selectTReqUserList(SearchVO searchVO) throws Exception;
    
    /**
	 * t_req_user 총 갯수를 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return t_req_user 총 갯수
	 * @exception
	 */
    int selectTReqUserListTotCnt(SearchVO searchVO);
    
    //아이디중복확인
    int idCheck(String loginId);
 
}
