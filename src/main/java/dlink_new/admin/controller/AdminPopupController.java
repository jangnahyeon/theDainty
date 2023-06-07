package dlink_new.admin.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.egovframe.rte.fdl.property.EgovPropertyService;
import org.egovframe.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.util.UrlPathHelper;

import dlink_new.admin.service.AdminPopupService;
import dlink_new.admin.vo.SearchVO;
import dlink_new.admin.vo.TImgInfo;
import dlink_new.admin.vo.TbMemVO;
import dlink_new.admin.vo.TbPopupVO;

@Controller
@RequestMapping("/admin/popup")
public class AdminPopupController {
	
	@Resource(name = "AdminPopupService")
	private AdminPopupService adminPopupService;
	
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;
	
	
	@RequestMapping(value="/popupList.do")
	public String popupList(@ModelAttribute("searchVO") TbPopupVO searchVO, ModelMap model, HttpServletRequest req,
			HttpServletResponse response, HttpSession session) {
		
		//사용자 로그인 확인 Start
		TbMemVO tbMemVO = (TbMemVO) session.getAttribute("adminLoginVO");
		if(tbMemVO == null) {
			model.addAttribute("msg", "fail");
			return "redirect:/admin/login.do";
		}
		
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
			
			List<?> popupList = adminPopupService.selectPopupList(searchVO);
			model.addAttribute("popupList", popupList);
			
			int totCnt = adminPopupService.selectPopupListTotCnt(searchVO);
			paginationInfo.setTotalRecordCount(totCnt);
	        model.addAttribute("paginationInfo", paginationInfo);
	        
	        model.addAttribute("searchVO", searchVO);
			searchVO.setSearchKeyword("");
			model.addAttribute("searchKeyword", searchVO.getSearchKeyword());
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	
		return "/admin/tbPopup/TbPopupList";
	}
	
	/* [관리자] 팝업화면이동 */
	@RequestMapping(value = { "/popupAdd.do", "/popupUpdate.do"})
	public String popupAdd(
			@ModelAttribute("searchVO") TbPopupVO searchVO
			, ModelMap model, HttpServletRequest req,
			HttpServletResponse response) throws Exception {
		
		UrlPathHelper urlPathHelper = new UrlPathHelper();
		String originalURL = urlPathHelper.getOriginatingRequestUri(req);
			
		try {
			
			if (originalURL.equals("/admin/popup/popupUpdate.do")) {
				searchVO = adminPopupService.selectPopup(searchVO);
				
				String tempH = "";
				//tempH = csiMasPopVo.getPop_cont().replace("&amp;", "&");
				tempH = searchVO.getContents();
				if(tempH != null) {
					tempH = tempH.replace("&amp;", "&");
					tempH = tempH.replace("&lt;", "<");
					tempH = tempH.replace("&gt;", ">");
					//tempH = tempH.replace("&nbsp;", " ");
					tempH = tempH.replace("&quot;", (char) 34 + "");
					tempH = tempH.replace("&apos;", "'");
					searchVO.setCont(tempH);
				}
				
				model.addAttribute("searchVO", searchVO);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "/admin/tbPopup/popupAdd";
	}
	
	/* [관리자] 팝업화면이동 */
	@RequestMapping(value = "/popupDetail.do")
	public String popupDetail(
			@ModelAttribute("searchVO") TbPopupVO searchVO
			, ModelMap model, HttpServletRequest req,
			HttpServletResponse response) throws Exception {
			
		String tempH = "";
		try {
			searchVO = adminPopupService.selectPopup(searchVO);
			
			//tempH = csiMasPopVo.getPop_cont().replace("&amp;", "&");
			tempH = searchVO.getContents();
			if(tempH != null) 
				tempH = tempH.replace("&amp;", "&");
				tempH = tempH.replace("&lt;", "<");
				tempH = tempH.replace("&gt;", ">");
				//tempH = tempH.replace("&nbsp;", " ");
				tempH = tempH.replace("&quot;", (char) 34 + "");
				tempH = tempH.replace("&apos;", "'");
				searchVO.setCont(tempH);
				
				model.addAttribute("searchVO", searchVO);
				
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "/admin/tbPopup/popupDetail";
	}
	
	
	
	/* [관리자] 팝업등록 */
	@RequestMapping(value = "/popupAddAct.do")
	@ResponseBody
	public String popupAddAct(
			@ModelAttribute("searchVO") TbPopupVO searchVO
			, ModelMap model, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		TbMemVO adminLoginVO = (TbMemVO) request.getSession().getAttribute("adminLoginVO");
		if(null == adminLoginVO) {
			model.addAttribute("msg", "fail");
			return "redirect:/admin/login.do";
		}
		
		String rs = "";
		try {			
			
			searchVO.setRegister(adminLoginVO.getMemId());
			searchVO.setContents(searchVO.getCont());
			adminPopupService.insertPopup(searchVO);

			rs = "suc";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return rs;
	}
	
	/* [관리자] 팝업수정 */
	@RequestMapping(value = "/popupUpdateAct.do")
	@ResponseBody
	public String popupUpdateAct(
			@ModelAttribute("searchVO") TbPopupVO searchVO
			, ModelMap model, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		TbMemVO adminLoginVO = (TbMemVO) request.getSession().getAttribute("adminLoginVO");
		if(null == adminLoginVO) {
			model.addAttribute("msg", "fail");
			return "redirect:/admin/login.do";
		}
		
		String rs = "";
		try {			
			
			searchVO.setRegister(adminLoginVO.getMemId());
			searchVO.setContents(searchVO.getCont());
			adminPopupService.updatePopup(searchVO);

			rs = "upsuc";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return rs;
	}
	
	/* [관리자] 디자인뱅크 이미지게시글 지우기 */
	@RequestMapping("/popupDelete.do")
	public String popupDelete(@ModelAttribute("searchVO") TbPopupVO searchVO
			, ModelMap model, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		String url = "";
		try {

			adminPopupService.popupDelete(searchVO);


		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/admin/popup//popupList.do";
	}
	
			
}
