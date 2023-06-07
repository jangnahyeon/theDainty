package dlink.front.service;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.util.EgovMap;

import dlink.admin.vo.TMemAccptVO;
import dlink.admin.vo.TMemComFileVO;
import dlink.front.vo.FrontSearchVO;
import dlink.front.vo.TReqComFileVO;
import dlink.front.vo.TReqComVO;

/**
 * @Class Name : TReqComService.java
 * @Description : TReqCom Business class
 * @Modification Information
 *
 * @author 이은지
 * @since 2022-04-13
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */
public interface TReqComService {
	
	/**
	 * t_req_com을 등록한다.
	 * @param vo - 등록할 정보가 담긴 TReqComVO
	 * @return 등록 결과
	 * @exception Exception
	 */
    String insertTReqCom(TReqComVO vo) throws Exception;
    
    /* 파일첨부*/
    void insertTMemComFile(TReqComFileVO vo) throws Exception;
    
    
    /**
	 * t_req_com을 수정한다.
	 * @param vo - 수정할 정보가 담긴 TReqComVO
	 * @return void형
	 * @exception Exception
	 */
    void updateTReqCom(TReqComVO vo) throws Exception;
    
    /**
	 * t_req_com을 삭제한다.
	 * @param vo - 삭제할 정보가 담긴 TReqComVO
	 * @return void형 
	 * @exception Exception
	 */
    void deleteTReqCom(TReqComVO vo) throws Exception;
    
    /**
	 * t_req_com을 조회한다.
	 * @param vo - 조회할 정보가 담긴 TReqComVO
	 * @return 조회한 t_req_com
	 * @exception Exception
	 */
    TReqComVO selectTReqCom(TReqComVO vo) throws Exception;
    
    /**
	 * t_req_com 목록을 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return t_req_com 목록
	 * @exception Exception
	 */
    List selectTReqComList(FrontSearchVO searchVO) throws Exception;
    
    /**
	 * t_req_com 총 갯수를 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return t_req_com 총 갯수
	 * @exception
	 */
    int selectTReqComListTotCnt(FrontSearchVO searchVO);
    
  //아이디중복확인
    int comIdCheck(String comId);
		
    
    List selectReqComFileList(TReqComVO vo) throws Exception;
    
    void updateTReqComAccept(TReqComVO vo) throws Exception;
    
    void insertMemAccpt(TReqComVO vo) throws Exception;
    
    void insertMemCom(TReqComVO vo) throws Exception;
    
    void insertMemComFile(TReqComVO vo) throws Exception;
	
}
