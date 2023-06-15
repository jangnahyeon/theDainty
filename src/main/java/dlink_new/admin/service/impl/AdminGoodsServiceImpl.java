package dlink_new.admin.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.springframework.stereotype.Service;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import dlink_new.admin.dao.AdminGoodsDAO;
import dlink_new.admin.service.AdminGoodsService;
import dlink_new.admin.vo.TbGoodsVO;

@Service("AdminGoodsService")
public class AdminGoodsServiceImpl extends EgovAbstractServiceImpl implements AdminGoodsService{

	
	private static final Logger LOGGER = LoggerFactory.getLogger(AdminGoodsServiceImpl.class);

    @Resource(name="AdminGoodsDAO")
    private AdminGoodsDAO adminGoodsDAO;
    
    
    public List<?> selectGoodsList(TbGoodsVO searchVO) throws Exception {
        return adminGoodsDAO.selectGoodsList(searchVO);
    }
    
    public int selectGoodsListTotCnt(TbGoodsVO searchVO) throws Exception {
        return adminGoodsDAO.selectGoodsListTotCnt(searchVO);
    }
    
    
}
