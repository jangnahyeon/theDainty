package dlink.front.controller;

import egovframework.cmmn.service.EgovStringUtil;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.egovframe.rte.fdl.property.EgovPropertyService;
import org.egovframe.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import dlink.admin.service.TCommutyService;
import dlink.admin.vo.SearchVO;
import dlink.admin.vo.TCommutyVO;
import dlink.common.service.TAttfileService;
import dlink.front.service.FrontTBusinessService;
import dlink.front.vo.FrontSearchVO;

@Controller
@RequestMapping("/front/business")
public class FrontBusinessController {
	
    @Resource(name = "FrontTBusinessService")
    private FrontTBusinessService FrontTBusinessService;
    
    /** EgovPropertyService */
    @Resource(name = "propertiesService")
    protected EgovPropertyService propertiesService;
	
    @Resource(name = "TCommutyService")
    private TCommutyService TCommutyService;
    
    @Resource(name = "TAttfileService")
    private TAttfileService tAttfileService;
    
  
    /** 용어정리
  	 * t_word 목록을 조회한다. (pageing)
  	 * 용어조회 관리 메뉴
  	 * @param searchVO - 조회할 정보가 담긴 SerchVo
  	 * @return "/selectWordList"
  	 * @exception Exception
  	 */
    @RequestMapping(value="/wordArgmtList.do")
    public String selectWordList(
    		@ModelAttribute("searchVO") FrontSearchVO searchVO, 
    		 @RequestParam(value = "searchCondition", required=false) String searchCondition ,
    		 @RequestParam(value = "searchKeyword" , required=false) String searchKeyword ,
    		ModelMap model)
            throws Exception {
    	
    	/** EgovPropertyService.sample */
    	searchVO.setPageUnit(propertiesService.getInt("pageUnit"));
    	searchVO.setPageSize(propertiesService.getInt("pageSize"));
    	
    	/** pageing */
    	PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(searchVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(searchVO.getPageUnit());
		paginationInfo.setPageSize(searchVO.getPageSize());
		
		searchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		searchVO.setLastIndex(paginationInfo.getLastRecordIndex());
		searchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		searchVO.setSearchCondition(searchCondition);
		searchVO.setSearchKeyword(searchKeyword);
		
        List<?> TWordList = FrontTBusinessService.selectTWordList(searchVO);
        model.addAttribute("resultList", TWordList);
        
        int totCnt = FrontTBusinessService.selectTWordListTotCnt(searchVO);
		paginationInfo.setTotalRecordCount(totCnt);
        model.addAttribute("paginationInfo", paginationInfo);
       
        
        return "/front/Business/wordArgmtList";
    } 
    
    
    /**
  	 * t_faq 목록을 조회한다. (pageing)
  	 * @param searchVO - 조회할 정보가 담긴 SerchVo
  	 * @return "/TFaq/TFaqList"
  	 * @exception Exception
  	 */
      @RequestMapping("/qnaList.do")
      public String selectTFaqList(
      		@ModelAttribute("searchVO") FrontSearchVO searchVO, 
      		ModelMap model)
              throws Exception {
      	
      	/** EgovPropertyService.sample */
      	searchVO.setPageUnit(propertiesService.getInt("pageUnit"));
      	searchVO.setPageSize(propertiesService.getInt("pageSize"));
      	
      	/** pageing */
      	PaginationInfo paginationInfo = new PaginationInfo();
  		paginationInfo.setCurrentPageNo(searchVO.getPageIndex());
  		paginationInfo.setRecordCountPerPage(searchVO.getPageUnit());
  		paginationInfo.setPageSize(searchVO.getPageSize());
  		
  		searchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
  		searchVO.setLastIndex(paginationInfo.getLastRecordIndex());
  		searchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
  		
        List<?> TFaqList = FrontTBusinessService.selectTFaqList(searchVO);
        model.addAttribute("resultList", TFaqList);
          
        //  int totCnt = FrontTBusinessService.selectTFaqListTotCnt(searchVO);
  		//	paginationInfo.setTotalRecordCount(totCnt);
        //  model.addAttribute("paginationInfo", paginationInfo);
          
          return "/front/Business/qnaListList";
      } 
      
      /** 공지사항
  	 * t_commuty 목록을 조회한다. (pageing)
  	 * @param searchVO - 조회할 정보가 담긴 SerchVo
  	 * @return "/TCommuty/TCommutyList"
  	 * @exception Exception
  	 */
      @RequestMapping(value="/noticeList.do")
      public String selectnoticeList(@ModelAttribute("searchVO") FrontSearchVO searchVO, 
      		 @RequestParam(value = "searchCondition", required=false) String searchCondition ,
      		 @RequestParam(value = "searchKeyword" , required=false) String searchKeyword ,
      		ModelMap model, HttpServletRequest request)
              throws Exception {
      	
      	String menuId = request.getParameter("menu_id");
      	
      	/** EgovPropertyService.sample */
      	searchVO.setPageUnit(propertiesService.getInt("pageUnit"));
      	searchVO.setPageSize(propertiesService.getInt("pageSize"));
      	
      	/** pageing */
      	PaginationInfo paginationInfo = new PaginationInfo();
  		paginationInfo.setCurrentPageNo(searchVO.getPageIndex());
  		paginationInfo.setRecordCountPerPage(searchVO.getPageUnit());
  		paginationInfo.setPageSize(searchVO.getPageSize());
  		
  		searchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
  		searchVO.setLastIndex(paginationInfo.getLastRecordIndex());
  		searchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
  		searchVO.setSearchCondition(searchCondition);
  		searchVO.setSearchKeyword(searchKeyword);
  		searchVO.setMenuId(menuId);
  		
          List<?> TCommutyList = FrontTBusinessService.selectTCommutyList(searchVO);
          model.addAttribute("resultList", TCommutyList);
          
          int totCnt = FrontTBusinessService.selectTCommutyListTotCnt(searchVO);
  		paginationInfo.setTotalRecordCount(totCnt);
  	
          model.addAttribute("paginationInfo", paginationInfo);
          model.addAttribute("menuId", menuId);
          
          return "/front/Business/noticeList";
      } 
      
 
    
      @RequestMapping("/viewCommuty.do")
      public String viewCommuty(
              @ModelAttribute("searchVO") SearchVO searchVO, 
              @RequestParam("menuId") String menuId ,
              @RequestParam("postNo") int postNo ,
              @RequestParam("seq") int seq ,
              @RequestParam("registerFlag") String registerFlag ,
              Model model)
              throws Exception {
      	
          TCommutyVO TCommutyVO = new TCommutyVO();
          TCommutyVO setTCommutyVO = new TCommutyVO();
          TCommutyVO.setMenuId(menuId);    
          TCommutyVO.setPostNo(postNo);  
          TCommutyVO.setSeq(seq);  
         
          setTCommutyVO = TCommutyService.selectTCommuty(TCommutyVO);
          setTCommutyVO.setCont(EgovStringUtil.getHtmlStrCnvr(setTCommutyVO.getCont()));   // 저장된 cont내용을 변환시켜서 cont로 담는다.
          
          
          List<?> selectTAttfileList= TCommutyService.selectTCommutyFileList(TCommutyVO);
          
          
          // 변수명은 CoC 에 따라 TCommutyVO
          model.addAttribute(selectTCommuty(TCommutyVO, searchVO));
          model.addAttribute("selectTAttfileList", selectTAttfileList);
          model.addAttribute("registerFlag", registerFlag);
          
          return "/front/Business/noticeDetail";
      }

      @RequestMapping("/selectCommuty.do")
      public @ModelAttribute("TCommutyVO")
      TCommutyVO selectTCommuty(
              TCommutyVO TCommutyVO,
              @ModelAttribute("searchVO") SearchVO searchVO) throws Exception {
          return TCommutyService.selectTCommuty(TCommutyVO);
      }
      
      // 스마트에디터 태그 변환 
      /*public String setHtml(String contents){
    	  String result = contents;
    	  
    	  result = result.replaceAll("&lt;", "<");
      	  result = result.replaceAll("&gt;", ">");
      	  result = result.replaceAll("&quot;", "\""); 
      	  result = result.replaceAll("&nbsp;", ""); 
      	  result = result.replaceAll("&amp;", "&"); 
    	     	
    	  return result;
      }*/
      
}