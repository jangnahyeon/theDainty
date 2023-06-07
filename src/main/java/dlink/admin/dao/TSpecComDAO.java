package dlink.admin.dao;



import java.util.List;

import org.egovframe.rte.psl.dataaccess.EgovAbstractDAO;
import org.springframework.stereotype.Repository;

import dlink.admin.vo.SearchVO;
import dlink.admin.vo.TSpecComVO;

/**
 * @Class Name : TSpecComDAO.java
 * @Description : TSpecCom DAO Class
 * @Modification Information
 *
 * @author 이효진
 * @since 2022-04-18
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */

@Repository("TSpecComDAO")
public class TSpecComDAO extends EgovAbstractDAO {

	/**
	 * t_spec_com을 등록한다.
	 * @param vo - 등록할 정보가 담긴 TSpecReqComVO
	 * @return 등록 결과
	 * @exception Exception
	 */
    public String insertTSpecCom(TSpecComVO TSpecComVO) throws Exception {
        return (String)insert("TSpecComDAO.insertTSpecCom", TSpecComVO);
    }

       
   	/**
   	 * t_spec_mem을 등록한다.
   	 * @param vo - 등록할 정보가 담긴 TSpecReqComVO
   	 * @return 등록 결과
   	 * @exception Exception
   	 */
       public String insertTSpecMem(TSpecComVO TSpecComVO) throws Exception {
           return (String)insert("TSpecComDAO.insertTSpecMem", TSpecComVO);
       }
       
       /**
        * SpecNo 번호 만들어줌
        * */
       public int selectSpecNoInsertCd(TSpecComVO TSpecComVO) throws Exception {
   		return (int) select("TSpecComDAO.selectSpecNoInsertCd", TSpecComVO);
       }
   		
   	  /**
         * Seq 번호 만들어줌
         * */
        public int selectSeqInsertCd(TSpecComVO TSpecComVO) throws Exception {
    		return (int) select("TSpecComDAO.selectSeqInsertCd", TSpecComVO);
   	}
        
    /**
	 * t_spec_com 목록을 조회한다.
	 * @param searchMap - 조회할 정보가 담긴 Map
	 * @return t_spec_com 목록
	 * @exception Exception
	 */
    public List<?> selectTSpecList(SearchVO searchVO) throws Exception {
        return list("TSpecComDAO.selectTSpecList", searchVO);
    }

    /**
	 * t_spec_com 총 갯수를 조회한다.
	 * @param searchMap - 조회할 정보가 담긴 Map
	 * @return t_spec_com 총 갯수
	 * @exception
	 */
    public int selectTSpecListTotCnt(SearchVO searchVO) {
        return (Integer)select("TSpecComDAO.selectTSpecListTotCnt", searchVO);
    }
    
    /**
   	 * t_spec_com,t_mem_com 을 조회한다.
   	 * @param vo - 조회할 정보가 담긴 TSpecComVO
   	 * @return 조회한 t_spec_com,t_mem_com
   	 * @exception Exception
   	 */
       public TSpecComVO selectTSpecCom(TSpecComVO TSpecComVO) throws Exception {
           return (TSpecComVO) select("TSpecComDAO.selectTSpecCom", TSpecComVO);
       }
       
       
       
       /**
   	 * t_spec_mem 목록을 조회한다.
   	 * @param searchMap - 조회할 정보가 담긴 Map
   	 * @return t_spec_mem 목록
   	 * @exception Exception
   	 */
       public List<?> selectTSpecMemList(TSpecComVO TSpecComVO) throws Exception {
           return list("TSpecComDAO.selectTSpecMemList", TSpecComVO);
       }
       
       
       /**
   	 *  t_spec_mem을 삭제한다.
   	 * @param vo - 삭제할 정보가 담긴 TSpecReqComVO
   	 * @return void형 
   	 * @exception Exception
   	 */
       public void deleteTSpecMem(TSpecComVO TSpecComVO) throws Exception {
           delete("TSpecComDAO.deleteTSpecMem", TSpecComVO);
       }
       
       
       /**
   	 * t_spec_com을 삭제한다.
   	 * @param vo - 삭제할 정보가 담긴 TSpecReqComVO
   	 * @return void형 
   	 * @exception Exception
   	 */
       public void deleteTSpecCom(TSpecComVO TSpecComVO) throws Exception {
           delete("TSpecComDAO.deleteTSpecCom", TSpecComVO);
       }
       
       
       /**
   	 * t_mem_com_file 목록을 조회한다.
   	 * @param searchMap - 조회할 정보가 담긴 Map
   	 * @return t_mem_com_file 목록
   	 * @exception Exception
   	 */
       public List<?> selectTMemComFileList(TSpecComVO searchVO) throws Exception {
           return list("TSpecComDAO.selectTMemComList_D", searchVO);
       }
}
