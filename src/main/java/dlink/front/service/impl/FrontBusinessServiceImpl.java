package dlink.front.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import dlink.admin.vo.TCommutyVO;
import dlink.front.dao.FrontBusinessDAO;
import dlink.front.service.FrontTBusinessService;
import dlink.front.vo.BusinessVO;
import dlink.front.vo.FrontSearchVO;


/**
 * @Class Name : BusinessServiceImpl.java
 * @Description : Business Business Implement class
 * @Modification Information
 *
 * @author 이효진
 * @since 2022-04-06
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */

@Service("FrontTBusinessService")
public class FrontBusinessServiceImpl extends EgovAbstractServiceImpl implements FrontTBusinessService {
        
    private static final Logger LOGGER = LoggerFactory.getLogger(FrontBusinessServiceImpl.class);

    @Resource(name="FrontBusinessDAO")
    private FrontBusinessDAO FrontBusinessDAO;

    /**
   	 * t_word 목록을 조회한다.
   	 * @param searchVO - 조회할 정보가 담긴 VO
   	 * @return t_word 목록
   	 * @exception Exception
   	 */
       public List<?> selectTWordList(FrontSearchVO searchVO) throws Exception {
           return FrontBusinessDAO.selectTWordList(searchVO);
       }

       /**
   	 * t_word 총 갯수를 조회한다.
   	 * @param searchVO - 조회할 정보가 담긴 VO
   	 * @return t_word 총 갯수
   	 * @exception
   	 */
       public int selectTWordListTotCnt(FrontSearchVO searchVO) {
   		return FrontBusinessDAO.selectTWordListTotCnt(searchVO);
   	}
   
       /**
   	 * t_faq 목록을 조회한다.
   	 * @param searchVO - 조회할 정보가 담긴 VO
   	 * @return t_faq 목록
   	 * @exception Exception
   	 */
       public List<?> selectTFaqList(FrontSearchVO searchVO) throws Exception {
           return FrontBusinessDAO.selectTFaqList(searchVO);
       }

       /**
   	 * t_faq 총 갯수를 조회한다.
   	 * @param searchVO - 조회할 정보가 담긴 VO
   	 * @return t_faq 총 갯수
   	 * @exception
   	 */
       public int selectTFaqListTotCnt(FrontSearchVO searchVO) {
   		return FrontBusinessDAO.selectTFaqListTotCnt(searchVO);
   	}
       

       /**
   	 * t_commuty 목록을 조회한다.
   	 * @param searchVO - 조회할 정보가 담긴 VO
   	 * @return t_commuty 목록
   	 * @exception Exception
   	 */
       public List<?> selectTCommutyList(FrontSearchVO searchVO) throws Exception {
           return FrontBusinessDAO.selectTCommutyList(searchVO);
       }

     
       /**
   	 * t_commuty 총 갯수를 조회한다.
   	 * @param searchVO - 조회할 정보가 담긴 VO
   	 * @return t_commuty 총 갯수
   	 * @exception
   	 */
       public int selectTCommutyListTotCnt(FrontSearchVO searchVO) {
   		return FrontBusinessDAO.selectTCommutyListTotCnt(searchVO);
   	}
       
   
}
