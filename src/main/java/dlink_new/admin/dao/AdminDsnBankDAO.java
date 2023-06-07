package dlink_new.admin.dao;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.EgovAbstractDAO;
import org.springframework.stereotype.Repository;

import dlink.admin.vo.TDsnBankVO;
import dlink.front.vo.TPtplInfoVO;
import dlink_new.admin.vo.TImgInfo;

@Repository("AdminDsnBankDAO")
public class AdminDsnBankDAO extends EgovAbstractDAO {


	public void insertImgInfo(TImgInfo searchVO) throws Exception {
        insert("AdminDsnBankDAO.insertImgInfo", searchVO);
    }

	public void insertImg(TImgInfo searchVO)  throws Exception {
		insert("AdminDsnBankDAO.insertImg", searchVO);
	}

	public List<?> selectImgInfoList(TImgInfo searchVO) throws Exception {
        return list("AdminDsnBankDAO.selectImgInfoList", searchVO);
    }

    public int selectImgInfoListTotCnt(TImgInfo searchVO) throws Exception {
        return (Integer)select("AdminDsnBankDAO.selectImgInfoListTotCnt", searchVO);
    }

	public TImgInfo selectImgInfo(TImgInfo searchVO) throws Exception {
		return (TImgInfo) select("AdminDsnBankDAO.selectImgInfo", searchVO);
	}

	public void deleteImg(TImgInfo vo) throws Exception {
        delete("AdminDsnBankDAO.deleteImg", vo);
    }
	
	public void deleteImgAll(TImgInfo vo) throws Exception {
        delete("AdminDsnBankDAO.deleteImgAll", vo);
    }

	public void updateImgInfo(TImgInfo vo) throws Exception {
        update("AdminDsnBankDAO.updateImgInfo", vo);
    }

	public void deleteImgInfo(TImgInfo vo) throws Exception {
		delete("AdminDsnBankDAO.deleteImgInfo", vo);
		
	}
	
	public TImgInfo selectImgList(TImgInfo searchVO) throws Exception {
        return (TImgInfo) select("AdminDsnBankDAO.selectImgList", searchVO);
    }

	public List<?> selectDownInfo(TImgInfo searchVO) {
		return list("AdminDsnBankDAO.selectDownInfo", searchVO);
	}

	public List<?> selectOrderNoList(TImgInfo searchVO) {
		return list("AdminDsnBankDAO.selectOrderNoList", searchVO);
	}
	
}
