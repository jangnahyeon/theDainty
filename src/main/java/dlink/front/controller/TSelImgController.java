package dlink.front.controller;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.egovframe.rte.fdl.property.EgovPropertyService;
import org.egovframe.rte.psl.dataaccess.util.EgovMap;
import org.egovframe.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import dlink.admin.service.TCodeService;
import dlink.admin.service.TMemComService;
import dlink.admin.vo.SearchVO;
import dlink.admin.vo.TCodeVO;
import dlink.admin.vo.TMemAccptVO;
import dlink.common.vo.TPtplimgVO;
import dlink.front.service.FrontDsnBankService;
import dlink.front.service.FrontTPtplInfoService;
import dlink.front.service.TSelImgService;
import dlink.front.vo.FrontDsnBankVO;
import dlink.front.vo.TPtplInfoVO;
import dlink.front.vo.TSelImgVO;

/**
 * @Class Name : TSelImgController.java
 * @Description : TSelImg Controller class
 * @Modification Information
 *
 * @author 이효진
 * @since 2022-04-14
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */

@Controller
@RequestMapping("/front/Interest")
public class TSelImgController {

	
    @Resource(name = "TSelImgService")
    private TSelImgService TSelImgService;
    
    /** EgovPropertyService */
    @Resource(name = "propertiesService")
    protected EgovPropertyService propertiesService;
    
    @Resource(name = "TCodeService")
    private TCodeService tCodeService;
    
    @Resource(name = "TptplimgService")
    private dlink.common.service.TptplimgService TptplimgService;
	

    @Resource(name = "TMemComService")
    private TMemComService TMemComService;
    
    @Resource(name = "FrontTPtplInfoService")
    private FrontTPtplInfoService frontTPtplInfoService;
    
    @Resource(name = "TCodeService")
    private TCodeService TCodeService;
    
    @Resource(name = "FrontDsnBankService")
    private FrontDsnBankService FrontDsnBankService;
    
