package dlink_new.front.service;

import java.util.List;

import dlink_new.admin.vo.TImgInfo;

public interface FrontMypageService {

	List<?> selectMypageDsnList(TImgInfo searchVO) throws Exception;

	int selectMypageDsnListTotCnt(TImgInfo searchVO) throws Exception;

	void deleteLikeInfo(TImgInfo searchVO) throws Exception;


}
