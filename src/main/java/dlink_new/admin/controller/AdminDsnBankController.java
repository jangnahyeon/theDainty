package dlink_new.admin.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.egovframe.rte.fdl.property.EgovPropertyService;
import org.egovframe.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.util.UrlPathHelper;

import com.fasterxml.jackson.databind.ObjectMapper;

import dlink_new.admin.service.AdminDsnBankService;
import dlink_new.admin.vo.SearchVO;
import dlink_new.admin.vo.TImgInfo;
import dlink_new.admin.vo.TbMemVO;
import dlink_new.admin.vo.TbPortfVO;

@Controller
@RequestMapping("/admin/dBank")
public class AdminDsnBankController {

	@Resource(name = "AdminDsnBankService")
	private AdminDsnBankService adminDsnBankService;

	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;

	/* [관리자] 디자인뱅크 리스트 */
	@RequestMapping(value = { "/pkDsnList.do", "/imgDsnList.do", "/vidDsnList.do" })
	public String dBankList(@ModelAttribute("searchVO") TImgInfo searchVO, ModelMap model, HttpServletRequest req,
			HttpServletResponse response, HttpSession session) throws Exception {
		
		//사용자 로그인 확인 Start
		TbMemVO tbMemVO = (TbMemVO) session.getAttribute("adminLoginVO");
		if(tbMemVO == null) {
			model.addAttribute("msg", "fail");
			return "redirect:/admin/login.do";
		}
		
		UrlPathHelper urlPathHelper = new UrlPathHelper();
		String originalURL = urlPathHelper.getOriginatingRequestUri(req);
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
	
			if (originalURL.equals("/admin/dBank/pkDsnList.do")) {
				searchVO.setCode("0001");
			} else if (originalURL.equals("/admin/dBank/imgDsnList.do")) {
				searchVO.setCode("0002");
			} else if (originalURL.equals("/admin/dBank/vidDsnList.do")) {
				searchVO.setCode("0003");
			}
			
			List<?> tbDBList = adminDsnBankService.selectOrderNoList(searchVO);
			model.addAttribute("tbDBList", tbDBList);
	
			List<?> ImgInfoList = adminDsnBankService.selectImgInfoList(searchVO);
			model.addAttribute("resultList", ImgInfoList);
	
			int totCnt = adminDsnBankService.selectImgInfoListTotCnt(searchVO);
			paginationInfo.setTotalRecordCount(totCnt);
			model.addAttribute("paginationInfo", paginationInfo);
	
			model.addAttribute("searchVO", searchVO);
			searchVO.setSearchKeyword("");
			model.addAttribute("searchKeyword", searchVO.getSearchKeyword());
			/* model.addAttribute("loginVO", loginVO); */
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "/admin/dBankMag/dBankList";
	}

