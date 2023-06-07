package dlink_new.front.dao;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.EgovAbstractDAO;
import org.springframework.stereotype.Repository;

import dlink_new.admin.vo.TImgInfo;

@Repository("FrontDsnBankDAO")
public class FrontDsnBankDAO extends EgovAbstractDAO {

	
	public List<?> selectImgInfoList(TImgInfo searchVO) throws Exception {
        return list("FrontDsnBankDAO.selectImgInfoList", searchVO);
    }

    public int selectImgInfoListTotCnt(TImgInfo searchVO) throws Exception {
        return (Integer)select("FrontDsnBankDAO.selectImgInfoListTotCnt", searchVO);
    }

	public TImgInfo selectImgInfo(TImgInfo searchVO) throws Exception {
		return (TImgInfo) select("FrontDsnBankDAO.selectImgInfo", searchVO);
	}

	public void insertDownInfo(TImgInfo searchVO)  throws Exception {
		insert("FrontDsnBankDAO.insertDownInfo", searchVO);
	}
	public void insertLikeInfo(TImgInfo searchVO)  throws Exception {
		insert("FrontDsnBankDAO.insertLikeInfo", searchVO);
	}

	public int selectLikeCnt(TImgInfo searchVO) {
		return (Integer)select("FrontDsnBankDAO.selectLikeCnt", searchVO);
	}

}
