package dlink.front.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import dlink.admin.vo.TMemComFileVO;
import dlink.common.vo.SearchVO;
import dlink.front.dao.TMemComFileDAO;
import dlink.front.service.TMemComFileService;


/**
 * @Class Name : TMemComFileServiceImpl.java
 * @Description : TMemComFile Business Implement class
 * @Modification Information
 *
 * @author 이효진
 * @since 2022-04-28
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */

@Service("TMemComFileService")
public class TMemComFileServiceImpl extends EgovAbstractServiceImpl implements
TMemComFileService {
        
    private static final Logger LOGGER = LoggerFactory.getLogger(TMemComFileServiceImpl.class);

    @Resource(name="TMemComFileDAO")
    private TMemComFileDAO TMemComFileDAO;
    
    
    /**
	 * t_mem_com_file을 수정한다.
	 * @param vo - 수정할 정보가 담긴 TMemComFileVO
	 * @return void형
	 * @exception Exception
	 */
    public void updateTMemComFile(TMemComFileVO vo) throws Exception {
    	TMemComFileDAO.updateTMemComFile(vo);
    }

    /**
	 * t_mem_com_file을 삭제한다.
	 * @param vo - 삭제할 정보가 담긴 TMemComFileVO
	 * @return void형 
	 * @exception Exception
	 */
    public void deleteTMemComFile(TMemComFileVO vo) throws Exception {
    	TMemComFileDAO.deleteTMemComFile(vo);
    }

    /**
	 * t_mem_com_file을 조회한다.
	 * @param vo - 조회할 정보가 담긴 TMemComFileVO
	 * @return 조회한 t_mem_com_file
	 * @exception Exception
	 */
    public TMemComFileVO selectTMemComFile(TMemComFileVO vo) throws Exception {
    	TMemComFileVO resultVO = TMemComFileDAO.selectTMemComFile(vo);
        if (resultVO == null)
            throw processException("info.nodata.msg");
        return resultVO;
    }

    /**
	 * t_mem_com_file 목록을 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return t_mem_com_file 목록
	 * @exception Exception
	 */
    public List<?> selectTMemComFileList(TMemComFileVO vo) throws Exception {
        return TMemComFileDAO.selectTMemComFileList(vo);
    }

    /**
	 * t_mem_com_file 총 갯수를 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return t_mem_com_file 총 갯수
	 * @exception
	 */
    public int selectTMemComFileListTotCnt(SearchVO searchVO) {
		return TMemComFileDAO.selectTMemComFileListTotCnt(searchVO);
	}

   
}
