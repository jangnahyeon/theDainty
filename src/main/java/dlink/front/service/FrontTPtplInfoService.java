package dlink.front.service;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.util.EgovMap;

import dlink.admin.vo.TCodeVO;
import dlink.front.vo.FrontDsnBankVO;
import dlink.front.vo.TPtplInfoDefaultVO;
import dlink.front.vo.TPtplInfoVO;

/**
 * @Class Name : TPtplInfoService.java
 * @Description : TPtplInfo Business class
 * @Modification Information
 *
 * @author 장나현
 * @since 2022-03-31
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */
public interface FrontTPtplInfoService {
	
	/**
	 * t_ptpl_info을 등록한다.
	 * @param vo - 등록할 정보가 담긴 TPtplInfoVO
	 * @return 등록 결과
	 * @exception Exception
	 */
    void insertTPtplInfo(TPtplInfoVO vo) throws Exception;
    void insertTPtplInfoImg(TPtplInfoVO vo) throws Exception;
    void insertTPtplInfoMultiImg(TPtplInfoVO vo) throws Exception;
    
    /**
	 * t_ptpl_info을 수정한다.
	 * @param vo - 수정할 정보가 담긴 TPtplInfoVO
	 * @return void형
	 * @exception Exception
	 */
    void updateTPtplInfo(TPtplInfoVO vo) throws Exception;
    
    /**
	 * t_ptpl_info을 삭제한다.
	 * @param vo - 삭제할 정보가 담긴 TPtplInfoVO
	 * @return void형 
	 * @exception Exception
	 */
    void deleteTPtplInfo(TPtplInfoVO vo) throws Exception;
    void deleteTPtplInfoImg(TPtplInfoVO vo) throws Exception;
    
    /**
	 * t_ptpl_info을 조회한다.
	 * @param vo - 조회할 정보가 담긴 TPtplInfoVO
	 * @return 조회한 t_ptpl_info
	 * @exception Exception
	 */
    TPtplInfoVO selectTPtplInfo(TPtplInfoVO vo) throws Exception;
    
    /**
	 * t_ptpl_info 목록을 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return t_ptpl_info 목록
	 * @exception Exception
	 */
    List selectTPtplInfoList(TPtplInfoVO searchVO) throws Exception;
    
    /**
	 * t_ptpl_info 총 갯수를 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return t_ptpl_info 총 갯수
	 * @exception
	 */
    int selectTPtplInfoListTotCnt(TPtplInfoVO searchVO);

    List selectCategoryNm(EgovMap map) throws Exception;

	List<EgovMap> searchPortfolio(TPtplInfoVO searchVO) throws Exception;
	
	int selectPtplFavoriteCnt(TPtplInfoVO searchVO);
	
	void insertPtplFavorite(TPtplInfoVO vo) throws Exception;
	
	void deleteTPtplFavorite(TPtplInfoVO vo) throws Exception;
	
	
	
	    List selectInterestPtplList(TPtplInfoVO searchVO) throws Exception;
	    
	 
	    int selectInterestPtplListTotCnt(TPtplInfoVO searchVO);
}
