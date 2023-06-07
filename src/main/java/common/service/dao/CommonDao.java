package common.service.dao;

import org.egovframe.rte.psl.dataaccess.EgovAbstractDAO;
import org.springframework.stereotype.Repository;

import dlink.front.vo.LoginVO;


@Repository("commonDao")
public class CommonDao extends EgovAbstractDAO{
	
	public LoginVO LoginCheck(LoginVO vo) {
		return (LoginVO) select("common.test", vo);
	}

	
}
