package dlink.admin.service;

import java.math.BigDecimal;
import java.util.List;



import dlink.admin.vo.SearchVO;
import dlink.admin.vo.TMemComVO;
import dlink.admin.vo.TSpecReqComVO;

/**
 * @Class Name : TSpecReqComService.java
 * @Description : TSpecReqCom Business class
 * @Modification Information
 *
 * @author 이은지
 * @since 2022-04-07
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */
public interface TSpecReqComService {
	
	/**
	 * t_spec_req_com을 등록한다.
	 * @param vo - 등록할 정보가 담긴 TSpecReqComVO
	 * @return 등록 결과
	 * @exception Exception
	 */
    String insertTSpecReqCom(TSpecReqComVO vo) throws Exception;
    
   

    /* 전문회사 인력현황*/
    String insertTSpecReqMem(TSpecReqComVO vo) throws Exception;
    BigDecimal selectTSpecReqComReqNo(TSpecReqComVO vo) throws Exception;
   
    
    
    
    /**
	 * t_spec_req_com을 수정한다.
	 * @param vo - 수정할 정보가 담긴 TSpecReqComVO
	 * @return void형
	 * @exception Exception
	 */
    void updateTSpecReqCom(TSpecReqComVO vo) throws Exception;
    
    /**
	 * t_spec_req_com을 삭제한다.
	 * @param vo - 삭제할 정보가 담긴 TSpecReqComVO
	 * @return void형 
	 * @exception Exception
	 */
    void deleteTSpecReqCom(TSpecReqComVO vo) throws Exception;
    
    /**
	 * t_spec_req_com을 조회한다.
	 * @param vo - 조회할 정보가 담긴 TSpecReqComVO
	 * @return 조회한 t_spec_req_com
	 * @exception Exception
	 */
    TSpecReqComVO selectTSpecReqCom(TSpecReqComVO vo) throws Exception;
    
    /**
	 * t_spec_req_com 목록을 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return t_spec_req_com 목록
	 * @exception Exception
	 */
    List selectTSpecReqComList(SearchVO searchVO) throws Exception;
    
    /**
	 * t_spec_req_com 총 갯수를 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return t_spec_req_com 총 갯수
	 * @exception
	 */
    int selectTSpecReqComListTotCnt(SearchVO searchVO);
    
    /**
  	 * t_spec_req_com을 관리자 승인,반려한다.
  	 * @param vo - 관리자 승인,반려할 정보가 담긴 TSpecReqComVO
  	 * @return void형
  	 * @exception Exception
  	 */
      void updateAcceptTSpecReqCom(TSpecReqComVO vo) throws Exception;
      
      /**
  	 * t_spec_com을 등록한다.
  	 * @param vo - 등록할 정보가 담긴 TSpecReqComVO
  	 * @return 등록 결과
  	 * @exception Exception
  	 */
      String insertTSpecCom(TSpecReqComVO vo) throws Exception;
      
      /**
  	 * t_spec_req_mem 목록을 조회한다.
  	 * @param searchVO - 조회할 정보가 담긴 VO
  	 * @return t_spec_req_mem 목록
  	 * @exception Exception
  	 */
      List selectAdminTSpecReqMem(TSpecReqComVO vo) throws Exception;
      
      
      /**
  	 * t_spec_req_mem을 삭제한다.
  	 * @param vo - 삭제할 정보가 담긴 TSpecReqComVO
  	 * @return void형 
  	 * @exception Exception
  	 */
      void deleteTSpecReqMem(TSpecReqComVO vo) throws Exception;
      
}
