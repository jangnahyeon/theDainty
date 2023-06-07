package dlink.admin.service;

import java.util.List;

import dlink.admin.vo.SearchVO;
import dlink.admin.vo.TSpecComVO;
import dlink.admin.vo.TSpecReqComVO;
import dlink.admin.vo.TWordVO;


/**
 * @Class Name : TSpecComService.java
 * @Description : TSpecCom Business class
 * @Modification Information
 *
 * @author 이효진
 * @since 2022-04-18
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */
public interface TSpecComService {
	
	/**
	 * t_spec_req_com을 등록한다.
	 * @param vo - 등록할 정보가 담긴 TSpecReqComVO
	 * @return 등록 결과
	 * @exception Exception
	 */
    String insertTSpecCom(TSpecComVO TSpecComVO) throws Exception;
    

      /**
  	 * t_spec_com을 등록한다.
  	 * @param vo - 등록할 정보가 담긴 TSpecReqComVO
  	 * @return 등록 결과
  	 * @exception Exception
  	 */
      String insertTSpecMem(TSpecComVO TSpecComVO) throws Exception;
      
      
      /**
       * t_spec_com의 SPEC_NO 번호 만들어줌
       * */
      int selectSpecNoInsertCd(TSpecComVO TSpecComVO) throws Exception;
      
      /**
       * t_spec_com의 Seq 번호 만들어줌
       * */
      int selectSeqInsertCd(TSpecComVO TSpecComVO) throws Exception;
      
      
      /**
   	 * t_spec_com 목록을 조회한다.
   	 * @param searchVO - 조회할 정보가 담긴 VO
   	 * @return t_spec_com 목록
   	 * @exception Exception
   	 */
       List selectTSpecList(SearchVO searchVO) throws Exception;
       
       /**
   	 * t_spec_com 총 갯수를 조회한다.
   	 * @param searchVO - 조회할 정보가 담긴 VO
   	 * @return t_spec_com 총 갯수
   	 * @exception
   	 */
       int selectTSpecListTotCnt(SearchVO searchVO);
       
       /**
   	 * t_spec_com,t_mem_com을 조회한다.
   	 * @param vo - 조회할 정보가 담긴 TSpecComVO
   	 * @return 조회한 t_spec_com,t_mem_com
   	 * @exception Exception
   	 */
       TSpecComVO selectTSpecCom(TSpecComVO TSpecComVO) throws Exception;
       
   /**
  	 * t_spec_mem 목록을 조회한다.
  	 * @param searchVO - 조회할 정보가 담긴 VO
  	 * @return t_spec_mem 목록
  	 * @exception Exception
  	 */
      List selectTSpecMemList(TSpecComVO TSpecComVO) throws Exception;
      
      /**
  	 * t_spec_mem을 삭제한다.
  	 * @param vo - 삭제할 정보가 담긴 TSpecComVO
  	 * @return void형 
  	 * @exception Exception
  	 */
      void deleteTSpecMem(TSpecComVO TSpecComVO) throws Exception;
      
      
      /**
  	 * t_spec_com을 삭제한다.
  	 * @param vo - 삭제할 정보가 담긴 TSpecComVO
  	 * @return void형 
  	 * @exception Exception
  	 */
      void deleteTSpecCom(TSpecComVO TSpecComVO) throws Exception;
      
      
  /**
 	 * t_mem_com_file 목록을 조회한다.
 	 * @param searchVO - 조회할 정보가 담긴 VO
 	 * @return t_mem_com_file 목록
 	 * @exception Exception
 	 */
     List<?> selectTMemComFileList(TSpecComVO searchVO) throws Exception;
   
}
