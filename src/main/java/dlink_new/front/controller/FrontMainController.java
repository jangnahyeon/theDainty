package dlink_new.front.controller;

import java.util.ArrayList;
import java.util.HashMap;
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
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;

import dlink_new.admin.service.AdminPopupService;
import dlink_new.admin.service.TbBannerService;
import dlink_new.admin.service.TbBrdService;
import dlink_new.admin.service.TbPortfService;
import dlink_new.admin.vo.TbBannerVO;
import dlink_new.admin.vo.TbBrdDefaultVO;
import dlink_new.admin.vo.TbBrdVO;
import dlink_new.admin.vo.TbPopupVO;
import dlink_new.admin.vo.TbPortfDefaultVO;
import dlink_new.admin.vo.TbPortfVO;
import dlink_new.front.service.TbMenuService;
import dlink_new.front.vo.TbMenuVO;

@Controller
@RequestMapping("/front")
public class FrontMainController {
	
//	@Resource(name = "commonService")
//	private CommonService commonService;
//	
//   @Resource(name = "FrontTBusinessService")
//    private FrontTBusinessService FrontTBusinessService;
//
//   @Resource(name = "TCommutyService")
//   private TCommutyService TCommutyService;
//   
//	@Resource(name = "TBannerService")
//    private TBannerService TBannerService;
//	
//    @Resource(name = "FrontTPtplInfoService")
//    private FrontTPtplInfoService frontTPtplInfoService;
//    
//    @Resource(name = "TCodeService")
//    private TCodeService tCodeService;
//    
	
	@Resource(name = "tbBrdService")
    private TbBrdService tbBrdService;
	
	@Resource(name = "tbMenuService")
    private TbMenuService tbMenuService;
	
	@Resource(name = "tbPortfService")
    private TbPortfService tbPortfService;
	
    /** EgovPropertyService */
    @Resource(name = "propertiesService")
    protected EgovPropertyService propertiesService;
    
    @Resource(name = "AdminPopupService")
	private AdminPopupService adminPopupService;
    
    @Resource(name = "tbBannerService")
    private TbBannerService tbBannerService;
	
	// 인덱스(시작)
	@RequestMapping(value = "/main.do")
	public String main(
				Model model, HttpServletRequest request, HttpSession session				
			) throws Exception {
		
//		TCodeVO code = new TCodeVO();
//	    code.setGubun("PA");
//	    code.setPagingYn("N");
//	    List<TCodeVO> codeListPA = tCodeService.selectTCodeList(code);
//	    model.addAttribute("codeListPA", codeListPA);
//		
//	    
//        code.setGubun("CP");
//        code.setPagingYn("N");
//        List<TCodeVO> codeListCP = tCodeService.selectTCodeList(code);
//        model.addAttribute("codeListCP", codeListCP);
		
		/*팝업불러오기*/
		TbPopupVO searchVO = new TbPopupVO();
		List<TbPopupVO> popList = adminPopupService.selectShowPopupList(searchVO);
		for (TbPopupVO popVo : popList) {
			String tempH = "";
			//tempH = csiMasPopVo.getPop_cont().replace("&amp;", "&");
			tempH = popVo.getContents();
			if(tempH != null) {
				tempH = tempH.replace("&amp;", "&");
				tempH = tempH.replace("&lt;", "<");
				tempH = tempH.replace("&gt;", ">");
				//tempH = tempH.replace("&nbsp;", " ");
				tempH = tempH.replace("&quot;", (char) 34 + "");
				tempH = tempH.replace("&apos;", "'");
				popVo.setContents(tempH);
			}
		}
		
		model.addAttribute("popupList", popList);
		model.addAttribute("maxPopupCnt", 3);
		
		/*배너불러오기*/
		TbBannerVO bannerVO = new TbBannerVO();
		List<?> tbBannerList = tbBannerService.selectMainBannerList(bannerVO);
		
		model.addAttribute("bannerList", tbBannerList);
		
		return "/front/main";

	}
	
