package dlink.front.dao;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.EgovAbstractDAO;
import org.springframework.stereotype.Repository;

import dlink.front.vo.TReqComVO;
import dlink.admin.vo.TMemComFileVO;
import dlink.front.vo.FrontSearchVO;
import dlink.front.vo.TReqComFileVO;

/**
 * @Class Name : TReqComDAO.java
 * @Description : TReqCom DAO Class
 * @Modification Information
 *
 * @author 이은지
 * @since 2022-04-13
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */

@Repository("TReqComDAO")
public class TReqComDAO extends EgovAbstractDAO {

	/**
	 * t_req_com을 등록한다.
	 * @param vo - 등록할 정보가 담긴 TReqComVO
	 * @return 등록 결과
	 * @exception Exception
	 */
    public String insertTReqCom(TReqComVO vo) throws Exception {
        return (String)insert("TReqComDAO.insertTReqCom_S", vo);
    }
    
    /**
	 파일첨부하기
	 */
   public void insertTMemComFile(TReqComFileVO vo) throws Exception {
       insert("TReqComDAO.insertTMemComFile", vo);
   }
   
  

    /**
	 * t_req_com을 수정한다.
	 * @param vo - 수정할 정보가 담긴 TReqComVO
	 * @return void형
	 * @exception Exception
	 */
    public void updateTReqCom(TReqComVO vo) throws Exception {
        update("TReqComDAO.updateTReqCom_S", vo);
    }

    /**
	 * t_req_com을 삭제한다.
	 * @param vo - 삭제할 정보가 담긴 TReqComVO
	 * @return void형 
	 * @exception Exception
	 */
    public void deleteTReqCom(TReqComVO vo) throws Exception {
        delete("TReqComDAO.deleteTReqCom_S", vo);
    }

    /**
	 * t_req_com을 조회한다.
	 * @param vo - 조회할 정보가 담긴 TReqComVO
	 * @return 조회한 t_req_com
	 * @exception Exception
	 */
    public TReqComVO selectTReqCom(TReqComVO vo) throws Exception {
        return (TReqComVO) select("TReqComDAO.selectTReqCom_S", vo);
    }

    /**
	 * t_req_com 목록을 조회한다.
	 * @param searchMap - 조회할 정보가 담긴 Map
	 * @return t_req_com 목록
	 * @exception Exception
	 */
    public List<?> selectTReqComList(FrontSearchVO searchVO) throws Exception {
        return list("TReqComDAO.selectTReqComList_D", searchVO);
    }

    /**
	 * t_req_com 총 갯수를 조회한다.
	 * @param searchMap - 조회할 정보가 담긴 Map
	 * @return t_req_com 총 갯수
	 * @exception
	 */
    public int selectTReqComListTotCnt(FrontSearchVO searchVO) {
        return (Integer)select("TReqComDAO.selectTReqComListTotCnt_S", searchVO);
    }
    
    public int comIdCheck(String comId) {
 	   return (Integer)select("TReqComDAO.comIdCheck", comId);
     }
    
    public List<?> selectReqComFileList(TReqComVO vo) throws Exception {
        return list("TReqComDAO.selectReqComFileList", vo);
    }
    
    //승인시 사용
    //신청테이블 수정
    public void updateTReqComAccept(TReqComVO vo) throws Exception {
        update("TReqComDAO.updateTReqComAccept", vo);
    }
    
    //회원접속정보
    public void insertMemAccpt(TReqComVO vo) throws Exception {
    	insert("TReqComDAO.insertMemAccpt", vo);
    }
    
    //기업회원정보
    public void insertMemCom(TReqComVO vo) throws Exception {
    	insert("TReqComDAO.insertMemCom", vo);
    }
    
    //기업회원파일
    public void insertMemComFile(TReqComVO vo) throws Exception {
    	insert("TReqComDAO.insertMemComFile", vo);
    }

}
