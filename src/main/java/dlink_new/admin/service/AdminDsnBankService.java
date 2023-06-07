package dlink_new.admin.service;

import java.util.List;

import dlink_new.admin.vo.TImgInfo;

public interface AdminDsnBankService {

	void insertImgInfo(TImgInfo searchVO) throws Exception;

	void insertImg(TImgInfo searchVO) throws Exception;

	List<?> selectImgInfoList(TImgInfo searchVO) throws Exception;

	int selectImgInfoListTotCnt(TImgInfo searchVO) throws Exception;

	TImgInfo selectImgInfo(TImgInfo searchVO) throws Exception;

	void deleteImg(TImgInfo searchVO) throws Exception;
	
	void deleteImgAll(TImgInfo searchVO) throws Exception;

	void updateImgInfo(TImgInfo searchVO) throws Exception;

	void deleteImgInfo(TImgInfo vo) throws Exception;

	TImgInfo selectImgList(TImgInfo searchVO) throws Exception;

	List<?> selectDownInfo(TImgInfo searchVO) throws Exception;

	List selectOrderNoList(TImgInfo searchVO) throws Exception;
}
