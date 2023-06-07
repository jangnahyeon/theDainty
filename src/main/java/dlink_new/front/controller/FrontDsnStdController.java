package dlink_new.front.controller;

import java.math.BigDecimal;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.egovframe.rte.fdl.property.EgovPropertyService;
import org.egovframe.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import dlink_new.admin.service.TbBrdService;
import dlink_new.admin.service.TbCodeService;
import dlink_new.admin.service.TbSisulHldService;
import dlink_new.admin.vo.TbBrdVO;
import dlink_new.admin.vo.TbCodeVO;
import dlink_new.admin.vo.TbMemVO;
import dlink_new.admin.vo.TbSisulHldDefaultVO;
import dlink_new.common.service.FileService;
import dlink_new.common.service.TbAtalkTmplService;
import dlink_new.common.vo.TbAtalkTmplVO;
import dlink_new.front.service.FrontDsnStdService;
// Vo 객체에 대한 import 구문
// import (vo package).TbSisulRsvDefaultVO;
// import (vo package).TbSisulRsvVO;
import dlink_new.front.vo.TbSisulRsvDefaultVO;
import dlink_new.front.vo.TbSisulRsvFileVO;
import dlink_new.front.vo.TbSisulRsvVO;
import dlink_new.util.PasswordUtils;

/**
 * @Class Name : TbSisulRsvController.java
 * @Description : TbSisulRsv Controller class
 * @Modification Information
 *
 * @author 이재욱
 * @since 2023-01-16
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */

@Controller
@RequestMapping("/front/dsnStd")
public class FrontDsnStdController {

    @Resource(name = "frontDsnStdService")
    private FrontDsnStdService frontDsnStdService;
    
    /** EgovPropertyService */
    @Resource(name = "propertiesService")
    protected EgovPropertyService propertiesService;
	
    @Resource(name = "tbCodeService")
    private TbCodeService tbCodeService;
    
    @Resource(name = "FileService")
    private FileService FileService;
    
    @Resource(name = "tbBrdService")
    private TbBrdService tbBrdService;
    
    @Resource(name = "tbAtalkTmplService")	
    private TbAtalkTmplService tbAtalkTmplService;
    
    @Resource(name = "tbSisulHldService")
    private TbSisulHldService tbSisulHldService;
    /**
	 * tb_sisul_rsv 목록을 조회한다. (pageing)
	 * @param searchVO - 조회할 정보가 담긴 TbSisulRsvDefaultVO
	 * @return "/tbSisulRsv/TbSisulRsvList"
	 * @exception Exception
	 */
    
	/** 시설예약 페이지 */
	@RequestMapping(value="/sisulRsv.do")
    public String selectTbSisulRsv(TbSisulRsvVO tbSisulRsvVO, ModelMap model,
            HttpSession session, HttpServletRequest request, HttpServletResponse response,
            @ModelAttribute("searchVO") TbSisulRsvDefaultVO searchVO) throws Exception {
        List<?> resultList = frontDsnStdService.selectTbSisulRsv_L(tbSisulRsvVO);
        model.addAttribute("resultList", resultList);
        
        TbSisulHldDefaultVO hldVO = new TbSisulHldDefaultVO();
        List<?> hldList = tbSisulHldService.selectTbSisulHld_L(hldVO);
        model.addAttribute("hldList", hldList);
        return "/front/dsnStd/sisulRsv";
    }
	
