package dlink_new.front.controller;

import static org.junit.Assert.assertNotNull;

import java.math.BigDecimal;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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

import dlink_new.admin.service.TbMemService;
import dlink_new.admin.vo.TImgInfo;
import dlink_new.admin.vo.TbMemVO;
import dlink_new.common.service.FileService;
import dlink_new.common.service.TbAtalkTmplService;
import dlink_new.common.vo.FileVO;
import dlink_new.common.vo.TbAtalkTmplVO;
import dlink_new.front.service.FrontDsnBankService;
import dlink_new.front.service.FrontDsnStdService;
import dlink_new.front.service.FrontMypageService;
import dlink_new.front.vo.TbSisulRsvDefaultVO;
import dlink_new.front.vo.TbSisulRsvFileVO;
import dlink_new.front.vo.TbSisulRsvVO;
import dlink_new.util.PasswordUtils;

@Controller
@RequestMapping("/front/mypage")
public class FrontMypageController {
	
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;
	
	@Resource(name = "FrontMypageService")
	private FrontMypageService frontMypageService;
	
	@Resource(name = "FrontDsnBankService")
	private FrontDsnBankService frontDsnBankService;
	
	@Resource(name = "frontDsnStdService")
    private FrontDsnStdService frontDsnStdService;
	
	@Resource(name = "tbMemService")
    private TbMemService tbMemService;
	
	@Resource(name = "FileService")
    private FileService fileService;
	
	@Resource(name = "tbAtalkTmplService")
	private TbAtalkTmplService tbAtalkTmplService;
	
