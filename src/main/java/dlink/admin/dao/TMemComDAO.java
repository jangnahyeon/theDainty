package dlink.admin.dao;

import java.math.BigDecimal;
import java.util.List;

import org.egovframe.rte.psl.dataaccess.EgovAbstractDAO;
import org.springframework.stereotype.Repository;

import dlink.admin.vo.TMemComVO;
import dlink.admin.vo.SearchVO;
import dlink.admin.vo.TMemAccptVO;
import dlink.admin.vo.TMemComFileVO;

/**
 * @Class Name : TMemComDAO.java
 * @Description : TMemCom DAO Class
 * @Modification Information
 *
 * @author 이은지
 * @since 2022-03-30
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */

@Repository("TMemComDAO")
public class TMemComDAO extends EgovAbstractDAO {

	/**
	 * t_mem_com을 등록한다.
	 * @param vo - 등록할 정보가 담긴 TMemComVO
	 * @return 등록 결과
	 * @exception Exception
	 */
    public String insertTMemCom(TMemComVO vo) throws Exception {
        return (String)insert("TMemComDAO.insertTMemCom_S", vo);
    }
    public String insertMemAccpt(TMemComVO vo) throws Exception {
        return (String)insert("TMemComDAO.insertMemAccpt", vo);
    }
    public String insertReqMemToTMemCom(TMemComVO vo) throws Exception {
        return (String)insert("TMemComDAO.insertReqMemToTMemCom", vo);
    }
    
    /**
	 파일첨부하기
	 */
    public void insertTMemComFile(TMemComFileVO vo) throws Exception {
        insert("TMemComDAO.insertTMemComFile", vo);
    }

   
    /**
	 * t_mem_com을 수정한다.
	 * @param vo - 수정할 정보가 담긴 TMemComVO
	 * @return void형
	 * @exception Exception
	 */
    public void updateTMemCom(TMemComVO vo) throws Exception {
        update("TMemComDAO.updateTMemCom_S", vo);
    
    }

    /**
	 * t_mem_com을 삭제한다.
	 * @param vo - 삭제할 정보가 담긴 TMemComVO
	 * @return void형 
	 * @exception Exception
	 */
    public void deleteTMemCom(TMemComVO vo) throws Exception {
        delete("TMemComDAO.deleteTMemCom_S", vo);
    }

    /**
	 * t_mem_com을 조회한다.
	 * @param vo - 조회할 정보가 담긴 TMemComVO
	 * @return 조회한 t_mem_com
	 * @exception Exception
	 */
    public TMemComVO selectTMemCom(TMemComVO vo) throws Exception {
        return (TMemComVO) select("TMemComDAO.selectTMemCom_S", vo);
    }
    
    /**
	 * t_mem_com목록을 상세조회한다.
	 * @param vo - 조회할 정보가 담긴 TMemComVO
	 * @return 조회한 t_mem_com
	 * @exception Exception
	 */
    public TMemComVO TMemComView(TMemComVO vo) throws Exception {
        return (TMemComVO) select("TMemComDAO.selectTMemCom_S", vo);
    }
    
     /**
	 * t_mem_com 목록을 조회한다.
	 * @param searchMap - 조회할 정보가 담긴 Map
	 * @return t_mem_com 목록
	 * @exception Exception
	 */
    public List<?> selectTMemComList(SearchVO searchVO) throws Exception {
        return list("TMemComDAO.selectTMemComList_D", searchVO);
    }
 
    /**
	 * t_mem_com 총 갯수를 조회한다.
	 * @param searchMap - 조회할 정보가 담긴 Map
	 * @return t_mem_com 총 갯수
	 * @exception
	 */
    public int selectTMemComListTotCnt(SearchVO searchVO) {
        return (Integer)select("TMemComDAO.selectTMemComListTotCnt_S", searchVO);
    }
    
   
    /**
  	 * t_mem_com 목록을 전문업체 조회한다.
  	 * @param searchMap - 조회할 정보가 담긴 Map
  	 * @return t_mem_com 목록
  	 * @exception Exception
  	 */
      public List<?> selectagSearchList(SearchVO searchVO) throws Exception {
          return list("TMemComDAO.selectagSearchList", searchVO);
      }
      /**
  	 * t_mem_com 총 갯수를 전문업체 조회한다.
  	 * @param searchMap - 조회할 정보가 담긴 Map
  	 * @return t_mem_com 총 갯수
  	 * @exception
  	 */
      public int selectagSearchListTotCnt(SearchVO searchVO) {
          return (Integer)select("TMemComDAO.selectagSearchListTotCnt_S", searchVO);
      }
      
      /**
  	 * t_mem_com의 SpecYn을 수정한다.
  	 * @param vo - 수정할 정보가 담긴 TMemComVO
  	 * @return void형
  	 * @exception Exception
  	 */
      public void updateSpecYnTMemCom(TMemComVO vo) throws Exception {
          update("TMemComDAO.updateSpecYnTMemCom", vo);
      
      }
}
