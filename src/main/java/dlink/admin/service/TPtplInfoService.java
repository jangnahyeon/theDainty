package dlink.admin.service;

import java.util.List;

import dlink.admin.vo.SearchVO;
import dlink.admin.vo.TPtplInfoVO;

/**
 * @Class Name : TPtplInfoService.java
 * @Description : TPtplInfo Business class
 * @Modification Information
 *
 * @author 장나현
 * @since 2022-03-30
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */
public interface TPtplInfoService {
	
	/**
	 * t_ptpl_info을 등록한다.
	 * @param vo - 등록할 정보가 담긴 TPtplInfoVO
	 * @return 등록 결과
	 * @exception Exception
	 */
    String insertTPtplInfo(TPtplInfoVO vo) throws Exception;
    
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
    List selectTPtplInfoList(SearchVO searchVO) throws Exception;
    List<TPtplInfoVO> selectTPtplInfoImgList(TPtplInfoVO searchVO) throws Exception;
    
    /**
	 * t_ptpl_info 총 갯수를 조회한다.
	 * @param searchVO - 조회할 정보가 담긴 VO
	 * @return t_ptpl_info 총 갯수
	 * @exception
	 */
    int selectTPtplInfoListTotCnt(SearchVO searchVO);
    
}
