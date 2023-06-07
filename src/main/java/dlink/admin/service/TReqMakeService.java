package dlink.admin.service;

import java.util.List;

import dlink.admin.vo.SearchVO;
import dlink.admin.vo.TReqMakeVO;

public interface TReqMakeService {
	
	/**
	 * t_req_make을 등록한다.
	 * @param vo - 등록할 정보가 담긴 t_req_make
	 * @return 등록 결과
	 * @exception Exception
	 */
    String insertTReqMake(TReqMakeVO vo) throws Exception;
    
    /**
	 * t_req_make을 수정한다.
	 * @param vo - 수정할 정보가 담긴 t_req_make
	 * @return void형
	 * @exception Exception
	 */
    void updateTReqMake(TReqMakeVO vo) throws Exception;
    
    /**
	 * t_req_make을 삭제한다.
	 * @param vo - 삭제할 정보가 담긴 t_req_make
	 * @return void형 
	 * @exception Exception
	 */
    void deleteTReqMake(TReqMakeVO vo) throws Exception;
    
    /**
	 * t_req_make을 조회한다.
	 * @param vo - 조회할 정보가 담긴 t_req_make
	 * @return 조회한 t_req_make
	 * @exception Exception
	 */
    TReqMakeVO selectTReqMake(TReqMakeVO vo) throws Exception;
    
    /**
	 * t_req_make 목록을 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return t_req_make 목록
	 * @exception Exception
	 */
    List<?> selectTReqMakeList(SearchVO searchVO) throws Exception;
    
    /**
	 * t_req_make 총 갯수를 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return t_req_make 총 갯수
	 * @exception
	 */
    int selectTReqMakeListTotCnt(SearchVO searchVO);
    
    
    /**
     * t_req_make의 POST_NO 번호 만들어줌
     * */
    int selectForInsertReqNo(TReqMakeVO vo) throws Exception;
    
    
    /**
     * t_req_make의 SEQ 번호 만들어줌
     * */
    int selectForInsertSeq(TReqMakeVO vo) throws Exception;
    
    /**
     * 답변 조회
     * */
    List<?> selectCommentsTReqMakeList(TReqMakeVO vo) throws Exception;
}