	/* [관리자] 디자인뱅크 등록페이지 */
	@RequestMapping(value = "/dBankAdd.do")
	public String dBankAdd(@ModelAttribute("searchVO") TImgInfo searchVO, ModelMap model, HttpServletRequest req,
			HttpServletResponse response) throws Exception {
		
		try {			
			model.addAttribute("resultList", searchVO);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "/admin/dBankMag/dBankAdd";
	}

	/* [관리자] 디자인뱅크 수정페이지 */
	@RequestMapping(value = "/dBankUpdate.do")
	public String dBankUpdate(@ModelAttribute("searchVO") TImgInfo searchVO, ModelMap model, HttpServletRequest req,
			HttpServletResponse response) throws Exception {
		
		try {	
			TImgInfo ImgInfo = adminDsnBankService.selectImgInfo(searchVO);
			model.addAttribute("resultList", ImgInfo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "/admin/dBankMag/dBankAdd";
	}

	/* [관리자] 디자인뱅크 저장 */
	@RequestMapping(value = "/dBankAddAct.do")
	@ResponseBody
	public String dBankAddAct(@ModelAttribute("searchVO") TImgInfo searchVO, ModelMap model, HttpServletRequest req,
			HttpServletResponse response, HttpSession session) throws Exception {

		String rs = "";
		try {
			//사용자 로그인 확인 Start
			TbMemVO tbMemVO = (TbMemVO) session.getAttribute("adminLoginVO");
			if(tbMemVO == null) {
				model.addAttribute("msg", "fail");
				return "redirect:/admin/login.do";
			}
			
			TImgInfo bankVO = new TImgInfo();
			List<Map<String, Object>> tbDsnList = adminDsnBankService.selectOrderNoList(searchVO);
			String dsnSeq = "0";
			int order = 2;
			for(int i=0; i<tbDsnList.size(); i++) {
				
				dsnSeq = tbDsnList.get(i).get("dsnSeq").toString(); 
				bankVO.setDsnSeq(Integer.valueOf(dsnSeq));
				
				bankVO = adminDsnBankService.selectImgInfo(bankVO);
				
//				String OrderNo = bankVO.getOrderNo();
//				int OrderNo1 = Integer.valueOf(OrderNo) + 1;
				bankVO.setOrderNo(String.valueOf(order++));
				
				adminDsnBankService.updateImgInfo(bankVO);
			}
			
			
			searchVO.setOrderNo("1");
			searchVO.setMemId(tbMemVO.getMemId());
			searchVO.setRegister(tbMemVO.getMemId());
			adminDsnBankService.insertImgInfo(searchVO);

			searchVO.setTitleYn("Y");
			adminDsnBankService.insertImg(searchVO);

			searchVO.setTitleYn("N");
			searchVO.setFileSeq(searchVO.getThumFileSeq());
			adminDsnBankService.insertImg(searchVO);

			rs = "Y";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return rs;
	}

	/* [관리자] 디자인뱅크 수정 */
	@RequestMapping(value = "/dBankUpdateAct.do")
	@ResponseBody
	public String dBankUpdateAct(@ModelAttribute("searchVO") TImgInfo searchVO, ModelMap model, HttpServletRequest req,
			HttpServletResponse response, HttpSession session) throws Exception {

		String rs = "";
		try {
			//사용자 로그인 확인 Start
			TbMemVO tbMemVO = (TbMemVO) session.getAttribute("adminLoginVO");
			if(tbMemVO == null) {
				model.addAttribute("msg", "fail");
				return "redirect:/admin/login.do";
			}
			searchVO.setMemId(tbMemVO.getMemId());
			searchVO.setUpdater(tbMemVO.getMemId());
			adminDsnBankService.updateImgInfo(searchVO);
			adminDsnBankService.deleteImgAll(searchVO);

			searchVO.setTitleYn("Y");
			adminDsnBankService.insertImg(searchVO);

			searchVO.setTitleYn("N");
			searchVO.setFileSeq(searchVO.getThumFileSeq());
			adminDsnBankService.insertImg(searchVO);

			rs = "Y";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return rs;
	}

	/* [관리자] 디자인뱅크 상세보기 */
	@RequestMapping(value = "/dBankDetail.do")
	public String dBankDetail(@ModelAttribute("searchVO") TImgInfo searchVO, ModelMap model, HttpServletRequest req,
			HttpServletResponse response) throws Exception {

		try {
			TImgInfo ImgInfo = adminDsnBankService.selectImgInfo(searchVO);
			model.addAttribute("resultList", ImgInfo);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "/admin/dBankMag/dBankDetail";
	}

	/* [관리자] 모달 다운로드 상세보기 */
	@RequestMapping("/dBankDownDetailJson.do")
	@ResponseBody
	public ResponseEntity<String> dBankDownDetailJson(TImgInfo searchVO, @ModelAttribute("searchVO") TImgInfo vo,
			ModelMap model) throws Exception {
		HttpHeaders resHeaders = new HttpHeaders();
		String return_value = "";
		try {
			resHeaders.add("Content-Type", "application/json;charset=UTF-8");
			List<?> ImgInfo = adminDsnBankService.selectDownInfo(searchVO);
			ObjectMapper om = new ObjectMapper();
			return_value = om.writeValueAsString(ImgInfo);
		} catch (Exception e) {
			e.printStackTrace();
		}

		ResponseEntity<String> result = new ResponseEntity<String>(return_value, resHeaders, HttpStatus.CREATED);
		return result;
	}

	/* [관리자] 디자인뱅크 이미지지우기 */
	@RequestMapping("/deleteImg.do")
	@ResponseBody
	public String deleteImg(TImgInfo TImgInfo, @ModelAttribute("searchVO") TImgInfo searchVO, SessionStatus status)
			throws Exception {
		
		try {
			adminDsnBankService.deleteImg(searchVO);
			status.setComplete();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "Y";
	}

	/* [관리자] 디자인뱅크 이미지게시글 지우기 */
	@RequestMapping("/dBankDelete.do")
	public String dBankDelete(TImgInfo vo, @ModelAttribute("searchVO") SearchVO searchVO, SessionStatus status,
			RedirectAttributes redirect, HttpSession session, HttpServletRequest req) throws Exception {

		String url = "";
		try {

			adminDsnBankService.deleteImgInfo(vo);
			adminDsnBankService.deleteImgAll(vo);

			if (vo.getCode().equals("0001")) {
				url = "/admin/dBank/pkDsnList.do";
			} else if (vo.getCode().equals("0002")) {
				url = "/admin/dBank/imgDsnList.do";
			} else if (vo.getCode().equals("0003")) {
				url = "/admin/dBank/vidDsnList.do";
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:" + url;
	}
	
    @RequestMapping("/updateUpDown.do")
    public String updateUpDown(
    	TImgInfo iImgInfo, RedirectAttributes rttr,
        @ModelAttribute("searchVO") TImgInfo searchVO, SessionStatus status, HttpSession session)
        throws Exception {
    	
    	TbMemVO tbMemVO = (TbMemVO) session.getAttribute("adminLoginVO");
    	iImgInfo.setUpdId(tbMemVO.getMemId());
    	
		String code = searchVO.getCode();
		String url = "";
		if(code.equals("0001")) {
			url = "/pkDsnList.do";
		}
		if(code.equals("0002")) {
			url = "/imgDsnList.do";
		}
		if(code.equals("0003")) {
			url = "/vidDsnList.do";
		}
		String pageIndex = String.valueOf(searchVO.getPageIndex());
    	if(null != iImgInfo.getTarget_dsnSeq()) {
    		
    		TImgInfo curTImgInfo = adminDsnBankService.selectImgInfo(searchVO);
    		
    		searchVO.setDsnSeq(searchVO.getTarget_dsnSeq());
    		TImgInfo tarTImgInfo = adminDsnBankService.selectImgInfo(searchVO);
    		
    		if(null != curTImgInfo && null != tarTImgInfo) {
    			
    			String curOrderNo = curTImgInfo.getOrderNo();
    			String tarOrderNo = tarTImgInfo.getOrderNo();
    			
    			curTImgInfo.setOrderNo(tarOrderNo);
    			tarTImgInfo.setOrderNo(curOrderNo);
    			
    			curTImgInfo.setUpdId(tbMemVO.getMemId());
    			tarTImgInfo.setUpdId(tbMemVO.getMemId());
    			
    			adminDsnBankService.updateImgInfo(curTImgInfo);
    			adminDsnBankService.updateImgInfo(tarTImgInfo);

    		}
    	} else {
			return "redirect:/admin/dBank" + url + "?pageIndex=" + pageIndex;
    	}
    	
    	return "redirect:/admin/dBank" + url + "?pageIndex=" + pageIndex;
    }

}