	/* [사용자] 디자인뱅크 리스트 */
	@RequestMapping(value = { "/pkDsnList.do", "/imgDsnList.do", "/vidDsnList.do" })
	public String dBankList(@ModelAttribute("searchVO") TImgInfo searchVO, ModelMap model, HttpServletRequest req,
			HttpServletResponse response, HttpSession session) throws Exception {
		UrlPathHelper urlPathHelper = new UrlPathHelper();
		String originalURL = urlPathHelper.getOriginatingRequestUri(req);
		try {
			TbMemVO memVO = (TbMemVO) session.getAttribute("frontLoginVO");
			if(memVO == null) {
				model.addAttribute("msg", "fail");
				return "redirect:/front/login.do";
			}
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

			if (originalURL.equals("/front/mypage/pkDsnList.do")) {
				searchVO.setCode("0001");
			} else if (originalURL.equals("/front/mypage/imgDsnList.do")) {
				searchVO.setCode("0002");
			} else if (originalURL.equals("/front/mypage/vidDsnList.do")) {
				searchVO.setCode("0003");
			}
			searchVO.setMemId(memVO.getMemId());
			List<?> ImgInfoList = frontMypageService.selectMypageDsnList(searchVO);
			model.addAttribute("resultList", ImgInfoList);

			int totCnt = frontMypageService.selectMypageDsnListTotCnt(searchVO);
			paginationInfo.setTotalRecordCount(totCnt);
			model.addAttribute("paginationInfo", paginationInfo);

			model.addAttribute("searchVO", searchVO);
			searchVO.setSearchKeyword("");
			model.addAttribute("searchKeyword", searchVO.getSearchKeyword());
			/* model.addAttribute("loginVO", loginVO); */
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "/front/mypage/dsnLikeList";
	}
	
	/* [사용자]찜하기 취소 */
	@RequestMapping("/deleteLikeInfo.do")
	@ResponseBody
	public String insertLikeInfo(TImgInfo TImgInfo, @ModelAttribute("searchVO") TImgInfo searchVO, SessionStatus status)
			throws Exception {
		String rs = "";
		try {
			frontMypageService.deleteLikeInfo(searchVO);
			rs = "Y";
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return rs;
	}
	
	/** 시설예약리스트 */
	@RequestMapping(value="/sisulRsvList.do")
    public String sisulRsvList(TbSisulRsvVO tbSisulRsvVO, ModelMap model,
            HttpSession session, HttpServletRequest request, HttpServletResponse response,
            @ModelAttribute("searchVO") TbSisulRsvVO searchVO) throws Exception {
		
		TbMemVO memVO = (TbMemVO) session.getAttribute("frontLoginVO");
		if(memVO == null) {
			model.addAttribute("msg", "fail");
			return "redirect:/front/login.do";
		}
		
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
		
		searchVO.setMemSeq(memVO.getMemSeq().intValue());
		searchVO.setMemId(memVO.getMemId());
		
        List<?> tbSisulRsvList = frontDsnStdService.selectTbSisulRsvList_M(searchVO);
        model.addAttribute("resultList", tbSisulRsvList);
        
        int totCnt = frontDsnStdService.selectTbSisulRsvListTotCnt_M(searchVO);
		paginationInfo.setTotalRecordCount(totCnt);
        model.addAttribute("paginationInfo", paginationInfo);
		
        //List<?> sisulRsvList = frontDsnStdService.selectTbSisulRsv(tbSisulRsvVO);
        //model.addAttribute("sisulRsvList", sisulRsvList);
        
        return "/front/mypage/sisulRsvList";
    }
	
	/** 시설예약 글보기 & 덧글 */
	@RequestMapping(value="/sisulRsvView.do")
	public String sisulRsvView(TbSisulRsvVO tbSisulRsvVO,TbSisulRsvFileVO tbSisulRsvFileVO ,Model model,
			HttpSession session, HttpServletRequest request, HttpServletResponse response,
			@ModelAttribute("searchVO") TbSisulRsvDefaultVO searchVO) 
					throws Exception{		
		
		model.addAttribute("rsvSeq", frontDsnStdService.selectTbSisulRsvSeq(tbSisulRsvVO));
		
		List<?> rsvSeqList =  frontDsnStdService.selectTbSisulRsvSeqList(tbSisulRsvFileVO);
		model.addAttribute("rsvSeqList", rsvSeqList);
        
		List<?> tbSisulRsvReply = frontDsnStdService.selectTbSisulRsvReply(tbSisulRsvVO);
		model.addAttribute("resultReply", tbSisulRsvReply);
		
        // 조회수 증가
        tbSisulRsvVO.setSearchCondition("readCnt");
        frontDsnStdService.updateSisulRsvReadCnt(tbSisulRsvVO);
        
        return "/front/mypage/sisulRsvView";
	}
	
	
	@RequestMapping("/sisulRsvCancle.do")
	@ResponseBody
	public String sisulRsvCancle(TbSisulRsvVO tbSisulRsvVO, @ModelAttribute("searchVO") TbSisulRsvVO searchVO, SessionStatus status
			,HttpSession session)
			
			throws Exception {
		TbMemVO memVO = (TbMemVO) session.getAttribute("frontLoginVO");
		if(memVO == null) {			
			return "NO_LOGIN";
		}
		
		try {
			tbSisulRsvVO.setRsvSeq(searchVO.getRsvSeq());
			frontDsnStdService.sisulRsvCancle(tbSisulRsvVO);
			
			String rsvInfo = "예약날짜 : " + searchVO.getRsvYear() + "-" + searchVO.getRsvMonth() + "-" + searchVO.getRsvDay() + "\n"
					+"예약시간 : " + searchVO.getRsvSt() + ":00~" + searchVO.getRsvEt() + ":00";
			/*관리자에게 알림톡 전송*/
			TbAtalkTmplVO vo = new TbAtalkTmplVO();
			vo.setTmplCd("dlink_mts102");
			vo = tbAtalkTmplService.selectTbAtalkTmpl(vo);
			//assertNotNull(vo);
			String msg = "";
			if(null != vo) {
				msg = vo.getTranMsg();
				msg = msg.replace("#{예약정보}", rsvInfo);
				vo.setTranMsg(msg);
				tbAtalkTmplService.insertMtsAtalkMsg(vo);
			}
			
			/*사용자에게 알림톡 전송*/
			vo = new TbAtalkTmplVO();
			vo.setTmplCd("dlink_mts104");
			vo = tbAtalkTmplService.selectTbAtalkTmpl(vo);
			if(null != vo) {
				msg = vo.getTranMsg();
				msg = msg.replace("#{예약정보}", rsvInfo);
				vo.setTranMsg(msg);
				vo.setTranPhone(memVO.getHp().replace("-", ""));
				tbAtalkTmplService.insertMtsAtalkMsg(vo);
			}
			status.setComplete();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "Y";
	}
	/** 회원정보 수정 */
	@RequestMapping(value="/memView.do")
	public String memView(
			Model model,
			HttpSession session, 
			HttpServletRequest request, 
			HttpServletResponse response ) 
					throws Exception{
		
		TbMemVO memVO = (TbMemVO) session.getAttribute("frontLoginVO");
		if(memVO == null) {
			model.addAttribute("msg", "fail");
			return "redirect:/front/login.do";
		}
		
		TbMemVO tbMemVO = tbMemService.selectTbMem(memVO);
		if(null != tbMemVO) {
			session.setAttribute("frontLoginVO", tbMemVO);
			
			FileVO fileVO = new FileVO();
			
			if( null != tbMemVO.getComFileSeq() ) {
				fileVO.setFileSeq( new BigDecimal( tbMemVO.getComFileSeq() ) );
				FileVO comFileVO = fileService.selectTAttfile(fileVO);
				model.addAttribute("comFileVO", comFileVO);
			}
			
			if( null != tbMemVO.getSmBizFileSeq() ) {			
				fileVO.setFileSeq( new BigDecimal( tbMemVO.getSmBizFileSeq() ) );
				FileVO smBizFileVO = fileService.selectTAttfile(fileVO);
				model.addAttribute("smBizFileVO", smBizFileVO);
			}
		}
        
        return "/front/mypage/memView";
	}
	
	/** 회원정보 수정 요청 */
	@RequestMapping(value="/memView_act.do")
	@ResponseBody
	public String memViewAct(
			TbMemVO tbMemVO,
			ModelMap model,
			HttpServletRequest req,
			HttpServletResponse response,
			HttpSession session )
					throws Exception{
		
		TbMemVO memVO = (TbMemVO) session.getAttribute("frontLoginVO");
		if(memVO == null) {			
			return "NO_LOGIN";
		}
		
		tbMemVO.setMemSeq(memVO.getMemSeq());
		tbMemVO.setMemId(memVO.getMemId());
		/*tbMemVO.setMemNm(memVO.getMemNm());*/		
		
		memVO = tbMemService.selectTbMem(tbMemVO);
		if(null == memVO) {
			return "NO_EXIST";
		}		
		
		if( !StringUtils.isEmpty(tbMemVO.getMemPw()) ) {
    		String memPw = tbMemVO.getMemPw();
    		String encMemPw = PasswordUtils.encript(memPw);
    		tbMemVO.setMemPw(encMemPw);
    	}
		
		tbMemService.updateTbMem(tbMemVO);
		
		memVO = tbMemService.selectTbMem(tbMemVO);
		if(null == memVO) {
			return "N";
		}
		
		session.setAttribute("frontLoginVO", memVO);
		
		return "Y";
	}
	
	/** 회원탈퇴 */
	@RequestMapping(value="/memOut.do")
	public String memOut(
			Model model,
			HttpSession session, 
			HttpServletRequest request, 
			HttpServletResponse response ) 
					throws Exception{
		
		TbMemVO memVO = (TbMemVO) session.getAttribute("frontLoginVO");
		if(memVO == null) {
			model.addAttribute("msg", "fail");
			return "redirect:/front/login.do";
		}
		
//		TbMemVO tbMemVO = tbMemService.selectTbMem(memVO);
//		if(null != tbMemVO) {
//			session.setAttribute("frontLoginVO", tbMemVO);
//			
//			FileVO fileVO = new FileVO();
//			
//			fileVO.setFileSeq( new BigDecimal( tbMemVO.getComFileSeq() ) );
//			FileVO comFileVO = fileService.selectTAttfile(fileVO);
//			model.addAttribute("comFileVO", comFileVO);
//			
//			fileVO.setFileSeq( new BigDecimal( tbMemVO.getSmBizFileSeq() ) );
//			FileVO smBizFileVO = fileService.selectTAttfile(fileVO);
//			model.addAttribute("smBizFileVO", smBizFileVO);
//		}
        
        return "/front/mypage/memOut";
	}
	
	/** 회원탈퇴 요청 */
	@RequestMapping(value="/memOut_act.do")
	@ResponseBody
	public String memOutAct(
			TbMemVO tbMemVO,
			ModelMap model,
			HttpServletRequest req,
			HttpServletResponse response,
			HttpSession session )
					throws Exception{
		
		TbMemVO memVO = (TbMemVO) session.getAttribute("frontLoginVO");
		if(memVO == null) {			
			return "NO_LOGIN";
		}
		
		tbMemVO.setMemSeq(memVO.getMemSeq());
		tbMemVO.setMemId(memVO.getMemId());
		tbMemVO.setMemNm(memVO.getMemNm());		
		
		memVO = tbMemService.selectTbMem(tbMemVO);
		if(null == memVO) {
			return "NO_EXIST";
		}		
		
		String memPw = tbMemVO.getMemPw();
		if( StringUtils.isEmpty(memPw) ) {
			return "NO_PW";
		}
		
		String encMemPw = memVO.getMemPw();
		if( !PasswordUtils.isValid(memPw, encMemPw) ) {
			return "NO_PW_VALID";
		}
		
//		if( !StringUtils.isEmpty(tbMemVO.getMemPw()) ) {
//    		String memPw = tbMemVO.getMemPw();
//    		String encMemPw = PasswordUtils.encript(memPw);
//    		tbMemVO.setMemPw(encMemPw);
//    	}
		
		//tbMemVO.set
		
		memVO.setOutReason(tbMemVO.getOutReason());
		memVO.setLeaveMsg(tbMemVO.getLeaveMsg());
		memVO.setAcceptYn("O");
		
		tbMemService.updateTbMem(memVO);
		
		TbAtalkTmplVO vo = new TbAtalkTmplVO();
		vo.setTmplCd("dlink_mts002");
		vo = tbAtalkTmplService.selectTbAtalkTmpl(vo);
		//assertNotNull(vo);
		if(null != vo) {				
			String msg = vo.getTranMsg();		
			vo.setTranMsg(msg);
			
			java.lang.Integer tranPr = tbAtalkTmplService.insertMtsAtalkMsg(vo);
		}
		
		memVO = tbMemService.selectTbMem(memVO);
		if(null == memVO) {
			return "N";
		}
		
		//session.setAttribute("frontLoginVO", memVO);
		session.removeAttribute("frontLoginVO");
		
		return "Y";
	}
	

}
