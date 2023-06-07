package dlink_new.front.controller;

import java.util.List;

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
import org.springframework.web.util.UrlPathHelper;

import com.fasterxml.jackson.databind.ObjectMapper;

import dlink_new.admin.vo.TImgInfo;
import dlink_new.admin.vo.TbMemVO;
import dlink_new.front.service.FrontDsnBankService;

@Controller
@RequestMapping("/front/dBank")
public class FrontDsnBankController {

	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;

	@Resource(name = "FrontDsnBankService")
	private FrontDsnBankService frontDsnBankService;

	/* [사용자] 디자인뱅크 리스트 */
	@RequestMapping(value = { "/pkDsnList.do", "/imgDsnList.do", "/vidDsnList.do" })
	public String dBankList(@ModelAttribute("searchVO") TImgInfo searchVO, ModelMap model, HttpServletRequest req,
			HttpServletResponse response, HttpSession session) throws Exception {
		UrlPathHelper urlPathHelper = new UrlPathHelper();
		String originalURL = urlPathHelper.getOriginatingRequestUri(req);
		try {
			TbMemVO memVO = (TbMemVO) session.getAttribute("frontLoginVO");
			model.addAttribute("memVO", memVO);

			/** EgovPropertyService.sample */
			searchVO.setPageUnit(propertiesService.getInt("pageUnit"));
			searchVO.setPageSize(propertiesService.getInt("pageSize"));

			/** pageing */
			PaginationInfo paginationInfo = new PaginationInfo();
			paginationInfo.setCurrentPageNo(searchVO.getPageIndex());
			paginationInfo.setRecordCountPerPage(16);
			paginationInfo.setPageSize(searchVO.getPageSize());

			searchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
			searchVO.setLastIndex(paginationInfo.getLastRecordIndex());
			searchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

			if (originalURL.equals("/front/dBank/pkDsnList.do")) {
				searchVO.setCode("0001");
			} else if (originalURL.equals("/front/dBank/imgDsnList.do")) {
				searchVO.setCode("0002");
			} else if (originalURL.equals("/front/dBank/vidDsnList.do")) {
				searchVO.setCode("0003");
			}

			List<?> ImgInfoList = frontDsnBankService.selectImgInfoList(searchVO);
			model.addAttribute("resultList", ImgInfoList);

			int totCnt = frontDsnBankService.selectImgInfoListTotCnt(searchVO);
			paginationInfo.setTotalRecordCount(totCnt);
			model.addAttribute("paginationInfo", paginationInfo);

			model.addAttribute("searchVO", searchVO);
			searchVO.setSearchKeyword("");
			model.addAttribute("searchKeyword", searchVO.getSearchKeyword());
			/* model.addAttribute("loginVO", loginVO); */
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "/front/dBankMag/dBankList";
	}

	/* [사용자] 모달상세보기 */
	@RequestMapping("/dBankDetailJson.do")
	@ResponseBody
	public ResponseEntity<String> dBankDetailJson(TImgInfo searchVO, @ModelAttribute("searchVO") TImgInfo vo)
			throws Exception {
		HttpHeaders resHeaders = new HttpHeaders();
		String return_value = "";
		try {
			resHeaders.add("Content-Type", "application/json;charset=UTF-8");

			TImgInfo ImgInfo = frontDsnBankService.selectImgInfo(searchVO);
			ObjectMapper om = new ObjectMapper();
			return_value = om.writeValueAsString(ImgInfo);
		} catch (Exception e) {
			e.printStackTrace();
		}

		ResponseEntity<String> result = new ResponseEntity<String>(return_value, resHeaders, HttpStatus.CREATED);
		return result;
	}

	/* [사용자] 다운로드 기록저장 */
	@RequestMapping("/insertDownInfo.do")
	@ResponseBody
	public String insertDownInfo(TImgInfo TImgInfo, @ModelAttribute("searchVO") TImgInfo searchVO, SessionStatus status)
			throws Exception {
		try {
			searchVO.setRegId(searchVO.getMemId());

			frontDsnBankService.insertDownInfo(searchVO);
			status.setComplete();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "Y";
	}

	/* [사용자]찜하기 기능 */
	@RequestMapping("/insertLikeInfo.do")
	@ResponseBody
	public String insertLikeInfo(TImgInfo TImgInfo, @ModelAttribute("searchVO") TImgInfo searchVO, SessionStatus status)
			throws Exception {
		String rs = "";
		try {
			searchVO.setRegId(searchVO.getMemId());
			int likeCnt = frontDsnBankService.selectLikeCnt(searchVO);
			status.setComplete();

			if (likeCnt > 0) {
				rs = "N";
			} else {
				frontDsnBankService.insertLikeInfo(searchVO);
				rs = "Y";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return rs;
	}
}
