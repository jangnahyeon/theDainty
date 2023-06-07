package dlink_new.admin.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import dlink_new.admin.dao.AdminPopupDAO;
import dlink_new.admin.service.AdminPopupService;
import dlink_new.admin.vo.TbPopupVO;

@Service("AdminPopupService")
public class AdminPopupServiceImpl extends EgovAbstractServiceImpl implements 
	AdminPopupService {
	
	private static final Logger LOGGER = LoggerFactory.getLogger(AdminPopupServiceImpl.class);
	
	@Resource(name="AdminPopupDAO")
    private AdminPopupDAO adminPopupDAO;
	
	public void insertPopup(TbPopupVO searchVO) throws Exception {
		adminPopupDAO.insertPopup(searchVO);
	}
	
	public List<?> selectPopupList(TbPopupVO searchVO) throws Exception {
        return adminPopupDAO.selectPopupList(searchVO);
    }
	
	public int selectPopupListTotCnt(TbPopupVO searchVO) {
		return adminPopupDAO.selectPopupListTotCnt(searchVO);
	}
	
	public List<TbPopupVO> selectShowPopupList(TbPopupVO searchVO) throws Exception {
        return adminPopupDAO.selectShowPopupList(searchVO);
    }
	
	public TbPopupVO selectPopup(TbPopupVO searchVO) {
		return adminPopupDAO.selectPopup(searchVO);
	}
	
	public void updatePopup(TbPopupVO searchVO) throws Exception {
		adminPopupDAO.updatePopup(searchVO);
	}
	
	public void popupDelete(TbPopupVO searchVO) throws Exception {
		adminPopupDAO.popupDelete(searchVO);
	}
}
