package dlink_new.admin.dao;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.EgovAbstractDAO;
import org.springframework.stereotype.Repository;

import dlink_new.admin.vo.TbPopupVO;

@Repository("AdminPopupDAO")
public class AdminPopupDAO extends EgovAbstractDAO {

	public void insertPopup(TbPopupVO searchVO) {
		insert("AdminPopupDAO.insertPopup", searchVO);
	}

	public List<?> selectPopupList(TbPopupVO searchVO) {
		return list("AdminPopupDAO.selectPopupList", searchVO);
	}

	public int selectPopupListTotCnt(TbPopupVO searchVO) {
		return (Integer)select("AdminPopupDAO.selectPopupListTotCnt", searchVO);
	}

	public List<TbPopupVO> selectShowPopupList(TbPopupVO searchVO) {
		return (List<TbPopupVO>) list("AdminPopupDAO.selectShowPopupList", searchVO);
	}

	public TbPopupVO selectPopup(TbPopupVO searchVO) {
		return (TbPopupVO) select("AdminPopupDAO.selectPopup", searchVO);
	}

	public void updatePopup(TbPopupVO searchVO) {
		update("AdminPopupDAO.updatePopup", searchVO);
	}

	public void popupDelete(TbPopupVO searchVO) {
		delete("AdminPopupDAO.popupDelete", searchVO);
	}
	

}
