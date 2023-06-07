package dlink_new.admin.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.egovframe.rte.fdl.property.EgovPropertyService;
import org.egovframe.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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
import dlink_new.admin.service.TbSisulRsvService;
import dlink_new.admin.vo.TbCodeVO;
import dlink_new.admin.vo.TbMemVO;
import dlink_new.admin.vo.TbSisulRsvDefaultVO;
import dlink_new.admin.vo.TbSisulRsvVO;
import dlink_new.common.service.TbAtalkTmplService;
import dlink_new.common.vo.TbAtalkTmplVO;

// Servoce 객체에 대한 import 구문
// import (service package).TbSisulRsvService;
// Vo 객체에 대한 import 구문
// import (vo package).TbSisulRsvDefaultVO;
// import (vo package).TbSisulRsvVO;

/**
 * @Class Name : TbSisulRsvController.java
 * @Description : TbSisulRsv Controller class
 * @Modification Information
 *
 * @author 김현재
 * @since 2023-01-21
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */

@Controller
//@SessionAttributes(types=TbSisulRsvVO.class)
public class TbSisulRsvController {
	
	private static final Logger LOGGER  = LoggerFactory.getLogger(TbSisulRsvController.class);

    @Resource(name = "tbSisulRsvService")
    private TbSisulRsvService tbSisulRsvService;
    
    /** EgovPropertyService */
    @Resource(name = "propertiesService")
    protected EgovPropertyService propertiesService;
    
    @Resource(name = "tbMemService")
	private TbMemService tbMemService;
    
    @Resource(name = "tbAtalkTmplService")
    private TbAtalkTmplService tbAtalkTmplService;
    
