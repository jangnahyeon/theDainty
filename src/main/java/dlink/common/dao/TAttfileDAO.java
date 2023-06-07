package dlink.common.dao;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.EgovAbstractDAO;
import org.springframework.stereotype.Repository;

import dlink.common.vo.TAttfileVO;

/**
 * @Class Name : TAttfileDAO.java
 * @Description : TAttfile DAO Class
 * @Modification Information
 *
 * @author 안성찬
 * @since 2022-04-08
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */

@Repository("TAttfileDAO")
public class TAttfileDAO extends EgovAbstractDAO {

	/**
	 * t_attfile을 등록한다.
	 * @param vo - 등록할 정보가 담긴 TAttfileVO
	 * @return 등록 결과
	 * @exception Exception
	 */
    public String insertTAttfile(TAttfileVO vo) throws Exception {
        return (String)insert("TAttfileDAO.insertTAttfile_S", vo);
    }

    /**
	 * t_attfile을 수정한다.
	 * @param vo - 수정할 정보가 담긴 TAttfileVO
	 * @return void형
	 * @exception Exception
	 */
    public void updateTAttfile(TAttfileVO vo) throws Exception {
        update("TAttfileDAO.updateTAttfile_S", vo);
    }

    /**
	 * t_attfile을 삭제한다.
	 * @param vo - 삭제할 정보가 담긴 TAttfileVO
	 * @return void형 
	 * @exception Exception
	 */
    public void deleteTAttfile(TAttfileVO vo) throws Exception {
        delete("TAttfileDAO.deleteTAttfile_S", vo);
    }

    /**
	 * t_attfile을 조회한다.
	 * @param vo - 조회할 정보가 담긴 TAttfileVO
	 * @return 조회한 t_attfile
	 * @exception Exception
	 */
    public TAttfileVO selectTAttfile(TAttfileVO vo) throws Exception {
        return (TAttfileVO) select("TAttfileDAO.selectTAttfile_S", vo);
    }
    
    public int selectFileSeq(TAttfileVO vo) throws Exception {
        return (int) select("TAttfileDAO.selectFileSeq", vo);
    }
    
    /**
	 * t_attfile 목록을 조회한다.
	 * @param searchMap - 조회할 정보가 담긴 Map
	 * @return t_attfile 목록
	 * @exception Exception
	 */
    public List<?> selectTAttfileList(TAttfileVO vo) throws Exception {
        return list("TAttfileDAO.selectTAttfileList_D", vo);
    }

}
