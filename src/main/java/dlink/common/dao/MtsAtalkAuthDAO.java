package dlink.common.dao;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.EgovAbstractDAO;
import org.springframework.stereotype.Repository;

import dlink.common.vo.SearchVO;
import dlink.common.vo.MtsAtalkAuthVO;
/**
 * @Class Name : MtsAtalkAuthDAO.java
 * @Description : MtsAtalkAuth DAO Class
 * @Modification Information
 *
 * @author 이은지
 * @since 2022-05-03
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */

@Repository("mtsAtalkAuthDAO")
public class MtsAtalkAuthDAO extends EgovAbstractDAO {

	/**
	 * mts_atalk_auth을 등록한다.
	 * @param vo - 등록할 정보가 담긴 MtsAtalkAuthVO
	 * @return 등록 결과
	 * @exception Exception
	 */
    public String insertMtsAtalkAuth(MtsAtalkAuthVO vo) throws Exception {
        return (String)insert("mtsAtalkAuthDAO.insertMtsAtalkAuth_S", vo);
    }

   
     
    /**
	 * mts_atalk_auth을 수정한다.
	 * @param vo - 수정할 정보가 담긴 MtsAtalkAuthVO
	 * @return void형
	 * @exception Exception
	 */
    public void updateMtsAtalkAuth(MtsAtalkAuthVO vo) throws Exception {
        update("mtsAtalkAuthDAO.updateMtsAtalkAuth_S", vo);
    }

    /**
	 * mts_atalk_auth을 삭제한다.
	 * @param vo - 삭제할 정보가 담긴 MtsAtalkAuthVO
	 * @return void형 
	 * @exception Exception
	 */
    public void deleteMtsAtalkAuth(MtsAtalkAuthVO vo) throws Exception {
        delete("mtsAtalkAuthDAO.deleteMtsAtalkAuth_S", vo);
    }

    /**
	 * mts_atalk_auth을 조회한다.
	 * @param vo - 조회할 정보가 담긴 MtsAtalkAuthVO
	 * @return 조회한 mts_atalk_auth
	 * @exception Exception
	 */
    public MtsAtalkAuthVO selectMtsAtalkAuth(MtsAtalkAuthVO vo) throws Exception {
        return (MtsAtalkAuthVO) select("mtsAtalkAuthDAO.selectMtsAtalkAuth_S", vo);
    }

    /**
	 * mts_atalk_auth 목록을 조회한다.
	 * @param searchMap - 조회할 정보가 담긴 Map
	 * @return mts_atalk_auth 목록
	 * @exception Exception
	 */
    public List<?> selectMtsAtalkAuthList(SearchVO searchVO) throws Exception {
        return list("mtsAtalkAuthDAO.selectMtsAtalkAuthList_D", searchVO);
    }

    /**
	 * mts_atalk_auth 총 갯수를 조회한다.
	 * @param searchMap - 조회할 정보가 담긴 Map
	 * @return mts_atalk_auth 총 갯수
	 * @exception
	 */
    public int selectMtsAtalkAuthListTotCnt(MtsAtalkAuthVO vo) {
        return (Integer)select("mtsAtalkAuthDAO.selectMtsAtalkAuthListTotCnt_S", vo);
    }



}
