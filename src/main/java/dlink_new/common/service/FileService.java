package dlink_new.common.service;

import java.util.List;

import dlink_new.common.vo.FileVO;

/**
 * @Class Name : TAttfileService.java
 * @Description : TAttfile Business class
 * @Modification Information
 *
 * @author ���깆갔
 * @since 2022-04-08
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */
public interface FileService {
	
	/**
	 * t_attfile�� �깅�����.
	 * @param vo - �깅��� ��蹂닿� �닿릿 TAttfileVO
	 * @return �깅� 寃곌낵
	 * @exception Exception
	 */
    String insertTAttfile(FileVO vo) throws Exception;
    
    /**
	 * t_attfile�� ��������.
	 * @param vo - ������ ��蹂닿� �닿릿 TAttfileVO
	 * @return void��
	 * @exception Exception
	 */
    void updateTAttfile(FileVO vo) throws Exception;
    
    /**
	 * t_attfile�� ��������.
	 * @param vo - ������ ��蹂닿� �닿릿 TAttfileVO
	 * @return void�� 
	 * @exception Exception
	 */
    void deleteTAttfile(FileVO vo) throws Exception;
    
    
    /**
	 * t_attfile�� 議고������.
	 * @param vo - 議고���� ��蹂닿� �닿릿 TAttfileVO
	 * @return 議고���� t_attfile
	 * @exception Exception
	 */
    FileVO selectTAttfile(FileVO vo) throws Exception;
    
    //泥⑤����� pk媛� 李얘린
    int selectFileSeq(FileVO vo) throws Exception;
    
    /**
 	 * t_attfile 紐⑸��� 議고������.
 	 * @param TAttfileVO - 議고���� ��蹂닿� �닿릿 VO
 	 * @return t_attfile 紐⑸�
 	 * @exception Exception
 	 */
     List<?> selectTAttfileList(FileVO vo) throws Exception;
     
    
}
