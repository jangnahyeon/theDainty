package dlink_new.common.dao;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.EgovAbstractDAO;
import org.springframework.stereotype.Repository;

import dlink_new.common.vo.FileVO;

/**
 * @Class Name : TAttfileDAO.java
 * @Description : TAttfile DAO Class
 * @Modification Information
 *
 * @author ���깆갔
 * @since 2022-04-08
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */

@Repository("FileDAO")
public class FileDAO extends EgovAbstractDAO {

	/**
	 * t_attfile�� �깅�����.
	 * @param vo - �깅��� ��蹂닿� �닿릿 TAttfileVO
	 * @return �깅� 寃곌낵
	 * @exception Exception
	 */
    public String insertTAttfile(FileVO vo) throws Exception {
        return (String)insert("FileDAO.insertTAttfile_S", vo);
    }

    /**
	 * t_attfile�� ��������.
	 * @param vo - ������ ��蹂닿� �닿릿 TAttfileVO
	 * @return void��
	 * @exception Exception
	 */
    public void updateTAttfile(FileVO vo) throws Exception {
        update("FileDAO.updateTAttfile_S", vo);
    }

    /**
	 * t_attfile�� ��������.
	 * @param vo - ������ ��蹂닿� �닿릿 TAttfileVO
	 * @return void�� 
	 * @exception Exception
	 */
    public void deleteTAttfile(FileVO vo) throws Exception {
        delete("FileDAO.deleteTAttfile_S", vo);
    }

    /**
	 * t_attfile�� 議고������.
	 * @param vo - 議고���� ��蹂닿� �닿릿 TAttfileVO
	 * @return 議고���� t_attfile
	 * @exception Exception
	 */
    public FileVO selectTAttfile(FileVO vo) throws Exception {
        return (FileVO) select("FileDAO.selectTAttfile_S", vo);
    }
    
    public int selectFileSeq(FileVO vo) throws Exception {
        return (int) select("FileDAO.selectFileSeq", vo);
    }
    
    /**
	 * t_attfile 紐⑸��� 議고������.
	 * @param searchMap - 議고���� ��蹂닿� �닿릿 Map
	 * @return t_attfile 紐⑸�
	 * @exception Exception
	 */
    public List<?> selectTAttfileList(FileVO vo) throws Exception {
        return list("FileDAO.selectTAttfileList_D", vo);
    }

}
