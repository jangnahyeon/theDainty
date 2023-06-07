package dlink_new.common.service.impl;

import java.io.File;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import dlink.common.service.CommProperties;
import dlink_new.common.dao.FileDAO;
import dlink_new.common.service.FileService;
import dlink_new.common.vo.FileVO;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;



/**
 * @Class Name : TAttfileServiceImpl.java
 * @Description : TAttfile Business Implement class
 * @Modification Information
 *
 * @author ���깆갔
 * @since 2022-04-08
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */

@Service("FileService")
public class FileServiceImpl extends EgovAbstractServiceImpl implements
        FileService {
        
    private static final Logger LOGGER = LoggerFactory.getLogger(FileServiceImpl.class);

    @Resource(name="FileDAO")
    private FileDAO FileDAO;
    
    /** ID Generation */
    //@Resource(name="{egovTAttfileIdGnrService}")    
    //private EgovIdGnrService egovIdGnrService;

	/**
	 * t_attfile�� �깅�����.
	 * @param vo - �깅��� ��蹂닿� �닿릿 TAttfileVO
	 * @return �깅� 寃곌낵
	 * @exception Exception
	 */
    public String insertTAttfile(FileVO vo) throws Exception {
    	LOGGER.debug(vo.toString());
    	
    	/** ID Generation Service */
    	//TODO �대�� ���대� ���깆�� �곕�� ID �������댁�� ��鍮��� �ъ��
    	//String id = egovIdGnrService.getNextStringId();
    	//vo.setId(id);
    	LOGGER.debug(vo.toString());
    	
    	FileDAO.insertTAttfile(vo);
    	//TODO �대�� ���대� ��蹂댁�� 留�寃� ����    	
        return null;
    }

    /**
	 * t_attfile�� ��������.
	 * @param vo - ������ ��蹂닿� �닿릿 TAttfileVO
	 * @return void��
	 * @exception Exception
	 */
    public void updateTAttfile(FileVO vo) throws Exception {
        FileDAO.updateTAttfile(vo);
    }

    /**
	 * t_attfile�� ��������.
	 * @param vo - ������ ��蹂닿� �닿릿 TAttfileVO
	 * @return void�� 
	 * @exception Exception
	 */
    public void deleteTAttfile(FileVO vo) throws Exception {
    	this.deleteFile(vo);
    	FileDAO.deleteTAttfile(vo);
    }
    
    public void deleteFile(FileVO vo) throws Exception {
    	try {
	    	if(null != vo) {
				String stordFilePath = CommProperties.getProperty("Globals.fileStorePath");
				String path = stordFilePath + vo.getSavePath() +System.getProperty("file.separator") + vo.getSaveNm();
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
	 * t_attfile�� 議고������.
	 * @param vo - 議고���� ��蹂닿� �닿릿 TAttfileVO
	 * @return 議고���� t_attfile
	 * @exception Exception
	 */
    public FileVO selectTAttfile(FileVO vo) throws Exception {
    	FileVO resultVO = FileDAO.selectTAttfile(vo);
        return resultVO;
    }

    
    public int selectFileSeq(FileVO vo) throws Exception {
        return FileDAO.selectFileSeq(vo);
    }
    
    /**
	 * t_attfile 紐⑸��� 議고������.
	 * @param TAttfileVO - 議고���� ��蹂닿� �닿릿 VO
	 * @return t_attfile 紐⑸�
	 * @exception Exception
	 */
    public List<?> selectTAttfileList(FileVO vo) throws Exception {
        return FileDAO.selectTAttfileList(vo);
    }

}
