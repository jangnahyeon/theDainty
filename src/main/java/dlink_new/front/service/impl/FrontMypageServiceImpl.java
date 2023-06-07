package dlink_new.front.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import dlink_new.admin.vo.TImgInfo;
import dlink_new.front.service.FrontMypageService;
import dlink_new.front.dao.FrontMypageDAO;

@Service("FrontMypageService")
public class FrontMypageServiceImpl extends EgovAbstractServiceImpl implements FrontMypageService {

	private static final Logger LOGGER = LoggerFactory.getLogger(FrontMypageServiceImpl.class);

	@Resource(name = "FrontMypageDAO")
	private FrontMypageDAO frontMypageDao;

	public List<?> selectMypageDsnList(TImgInfo searchVO) throws Exception {
		return frontMypageDao.selectMypageDsnList(searchVO);
	}

	public int selectMypageDsnListTotCnt(TImgInfo searchVO) throws Exception {
		return frontMypageDao.selectMypageDsnListTotCnt(searchVO);
	}

	public void deleteLikeInfo(TImgInfo vo) throws Exception {
		frontMypageDao.deleteLikeInfo(vo);
	}
}