	/** 시설예약_예약게시판_글쓰기 */
	@RequestMapping(value="/sisulRsvBoardForm.do")
	public String sisulRsvBoardForm(
    		HttpServletRequest req, HttpSession session, HttpServletResponse response,
    		ModelMap model, @ModelAttribute("searchVO") TbSisulRsvVO searchVO, TbSisulRsvVO tbSisulRsvVO)
            throws Exception {
        List<?> sisulRsvList = frontDsnStdService.selectTbSisulRsv(tbSisulRsvVO);
        model.addAttribute("sisulRsvList", sisulRsvList);

        TbCodeVO vo = new TbCodeVO();
        String searchKeyword = "plt002,plt003,plt004,plt007,plt008";
        vo.setSearchCondition("gbCd");
        vo.setSearchKeyword(searchKeyword);
        
//        vo.setGbCd("plt002");
//        vo.setGbCd("plt003");
//        vo.setGbCd("plt004");
        List<?> codelist = tbCodeService.selectTbCodeListFront(vo);
        model.addAttribute("codelist", codelist);
        
		model.addAttribute("resultList", searchVO);
		
        TbSisulHldDefaultVO hldVO = new TbSisulHldDefaultVO();
        List<?> hldList = tbSisulHldService.selectTbSisulHld(hldVO);
        model.addAttribute("hldList", hldList);
		
		return "/front/dsnStd/sisulRsvBoardForm";
    }
	
	/** 시설예약정보저장 */	
	@RequestMapping(value="/addSisulRsv.do")	
	public String addSisulRsv(	
			TbSisulRsvVO TbSisulRsvVO, @ModelAttribute("searchVO") TbSisulRsvVO searchVO,	
			BigDecimal multiFileSeq[],	
			HttpServletRequest request, HttpServletResponse response, Model mode, HttpSession session) throws Exception{
			try {	
				TbMemVO memVO = (TbMemVO) session.getAttribute("frontLoginVO");	
				mode.addAttribute("memVO", memVO);
				
				String encPwd = PasswordUtils.encript(TbSisulRsvVO.getPwd());
				TbSisulRsvVO.setPwd(encPwd);
				if(TbSisulRsvVO.getSmBizFileSeq().equals("")) {
					TbSisulRsvVO.setSmBizFileSeq(null);
				}
				int rsvSeq = frontDsnStdService.insertTbSisulRsvForm(TbSisulRsvVO);	
					
	//			frontDsnStdService.insertTbSisulRsvImgInfo(TbSisulRsvVO);	
					
				if(multiFileSeq != null) {	
					for(int i=0; i<multiFileSeq.length; i++) {	
						searchVO.setRsvSeq(rsvSeq);	
						searchVO.setFileSeq(multiFileSeq[i]);	
						frontDsnStdService.insertTbSisulRsvMultiImg(searchVO);	
					}	
				}	
				String rsvInfo = "예약날짜 : " + searchVO.getRsvYear() + "-" + searchVO.getRsvMonth() + "-" + searchVO.getRsvDay() + "\n"	
						+ "예약시간 : " + searchVO.getRsvSt() + ":00~" + searchVO.getRsvEt() + ":00";	
				/*관리자에게 알림톡 전송*/	
				TbAtalkTmplVO vo = new TbAtalkTmplVO();	
				vo.setTmplCd("dlink_mts101");	
				vo = tbAtalkTmplService.selectTbAtalkTmpl(vo);
				String msg = "";
				//assertNotNull(vo);	
				if(null != vo) {
					msg = vo.getTranMsg();	
					msg = msg.replace("#{예약정보}", rsvInfo);	
					vo.setTranMsg(msg);	
						
					tbAtalkTmplService.insertMtsAtalkMsg(vo);
				}
					
				/*사용자에게 알림톡 전송*/	
				vo = new TbAtalkTmplVO();
				vo.setTmplCd("dlink_mts103");	
				vo = tbAtalkTmplService.selectTbAtalkTmpl(vo);	
				//assertNotNull(vo);	
				if(null != vo) {
					msg = vo.getTranMsg();	
					msg = msg.replace("#{예약정보}", rsvInfo);	
					vo.setTranMsg(msg);	
					vo.setTranPhone(memVO.getHp().replace("-", ""));	
						
					tbAtalkTmplService.insertMtsAtalkMsg(vo);	
				}
					
			}catch(Exception e) {	
				e.printStackTrace();	
			}	
			return "redirect:/front/dsnStd/sisulRsvList.do";	
		}
    
