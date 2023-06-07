package dlink.front.dao;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.EgovAbstractDAO;
import org.springframework.stereotype.Repository;

import dlink.front.vo.MtsAtalkMsgVO;
import dlink.front.vo.MtsAtalkMsgDefaultVO;

/**
 * @Class Name : MtsAtalkMsgDAO.java
 * @Description : MtsAtalkMsg DAO Class
 * @Modification Information
 *
 * @author 이효진
 * @since 2022-04-07
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */

@Repository("mtsAtalkMsgDAO")
public class FrontMtsAtalkMsgDAO extends EgovAbstractDAO {

	/**
	 * mts_atalk_msg을 등록한다.
	 * @param vo - 등록할 정보가 담긴 MtsAtalkMsgVO
	 * @return 등록 결과
	 * @exception Exception
	 */
    public String insertMtsAtalkMsg(MtsAtalkMsgVO vo) throws Exception {
        return (String)insert("mtsAtalkMsgDAO.insertMtsAtalkMsg_S", vo);
    }

    /**
	 * mts_atalk_msg을 수정한다.
	 * @param vo - 수정할 정보가 담긴 MtsAtalkMsgVO
	 * @return void형
	 * @exception Exception
	 */
    public void updateMtsAtalkMsg(MtsAtalkMsgVO vo) throws Exception {
        update("mtsAtalkMsgDAO.updateMtsAtalkMsg_S", vo);
    }

    /**
	 * mts_atalk_msg을 삭제한다.
	 * @param vo - 삭제할 정보가 담긴 MtsAtalkMsgVO
	 * @return void형 
	 * @exception Exception
	 */
    public void deleteMtsAtalkMsg(MtsAtalkMsgVO vo) throws Exception {
        delete("mtsAtalkMsgDAO.deleteMtsAtalkMsg_S", vo);
    }

    /**
	 * mts_atalk_msg을 조회한다.
	 * @param vo - 조회할 정보가 담긴 MtsAtalkMsgVO
	 * @return 조회한 mts_atalk_msg
	 * @exception Exception
	 */
    public MtsAtalkMsgVO selectMtsAtalkMsg(MtsAtalkMsgVO vo) throws Exception {
        return (MtsAtalkMsgVO) select("mtsAtalkMsgDAO.selectMtsAtalkMsg_S", vo);
    }

    /**
	 * mts_atalk_msg 목록을 조회한다.
	 * @param searchMap - 조회할 정보가 담긴 Map
	 * @return mts_atalk_msg 목록
	 * @exception Exception
	 */
    public List<?> selectMtsAtalkMsgList(MtsAtalkMsgDefaultVO searchVO) throws Exception {
        return list("mtsAtalkMsgDAO.selectMtsAtalkMsgList_D", searchVO);
    }

    /**
	 * mts_atalk_msg 총 갯수를 조회한다.
	 * @param searchMap - 조회할 정보가 담긴 Map
	 * @return mts_atalk_msg 총 갯수
	 * @exception
	 */
    public int selectMtsAtalkMsgListTotCnt(MtsAtalkMsgDefaultVO searchVO) {
        return (Integer)select("mtsAtalkMsgDAO.selectMtsAtalkMsgListTotCnt_S", searchVO);
    }

}
