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
import org.springframework.web.bind.support.SessionStatus;

import dlink_new.admin.service.AdminDsnBankService;
import dlink_new.admin.service.AdminGoodsService;
import dlink_new.admin.vo.TImgInfo;
import dlink_new.admin.vo.TbBannerDefaultVO;
import dlink_new.admin.vo.TbBannerVO;
import dlink_new.admin.vo.TbGoodsVO;
import dlink_new.admin.vo.TbMemVO;

@Controller
@RequestMapping("/admin/goods")
public class AdminGoodsController {

	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;
	
	@Resource(name = "AdminGoodsService")
	private AdminGoodsService adminGoodsService;

	@RequestMapping(value = { "/goodsList.do" })
	public String goodsList(@ModelAttribute("searchVO") TbGoodsVO searchVO, ModelMap model, HttpServletRequest req,
			HttpServletResponse response, HttpSession session) throws Exception {

		// 사용자 로그인 확인 Start
		TbMemVO tbMemVO = (TbMemVO) session.getAttribute("adminLoginVO");
		if (tbMemVO == null) {
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
			
			List<?> goodsVO = adminGoodsService.selectGoodsList(searchVO);
			model.addAttribute("resultList", goodsVO);
			
			int totCnt = adminGoodsService.selectGoodsListTotCnt(searchVO);
			paginationInfo.setTotalRecordCount(totCnt);
			model.addAttribute("paginationInfo", paginationInfo);

			model.addAttribute("searchVO", searchVO);
			searchVO.setSearchKeyword("");
			model.addAttribute("searchKeyword", searchVO.getSearchKeyword());
			/* model.addAttribute("loginVO", loginVO); */
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "/admin/goods/GoodsList";
	}
	
	/* [관리자] 상품 등록페이지 */
	@RequestMapping(value = "/addGoods.do")
	public String addGoods(@ModelAttribute("searchVO") TbGoodsVO searchVO, ModelMap model, HttpServletRequest req,
			HttpServletResponse response) throws Exception {
		
		try {			
			model.addAttribute("resultList", searchVO);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "/admin/goods/addGoods";
	}
	
	 @RequestMapping("/addGoodsAct.do")
	    public String addTbPopup(
	    		TbGoodsVO tbGoodsVO,
	            @ModelAttribute("searchVO") TbBannerDefaultVO searchVO, SessionStatus status, HttpSession session)
	            throws Exception {
	    	
	    	TbMemVO tbMemVO = (TbMemVO) session.getAttribute("adminLoginVO");
			if(tbMemVO == null) {
				return "redirect:/admin/login.do";
			}
			
	        adminGoodsService.insertGoods(tbGoodsVO);
			
	        status.setComplete();
	        return "forward:/admin/goods/goodsList.do";
	    }
}
