package dlink.admin.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import dlink.admin.dao.TReqMakeDAO;
import dlink.admin.service.TReqMakeService;
import dlink.admin.vo.SearchVO;

import dlink.admin.vo.TReqMakeVO;

@Service("TReqMakeService")
public class TReqMakeServiceImpl  extends EgovAbstractServiceImpl implements
TReqMakeService{
	
	 private static final Logger LOGGER = LoggerFactory.getLogger(TReqMakeServiceImpl.class);

	    @Resource(name="TReqMakeDAO")
	    private TReqMakeDAO TReqMakeDAO;
	    
	    /** ID Generation */
	    //@Resource(name="{egovTCommutyIdGnrService}")    
	    //private EgovIdGnrService egovIdGnrService;

	    
	    /**
		 * t_req_make을 등록한다.
		 * @param vo - 등록할 정보가 담긴 TCommutyVO
		 * @return 등록 결과
		 * @exception Exception
		 */
	    public String insertTReqMake(TReqMakeVO vo) throws Exception {
	    	LOGGER.debug(vo.toString());
	    	
	    	/** ID Generation Service */
	    	//TODO 해당 테이블 속성에 따라 ID 제너레이션 서비스 사용
	    	//String id = egovIdGnrService.getNextStringId();
	    	//vo.setId(id);
	    	LOGGER.debug(vo.toString());
	    	
	    	TReqMakeDAO.insertTReqMake(vo);
	    	//TODO 해당 테이블 정보에 맞게 수정    	
	        return null;
	    }

	    /**
		 * t_req_make을 수정한다.
		 * @param vo - 수정할 정보가 담긴 TCommutyVO
		 * @return void형
		 * @exception Exception
		 */
	    public void updateTReqMake(TReqMakeVO vo) throws Exception {
	    	TReqMakeDAO.updateTReqMake(vo);
	    }

	    /**
		 * t_req_make을 삭제한다.
		 * @param vo - 삭제할 정보가 담긴 TCommutyVO
		 * @return void형 
		 * @exception Exception
		 */
	    public void deleteTReqMake(TReqMakeVO vo) throws Exception {
	    	TReqMakeDAO.deleteTReqMake(vo);
	    }

	    /**
		 * t_req_make을 조회한다.
		 * @param vo - 조회할 정보가 담긴 TCommutyVO
		 * @return 조회한 t_req_make
		 * @exception Exception
		 */
	    public TReqMakeVO selectTReqMake(TReqMakeVO vo) throws Exception {
	    	TReqMakeVO resultVO = TReqMakeDAO.selectTReqMake(vo);
	        if (resultVO == null)
	            throw processException("info.nodata.msg");
	        return resultVO;
	    }

	    /**
		 * t_req_make 목록을 조회한다.
		 * @param searchVO - 조회할 정보가 담긴 VO
		 * @return t_req_make 목록
		 * @exception Exception
		 */
	    public List<?> selectTReqMakeList(SearchVO searchVO) throws Exception {
	        return TReqMakeDAO.selectTReqMakeList(searchVO);
	    }

	    /**
		 * t_req_make 총 갯수를 조회한다.
		 * @param searchVO - 조회할 정보가 담긴 VO
		 * @return t_req_make 총 갯수
		 * @exception
		 */
	    public int selectTReqMakeListTotCnt(SearchVO searchVO) {
			return TReqMakeDAO.selectTReqMakeListTotCnt(searchVO);
		}

		@Override
		public int selectForInsertReqNo(TReqMakeVO vo) throws Exception {
			return TReqMakeDAO.selectForInsertReqNo(vo);
		}

		@Override
		public int selectForInsertSeq(TReqMakeVO vo) throws Exception {
			return TReqMakeDAO.selectForInsertSeq(vo);
		}
		
		public List<?> selectCommentsTReqMakeList(TReqMakeVO vo) throws Exception {
			return TReqMakeDAO.selectCommentsTReqMakeList(vo);
	      
	    }
	    
	    

}
