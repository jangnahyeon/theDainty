package dlink.common.service.impl;

import java.io.File;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import dlink.common.service.CommProperties;
import dlink.common.service.TAttfileService;
import dlink.common.vo.TAttfileVO;
import dlink.admin.vo.SearchVO;
import dlink.common.dao.TAttfileDAO;

/**
 * @Class Name : TAttfileServiceImpl.java
 * @Description : TAttfile Business Implement class
 * @Modification Information
 *
 * @author 안성찬
 * @since 2022-04-08
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */

@Service("TAttfileService")
public class TAttfileServiceImpl extends EgovAbstractServiceImpl implements
        TAttfileService {
        
    private static final Logger LOGGER = LoggerFactory.getLogger(TAttfileServiceImpl.class);

    @Resource(name="TAttfileDAO")
    private TAttfileDAO TAttfileDAO;
    
    /** ID Generation */
    //@Resource(name="{egovTAttfileIdGnrService}")    
    //private EgovIdGnrService egovIdGnrService;

	/**
	 * t_attfile을 등록한다.
	 * @param vo - 등록할 정보가 담긴 TAttfileVO
	 * @return 등록 결과
	 * @exception Exception
	 */
    public String insertTAttfile(TAttfileVO vo) throws Exception {
    	LOGGER.debug(vo.toString());
    	
    	/** ID Generation Service */
    	//TODO 해당 테이블 속성에 따라 ID 제너레이션 서비스 사용
    	//String id = egovIdGnrService.getNextStringId();
    	//vo.setId(id);
    	LOGGER.debug(vo.toString());
    	
    	TAttfileDAO.insertTAttfile(vo);
    	//TODO 해당 테이블 정보에 맞게 수정    	
        return null;
    }

    /**
	 * t_attfile을 수정한다.
	 * @param vo - 수정할 정보가 담긴 TAttfileVO
	 * @return void형
	 * @exception Exception
	 */
    public void updateTAttfile(TAttfileVO vo) throws Exception {
        TAttfileDAO.updateTAttfile(vo);
    }

    /**
	 * t_attfile을 삭제한다.
	 * @param vo - 삭제할 정보가 담긴 TAttfileVO
	 * @return void형 
	 * @exception Exception
	 */
    public void deleteTAttfile(TAttfileVO vo) throws Exception {
    	this.deleteFile(vo);
        TAttfileDAO.deleteTAttfile(vo);
    }
    
    public void deleteFile(TAttfileVO vo) throws Exception {
    	try {
	    	if(null != vo) {
				String stordFilePath = CommProperties.getProperty("Globals.fileStorePath");
				String path = stordFilePath + vo.getSavePath() +System.getProperty("file.separator") + vo.getFileSaveNm();
				File file = new File(path);
				if(file.exists()) {
					file.delete();
				}
			}
    	} catch (Exception e) {
    		e.printStackTrace();
		}
    }

    /**
	 * t_attfile을 조회한다.
	 * @param vo - 조회할 정보가 담긴 TAttfileVO
	 * @return 조회한 t_attfile
	 * @exception Exception
	 */
    public TAttfileVO selectTAttfile(TAttfileVO vo) throws Exception {
        TAttfileVO resultVO = TAttfileDAO.selectTAttfile(vo);
        return resultVO;
    }

    
    public int selectFileSeq(TAttfileVO vo) throws Exception {
        return TAttfileDAO.selectFileSeq(vo);
    }
    
    /**
	 * t_attfile 목록을 조회한다.
	 * @param TAttfileVO - 조회할 정보가 담긴 VO
	 * @return t_attfile 목록
	 * @exception Exception
	 */
    public List<?> selectTAttfileList(TAttfileVO vo) throws Exception {
        return TAttfileDAO.selectTAttfileList(vo);
    }

}