    @Resource(name = "tbCodeService")
    private TbCodeService tbCodeService;

	
    /**
	 * tb_sisul_rsv 목록을 조회한다. (pageing)
	 * @param searchVO - 조회할 정보가 담긴 TbSisulRsvDefaultVO
	 * @return "/admin/tbSisulRsv/TbSisulRsvList"
	 * @exception Exception
	 */
    @RequestMapping(value={"/admin/tbSisulRsv/TbSisulRsvList.do", "/admin/sisul/sisulRsvList.do"})
    public String selectTbSisulRsvList(@ModelAttribute("searchVO") TbSisulRsvVO searchVO, 
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
		
		TbCodeVO vo = new TbCodeVO();
        String searchKeyword = "plt001";
        vo.setSearchCondition("gbCd");
        vo.setSearchKeyword(searchKeyword);
        
//        vo.setGbCd("plt002");
//        vo.setGbCd("plt003");
//        vo.setGbCd("plt004");
        List<?> codelist = tbCodeService.selectTbCodeListFront(vo);
        model.addAttribute("codelist", codelist);
        
        List<?> tbSisulRsvList = tbSisulRsvService.selectTbSisulRsvList(searchVO);
        model.addAttribute("resultList", tbSisulRsvList);
        
        int totCnt = tbSisulRsvService.selectTbSisulRsvListTotCnt(searchVO);
		paginationInfo.setTotalRecordCount(totCnt);
        model.addAttribute("paginationInfo", paginationInfo);
        
        return "/admin/tbSisulRsv/TbSisulRsvList";
    } 
    
    
	@RequestMapping(value = {"/admin/tbSisulRsv/TbSisulRsvDetail.do", "/admin/excel/TbSisulRsvExcelDown.do"})
	public String selectTbSisulRsvDetail( TbSisulRsvVO searchVO, ModelMap model, HttpServletRequest req,
			HttpServletResponse response, HttpServletRequest request) throws Exception {
		UrlPathHelper urlPathHelper = new UrlPathHelper(); 
		String originalURL = urlPathHelper.getOriginatingRequestUri(request);
		boolean isExcel = false;
		if(originalURL.equals("/admin/excel/TbSisulRsvExcelDown.do")) {
			isExcel = true;
		}
		TbCodeVO vo = new TbCodeVO();
        String searchKeyword = "plt002,plt003,plt004,plt007,plt008";
        vo.setSearchCondition("gbCd");
        vo.setSearchKeyword(searchKeyword);
        
//        vo.setGbCd("plt002");
//        vo.setGbCd("plt003");
//        vo.setGbCd("plt004");
        List<?> codelist = tbCodeService.selectTbCodeListFront(vo);
        model.addAttribute("codelist", codelist);
		String startDate = searchVO.getStartDate();
		String endDate = searchVO.getEndDate();
		if(startDate == null && endDate == null) {
			try {
				TbSisulRsvVO tbSisulRsvVO = tbSisulRsvService.selectTbSisulRsv(searchVO);
				model.addAttribute("result", tbSisulRsvVO);
				
	        	List<?> tbSmBizFileList = tbSisulRsvService.selectSmBizFileList(searchVO);
	        	model.addAttribute("smFileList", tbSmBizFileList);
				
				List<?> tbSisulRsvFileList = tbSisulRsvService.selectTbSisulRsvFileList(searchVO);
		        model.addAttribute("fileList", tbSisulRsvFileList);
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		if(startDate != null && endDate != null) {
			try {
		        List<?> tbSisulRsvList = tbSisulRsvService.selectTbSisulRsvListExcel(searchVO);
		        model.addAttribute("resultList", tbSisulRsvList);
		        
	        	/*List<?> tbSisulRsvFileList = tbSisulRsvService.selectTbSisulRsvFileList(searchVO);
	        	model.addAttribute("fileList", tbSisulRsvFileList);
	        	
	        	List<?> tbSmBizFileList = tbSisulRsvService.selectSmBizFileList(searchVO);
	        	model.addAttribute("smFileList", tbSmBizFileList);*/
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		if(isExcel) {
			return "/admin/excel/TbSisulRsvExcel";
		}
		
		return "/admin/tbSisulRsv/TbSisulRsvDetail";
	}
	
	@RequestMapping("/admin/tbSisulRsv/TbSisulRsvCmt.do")
	
	public String TbSisulRsvCmt( TbSisulRsvVO searchVO, ModelMap model, HttpServletRequest req,
			HttpServletResponse response) throws Exception {

		List<?> tbSisulRsvReply = tbSisulRsvService.selectTbSisulRsvReply(searchVO);
        model.addAttribute("resultReply", tbSisulRsvReply);
        
        return "/admin/tbSisulRsvCmt/TbSisulRsvCmt";
    } 
	
	
	@RequestMapping("/admin/tbSisulRsv/TbSisulRsvReplyAdd.do")
	@ResponseBody
    public String tbSisulRsvReplyAdd(TbSisulRsvVO searchVO, Model model)
            throws Exception {
		
		String rs = "";
		try {
		
			tbSisulRsvService.insertRsvReply(searchVO);
			rs = "Y";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return rs;
    }
	
	@RequestMapping("/admin/tbSisulRsv/TbSisulRsvReplyUpdate.do")
	@ResponseBody
    public String TbSisulRsvReplyUpdate(TbSisulRsvVO searchVO, Model model)
            throws Exception {
		
		String rs = "";
		try {
		
			tbSisulRsvService.updateRsvReply(searchVO);
			rs = "Y";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return rs;
    }
	
	@RequestMapping("/admin/tbSisulRsv/TbSisulRsvAcceotUpdate.do")
	@ResponseBody
    public String TbSisulRsvAcceotUpdate(TbSisulRsvVO searchVO, Model model)
            throws Exception {
		
		String rs = "";
		try {
			TbMemVO memVO = new TbMemVO();
			//BigDecimal memSeq = new BigDecimal(searchVO.getMemSeq());
			memVO.setMemSeq(searchVO.getMemSeq());
			memVO = tbMemService.selectTbMem(memVO);
			
			tbSisulRsvService.updateTbSisulRsvAccept(searchVO);
			
			/*알림톡 발송*/
			TbAtalkTmplVO vo = new TbAtalkTmplVO();
			String rsvInfo = "예약날짜 : "+ searchVO.getRsvYear() + "-" + searchVO.getRsvMonth() + "-" + searchVO.getRsvDay() + "\n"
							+ "예약시간 : " + searchVO.getRsvSt() + ":00~" + searchVO.getRsvEt() + ":00";
			if( "Y".equals( searchVO.getAcceptYn() ) ) {
				vo.setTmplCd("dlink_mts105");
				vo = tbAtalkTmplService.selectTbAtalkTmpl(vo);
				//assertNotNull(vo);
				if(null != vo) {
					String msg = vo.getTranMsg();
					msg = msg.replace("#{예약정보}", rsvInfo);
					vo.setTranMsg(msg);
					vo.setTranPhone(memVO.getHp().replace("-", ""));
					tbAtalkTmplService.insertMtsAtalkMsg(vo);
				}
			} else if( "N".equals( searchVO.getAcceptYn() ) ) {
				vo.setTmplCd("dlink_mts106");
				vo = tbAtalkTmplService.selectTbAtalkTmpl(vo);
				//assertNotNull(vo);
				if(null != vo) {
					String msg = vo.getTranMsg();
					rsvInfo += "\n반려사유 : " + searchVO.getRejectMsg();
					msg = msg.replace("#{예약정보}", rsvInfo);
					vo.setTranMsg(msg);
					vo.setTranPhone(memVO.getHp().replace("-", ""));
					tbAtalkTmplService.insertMtsAtalkMsg(vo);
				}
			}
			rs = "Y";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return rs;
    }
	
	@RequestMapping("/admin/tbSisulRsv/TbSisulRsvReplyDelete.do")
	@ResponseBody
	public String TbSisulRsvReplyDelete(TbSisulRsvVO searchVO, Model model, SessionStatus status)
			throws Exception {
		
		try {
			tbSisulRsvService.deleteRsvReply(searchVO);
			status.setComplete();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "Y";
	}

	
    
    @RequestMapping("/admin/tbSisulRsv/addTbSisulRsvView.do")
    public String addTbSisulRsvView(
            @ModelAttribute("searchVO") TbSisulRsvDefaultVO searchVO, Model model)
            throws Exception {
        model.addAttribute("tbSisulRsvVO", new TbSisulRsvVO());
        return "/admin/tbSisulRsv/TbSisulRsvRegister";
    }
    
    @RequestMapping("/admin/tbSisulRsv/addTbSisulRsv.do")
    public String addTbSisulRsv(
            TbSisulRsvVO tbSisulRsvVO,
            @ModelAttribute("searchVO") TbSisulRsvDefaultVO searchVO, SessionStatus status)
            throws Exception {
        tbSisulRsvService.insertTbSisulRsv(tbSisulRsvVO);
        status.setComplete();
        return "forward:/admin/tbSisulRsv/TbSisulRsvList.do";
    }
    
    @RequestMapping("/admin/tbSisulRsv/updateTbSisulRsvView.do")
    public String updateTbSisulRsvView(
            @RequestParam("rsvSeq") int rsvSeq ,
            @ModelAttribute("searchVO") TbSisulRsvDefaultVO searchVO, Model model)
            throws Exception {
        TbSisulRsvVO tbSisulRsvVO = new TbSisulRsvVO();
        tbSisulRsvVO.setRsvSeq(rsvSeq);        
        // 변수명은 CoC 에 따라 tbSisulRsvVO
        model.addAttribute(selectTbSisulRsv(tbSisulRsvVO, searchVO));
        return "/admin/tbSisulRsv/TbSisulRsvRegister";
    }

    @RequestMapping("/admin/tbSisulRsv/selectTbSisulRsv.do")
    public @ModelAttribute("tbSisulRsvVO")
    TbSisulRsvVO selectTbSisulRsv(
            TbSisulRsvVO tbSisulRsvVO,
            @ModelAttribute("searchVO") TbSisulRsvDefaultVO searchVO) throws Exception {
        return tbSisulRsvService.selectTbSisulRsv(tbSisulRsvVO);
    }

    @RequestMapping("/admin/tbSisulRsv/updateTbSisulRsv.do")
    public String updateTbSisulRsv(
            TbSisulRsvVO tbSisulRsvVO,
            @ModelAttribute("searchVO") TbSisulRsvDefaultVO searchVO, SessionStatus status)
            throws Exception {
        tbSisulRsvService.updateTbSisulRsv(tbSisulRsvVO);
        status.setComplete();
        return "forward:/admin/tbSisulRsv/TbSisulRsvList.do";
    }
    
    @RequestMapping("/admin/tbSisulRsv/deleteTbSisulRsv.do")
    public String deleteTbSisulRsv(
            TbSisulRsvVO tbSisulRsvVO,
            @ModelAttribute("searchVO") TbSisulRsvDefaultVO searchVO, SessionStatus status)
            throws Exception {
        tbSisulRsvService.deleteTbSisulRsv(tbSisulRsvVO);
        status.setComplete();
        return "forward:/admin/tbSisulRsv/TbSisulRsvList.do";
    }
    
    @RequestMapping("/admin/tbSisulRsv/updateRsvDt.do")
    @ResponseBody
    public String updateRsvDt (TbSisulRsvVO searchVO, Model model, SessionStatus status) throws Exception {
		String rs = "";
		try {
		
			tbSisulRsvService.updateRsvDt(searchVO);
			rs = "Y";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return rs;
    }
    
 
    @RequestMapping(value={"/admin/tbSisulRsv/updateZipFile.do", "/admin/tbSisulRsv/deleteZipFile.do"})
    @ResponseBody
    public String updateZipFile (TbSisulRsvVO searchVO, Model model, SessionStatus status, HttpServletRequest req) throws Exception {
		String rs = "";
		try {
			UrlPathHelper urlPathHelper = new UrlPathHelper(); 
			String originalURL = urlPathHelper.getOriginatingRequestUri(req);
			if(originalURL.equals("/admin/tbSisulRsv/deleteZipFile.do")) {
				searchVO.setZipFileSeq("");
			} else {
				searchVO.setZipFileSeq(Integer.toString(searchVO.getFileSeq()));
			}
		
			tbSisulRsvService.updateZipFile(searchVO);
			
			/*납기본 업로드 시 알림톡 전송*/
			if(originalURL.equals("/admin/tbSisulRsv/updateZipFile.do")) {
				TbMemVO memVO = new TbMemVO();
				memVO.setMemId(searchVO.getMemId());
				memVO.setMemSeq(searchVO.getMemSeq());
				memVO = tbMemService.selectTbMem(memVO);
				
				
				TbAtalkTmplVO vo = new TbAtalkTmplVO();	
				vo.setTmplCd("dlink_mts107");	
				vo = tbAtalkTmplService.selectTbAtalkTmpl(vo);
				String msg = "";
				//assertNotNull(vo);	
				if(null != vo) {
					msg = vo.getTranMsg();	
					msg = msg.replace("#{설문링크}", searchVO.getSurveyLink());	
					vo.setTranMsg(msg);	
					vo.setTranPhone(memVO.getHp().replace("-", ""));
						
					tbAtalkTmplService.insertMtsAtalkMsg(vo);
				}
			}
			rs = "Y";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return rs;
    }
    
    
    
}
