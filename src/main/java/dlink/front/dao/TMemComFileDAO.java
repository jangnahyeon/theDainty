package dlink.front.dao;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.EgovAbstractDAO;
import org.springframework.stereotype.Repository;

import dlink.admin.vo.TMemComFileVO;
import dlink.common.vo.SearchVO;


/**
 * @Class Name : TMemComFileDAO.java
 * @Description : TMemComFile DAO Class
 * @Modification Information
 *
 * @author 이효진
 * @since 2022-04-28
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */

@Repository("TMemComFileDAO")
public class TMemComFileDAO extends EgovAbstractDAO {



    /**
	 * t_mem_com_file을 수정한다.
	 * @param vo - 수정할 정보가 담긴 TMemComFileVO
	 * @return void형
	 * @exception Exception
	 */
    public void updateTMemComFile(TMemComFileVO vo) throws Exception {
        update("TMemComFileDAO.updateTMemComFile_S", vo);
    }

    /**
	 * t_mem_com_file을 삭제한다.
	 * @param vo - 삭제할 정보가 담긴 TMemComFileVO
	 * @return void형 
	 * @exception Exception
	 */
    public void deleteTMemComFile(TMemComFileVO vo) throws Exception {
        delete("TMemComFileDAO.deleteTMemComFile_S", vo);
    }

    /**
	 * t_mem_com_file을 조회한다.
	 * @param vo - 조회할 정보가 담긴 TMemComFileVO
	 * @return 조회한 t_mem_com_file
	 * @exception Exception
	 */
    public TMemComFileVO selectTMemComFile(TMemComFileVO vo) throws Exception {
        return (TMemComFileVO) select("TMemComFileDAO.selectTMemComFile", vo);
    }

    /**
	 * t_mem_com_file 목록을 조회한다.
	 * @param searchMap - 조회할 정보가 담긴 Map
	 * @return t_mem_com_file 목록
	 * @exception Exception
	 */
    public List<?> selectTMemComFileList(TMemComFileVO vo) throws Exception {
        return list("TMemComFileDAO.selectTMemComFileList_D", vo);
    }

    /**
	 * t_mem_com_file 총 갯수를 조회한다.
	 * @param searchMap - 조회할 정보가 담긴 Map
	 * @return t_mem_com_file 총 갯수
	 * @exception
	 */
    public int selectTMemComFileListTotCnt(SearchVO searchVO) {
        return (Integer)select("TMemComFileDAO.selectTMemComFileListTotCnt_S", searchVO);
    }
    
  
}
