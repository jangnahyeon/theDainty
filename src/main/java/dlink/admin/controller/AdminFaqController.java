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

import dlink.admin.service.TFaqService;
import dlink.admin.vo.SearchVO;
import dlink.admin.vo.TFaqVO;
import dlink.admin.vo.TMemAccptVO;
import dlink.admin.vo.TWordVO;

/**
 * @Class Name : TFaqController.java
 * @Description : TFaq Controller class
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
//@SessionAttributes(types=TFaqVO.class)
@RequestMapping("/admin/faq")
public class AdminFaqController {

    @Resource(name = "TFaqService")
    private TFaqService TFaqService;
    
    /** EgovPropertyService */
    @Resource(name = "propertiesService")
    protected EgovPropertyService propertiesService;
	
    /**
	 * t_faq 목록을 조회한다. (pageing)
	 * @param searchVO - 조회할 정보가 담긴 SerchVo
	 * @return "/TFaq/TFaqList"
	 * @exception Exception
	 */
    @RequestMapping("/faqInquiryList.do")
    public String selectTFaqList(
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
		
        List<?> TFaqList = TFaqService.selectTFaqList(searchVO);
        model.addAttribute("resultList", TFaqList);
        
        int totCnt = TFaqService.selectTFaqListTotCnt(searchVO);
		paginationInfo.setTotalRecordCount(totCnt);
        model.addAttribute("paginationInfo", paginationInfo);
        
        return "/admin/faq/faqInquiryList";
    } 
    
    @RequestMapping("/addFaqView.do")
    public String addTFaqView(
            @ModelAttribute("searchVO") SearchVO searchVO, 
            @RequestParam("registerFlag") String registerFlag ,
            Model model)
            throws Exception {
    	
        model.addAttribute("TFaqVO", new TFaqVO());
        model.addAttribute("registerFlag", registerFlag);
        
        return "/admin/faq/FaqMagmt";
    }
    
    @ResponseBody
    @RequestMapping("/addFaq.do")
    public String addTFaq(
    		HttpServletRequest request, ModelAndView view, ModelMap modelMap, HttpSession session,
            TFaqVO TFaqVO, Model model,
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
			TFaqVO setTfaqvo = new TFaqVO();
			
			int seq = TFaqService.selectForInsertCd(TFaqVO);
			
			setTfaqvo.setFaqNo(seq);
			setTfaqvo.setQuestion(TFaqVO.getQuestion());
			setTfaqvo.setAnswer(TFaqVO.getAnswer());
			setTfaqvo.setOpenYn(TFaqVO.getOpenYn());
			setTfaqvo.setRegister(loginVO.getLoginId());	
			
			TFaqService.insertTFaq(setTfaqvo);
			//    status.setComplete();
			
			res = "suc";
		}catch (Exception e){
			
			e.printStackTrace();
			return "fail";
			
		}finally{
		
		}	
    			
         
        return res;
    }
    
    @RequestMapping("/updateFaqView.do")
    public String updateTFaqView(
            @RequestParam("faqNo") int faqNo ,
            @RequestParam("registerFlag") String registerFlag ,
            @ModelAttribute("searchVO") SearchVO searchVO, Model model)
            throws Exception {
    	
        TFaqVO TFaqVO = new TFaqVO();
        
        TFaqVO.setFaqNo(faqNo);  
        
        // 변수명은 CoC 에 따라 TFaqVO
        model.addAttribute(selectTFaq(TFaqVO, searchVO));
        model.addAttribute("registerFlag", registerFlag);
        
        return "/admin/faq/FaqMagmt";
    }

    @RequestMapping("/selectFaq.do")
    public @ModelAttribute("TFaqVO")
    TFaqVO selectTFaq(    		
            TFaqVO TFaqVO, 
            @ModelAttribute("searchVO") SearchVO searchVO) throws Exception {
        return TFaqService.selectTFaq(TFaqVO);
    }
    
    
    // view페이지
    @RequestMapping("/FaqDetail.do")
    public String viewTFaq(    		
            @RequestParam("faqNo") int faqNo , Model model,
            @RequestParam("registerFlag") String registerFlag ,
            @ModelAttribute("searchVO") SearchVO searchVO) throws Exception {
    	
    	TFaqVO Tfaqvo = new TFaqVO();
    	TFaqVO setTfaqvo = new TFaqVO();
    	
    	Tfaqvo.setFaqNo(faqNo);  
    	setTfaqvo = TFaqService.selectTFaq(Tfaqvo);
    	
         // 변수명은 CoC 에 따라 TFaqVO
         model.addAttribute(selectTFaq(Tfaqvo, searchVO));
         model.addAttribute("registerFlag", registerFlag);
         model.addAttribute("setTfaqvo", setTfaqvo);
         
        return "/admin/faq/FaqDetail";
    }
    
    @ResponseBody
    @RequestMapping("/updateFaq.do")
    public String updateTFaq(
    		HttpServletRequest request, ModelAndView view, ModelMap modelMap, HttpSession session,
            TFaqVO TFaqVO, Model model,
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
			TFaqVO setTfaqvo = new TFaqVO();
			
			setTfaqvo.setFaqNo(TFaqVO.getFaqNo());
			setTfaqvo.setQuestion(TFaqVO.getQuestion());
			setTfaqvo.setAnswer(TFaqVO.getAnswer());
			setTfaqvo.setOpenYn(TFaqVO.getOpenYn());
			setTfaqvo.setRegister(loginVO.getLoginId());	
			
			TFaqService.updateTFaq(setTfaqvo);
	       // status.setComplete();
			
			res = "upsuc";
		} catch (Exception e) {
			e.printStackTrace();
  			
  			return "fail";
  			
		}finally {
			
		}
		
        
        return res;
    }
    
    @ResponseBody
    @RequestMapping("/deleteFaq.do")
    public String deleteTFaq(
    		HttpServletRequest request, ModelAndView view, ModelMap modelMap, HttpSession session,
            TFaqVO TFaqVO, Model model,
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
			 TFaqService.deleteTFaq(TFaqVO);
		      // status.setComplete(); 	
			 
			 rst = "suc";
		 } catch(Exception e){
			
			 	e.printStackTrace();
	  			
	  			return "fail";
	  			
		 }finally {
			 
		 }
       
        return rst;
    }

}
