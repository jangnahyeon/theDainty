package dlink_new.admin.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.egovframe.rte.fdl.property.EgovPropertyService;
import org.egovframe.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.util.UrlPathHelper;

import dlink_new.admin.service.TbCodeService;
import dlink_new.admin.service.TbMemService;
import dlink_new.admin.vo.TbCodeVO;
import dlink_new.admin.vo.TbMemDefaultVO;
import dlink_new.admin.vo.TbMemVO;
import dlink_new.common.service.FileService;
import dlink_new.common.service.TbAtalkTmplService;
import dlink_new.common.vo.TbAtalkTmplVO;
import dlink_new.front.service.FrontDsnStdService;
import dlink_new.front.vo.TbSisulRsvVO;
import dlink_new.util.PasswordUtils;

// Servoce 객체에 대한 import 구문
// import (service package).TbMemService;
// Vo 객체에 대한 import 구문
// import (vo package).TbMemDefaultVO;
// import (vo package).TbMemVO;

/**
 * @Class Name : TbMemController.java
 * @Description : TbMem Controller class
 * @Modification Information
 *
 * @author 김현재
 * @since 2023-01-18
 * @version 1.0
 * @see
 * 
 * 		Copyright (C) All right reserved.
 */

@Controller
// @SessionAttributes(types=TbMemVO.class)
@RequestMapping("/admin")
public class TbMemController {

	@Resource(name = "tbMemService")
	private TbMemService tbMemService;

	@Resource(name = "FileService")
	private FileService fileService;

	/** EgovPropertyService */
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;
	
	@Resource(name = "tbAtalkTmplService")
	private TbAtalkTmplService tbAtalkTmplService;
	
	@Resource(name = "frontDsnStdService")
	private FrontDsnStdService frontDsnStdService;
	
	@Resource(name = "tbCodeService")
    private TbCodeService tbCodeService;

	/**
	 * tb_mem 목록을 조회한다. (pageing)
	 * 
	 * @param searchVO
	 *            - 조회할 정보가 담긴 TbMemDefaultVO
	 * @return "/tbMem/TbMemList"
	 * @exception Exception
	 */
	@RequestMapping(value = { "/tbMem/TbMemList.do", "/mem/memList.do", "/mem/memCList.do", "/mem/memDList.do" })
	public String selectTbMemList(@ModelAttribute("searchVO") TbMemVO searchVO
			, ModelMap model, HttpServletRequest req) throws Exception {

		UrlPathHelper urlPathHelper = new UrlPathHelper();
		String originalURL = urlPathHelper.getOriginatingRequestUri(req);
		
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
		
		if (originalURL.equals("/admin/mem/memList.do")) {
			searchVO.setCode("0002");
		} else if (originalURL.equals("/admin/mem/memCList.do")) {
			searchVO.setCode("0003");
			searchVO.setComType("C");
		} else if (originalURL.equals("/admin/mem/memDList.do")) {
			searchVO.setCode("0003");
			searchVO.setComType("D");
		}
		String code = searchVO.getCode(); 
				
		List<?> tbMemList = tbMemService.selectTbMemList(searchVO);
		model.addAttribute("resultList", tbMemList);

		int totCnt = tbMemService.selectTbMemListTotCnt(searchVO);
		paginationInfo.setTotalRecordCount(totCnt);
		model.addAttribute("paginationInfo", paginationInfo);

		model.addAttribute("searchVO", searchVO);
		searchVO.setSearchKeyword("");
		model.addAttribute("searchKeyword", searchVO.getSearchKeyword());
		model.addAttribute("searchCondition", searchVO.getSearchCondition());
		model.addAttribute("code", code);

		// return "/tbMem/TbMemList";
		return "/admin/mem/memList";
	}

