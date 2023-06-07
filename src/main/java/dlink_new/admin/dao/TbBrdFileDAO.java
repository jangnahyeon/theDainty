package dlink_new.admin.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import org.egovframe.rte.psl.dataaccess.EgovAbstractDAO;
import dlink_new.admin.vo.TbBrdFileVO;
import dlink_new.admin.vo.TbBrdFileDefaultVO;

/**
 * @Class Name : TbBrdFileDAO.java
 * @Description : TbBrdFile DAO Class
 * @Modification Information
 *
 * @author 김현재
 * @since 2023-02-02
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */

@Repository("tbBrdFileDAO")
public class TbBrdFileDAO extends EgovAbstractDAO {

	/**
	 * tb_brd_file을 등록한다.
	 * @param vo - 등록할 정보가 담긴 TbBrdFileVO
	 * @return 등록 결과
	 * @exception Exception
	 */
    public int insertTbBrdFile(TbBrdFileVO vo) throws Exception {
        return (int)insert("tbBrdFileDAO.insertTbBrdFile_S", vo);
    }

    /**
	 * tb_brd_file을 수정한다.
	 * @param vo - 수정할 정보가 담긴 TbBrdFileVO
	 * @return void형
	 * @exception Exception
	 */
    public void updateTbBrdFile(TbBrdFileVO vo) throws Exception {
        update("tbBrdFileDAO.updateTbBrdFile_S", vo);
    }

    /**
	 * tb_brd_file을 삭제한다.
	 * @param vo - 삭제할 정보가 담긴 TbBrdFileVO
	 * @return void형 
	 * @exception Exception
	 */
    public void deleteTbBrdFile(TbBrdFileVO vo) throws Exception {
        delete("tbBrdFileDAO.deleteTbBrdFile_S", vo);
    }

    /**
	 * tb_brd_file을 조회한다.
	 * @param vo - 조회할 정보가 담긴 TbBrdFileVO
	 * @return 조회한 tb_brd_file
	 * @exception Exception
	 */
    public TbBrdFileVO selectTbBrdFile(TbBrdFileVO vo) throws Exception {
        return (TbBrdFileVO) select("tbBrdFileDAO.selectTbBrdFile_S", vo);
    }

    /**
	 * tb_brd_file 목록을 조회한다.
	 * @param searchMap - 조회할 정보가 담긴 Map
	 * @return tb_brd_file 목록
	 * @exception Exception
	 */
    public List<?> selectTbBrdFileList(TbBrdFileDefaultVO searchVO) throws Exception {
        return list("tbBrdFileDAO.selectTbBrdFileList_D", searchVO);
    }

    /**
	 * tb_brd_file 총 갯수를 조회한다.
	 * @param searchMap - 조회할 정보가 담긴 Map
	 * @return tb_brd_file 총 갯수
	 * @exception
	 */
    public int selectTbBrdFileListTotCnt(TbBrdFileDefaultVO searchVO) {
        return (Integer)select("tbBrdFileDAO.selectTbBrdFileListTotCnt_S", searchVO);
    }

}
