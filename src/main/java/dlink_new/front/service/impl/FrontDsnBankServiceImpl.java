package dlink_new.front.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import dlink_new.admin.vo.TImgInfo;
import dlink_new.front.dao.FrontDsnBankDAO;
import dlink_new.front.service.FrontDsnBankService;


@Service("FrontDsnBankService")
public class FrontDsnBankServiceImpl extends EgovAbstractServiceImpl implements
FrontDsnBankService {
	
	private static final Logger LOGGER = LoggerFactory.getLogger(FrontDsnBankServiceImpl.class);
	
	@Resource(name="FrontDsnBankDAO")
	private FrontDsnBankDAO frontDsnBankDAO;
	
	public List<?> selectImgInfoList(TImgInfo searchVO) throws Exception {
        return frontDsnBankDAO.selectImgInfoList(searchVO);
    }
	
	public int selectImgInfoListTotCnt(TImgInfo searchVO) throws Exception {
		return frontDsnBankDAO.selectImgInfoListTotCnt(searchVO);
	}
	public TImgInfo selectImgInfo(TImgInfo searchVO) throws Exception {
	    	TImgInfo resultVO = frontDsnBankDAO.selectImgInfo(searchVO);
	        if (resultVO == null)
	            throw processException("info.nodata.msg");
	    return resultVO;
	}
	public void insertDownInfo(TImgInfo searchVO) throws Exception {
		frontDsnBankDAO.insertDownInfo(searchVO);
	}
	
	public void insertLikeInfo(TImgInfo searchVO) throws Exception {
		frontDsnBankDAO.insertLikeInfo(searchVO);
	}
	
	public int selectLikeCnt(TImgInfo searchVO) throws Exception {
		return frontDsnBankDAO.selectLikeCnt(searchVO);
	}
	

}
