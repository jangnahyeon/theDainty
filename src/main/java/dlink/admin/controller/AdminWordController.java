package dlink.admin.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.egovframe.rte.fdl.property.EgovPropertyService;
import org.egovframe.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import dlink.admin.service.TWordService;
import dlink.admin.vo.SearchVO;
import dlink.admin.vo.TMemAccptVO;
import dlink.admin.vo.TWordVO;

/**
 * @Class Name : TWordController.java
 * @Description : TWord Controller class
 * @Modification Information
 *
 * @author 이효진
 * @since 2022-03-30
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */

@Controller
//@SessionAttributes(types=TWordVO.class) /admin/TWord/TWordList.do
@RequestMapping("/admin/word")
public class AdminWordController {

    @Resource(name = "TWordService")
    private TWordService TWordService;
    
    /** EgovPropertyService */
    @Resource(name = "propertiesService")
    protected EgovPropertyService propertiesService;
	
 
    /**
  	 * t_word 목록을 조회한다. (pageing)
  	 * 용어조회 관리 메뉴
  	 * @param searchVO - 조회할 정보가 담긴 SerchVo
  	 * @return "/selectWordList"
  	 * @exception Exception
  	 */
    @RequestMapping(value="/selectWordList.do")
    public String selectWordList(
    		@ModelAttribute("searchVO") SearchVO searchVO, 
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
		
        List<?> TWordList = TWordService.selectTWordList(searchVO);
        model.addAttribute("resultList", TWordList);
        
        int totCnt = TWordService.selectTWordListTotCnt(searchVO);
		paginationInfo.setTotalRecordCount(totCnt);
        model.addAttribute("paginationInfo", paginationInfo);
       
        
        return "/admin/word/wordInquiryList";
    } 
    
    
    /**
 	 * t_word 목록을 조회한다. (pageing)
 	 * 용어 관리하는 메뉴 (등록, 수정, 삭제 가능)
 	 * @param searchVO - 조회할 정보가 담긴 SerchVo
 	 * @return "/WordList"
 	 * @exception Exception
 	 */
     @RequestMapping(value="/wordInquiryList.do")
     public String selectTWordList(
    		 @ModelAttribute("searchVO") SearchVO searchVO, 
    		 @RequestParam(value = "searchCondition", required=false) String searchCondition ,
    		 @RequestParam(value = "searchKeyword" , required=false) String searchKeyword ,
     		ModelMap model)
             throws Exception {
    	 
    	// 등록, 수정, 삭제 가능한 페이지 구분
     	String registerFlag = "insert";

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
		
         List<?> TWordList = TWordService.selectTWordList(searchVO);
         model.addAttribute("resultList", TWordList);
         
         int totCnt = TWordService.selectTWordListTotCnt(searchVO);
 		paginationInfo.setTotalRecordCount(totCnt);
         model.addAttribute("paginationInfo", paginationInfo);
         model.addAttribute("registerFlag", registerFlag);
         
         
         return "/admin/word/wordInquiryList";
     } 
     
    
    @RequestMapping("/addWordView.do")
    public String addTWordView(
            @ModelAttribute("searchVO") SearchVO searchVO,
            @RequestParam("registerFlag") String registerFlag ,
            Model model)
            throws Exception {
    	
        model.addAttribute("registerFlag", registerFlag);
    	model.addAttribute("TWordVO", new TWordVO());
        
    	return "/admin/word/wordMagmt";
    }
    
    @ResponseBody
    @RequestMapping("/addWord.do")
    public String addTWord(
    		HttpServletRequest request, ModelAndView view, ModelMap modelMap, HttpSession session,
            TWordVO TWordVO, Model model,
            @ModelAttribute("searchVO") SearchVO searchVO, SessionStatus status)
            throws Exception {
    	
    	String res = "";
    	
    	//사용자 로그인 확인 Start
		TMemAccptVO loginVO = (TMemAccptVO) session.getAttribute("DlinkLogin");
		if(loginVO == null) {
			model.addAttribute("msg", "fail");
			return "redirect:/admin/login.do";
		}
		//사용자 로그인 확인 End
    			
		        		       
        try {
        	TWordVO setWordvo = new TWordVO();
        	
        	int seq = TWordService.selectForInsertCd(TWordVO);
        	
        	setWordvo.setWordNo(seq);
        	setWordvo.setWordNm(TWordVO.getWordNm());
        	setWordvo.setCont(TWordVO.getCont());
        	setWordvo.setOpenYn(TWordVO.getOpenYn());
        	setWordvo.setRegister(loginVO.getLoginId());
        	
        	TWordService.insertTWord(setWordvo);
        	// status.setComplete();
        	 
        	 res = "suc";
		} catch (Exception e) {
			
			e.printStackTrace();
			return "fail";
		}finally {
			
		}
        
        	        
        return res;
    }
    
