package dlink_new.front.dao;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.EgovAbstractDAO;
import org.springframework.stereotype.Repository;

import dlink_new.admin.vo.TImgInfo;

@Repository("FrontMypageDAO")
public class FrontMypageDAO  extends EgovAbstractDAO {

	public List<?> selectMypageDsnList(TImgInfo searchVO) throws Exception {
        return list("FrontMypageDAO.selectMypageDsnList", searchVO);
    }

	public int selectMypageDsnListTotCnt(TImgInfo searchVO) throws Exception {
        return (Integer)select("FrontMypageDAO.selectMypageDsnListTotCnt", searchVO);
    }

	public void deleteLikeInfo(TImgInfo vo) {
		delete("FrontMypageDAO.deleteLikeInfo", vo);
	}

}
