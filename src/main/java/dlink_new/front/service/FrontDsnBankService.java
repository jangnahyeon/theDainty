package dlink_new.front.service;

import java.util.List;

import dlink_new.admin.vo.TImgInfo;

public interface FrontDsnBankService {

	List<?> selectImgInfoList(TImgInfo searchVO) throws Exception;

	int selectImgInfoListTotCnt(TImgInfo searchVO) throws Exception;

	TImgInfo selectImgInfo(TImgInfo searchVO) throws Exception;

	void insertDownInfo(TImgInfo searchVO)  throws Exception;
	
	void insertLikeInfo(TImgInfo searchVO)  throws Exception;

	int selectLikeCnt(TImgInfo searchVO) throws Exception;

}
