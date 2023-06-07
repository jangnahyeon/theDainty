package common.service.impl;

import javax.annotation.Resource;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.springframework.stereotype.Service;

import common.service.CommonService;
import common.service.dao.CommonDao;
import dlink.front.vo.LoginVO;

@Service("commonService")
public class CommonServiceImpl extends EgovAbstractServiceImpl implements CommonService{

	@Resource(name="commonDao")
	private CommonDao commonDao;

	@Override
	public LoginVO LoginCheck(LoginVO vo) throws Exception {
		return commonDao.LoginCheck(vo);
	}

}
