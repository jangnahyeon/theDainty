package dlink_new.admin.dao;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.EgovAbstractDAO;
import org.springframework.stereotype.Repository;

import dlink_new.admin.vo.TbGoodsVO;

@Repository("AdminGoodsDAO")
public class AdminGoodsDAO extends EgovAbstractDAO {

	public List<?> selectGoodsList(TbGoodsVO searchVO) {
		return list("AdminGoodsDAO.selectGoodsList", searchVO);
	}

	public int selectGoodsListTotCnt(TbGoodsVO searchVO) {
		return (Integer)select("AdminGoodsDAO.selectGoodsListTotCnt", searchVO);
	}
	

}
