package dlink.admin.controller;

import java.io.File;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.egovframe.rte.fdl.property.EgovPropertyService;
import org.egovframe.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.support.SessionStatus;

import com.fasterxml.jackson.databind.ObjectMapper;

import dlink.admin.service.TBannerService;
import dlink.admin.vo.SearchVO;
import dlink.admin.vo.TBannerVO;
import dlink.admin.vo.TMemAccptVO;
import dlink.admin.vo.TMenuVO;
import dlink.common.service.CommProperties;
import dlink.common.service.TAttfileService;
import dlink.common.vo.TAttfileVO;
import java.math.BigDecimal;

@Controller
@RequestMapping("/admin/main")
public class AdminMainController {
	
	@Resource(name = "TBannerService")
    private TBannerService TBannerService;
	
	/** EgovPropertyService */
    @Resource(name = "propertiesService")
    protected EgovPropertyService propertiesService;
	
    @Resource(name = "TAttfileService")
    private TAttfileService tAttfileService;
    
    
    
	@RequestMapping(value="/index.do")
	public String DLinkMain (Model model, HttpServletRequest request, HttpSession session) throws Exception {
		//사용자 로그인 확인 Start
		TMemAccptVO loginVO = (TMemAccptVO) session.getAttribute("DlinkLogin");
		if(loginVO == null) {
			model.addAttribute("msg", "fail");
			return "redirect:/admin/login.do";
		}
		//사용자 로그인 확인 End
		
		
		return "/admin/main/main";
	}
	
	/**
	 * t_banner 목록을 조회한다. (pageing)
	 * @param searchVO - 조회할 정보가 담긴 SerchVo
	 * @return "/admin/main/TBannerList"
	 * @exception Exception
	 */
    @RequestMapping(value="/banSearchList.do")
    public String selectTBannerList(@ModelAttribute("searchVO") TBannerVO searchVO, 
    		ModelMap model)
            throws Exception {
    	
    	 try {
	  		  
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
    		 
    		 List<?> TBannerList = TBannerService.selectTBannerList(searchVO);
    		 model.addAttribute("resultList", TBannerList);
    		 
    		 int totCnt = TBannerService.selectTBannerListTotCnt(searchVO);
    		 paginationInfo.setTotalRecordCount(totCnt);
    		 model.addAttribute("paginationInfo", paginationInfo);
   		} catch (Exception e) {
   			
   			e.printStackTrace();
   			
   		}
    	 
        
        return "/admin/main/BannerList";
    } 
    
    @RequestMapping("/selectBanner.do")
    public String selectTBanner(
    		TBannerVO TBannerVO,
    		@ModelAttribute("searchVO") SearchVO searchVO, Model model) throws Exception {
    	model.addAttribute("result",TBannerService.selectTBanner(TBannerVO));
    	return "/admin/main/BannerDetail";
    }
    
    @RequestMapping("/bannerView.do")
    public String bannerView(Model model)
            throws Exception {
        model.addAttribute("bannerVO", new TBannerVO());
        return "/admin/main/BannerWrite";
    }

    @RequestMapping("/updateBannerView.do")
    public String updateTBannerView(
            @RequestParam("bannerNo") int bannerNo ,
            @ModelAttribute("bannerVO") TBannerVO bannerVO, Model model)
            throws Exception {
    	try {
    		bannerVO.setBannerNo(bannerNo);        
    		// 변수명은 CoC 에 따라 TBannerVO
    		model.addAttribute("bannerVO",TBannerService.selectTBanner(bannerVO));
	  		  
   		} catch (Exception e) {
   			
   			e.printStackTrace();
   			
   		}
        return "/admin/main/BannerWrite";
    }


    @RequestMapping("/addBanner.do")
    public String addTBanner(
            TBannerVO TBannerVO,
            @ModelAttribute("searchVO") SearchVO searchVO, SessionStatus status
            ,Model model, HttpServletRequest request, HttpSession session)
            throws Exception {
    	
    	//사용자 로그인 확인 Start
		TMemAccptVO loginVO = (TMemAccptVO) session.getAttribute("DlinkLogin");
		if(loginVO == null) {
			model.addAttribute("msg", "fail");
			return "redirect:/admin/login.do";
		}
		//사용자 로그인 확인 End
    			
		try {
			TBannerVO.setRegister(loginVO.getLoginId());
			TBannerService.insertTBanner(TBannerVO);
			status.setComplete();
	  		  
   		} catch (Exception e) {
   			
   			e.printStackTrace();
   			
   		}
		
        return "redirect:/admin/main/banSearchList.do";
    }
    
    @RequestMapping("/updateBanner.do")
    public String updateTBanner(
            TBannerVO TBannerVO,
            @ModelAttribute("searchVO") SearchVO searchVO, SessionStatus status
            ,Model model, HttpServletRequest request, HttpSession session)
            throws Exception {
    	//사용자 로그인 확인 Start
		TMemAccptVO loginVO = (TMemAccptVO) session.getAttribute("DlinkLogin");
		if(loginVO == null) {
			model.addAttribute("msg", "fail");
			return "redirect:/admin/login.do";
		}
		//사용자 로그인 확인 End
    			
		try {
	  		  
			TBannerVO.setRegister(loginVO.getLoginId());
			
			TBannerService.updateTBanner(TBannerVO);
			status.setComplete();
   		} catch (Exception e) {
   			
   			e.printStackTrace();
   			
   		}
		
        return "redirect:/admin/main/banSearchList.do";
    }
    
    @RequestMapping("/deleteBanner.do")
    public String deleteTBanner(
            TBannerVO TBannerVO,
            @ModelAttribute("searchVO") SearchVO searchVO, SessionStatus status
            ,Model model, HttpServletRequest request, HttpSession session)
            throws Exception {
    	//사용자 로그인 확인 Start
		TMemAccptVO loginVO = (TMemAccptVO) session.getAttribute("DlinkLogin");
		if(loginVO == null) {
			model.addAttribute("msg", "fail");
			return "redirect:/admin/login.do";
		}
		//사용자 로그인 확인 End
    			
        
        
        try {
        	TBannerService.deleteTBanner(TBannerVO);
        	status.setComplete();
			try {
				TAttfileVO att = new TAttfileVO();
				att.setFileSeq(new BigDecimal(TBannerVO.getFileSeq()));
				att = tAttfileService.selectTAttfile(att);
					
				//파일 정보 삭제
				tAttfileService.deleteTAttfile(att);
				
			} catch (NullPointerException e) {
				e.printStackTrace();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
        
        
        return "redirect:/admin/main/banSearchList.do";
    }
	
}