    @RequestMapping("/updateWordView.do")
    public String updateTWordView(
            @RequestParam("wordNo") int wordNo ,
            @RequestParam("registerFlag") String registerFlag ,
            @ModelAttribute("searchVO") SearchVO searchVO, Model model)
            throws Exception {
        
    	
    	TWordVO TWordVO = new TWordVO();
        
        TWordVO.setWordNo(wordNo);                
        TWordService.selectTWord(TWordVO);
        
        // 변수명은 CoC 에 따라 TWordVO
        model.addAttribute(selectTWord(TWordVO, searchVO));
        model.addAttribute("registerFlag", registerFlag);
        
        
        return "/admin/word/wordMagmt"; 
    }
    
    // view페이지
    @RequestMapping("/viewWord.do")
    public String viewTWord(
            @RequestParam("wordNo") int wordNo ,
            @RequestParam("registerFlag") String registerFlag ,
            @ModelAttribute("searchVO") SearchVO searchVO, Model model)
            throws Exception {
        
    	
    	TWordVO TWordVO = new TWordVO();
    	TWordVO setTWordVO = new TWordVO();
    	
        TWordVO.setWordNo(wordNo);                
        setTWordVO = TWordService.selectTWord(TWordVO);
        
        // 변수명은 CoC 에 따라 TWordVO
        model.addAttribute(selectTWord(TWordVO, searchVO));
        model.addAttribute("registerFlag", registerFlag);
        model.addAttribute("setTWordVO", setTWordVO);
     
        return "/admin/word/wordDetail";
    }

    @RequestMapping("/selectWord.do")
    public @ModelAttribute("TWordVO")
    TWordVO selectTWord(
            TWordVO TWordVO,
            @ModelAttribute("searchVO") SearchVO searchVO) throws Exception {
        return TWordService.selectTWord(TWordVO);
    }
    
    @ResponseBody
    @RequestMapping("/updateWord.do")
    public String updateTWord(
    		HttpServletRequest request, ModelAndView view, ModelMap modelMap, HttpSession session,
            TWordVO TWordVO, Model model,
            @ModelAttribute("searchVO") SearchVO searchVO, SessionStatus status)
            throws Exception {
    	
    	String rst = "";
    	 	

    	//사용자 로그인 확인 Start
		TMemAccptVO loginVO = (TMemAccptVO) session.getAttribute("DlinkLogin");
		if(loginVO == null) {
			model.addAttribute("msg", "fail");
			return "redirect:/admin/login.do";
		}
		//사용자 로그인 확인 End
    			
		
        try {
        	TWordVO setWordvo = new TWordVO();
        	setWordvo.setWordNo(TWordVO.getWordNo());
        	setWordvo.setWordNm(TWordVO.getWordNm());
        	setWordvo.setCont(TWordVO.getCont());
        	setWordvo.setOpenYn(TWordVO.getOpenYn());
        	setWordvo.setRegister(loginVO.getLoginId());
        	
            TWordService.updateTWord(setWordvo);
            //status.setComplete();
            
        	rst = "upsuc";
             
		} catch (Exception e) {
			
			e.printStackTrace();
			return "fail";
			
		}finally {
			
		}
        
        return rst;
     }
    
    @ResponseBody
    @RequestMapping("/deleteWord.do")
    public String deleteTWord(
    		HttpServletRequest request, ModelAndView view, ModelMap modelMap, HttpSession session,
            TWordVO TWordVO, Model model,
            @ModelAttribute("searchVO") SearchVO searchVO,
            @RequestParam("wordNo") int wordNo ,
            
            SessionStatus status)
            throws Exception {
    	
	    	String rst = "";
	    	
	    	//사용자 로그인 확인 Start
			TMemAccptVO loginVO = (TMemAccptVO) session.getAttribute("DlinkLogin");
			if(loginVO == null) {
				model.addAttribute("msg", "fail");
				return "redirect:/admin/login.do";
			}
			//사용자 로그인 확인 End
    	
	    	  try {
	    		  
	          	TWordVO setWordvo = new TWordVO();
	          	setWordvo.setWordNo(wordNo);
	          
	          	TWordService.deleteTWord(setWordvo);
	          //status.setComplete();
	              
	          	rst = "suc";
	  		} catch (Exception e) {
	  			
	  			e.printStackTrace();
	  			
	  			return "fail";
	  		}finally {
	  			
	  		}
    	  
       
        return rst;
    }

}
