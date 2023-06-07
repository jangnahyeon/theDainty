package dlink.admin.controller;

import java.io.File;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.egovframe.rte.fdl.property.EgovPropertyService;
import org.egovframe.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.support.SessionStatus;

import dlink.admin.service.TCodeService;
import dlink.admin.service.TDsnBankService;
import dlink.admin.vo.TCodeVO;
import dlink.admin.vo.TDsnBankVO;
import dlink.admin.vo.TMemAccptVO;
import dlink.common.service.CommProperties;
import dlink.common.service.TAttfileService;
import dlink.common.vo.TAttfileVO;


/**
 * @Class Name : TDsnBankController.java
 * @Description : TDsnBank Controller class
 * @Modification Information
 *
 * @author 장나현
 * @since 2022-04-11
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */

@Controller
@RequestMapping("/admin/dsn")
public class AdminDsnBankController {

    @Resource(name = "TDsnBankService")
    private TDsnBankService TDsnBankService;
    
    /** EgovPropertyService */
    @Resource(name = "propertiesService")
    protected EgovPropertyService propertiesService;
	
    @Resource(name = "TCodeService")
    private TCodeService TCodeService;
    
    @Resource(name = "TAttfileService")
    private TAttfileService tAttfileService;
    /**
	 * t_dsn_bank 목록을 조회한다. (pageing)
	 * @param searchVO - 조회할 정보가 담긴 TDsnBankVO
	 * @return "/TDsnBank/TDsnBankList"
	 * @exception Exception
	 */
    @RequestMapping(value="/dsnBankList.do")
    public String dsnBankList(@ModelAttribute("searchVO") TDsnBankVO searchVO, 
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
		
        List<?> TDsnBankList = TDsnBankService.selectTDsnBankList(searchVO);
        model.addAttribute("resultList", TDsnBankList);
        
        int totCnt = TDsnBankService.selectTDsnBankListTotCnt(searchVO);
		paginationInfo.setTotalRecordCount(totCnt);
        model.addAttribute("paginationInfo", paginationInfo);
        
        TCodeVO codeVO = new TCodeVO();
    	codeVO.setUseYn("Y");
    	codeVO.setGubun("PA");
    	List<TCodeVO> codeList = TCodeService.selectTCodeList(codeVO);
    	model.addAttribute("codeList", codeList);
    	
        return "/admin/dsnBank/dsnBankList";
    } 
    
    @RequestMapping("/dsnBankDetail.do")
    public String dsnBankView(
            @ModelAttribute("dsnBankVO") TDsnBankVO dsnBankVO, Model model)
            throws Exception {
    	TCodeVO codeVO = new TCodeVO();
    	codeVO.setUseYn("Y");
    	codeVO.setGubun("PA");
    	List<TCodeVO> codeList = TCodeService.selectTCodeList(codeVO);
    	model.addAttribute("codeList", codeList);
    	
    	dsnBankVO = TDsnBankService.selectTDsnBank(dsnBankVO);
    	model.addAttribute("dsnBankVO", dsnBankVO);
        return "/admin/dsnBank/dsnBankDetail";
    }
    
    @RequestMapping("/addDsnBankView.do")
    public String addDsnBankView(
            @ModelAttribute("dsnBankVO") TDsnBankVO dsnBankVO, Model model)
            throws Exception {
    	TCodeVO codeVO = new TCodeVO();
    	codeVO.setUseYn("Y");
    	codeVO.setGubun("PA");
    	List<TCodeVO> codeList = TCodeService.selectTCodeList(codeVO);
    	model.addAttribute("codeList", codeList);
        
        model.addAttribute("dsnBankVO", new TDsnBankVO());
        return "/admin/dsnBank/dsnBankWrite";
    }
    
    @RequestMapping("/updateDsnBankView.do")
    public String updateDsnBankView(
            @ModelAttribute("dsnBankVO") TDsnBankVO dsnBankVO, Model model)
            throws Exception {
        // 변수명은 CoC 에 따라 TDsnBankVO
    	TCodeVO codeVO = new TCodeVO();
    	codeVO.setUseYn("Y");
    	codeVO.setGubun("PA");
    	List<TCodeVO> codeList = TCodeService.selectTCodeList(codeVO);
    	model.addAttribute("codeList", codeList);
    	
        model.addAttribute("dsnBankVO",TDsnBankService.selectTDsnBank(dsnBankVO));
        return "/admin/dsnBank/dsnBankWrite";
    }
    
    
    @RequestMapping("/addDsnBank.do")
    public String addDsnBank(
            TDsnBankVO TDsnBankVO, SessionStatus status ,Model model, HttpSession session)
            throws Exception {
    	//사용자 로그인 확인 Start
		TMemAccptVO loginVO = (TMemAccptVO) session.getAttribute("DlinkLogin");
		if(loginVO == null) {
			model.addAttribute("msg", "fail");
			return "redirect:/admin/login.do";
		}
		//사용자 로그인 확인 End
		TDsnBankVO.setRegister(loginVO.getLoginId());
        TDsnBankService.insertTDsnBank(TDsnBankVO);
        status.setComplete();
        return "redirect:/admin/dsn/dsnBankList.do";
    }
    

    @RequestMapping("/updateDsnBank.do")
    public String updateTDsnBank(
            TDsnBankVO TDsnBankVO,
            @ModelAttribute("searchVO") TDsnBankVO searchVO, SessionStatus status,Model model, HttpSession session)
            throws Exception {
    	//사용자 로그인 확인 Start
		TMemAccptVO loginVO = (TMemAccptVO) session.getAttribute("DlinkLogin");
		if(loginVO == null) {
			model.addAttribute("msg", "fail");
			return "redirect:/admin/login.do";
		}
		//사용자 로그인 확인 End
		TDsnBankVO.setRegister(loginVO.getLoginId());
        TDsnBankService.updateTDsnBank(TDsnBankVO);
        status.setComplete();
        return "redirect:/admin/dsn/dsnBankList.do";
    }
    
    @RequestMapping("/deleteTDsnBank.do")
    public String deleteTDsnBank(
            TDsnBankVO TDsnBankVO, SessionStatus status,Model model, HttpSession session)
            throws Exception {
    	//사용자 로그인 확인 Start
		TMemAccptVO loginVO = (TMemAccptVO) session.getAttribute("DlinkLogin");
		if(loginVO == null) {
			model.addAttribute("msg", "fail");
			return "redirect:/admin/login.do";
		}
		
		try {
			//사용자 로그인 확인 End
			TDsnBankVO.setRegister(loginVO.getLoginId());
	        TDsnBankService.deleteTDsnBank(TDsnBankVO);
			try {
				TAttfileVO att = new TAttfileVO();
				att.setFileSeq(TDsnBankVO.getFileSeq());
				att = tAttfileService.selectTAttfile(att);
					if(null != att) {
						String stordFilePath = CommProperties.getProperty("Globals.fileStorePath");
						String path = stordFilePath + att.getSavePath() +System.getProperty("file.separator") + att.getFileSaveNm();
						File file = new File(path);
						if(file.exists()) {
							file.delete();
						}
					}
					//파일 정보 삭제
					tAttfileService.deleteTAttfile(att);
					
				
			} catch (NullPointerException e) {
				e.printStackTrace();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
        status.setComplete();
        return "redirect:/admin/dsn/dsnBankList.do";
    }
    
}
