package dlink_new.admin.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import dlink_new.admin.dao.AdminDsnBankDAO;
import dlink_new.admin.service.AdminDsnBankService;
import dlink_new.admin.vo.TImgInfo;

@Service("AdminDsnBankService")
public class AdminDsnBankServiceImpl extends EgovAbstractServiceImpl implements
        AdminDsnBankService {
	
    private static final Logger LOGGER = LoggerFactory.getLogger(AdminDsnBankServiceImpl.class);

    @Resource(name="AdminDsnBankDAO")
    private AdminDsnBankDAO adminDsnBankDAO;
    

	public void insertImgInfo(TImgInfo searchVO) throws Exception {
		adminDsnBankDAO.insertImgInfo(searchVO);
	}
	
	public void insertImg(TImgInfo searchVO) throws Exception {
		adminDsnBankDAO.insertImg(searchVO);
	}
	
	public List<?> selectImgInfoList(TImgInfo searchVO) throws Exception {
        return adminDsnBankDAO.selectImgInfoList(searchVO);
    }


    public int selectImgInfoListTotCnt(TImgInfo searchVO) throws Exception {
		return adminDsnBankDAO.selectImgInfoListTotCnt(searchVO);
	}

    public TImgInfo selectImgInfo(TImgInfo searchVO) throws Exception {
    	TImgInfo resultVO = adminDsnBankDAO.selectImgInfo(searchVO);
        if (resultVO == null)
            throw processException("info.nodata.msg");
        return resultVO;
	}
    public void deleteImg(TImgInfo vo) throws Exception {
    	adminDsnBankDAO.deleteImg(vo);
    }
    
    public void deleteImgAll(TImgInfo vo) throws Exception {
    	adminDsnBankDAO.deleteImgAll(vo);
    }
    
    public void updateImgInfo(TImgInfo vo) throws Exception {
    	adminDsnBankDAO.updateImgInfo(vo);
    }
    
    public void deleteImgInfo(TImgInfo vo) throws Exception {
    	adminDsnBankDAO.deleteImgInfo(vo);
    }
    public TImgInfo selectImgList(TImgInfo searchVO) throws Exception {
        return adminDsnBankDAO.selectImgList(searchVO);
    }
    
    public List<?> selectDownInfo(TImgInfo searchVO) throws Exception {
        return adminDsnBankDAO.selectDownInfo(searchVO);
    }
    
    public List<?> selectOrderNoList(TImgInfo searchVO) throws Exception {
        return adminDsnBankDAO.selectOrderNoList(searchVO);
    }
  
}