    /**
	 * t_sel_img 목록을 조회한다. (pageing)
	 * @param searchVO - 조회할 정보가 담긴 TSelImgDefaultVO
	 * @return "/TSelImg/TSelImgList"
	 * @exception Exception
	 */
    @RequestMapping(value="/proCompany.do")
    public String selectTSelImgList(@ModelAttribute("searchVO") SearchVO searchVO,     	
    		ModelMap model,  HttpSession session, HttpServletRequest request)
            throws Exception {
    	
    	String selGb = request.getParameter("sel_gb");
    	String res = " ";
    	
    	//사용자 로그인 확인 Start
		TMemAccptVO loginVO = (TMemAccptVO) session.getAttribute("DlinkLogin");
		if(loginVO == null) {
			model.addAttribute("msg", "fail");
			return "redirect:/front/login.do";
		}
		//사용자 로그인 확인 End
		if(selGb.equals("agency")){
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
				searchVO.setUserId(loginVO.getLoginId());
				searchVO.setSelGb(selGb);
		        List<?> TSelImgList = TSelImgService.selectTSelImgList(searchVO);
		        
		        int totCnt = TSelImgService.selectTSelImgListTotCnt(searchVO);
				paginationInfo.setTotalRecordCount(totCnt);
		        model.addAttribute("paginationInfo", paginationInfo);
		        
		        for (int i = 0; i < TSelImgList.size(); i++) {
		        	EgovMap map = (EgovMap)TSelImgList.get(i);
		        	
		        	//1. 포트폴리오 List 정보를 가지고 이미지를 select 값을 설정 함
		        	//String 포트폴리오변수 = (String)map.get("포트폴리오 pk");
		        	String loginId = (String) map.get("loginId");
		        	
		        	TPtplimgVO TPtplimgVO = new TPtplimgVO();
		        	TPtplimgVO.setLoginId(loginId);
		        	
		        	//2.파일 List를 가지고옴(포트폴리오 이미지 파일 정보)
		        	// List<?> fileList = TMemComService.selectagSearchList(searchVO);
		        	List<?> imgList = TptplimgService.selectTptplimgList(TPtplimgVO);
		        	
		        	//3.파일 리스트를 map에 담아줌
		        	map.put("imgList", imgList);
		        	
				}
		        
		        // 기업정보
		        
		        for (int i = 0; i < TSelImgList.size(); i++) {
		        	EgovMap map = (EgovMap)TSelImgList.get(i);
		        	
		        	//1. 포트폴리오 List 정보를 가지고 이미지를 select 값을 설정 함
		        	//String 포트폴리오변수 = (String)map.get("포트폴리오 pk");
		        	String loginId = (String)map.get("loginId");
		        	
		        	SearchVO ssearchVO = new SearchVO();
		        	ssearchVO.setLoginId(loginId);
		        	ssearchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		        	ssearchVO.setLastIndex(paginationInfo.getLastRecordIndex());
		        	ssearchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		        	
		        	//2.파일 List를 가지고옴(포트폴리오 이미지 파일 정보)
		        	// List<?> fileList = TMemComService.selectagSearchList(searchVO);
		        	ssearchVO.setSpecYn("Y");
		        	  List<?> agSearchList = TMemComService.selectagSearchList(ssearchVO);
		              
		        	//3.파일 리스트를 map에 담아줌
		        	map.put("agSearchList", agSearchList);
		        	
				}
		        
		        model.addAttribute("TSelImgList", TSelImgList);
		        
		        
		        // 의뢰하기 모달창에서 사용자구분 필요
		        TCodeVO CPcode = new TCodeVO();
		        CPcode.setGubun("CP");
		        CPcode.setPagingYn("N");
		        List<TCodeVO> codeListCP = tCodeService.selectTCodeList(CPcode);
		        model.addAttribute("codeListCP", codeListCP);
		        
		        // 의뢰하기 모달창에서 사용자 아이디 필요 
		        model.addAttribute("loginVO", loginVO);
		        
		        res =  "/front/Intertest/proCompanyList";
		        
		}else if(selGb.equals("ptpl")){
				
				TPtplInfoVO TPtplInfosearchVO = new TPtplInfoVO();
			
		    	/** EgovPropertyService.sample */
				TPtplInfosearchVO.setPageUnit(propertiesService.getInt("pageUnit"));
				TPtplInfosearchVO.setPageSize(propertiesService.getInt("pageSize"));
		    	
		    	/** pageing */
		    	PaginationInfo paginationInfo = new PaginationInfo();
				paginationInfo.setCurrentPageNo(TPtplInfosearchVO.getPageIndex());
				paginationInfo.setRecordCountPerPage(20);
				paginationInfo.setPageSize(TPtplInfosearchVO.getPageSize());
				
				TPtplInfosearchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
				TPtplInfosearchVO.setLastIndex(paginationInfo.getLastRecordIndex());
				TPtplInfosearchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
				TPtplInfosearchVO.setSelGb(selGb);
				TPtplInfosearchVO.setLoginId(loginVO.getLoginId());
				
				
				
				List<String> listPT = new ArrayList<>();
				List<String> listPS = new ArrayList<>();
				List<String> listAP = new ArrayList<>();
				String arrVal = null;
				if(TPtplInfosearchVO.getStrArr() != null) {
					
					String[] str = TPtplInfosearchVO.getStrArr().split(",");
					TPtplInfosearchVO.setArr(str);
					
					for(int i = 0; i < TPtplInfosearchVO.getArr().length; i++) {
						
						
						if(!TPtplInfosearchVO.getArr()[i].isEmpty()) {
							arrVal = TPtplInfosearchVO.getArr()[i].substring(0,2);
							
							if(arrVal.equals("PT")) {    				
								listPT.add(TPtplInfosearchVO.getArr()[i]);
							} else if(arrVal.equals("PS")) {
								listPS.add(TPtplInfosearchVO.getArr()[i]);
							} else if(arrVal.equals("AP")) {
								listAP.add(TPtplInfosearchVO.getArr()[i]);
							} else {
								
							}
						}
						
					}
					TPtplInfosearchVO.setArrPtplType(listPT);
					TPtplInfosearchVO.setArrPtplStyle(listPS);
					TPtplInfosearchVO.setArrAddOption(listAP);
				}
				
				/*임시*/
				
				TCodeVO code = new TCodeVO();
		        code.setGubun("PA");
		        code.setPagingYn("N");
		        List<TCodeVO> codeListPA = tCodeService.selectTCodeList(code);
		        model.addAttribute("codeListPA", codeListPA);
		        if(TPtplInfosearchVO.getPtplPart() == null || TPtplInfosearchVO.getPtplPart().isEmpty()) {
		        	TPtplInfosearchVO.setPtplPart(codeListPA.get(0).getCode());
		        }
		        
		        // 관심정보 > 포트폴리오 정보
		        List<?> TPtplInfoList = frontTPtplInfoService.selectInterestPtplList(TPtplInfosearchVO);
		        model.addAttribute("resultList", TPtplInfoList);
		        
		        
		        int totCnt = frontTPtplInfoService.selectInterestPtplListTotCnt(TPtplInfosearchVO);
				paginationInfo.setTotalRecordCount(totCnt);
		        model.addAttribute("paginationInfo", paginationInfo);
		        
		        // 의뢰하기 모달창에서 사용자구분 필요
		        TCodeVO CPcode = new TCodeVO();
		        CPcode.setGubun("CP");
		        CPcode.setPagingYn("N");
		        List<TCodeVO> codeListCP = tCodeService.selectTCodeList(CPcode);
		        model.addAttribute("codeListCP", codeListCP);
		        
		        
		        // 의뢰하기 모달창에서 사용자 아이디 필요 
		        model.addAttribute("loginVO", loginVO);
		        
		        res = "/front/Intertest/SearchPortfolio";
		        
		        
		}else if(selGb.equals("dsn")){
			
			FrontDsnBankVO DsnBankvo = new  FrontDsnBankVO();
			
			/** EgovPropertyService.sample */
			DsnBankvo.setPageUnit(propertiesService.getInt("pageUnit"));
			DsnBankvo.setPageSize(propertiesService.getInt("pageSize"));
	    	
	    	/** pageing */
	    	PaginationInfo paginationInfo = new PaginationInfo();
			paginationInfo.setCurrentPageNo(DsnBankvo.getPageIndex());
			paginationInfo.setRecordCountPerPage(DsnBankvo.getPageUnit());
			paginationInfo.setPageSize(20);
			
			DsnBankvo.setFirstIndex(paginationInfo.getFirstRecordIndex());
			DsnBankvo.setLastIndex(paginationInfo.getLastRecordIndex());
			DsnBankvo.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
			DsnBankvo.setSelGb(selGb);
			DsnBankvo.setUserId(loginVO.getLoginId());
			
			try {
				
				List<?> TDsnBankList = FrontDsnBankService.selectInterestDsnBankList(DsnBankvo);
				model.addAttribute("resultList", TDsnBankList);
				
			}catch (Exception e) {
				FrontDsnBankService.createTable(DsnBankvo);
	    		session.setAttribute("DLinkDsnBank","Y");
	    		
	    		List<?> TDsnBankList = FrontDsnBankService.selectInterestDsnBankList(DsnBankvo);
				model.addAttribute("resultList", TDsnBankList);
			}
	        
	        int totCnt = FrontDsnBankService.selectInterestDsnBankListTotCnt(DsnBankvo);
			paginationInfo.setTotalRecordCount(totCnt);
	        model.addAttribute("paginationInfo", paginationInfo);
	        
	        TCodeVO codeVO = new TCodeVO();
	    	codeVO.setUseYn("Y");
	    	codeVO.setGubun("PA");
	    	List<TCodeVO> codeList = TCodeService.selectTCodeList(codeVO);
	    	model.addAttribute("codeList", codeList);
	    	
	    	res = "/front/Intertest/dsnBankList";
	        
		}
        return res;
    } 
    
    
    @RequestMapping("/addTSelImgView.do")
    public String addTSelImgView(
            @ModelAttribute("searchVO") SearchVO searchVO, Model model)
            throws Exception {
        model.addAttribute("TSelImgVO", new TSelImgVO());
        return "/TSelImg/TSelImgRegister";
    }
    
