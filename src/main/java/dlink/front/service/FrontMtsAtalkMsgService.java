package dlink.front.service;

import java.util.List;
import dlink.front.vo.MtsAtalkMsgDefaultVO;
import dlink.front.vo.MtsAtalkMsgVO;

/**
 * @Class Name : MtsAtalkMsgService.java
 * @Description : MtsAtalkMsg Business class
 * @Modification Information
 *
 * @author 이효진
 * @since 2022-04-07
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */
public interface FrontMtsAtalkMsgService {
	
	/**
	 * mts_atalk_msg을 등록한다.
	 * @param vo - 등록할 정보가 담긴 MtsAtalkMsgVO
	 * @return 등록 결과
	 * @exception Exception
	 */
    String insertMtsAtalkMsg(MtsAtalkMsgVO vo) throws Exception;
    
    /**
	 * mts_atalk_msg을 수정한다.
	 * @param vo - 수정할 정보가 담긴 MtsAtalkMsgVO
	 * @return void형
	 * @exception Exception
	 */
    void updateMtsAtalkMsg(MtsAtalkMsgVO vo) throws Exception;
    
    /**
	 * mts_atalk_msg을 삭제한다.
	 * @param vo - 삭제할 정보가 담긴 MtsAtalkMsgVO
	 * @return void형 
	 * @exception Exception
	 */
    void deleteMtsAtalkMsg(MtsAtalkMsgVO vo) throws Exception;
    
    /**
	 * mts_atalk_msg을 조회한다.
	 * @param vo - 조회할 정보가 담긴 MtsAtalkMsgVO
	 * @return 조회한 mts_atalk_msg
	 * @exception Exception
	 */
    MtsAtalkMsgVO selectMtsAtalkMsg(MtsAtalkMsgVO vo) throws Exception;
    
    /**
	 * mts_atalk_msg 목록을 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return mts_atalk_msg 목록
	 * @exception Exception
	 */
    List selectMtsAtalkMsgList(MtsAtalkMsgDefaultVO searchVO) throws Exception;
    
    /**
	 * mts_atalk_msg 총 갯수를 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return mts_atalk_msg 총 갯수
	 * @exception
	 */
    int selectMtsAtalkMsgListTotCnt(MtsAtalkMsgDefaultVO searchVO);
    
}
