package dlink_new.admin.service;

import java.util.List;

import dlink_new.admin.vo.TbGoodsVO;

public interface AdminGoodsService {

	List<?> selectGoodsList(TbGoodsVO searchVO) throws Exception;

	int selectGoodsListTotCnt(TbGoodsVO searchVO) throws Exception;

	void insertGoods(TbGoodsVO tbGoodsVO) throws Exception;

	
}