    @RequestMapping("/addTSelImg.do")
    public String addTSelImg(
            TSelImgVO TSelImgVO,
            @ModelAttribute("searchVO") SearchVO searchVO, SessionStatus status)
            throws Exception {
        TSelImgService.insertTSelImg(TSelImgVO);
        status.setComplete();
        return "forward:/front/Intertest/TSelImgList.do";
    }
    
    @RequestMapping("/updateTSelImgView.do")
    public String updateTSelImgView(
            @RequestParam("userId") java.lang.String userId ,
            @ModelAttribute("searchVO") SearchVO searchVO, Model model)
            throws Exception {
        TSelImgVO TSelImgVO = new TSelImgVO();
        TSelImgVO.setUserId(userId);        
        // 변수명은 CoC 에 따라 TSelImgVO
        model.addAttribute(selectTSelImg(TSelImgVO, searchVO));
        return "/TSelImg/TSelImgRegister";
    }

    @RequestMapping("/selectTSelImg.do")
    public @ModelAttribute("TSelImgVO")
    TSelImgVO selectTSelImg(
            TSelImgVO TSelImgVO,
            @ModelAttribute("searchVO") SearchVO searchVO) throws Exception {
        return TSelImgService.selectTSelImg(TSelImgVO);
    }

    @RequestMapping("/updateTSelImg.do")
    public String updateTSelImg(
            TSelImgVO TSelImgVO,
            @ModelAttribute("searchVO") SearchVO searchVO, SessionStatus status)
            throws Exception {
        TSelImgService.updateTSelImg(TSelImgVO);
        status.setComplete();
        return "forward:/front/Intertest/TSelImgList.do";
    }
    
    @RequestMapping("/deleteTSelImg.do")
    public String deleteTSelImg(
            TSelImgVO TSelImgVO,
            @ModelAttribute("searchVO") SearchVO searchVO, SessionStatus status)
            throws Exception {
        TSelImgService.deleteTSelImg(TSelImgVO);
        status.setComplete();
        return "forward:/front/Intertest/TSelImgList.do";
    }

}
