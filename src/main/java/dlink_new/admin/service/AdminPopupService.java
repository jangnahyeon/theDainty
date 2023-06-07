package dlink_new.admin.service;

import java.util.List;

import dlink_new.admin.vo.TbPopupVO;

public interface AdminPopupService {

	void insertPopup(TbPopupVO searchVO) throws Exception;

	List<?> selectPopupList(TbPopupVO searchVO) throws Exception;

	int selectPopupListTotCnt(TbPopupVO searchVO) throws Exception;

	List<TbPopupVO> selectShowPopupList(TbPopupVO searchVO) throws Exception;

	TbPopupVO selectPopup(TbPopupVO searchVO) throws Exception;

	void updatePopup(TbPopupVO searchVO) throws Exception;

	void popupDelete(TbPopupVO searchVO) throws Exception;

}