	@RequestMapping(value={"/main/brdList.do"})
    public String mainBrdList(@ModelAttribute("searchVO") TbBrdVO searchVO, 
    		TbMenuVO searchMenuVO,
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
		
        List<?> tbBrdList = tbBrdService.selectTbBrdList(searchVO);
        model.addAttribute("resultList", tbBrdList);
        
        int totCnt = tbBrdService.selectTbBrdListTotCnt(searchVO);
		paginationInfo.setTotalRecordCount(totCnt);
        model.addAttribute("paginationInfo", paginationInfo);
        
        TbMenuVO tbMenuVO = tbMenuService.selectTbMenu(searchMenuVO);
        model.addAttribute("tbMenuVO", tbMenuVO);
        
        return "/front/main/brdList";
    } 
	
	@RequestMapping(value={"/main/brdListJson.do"})
	@ResponseBody
    public String mainBrdListJson(@ModelAttribute("searchVO") TbBrdVO searchVO, 
    		TbMenuVO searchMenuVO,
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
		
        List<?> tbBrdList = tbBrdService.selectTbBrdList(searchVO);
        model.addAttribute("resultList", tbBrdList);
        
        int totCnt = tbBrdService.selectTbBrdListTotCnt(searchVO);
		paginationInfo.setTotalRecordCount(totCnt);
        model.addAttribute("paginationInfo", paginationInfo);
        
        TbMenuVO tbMenuVO = tbMenuService.selectTbMenu(searchMenuVO);
        model.addAttribute("tbMenuVO", tbMenuVO);
        
        ObjectMapper mapper = new ObjectMapper();
        
    	HashMap<String, Object> returnMap = new HashMap<String, Object>();  
    	
    	returnMap.put("brdList", tbBrdList);
    	returnMap.put("menu", tbMenuVO);
    	
    	String jsonStr = mapper.writeValueAsString(returnMap);		
		return jsonStr;        
    } 
	
	@RequestMapping(value={"/main/portfList.do"})
    public String mainPortfList(@ModelAttribute("searchVO") TbPortfVO searchVO,
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
		
        List<?> tbPortfList = tbPortfService.selectTbPortfList(searchVO);
        model.addAttribute("resultList", tbPortfList);
        
        int totCnt = tbPortfService.selectTbPortfListTotCnt(searchVO);
		paginationInfo.setTotalRecordCount(totCnt);
        model.addAttribute("paginationInfo", paginationInfo);
        
        return "/front/main/portfList";
    } 

//	@RequestMapping(value = "/banner.do")
//	public String banner(
//				Model model, HttpServletRequest request, HttpSession session,
//				@ModelAttribute("searchVO") FrontSearchVO searchVO
//		) throws Exception {
//		
//        TBannerVO bannerVO = new TBannerVO();
//        bannerVO.setDisYn("Y");
//        bannerVO.setPagingYn("N");
//        List<?> TBannerList = TBannerService.selectTBannerList(bannerVO);
//		model.addAttribute("bannerList", TBannerList);
//		 
//		return "/frontMain/banner";
//
//	}
//	
//	@RequestMapping(value = "/news.do")
//	public String news(
//				Model model, HttpServletRequest request, HttpSession session,
//				@ModelAttribute("searchVO") FrontSearchVO searchVO
//		) throws Exception {
//		TCommutyVO TCommutyVO = new TCommutyVO();
//		TCommutyVO.setMenuId("gongji");
//		
//		List<?> TCommutyList = TCommutyService.selectMainTCommutyList(TCommutyVO);
//        model.addAttribute("resultList", TCommutyList);
//		 
//		return "/frontMain/news";
//
//	}
//	
//	
//	@RequestMapping(value = "/ptpl.do")
//	public String ptpl(
//				Model model, HttpServletRequest request, HttpSession session,
//				@ModelAttribute("searchVO") TPtplInfoVO searchVO
//		) throws Exception {
//		TCodeVO code = new TCodeVO();
//	    code.setGubun("PA");
//	    code.setPagingYn("N");
//	    List<TCodeVO> codeListPA = tCodeService.selectTCodeList(code);
//	    model.addAttribute("codeListPA", codeListPA);
//		 
//		
//		searchVO.setFirstIndex(0);
//		searchVO.setRecordCountPerPage(10);
//		searchVO.setSearchKeyword2("random");
//		
//	    List<?> TPtplInfoList = frontTPtplInfoService.selectTPtplInfoList(searchVO);
//	    model.addAttribute("resultList", TPtplInfoList);
//	    
//	    
//	    model.addAttribute("ptplPart", searchVO.getPtplPart());
//	    
//		return "/frontMain/ptpl";
//
//	}

	
}