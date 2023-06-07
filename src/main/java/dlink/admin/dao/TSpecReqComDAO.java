package dlink.admin.dao;

import java.math.BigDecimal;
import java.util.List;

import org.egovframe.rte.psl.dataaccess.EgovAbstractDAO;
import org.springframework.stereotype.Repository;


import dlink.admin.vo.TSpecReqComVO;
import dlink.admin.vo.SearchVO;
import dlink.admin.vo.TMemComVO;


/**
 * @Class Name : TSpecReqComDAO.java
 * @Description : TSpecReqCom DAO Class
 * @Modification Information
 *
 * @author 이은지
 * @since 2022-04-07
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */

@Repository("TSpecReqComDAO")
public class TSpecReqComDAO extends EgovAbstractDAO {

	/**
	 * t_spec_req_com을 등록한다.
	 * @param vo - 등록할 정보가 담긴 TSpecReqComVO
	 * @return 등록 결과
	 * @exception Exception
	 */
    public String insertTSpecReqCom(TSpecReqComVO vo) throws Exception {
        return (String)insert("TSpecReqComDAO.insertTSpecReqCom_S", vo);
    }
   
    
    /**
	 전문회사 인력현황
	 */
   public String insertTSpecReqMem(TSpecReqComVO vo) throws Exception {
       return (String)insert("TSpecReqComDAO.insertTSpecReqMem", vo);
   }
   
  public BigDecimal selectTSpecReqComReqNo(TSpecReqComVO vo) throws Exception {
       return (BigDecimal) select("TSpecReqComDAO.selectTSpecReqComReqNo", vo);
   }
 
 
  
   
 
    /**
	 * t_spec_req_com을 수정한다.
	 * @param vo - 수정할 정보가 담긴 TSpecReqComVO
	 * @return void형
	 * @exception Exception
	 */
    public void updateTSpecReqCom(TSpecReqComVO vo) throws Exception {
        update("TSpecReqComDAO.updateTSpecReqCom_S", vo);
    }

    /**
	 * t_spec_req_com을 삭제한다.
	 * @param vo - 삭제할 정보가 담긴 TSpecReqComVO
	 * @return void형 
	 * @exception Exception
	 */
    public void deleteTSpecReqCom(TSpecReqComVO vo) throws Exception {
        delete("TSpecReqComDAO.deleteTSpecReqCom_S", vo);
    }

    /**
	 * t_spec_req_com을 조회한다.
	 * @param vo - 조회할 정보가 담긴 TSpecReqComVO
	 * @return 조회한 t_spec_req_com
	 * @exception Exception
	 */
    public TSpecReqComVO selectTSpecReqCom(TSpecReqComVO vo) throws Exception {
        return (TSpecReqComVO) select("TSpecReqComDAO.selectTSpecReqCom_S", vo);
    }

    /**
	 * t_spec_req_com 목록을 조회한다.
	 * @param searchMap - 조회할 정보가 담긴 Map
	 * @return t_spec_req_com 목록
	 * @exception Exception
	 */
    public List<?> selectTSpecReqComList(SearchVO searchVO) throws Exception {
        return list("TSpecReqComDAO.selectTSpecReqComList_D", searchVO);
    }

    /**
	 * t_spec_req_com 총 갯수를 조회한다.
	 * @param searchMap - 조회할 정보가 담긴 Map
	 * @return t_spec_req_com 총 갯수
	 * @exception
	 */
    public int selectTSpecReqComListTotCnt(SearchVO searchVO) {
        return (Integer)select("TSpecReqComDAO.selectTSpecReqComListTotCnt_S", searchVO);
    }
    
    /**
   	 * t_spec_req_com을 관리자 승인,반려한다.
   	 * @param vo - 관리자 승인,반려할 정보가 담긴 TSpecReqComVO
   	 * @return void형
   	 * @exception Exception
   	 */
       public void updateAcceptTSpecReqCom(TSpecReqComVO vo) throws Exception {
           update("TSpecReqComDAO.updateAcceptTSpecReqCom", vo);
       }
       
   	/**
   	 * t_spec_req_com을 등록한다.
   	 * @param vo - 등록할 정보가 담긴 TSpecReqComVO
   	 * @return 등록 결과
   	 * @exception Exception
   	 */
       public String insertTSpecCom(TSpecReqComVO vo) throws Exception {
           return (String)insert("TSpecReqComDAO.insertTSpecCom_S", vo);
       }
       
       
       
       /**
   	 * t_spec_req_mem 목록을 조회한다.
   	 * @param searchMap - 조회할 정보가 담긴 Map
   	 * @return t_spec_req_mem 목록
   	 * @exception Exception
   	 */
       public List<?> selectAdminTSpecReqMem(TSpecReqComVO vo) throws Exception {
           return list("TSpecReqComDAO.selectAdminTSpecReqMem", vo);
       }
       
       
       /**
   	 * t_spec_req_mem을 삭제한다.
   	 * @param vo - 삭제할 정보가 담긴 TSpecReqComVO
   	 * @return void형 
   	 * @exception Exception
   	 */
       public void deleteTSpecReqMem(TSpecReqComVO vo) throws Exception {
           delete("TSpecReqComDAO.deleteTSpecReqMem", vo);
       }
       
       
       
}