	/** 시설예약리스트 */
	@RequestMapping(value="/sisulRsvList.do")
    public String sisulRsvList(HttpSession session, TbSisulRsvVO tbSisulRsvVO,TbSisulRsvFileVO tbSisulRsvFileVO , ModelMap model,
    		HttpServletRequest request, HttpServletResponse response,
            @ModelAttribute("searchVO") TbSisulRsvVO searchVO, TbBrdVO tbBrdVO) throws Exception {
		try {
			TbMemVO memVO = (TbMemVO) session.getAttribute("frontLoginVO");
			model.addAttribute("memVO", memVO);
			
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
			
	        List<?> tbSisulRsvList = frontDsnStdService.selectTbSisulRsvList(searchVO);
	        model.addAttribute("resultList", tbSisulRsvList);
	        
	        int totCnt = frontDsnStdService.selectTbSisulRsvListTotCnt(searchVO);
			paginationInfo.setTotalRecordCount(totCnt);
	        model.addAttribute("paginationInfo", paginationInfo);
			
	        List<?> sisulRsvList = frontDsnStdService.selectTbSisulRsv(tbSisulRsvVO);
	        model.addAttribute("sisulRsvList", sisulRsvList);
	
	        //model.addAttribute("brdLast", tbBrdService.selectTbBrdLast(tbBrdVO));
	        tbBrdVO.setSearchCondition("srcNm");
	        tbBrdVO.setSearchKeyword("시설예약 공지사항");
	        tbBrdVO.setMenuSeq(3);
	        List<?> brdList = tbBrdService.selectTbBrdList(tbBrdVO);
	        model.addAttribute("brdList", brdList);
		} catch (Exception e) {
			e.printStackTrace();
		}
        return "/front/dsnStd/sisulRsvList";
    }
	
	/** 시설예약 글보기 & 덧글 */
	@RequestMapping(value="/sisulRsvView.do")
	public String sisulRsvView(TbSisulRsvVO tbSisulRsvVO,TbSisulRsvFileVO tbSisulRsvFileVO, Model model,
			HttpSession session, HttpServletRequest request, HttpServletResponse response,
			@ModelAttribute("searchVO") TbSisulRsvDefaultVO searchVO) throws Exception{
		
		TbCodeVO vo = new TbCodeVO();
        String searchKeyword = "plt002,plt003,plt004,plt007,plt008";
        vo.setSearchCondition("gbCd");
        vo.setSearchKeyword(searchKeyword);
        
//        vo.setGbCd("plt002");
//        vo.setGbCd("plt003");
//        vo.setGbCd("plt004");
        List<?> codelist = tbCodeService.selectTbCodeListFront(vo);
        model.addAttribute("codelist", codelist);
		
		model.addAttribute("rsvSeq", frontDsnStdService.selectTbSisulRsvSeq(tbSisulRsvVO));
		
		List<?> rsvSeqList =  frontDsnStdService.selectTbSisulRsvSeqList(tbSisulRsvFileVO);
		model.addAttribute("rsvSeqList", rsvSeqList);
		
		List<?> tbSisulRsvReply = frontDsnStdService.selectTbSisulRsvReply(tbSisulRsvVO);
		model.addAttribute("resultReply", tbSisulRsvReply);
        
        // 조회수 증가
        tbSisulRsvVO.setSearchCondition("readCnt");
        frontDsnStdService.updateSisulRsvReadCnt(tbSisulRsvVO);
        
        return "/front/dsnStd/sisulRsvView";
	}
	
	/** 시설소개 */
	@RequestMapping(value={"/sisulIntro.do"})
	public String dsnStdSisulIntro(
			ModelMap model,
			HttpServletRequest req,
			HttpSession session,
			HttpServletResponse response)
			throws Exception{
		
		return "/front/dsnStd/sisulIntro";
	}
	
	/** 이용안내 */
	@RequestMapping(value={"/sisulUseGuide.do"})
	public String dsnStdSisulUseGuide(
			ModelMap model,
			HttpServletRequest req,
			HttpSession session,
			HttpServletResponse response)
			throws Exception{
		
		return "/front/dsnStd/sisulUseGuide";
	}
}