	@RequestMapping(value = "/tbMem/tbMemDetail.do")
	public String tbMemDetail(@ModelAttribute("searchVO") TbMemVO searchVO, ModelMap model, HttpServletRequest req,
			HttpServletResponse response) throws Exception {

		try {
			TbCodeVO vo = new TbCodeVO();
	        String searchKeyword = "plt009";
	        vo.setSearchCondition("gbCd");
	        vo.setSearchKeyword(searchKeyword);
	        
//	        vo.setGbCd("plt002");
//	        vo.setGbCd("plt003");
//	        vo.setGbCd("plt004");
	        List<?> codelist = tbCodeService.selectTbCodeListFront(vo);
	        model.addAttribute("codelist", codelist);
	        
			TbMemVO tbMemVO = tbMemService.selectTbMem(searchVO);
			model.addAttribute("tbMemVO", tbMemVO);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "/admin/mem/memDetail";
	}

	@RequestMapping("/tbMem/addTbMemView.do")
	public String addTbMemView(@RequestParam("code") String code,@ModelAttribute("searchVO") TbMemVO searchVO, Model model) throws Exception {
		searchVO.setCode(code);
		model.addAttribute("resultList", searchVO);
		
		TbCodeVO vo = new TbCodeVO();
        String searchKeyword = "plt009";
        vo.setSearchCondition("gbCd");
        vo.setSearchKeyword(searchKeyword);
        
//        vo.setGbCd("plt002");
//        vo.setGbCd("plt003");
//        vo.setGbCd("plt004");
        List<?> codelist = tbCodeService.selectTbCodeListFront(vo);
        model.addAttribute("codelist", codelist);
        
		// return "/tbMem/TbMemRegister";
		return "/admin/mem/memAdd";
	}

	@RequestMapping("/tbMem/addTbMem.do")
	@ResponseBody
	public String addTbMem(TbMemVO tbMemVO, @ModelAttribute("searchVO") TbMemDefaultVO searchVO, SessionStatus status)
			throws Exception {
		String rs = "";
		try {
			if (!StringUtils.isEmpty(tbMemVO.getMemPw())) {
				String memPw = tbMemVO.getMemPw();
				String encMemPw = PasswordUtils.encript(memPw);
				tbMemVO.setMemPw(encMemPw);
			}
	
			tbMemService.insertTbMem(tbMemVO);
			status.setComplete();
			rs = "Y";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return rs;
	}

	@RequestMapping("/tbMem/updateTbMemView.do")
	public String updateTbMemView(@RequestParam("memSeq") Integer memSeq,
			@ModelAttribute("searchVO") TbMemVO searchVO, Model model) throws Exception {
		TbCodeVO vo = new TbCodeVO();
        String searchKeyword = "plt009";
        vo.setSearchCondition("gbCd");
        vo.setSearchKeyword(searchKeyword);
        
//        vo.setGbCd("plt002");
//        vo.setGbCd("plt003");
//        vo.setGbCd("plt004");
        List<?> codelist = tbCodeService.selectTbCodeListFront(vo);
        model.addAttribute("codelist", codelist);
        
		TbMemVO tbMemVO = new TbMemVO();
		tbMemVO.setMemSeq(memSeq);

		tbMemVO = tbMemService.selectTbMem(tbMemVO);
		
		model.addAttribute("resultList", tbMemVO);

		return "/admin/mem/memAdd";
	}

	@RequestMapping("/tbMem/selectTbMem.do")
	public @ModelAttribute("tbMemVO") TbMemVO selectTbMem(TbMemVO tbMemVO,
			@ModelAttribute("searchVO") TbMemDefaultVO searchVO) throws Exception {
		return tbMemService.selectTbMem(tbMemVO);
	}

	@RequestMapping("/tbMem/updateTbMem.do")
	@ResponseBody
	public String updateTbMem(TbMemVO tbMemVO, @ModelAttribute("searchVO") TbMemDefaultVO searchVO,
			SessionStatus status) throws Exception {
		String rs = "";
		try {
			if (!StringUtils.isEmpty(tbMemVO.getMemPw())) {
				String memPw = tbMemVO.getMemPw();
				String encMemPw = PasswordUtils.encript(memPw);
				tbMemVO.setMemPw(encMemPw);
			}
	
			tbMemService.updateTbMem(tbMemVO);
			status.setComplete();
			rs = "Y";
		} catch (Exception e) {
			e.printStackTrace();
		}
	return rs;
	}
	
	@RequestMapping("/tbMem/tbMemAcceotUpdate.do")
	@ResponseBody
    public String TbMemAcceotUpdate(TbMemVO searchVO, Model model)
            throws Exception {
		
		String rs = "";
		try {
		
			tbMemService.tbMemAcceotUpdate(searchVO);
			
			/*알림톡 발송*/
			TbAtalkTmplVO vo = new TbAtalkTmplVO();
			if( "Y".equals( searchVO.getAcceptYn() ) ) {
				vo.setTmplCd("dlink_mts003");
				vo = tbAtalkTmplService.selectTbAtalkTmpl(vo);
				//assertNotNull(vo);
				if(null != vo) {				
					String msg = vo.getTranMsg();		
					vo.setTranMsg(msg);
					vo.setTranPhone(searchVO.getHp().replace("-", ""));
					tbAtalkTmplService.insertMtsAtalkMsg(vo);
				}
			} else if( "N".equals( searchVO.getAcceptYn() ) ) {
				
				vo.setTmplCd("dlink_mts005");
				vo = tbAtalkTmplService.selectTbAtalkTmpl(vo);
				//assertNotNull(vo);
				if(null != vo) {				
					String msg = vo.getTranMsg();
					String rejectMsg = "반려사유 : " + searchVO.getRejectMsg();
					msg = msg.replace("#{반려사유}", rejectMsg);
					vo.setTranMsg(msg);
					vo.setTranPhone(searchVO.getHp().replace("-", ""));
					tbAtalkTmplService.insertMtsAtalkMsg(vo);
				}
			}
			rs = "Y";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return rs;
    }

	@RequestMapping("/tbMem/deleteTbMem.do")
	public String deleteTbMem(TbMemVO tbMemVO, @ModelAttribute("searchVO") TbMemDefaultVO searchVO,
			SessionStatus status) throws Exception {
		
		String url = "";
		
		String code = tbMemVO.getCode();
		tbMemService.deleteTbMem(tbMemVO);
		TbSisulRsvVO tbSisulRsvVO = new TbSisulRsvVO();
		frontDsnStdService.deleteTbSisulRsv(tbSisulRsvVO);
		if(tbMemVO.getCode().equals("0002")) {
			url = "/mem/memList.do";
		} else if(tbMemVO.getCode().equals("0003")) {
			if(tbMemVO.getComType().equals("C")) {
				url = "/admin/mem/memCList.do";
			}else if(tbMemVO.getComType().equals("D")) {
				url = "/admin/mem/memDList.do";
			}
		}
		status.setComplete();
		return "redirect:" + url;
	}
	
	@RequestMapping("/tbMem/deleteTbMemAjax.do")
	@ResponseBody
	public String deleteTbMemAjax(TbMemVO tbMemVO, @RequestParam(value="memList[]") List<String> memList,
			SessionStatus status) throws Exception {
		
		String rs = "";
		try {
			for(String memSeq : memList) {
				//BigDecimal dMemSeq = new BigDecimal(memSeq);
				Integer dMemSeq = Integer.valueOf( memSeq );
				tbMemVO.setMemSeq(dMemSeq);
				tbMemService.deleteTbMem(tbMemVO);
				TbSisulRsvVO tbSisulRsvVO = new TbSisulRsvVO();
				tbSisulRsvVO.setMemSeq(dMemSeq);
				frontDsnStdService.deleteTbSisulRsv(tbSisulRsvVO);
			}	
			status.setComplete();
			rs = "Y";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return rs;
		}

}