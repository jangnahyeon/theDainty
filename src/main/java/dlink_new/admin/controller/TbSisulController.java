package dlink_new.admin.controller;

import java.math.BigDecimal;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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

import dlink_new.admin.service.TbSisulService;
import dlink_new.admin.vo.TImgInfo;
import dlink_new.admin.vo.TbSisulDefaultVO;
import dlink_new.admin.vo.TbSisulVO;

// Servoce 객체에 대한 import 구문
// import (service package).TbSisulService;
// Vo 객체에 대한 import 구문
// import (vo package).TbSisulDefaultVO;
// import (vo package).TbSisulVO;

/**
 * @Class Name : TbSisulController.java
 * @Description : TbSisul Controller class
 * @Modification Information
 *
 * @author 김현재
 * @since 2023-01-21
 * @version 1.0
 * @see
 * 
 * 		Copyright (C) All right reserved.
 */

@Controller
@SessionAttributes(types = TbSisulVO.class)
public class TbSisulController {

	@Resource(name = "tbSisulService")
	private TbSisulService tbSisulService;

	/** EgovPropertyService */
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;

	/**
	 * tb_sisul 목록을 조회한다. (pageing)
	 * 
	 * @param searchVO
	 *            - 조회할 정보가 담긴 TbSisulDefaultVO
	 * @return "/admin/tbSisul/TbSisulList"
	 * @exception Exception
	 */
	@RequestMapping(value = { "/admin/tbSisul/TbSisulList.do", "/admin/sisul/sisulList.do" })
	public String selectTbSisulList(@ModelAttribute("searchVO") TbSisulDefaultVO searchVO, ModelMap model)
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

		List<?> tbSisulList = tbSisulService.selectTbSisulList(searchVO);
		model.addAttribute("resultList", tbSisulList);

		int totCnt = tbSisulService.selectTbSisulListTotCnt(searchVO);
		paginationInfo.setTotalRecordCount(totCnt);
		model.addAttribute("paginationInfo", paginationInfo);

		return "/admin/tbSisul/TbSisulList";
	}

	@RequestMapping("/admin/tbSisul/tbSisulDetail.do")
	public String tbSisulDetail(@RequestParam("sisulSeq") BigDecimal sisulSeq,
			@ModelAttribute("searchVO") TbSisulDefaultVO searchVO, Model model) throws Exception {
		TbSisulVO tbSisulVO = new TbSisulVO();
		tbSisulVO.setSisulSeq(sisulSeq);
		tbSisulVO = tbSisulService.selectTbSisul(tbSisulVO);
		model.addAttribute("tbSisulVO", tbSisulVO);

		return "/admin/tbSisul/TbSisulDetail";
	}

	@RequestMapping("/admin/tbSisul/addTbSisulView.do")
	public String addTbSisulView(Model model) throws Exception {
		TbSisulVO tbSisulVO = new TbSisulVO();

		model.addAttribute("tbSisulVO", tbSisulVO);
		return "/admin/tbSisul/TbSisulAdd";
	}

	@RequestMapping("/admin/tbSisul/addTbSisul.do")
	@ResponseBody
	public String addTbSisul(TbSisulVO tbSisulVO, @ModelAttribute("searchVO") TbSisulDefaultVO searchVO,
			SessionStatus status) throws Exception {
		String rs = "";
		try {
			tbSisulService.insertTbSisul(tbSisulVO);
			status.setComplete();
			rs = "Y";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return rs;
	}
	
	@RequestMapping("/admin/tbSisul/updateTbSisul.do")
	@ResponseBody
	public String updateTbSisul(TbSisulVO tbSisulVO, @ModelAttribute("searchVO") TbSisulDefaultVO searchVO,
			SessionStatus status) throws Exception {
		String rs = "";
		try {
			tbSisulService.updateTbSisul(tbSisulVO);
			status.setComplete();
			rs = "Y";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return rs;
	}

	@RequestMapping("/admin/tbSisul/updateTbSisulView.do")
	public String updateTbSisulView(@RequestParam("sisulSeq") BigDecimal sisulSeq,
			@ModelAttribute("searchVO") TbSisulDefaultVO searchVO, Model model) throws Exception {
		TbSisulVO tbSisulVO = new TbSisulVO();
		tbSisulVO.setSisulSeq(sisulSeq);
		// 변수명은 CoC 에 따라 tbSisulVO
		model.addAttribute(selectTbSisul(tbSisulVO, searchVO));
		return "/admin/tbSisul/TbSisulAdd";
	}


	@RequestMapping("/admin/tbSisul/deleteTbSisul.do")
	public String deleteTbSisul(TbSisulVO tbSisulVO, @ModelAttribute("searchVO") TbSisulDefaultVO searchVO,
			SessionStatus status) throws Exception {
		tbSisulService.deleteTbSisul(tbSisulVO);
		status.setComplete();
		return "forward:/admin/tbSisul/TbSisulList.do";
	}

	@RequestMapping("/admin/tbSisul/selectTbSisul.do")
	public @ModelAttribute("tbSisulVO") TbSisulVO selectTbSisul(TbSisulVO tbSisulVO,
			@ModelAttribute("searchVO") TbSisulDefaultVO searchVO) throws Exception {
		return tbSisulService.selectTbSisul(tbSisulVO);
	}
}
