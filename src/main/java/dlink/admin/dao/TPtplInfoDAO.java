package dlink.admin.dao;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.EgovAbstractDAO;
import org.springframework.stereotype.Repository;

import dlink.admin.vo.TPtplInfoVO;
import dlink.admin.vo.SearchVO;

/**
 * @Class Name : TPtplInfoDAO.java
 * @Description : TPtplInfo DAO Class
 * @Modification Information
 *
 * @author 장나현
 * @since 2022-03-30
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */

@Repository("TPtplInfoDAO")
public class TPtplInfoDAO extends EgovAbstractDAO {

	/**
	 * t_ptpl_info을 등록한다.
	 * @param vo - 등록할 정보가 담긴 TPtplInfoVO
	 * @return 등록 결과
	 * @exception Exception
	 */
    public String insertTPtplInfo(TPtplInfoVO vo) throws Exception {
        return (String)insert("TPtplInfoDAO.insertTPtplInfo_S", vo);
    }

    /**
	 * t_ptpl_info을 수정한다.
	 * @param vo - 수정할 정보가 담긴 TPtplInfoVO
	 * @return void형
	 * @exception Exception
	 */
    public void updateTPtplInfo(TPtplInfoVO vo) throws Exception {
        update("TPtplInfoDAO.updateTPtplInfo_S", vo);
    }

    /**
	 * t_ptpl_info을 삭제한다.
	 * @param vo - 삭제할 정보가 담긴 TPtplInfoVO
	 * @return void형 
	 * @exception Exception
	 */
    public void deleteTPtplInfo(TPtplInfoVO vo) throws Exception {
        delete("TPtplInfoDAO.deleteTPtplInfo_S", vo);
    }
    public void deleteTPtplInfoImg(TPtplInfoVO vo) throws Exception {
        delete("TPtplInfoDAO.deleteTPtplInfoImg", vo);
    }

    /**
	 * t_ptpl_info을 조회한다.
	 * @param vo - 조회할 정보가 담긴 TPtplInfoVO
	 * @return 조회한 t_ptpl_info
	 * @exception Exception
	 */
    public TPtplInfoVO selectTPtplInfo(TPtplInfoVO vo) throws Exception {
        return (TPtplInfoVO) select("TPtplInfoDAO.selectTPtplInfo_S", vo);
    }

    /**
	 * t_ptpl_info 목록을 조회한다.
	 * @param searchMap - 조회할 정보가 담긴 Map
	 * @return t_ptpl_info 목록
	 * @exception Exception
	 */
    public List<?> selectTPtplInfoList(SearchVO searchVO) throws Exception {
        return list("TPtplInfoDAO.selectTPtplInfoList_D", searchVO);
    }
    
    public List<TPtplInfoVO> selectTPtplInfoImgList(TPtplInfoVO searchVO) throws Exception {
        return (List<TPtplInfoVO>) list("TPtplInfoDAO.selectTPtplInfoImgList", searchVO);
    }

    /**
	 * t_ptpl_info 총 갯수를 조회한다.
	 * @param searchMap - 조회할 정보가 담긴 Map
	 * @return t_ptpl_info 총 갯수
	 * @exception
	 */
    public int selectTPtplInfoListTotCnt(SearchVO searchVO) {
        return (Integer)select("TPtplInfoDAO.selectTPtplInfoListTotCnt_S", searchVO);
    }

}
