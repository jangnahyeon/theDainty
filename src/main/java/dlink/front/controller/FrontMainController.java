package dlink.front.controller;

import java.util.List;
import java.util.Properties;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.egovframe.rte.fdl.property.EgovPropertyService;
import org.egovframe.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import common.service.CommonService;
import dlink.admin.service.TBannerService;
import dlink.admin.service.TCodeService;
import dlink.admin.service.TCommutyService;
import dlink.admin.vo.TBannerVO;
import dlink.admin.vo.TCodeVO;
import dlink.admin.vo.TCommutyVO;
import dlink.admin.vo.TMemAccptVO;
import dlink.common.service.CommProperties;
import dlink.front.service.FrontTBusinessService;
import dlink.front.service.FrontTPtplInfoService;
import dlink.front.vo.FrontSearchVO;
import dlink.front.vo.LoginVO;
import dlink.front.vo.TPtplInfoVO;
import egovframework.cmmn.service.EgovProperties;

@Controller
@RequestMapping("/front")
public class FrontMainController {
	
	@Resource(name = "commonService")
	private CommonService commonService;
	
   @Resource(name = "FrontTBusinessService")
    private FrontTBusinessService FrontTBusinessService;

   @Resource(name = "TCommutyService")
   private TCommutyService TCommutyService;
   
	@Resource(name = "TBannerService")
    private TBannerService TBannerService;
	
    @Resource(name = "FrontTPtplInfoService")
    private FrontTPtplInfoService frontTPtplInfoService;
    
    @Resource(name = "TCodeService")
    private TCodeService tCodeService;
    
    /** EgovPropertyService */
    @Resource(name = "propertiesService")
    protected EgovPropertyService propertiesService;
    
	
	// 인덱스(시작)
	@RequestMapping(value = "/main.do")
	public String indexMethod(
				Model model, HttpServletRequest request, HttpSession session,
				@ModelAttribute("searchVO") FrontSearchVO searchVO
		) throws Exception {
		
		TCodeVO code = new TCodeVO();
	    code.setGubun("PA");
	    code.setPagingYn("N");
	    List<TCodeVO> codeListPA = tCodeService.selectTCodeList(code);
	    model.addAttribute("codeListPA", codeListPA);
		
	    
        code.setGubun("CP");
        code.setPagingYn("N");
        List<TCodeVO> codeListCP = tCodeService.selectTCodeList(code);
        model.addAttribute("codeListCP", codeListCP);
		
		return "/front/main";

	}



	@RequestMapping(value = "/banner.do")
	public String banner(
				Model model, HttpServletRequest request, HttpSession session,
				@ModelAttribute("searchVO") FrontSearchVO searchVO
		) throws Exception {
		
        TBannerVO bannerVO = new TBannerVO();
        bannerVO.setDisYn("Y");
        bannerVO.setPagingYn("N");
        List<?> TBannerList = TBannerService.selectTBannerList(bannerVO);
		model.addAttribute("bannerList", TBannerList);
		 
		return "/frontMain/banner";

	}
	
	@RequestMapping(value = "/news.do")
	public String news(
				Model model, HttpServletRequest request, HttpSession session,
				@ModelAttribute("searchVO") FrontSearchVO searchVO
		) throws Exception {
		TCommutyVO TCommutyVO = new TCommutyVO();
		TCommutyVO.setMenuId("gongji");
		
		List<?> TCommutyList = TCommutyService.selectMainTCommutyList(TCommutyVO);
        model.addAttribute("resultList", TCommutyList);
		 
		return "/frontMain/news";

	}
	
	
	@RequestMapping(value = "/ptpl.do")
	public String ptpl(
				Model model, HttpServletRequest request, HttpSession session,
				@ModelAttribute("searchVO") TPtplInfoVO searchVO
		) throws Exception {
		TCodeVO code = new TCodeVO();
	    code.setGubun("PA");
	    code.setPagingYn("N");
	    List<TCodeVO> codeListPA = tCodeService.selectTCodeList(code);
	    model.addAttribute("codeListPA", codeListPA);
		 
		
		searchVO.setFirstIndex(0);
		searchVO.setRecordCountPerPage(10);
		searchVO.setSearchKeyword2("random");
		
	    List<?> TPtplInfoList = frontTPtplInfoService.selectTPtplInfoList(searchVO);
	    model.addAttribute("resultList", TPtplInfoList);
	    
	    
	    model.addAttribute("ptplPart", searchVO.getPtplPart());
	    
		return "/frontMain/ptpl";

	}

	
}