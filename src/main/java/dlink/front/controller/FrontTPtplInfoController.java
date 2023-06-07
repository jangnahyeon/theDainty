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
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.databind.ObjectMapper;

import dlink.admin.service.TCodeService;
import dlink.admin.service.TMemComService;
import dlink.admin.service.TPtplInfoService;
import dlink.admin.vo.SearchVO;
import dlink.admin.vo.TCodeVO;
import dlink.admin.vo.TMemAccptVO;
import dlink.admin.vo.TMemComVO;
import dlink.common.service.TAttfileService;
import dlink.common.vo.TAttfileVO;
import dlink.front.service.FrontTPtplInfoService;
import dlink.front.vo.TPtplInfoDefaultVO;
import dlink.front.vo.TPtplInfoVO;

/**
 * @Class Name : TPtplInfoController.java
 * @Description : TPtplInfo Controller class
 * @Modification Information
 *
 * @author 장나현
 * @since 2022-03-31
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */

@Controller
public class FrontTPtplInfoController {

    @Resource(name = "FrontTPtplInfoService")
    private FrontTPtplInfoService frontTPtplInfoService;
    
    /** EgovPropertyService */
    @Resource(name = "propertiesService")
    protected EgovPropertyService propertiesService;
	
    @Resource(name = "TCodeService")
    private TCodeService tCodeService;
    
    @Resource(name = "TMemComService")
    private TMemComService TMemComService;
    
    @Resource(name = "TAttfileService")
    private TAttfileService tAttfileService;
	
    @Resource(name = "TPtplInfoService")
    private TPtplInfoService TPtplInfoService;
    
	
    /*포트폴리오조회(마이페이지)*/
    @RequestMapping(value="/front/portMagmt/portInquiryList.do")
    public String selectTPtplInfoList(@ModelAttribute("searchVO") TPtplInfoVO searchVO, HttpServletRequest request, HttpSession session,
    		ModelMap model)
            throws Exception {
    	
    	TMemAccptVO loginVO = (TMemAccptVO) session.getAttribute("DlinkLogin");
		if(loginVO == null) {
			model.addAttribute("msg", "fail");
			return "redirect:/front/login.do";
		}
		TMemComVO setTMemComVO = new TMemComVO();
		setTMemComVO.setLoginId(loginVO.getLoginId());
		setTMemComVO = TMemComService.selectTMemCom(setTMemComVO);
		
		model.addAttribute("comInfo", setTMemComVO);
		
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
		
		model.addAttribute("ptplType", searchVO.getPtplPart());
		model.addAttribute("searchKeyword", searchVO.getSearchKeyword());
		
		/*임시*/
		searchVO.setLoginId(loginVO.getLoginId());
        List<?> TPtplInfoList = frontTPtplInfoService.selectTPtplInfoList(searchVO);
        model.addAttribute("resultList", TPtplInfoList);
        
        TCodeVO code = new TCodeVO();
        code.setGubun("PA");
        code.setPagingYn("N");
        List<TCodeVO> codeListPA = tCodeService.selectTCodeList(code);
        model.addAttribute("codeListPA", codeListPA);
        
        int totCnt = frontTPtplInfoService.selectTPtplInfoListTotCnt(searchVO);
		paginationInfo.setTotalRecordCount(totCnt);
        model.addAttribute("paginationInfo", paginationInfo);
        
        model.addAttribute("searchVO", searchVO);
        model.addAttribute("loginVO", loginVO);
        
        return "/front/TPtplInfo/TPtplInfoList";
    } 
    
    
    
    
    /*포트폴리오등록(마이페이지)*/
    @RequestMapping("/front/portMagmt/portRegt.do")
    public String addTPtplInfoView(
            @ModelAttribute("searchVO") TPtplInfoVO searchVO, Model model, HttpSession session)
            throws Exception {

	    	TMemAccptVO loginVO = (TMemAccptVO) session.getAttribute("DlinkLogin");
			if(loginVO == null) {
				model.addAttribute("msg", "fail");
				return "redirect:/front/login.do";
			}
			TMemComVO setTMemComVO = new TMemComVO();
			setTMemComVO.setLoginId(loginVO.getLoginId());
			setTMemComVO = TMemComService.selectTMemCom(setTMemComVO);
			
			model.addAttribute("comInfo", setTMemComVO);
			
    		TCodeVO code = new TCodeVO();
    		code.setGubun("PA");
    		code.setPagingYn("N");
    		List<TCodeVO> codeListPA = tCodeService.selectTCodeList(code);
    		
    		
    		model.addAttribute("codeListPA", codeListPA);
    		model.addAttribute("resultList", searchVO);
    		model.addAttribute("loginVO", loginVO);
       /* model.addAttribute("TPtplInfoVO", new TPtplInfoVO());*/
        return "/front/TPtplInfo/TPtplInfoRegister";
    }
    
    @RequestMapping("/front/portMagmt/registerTPtplInfo.do")
    @ResponseBody
    public String addTPtplInfo(
            TPtplInfoVO TPtplInfoVO,
            @ModelAttribute("searchVO") TPtplInfoVO searchVO, SessionStatus status, HttpSession session, Model model)
            throws Exception {
    	String rs = "";
    	try{
    		TMemAccptVO loginVO = (TMemAccptVO) session.getAttribute("DlinkLogin");
    		if(loginVO == null) {
    			model.addAttribute("msg", "fail");
    			return "redirect:/front/login.do";
    		}

    		/*임시*/
    		searchVO.setLoginId(loginVO.getLoginId());
	        frontTPtplInfoService.insertTPtplInfo(searchVO);
	        
	        frontTPtplInfoService.insertTPtplInfoImg(searchVO);
	        if(searchVO.getMultiFileSeq() != null) {
			    for(int i = 0; i < searchVO.getMultiFileSeq().length; i++) {
			    	searchVO.setFileSeq(searchVO.getMultiFileSeq()[i]);
			    	frontTPtplInfoService.insertTPtplInfoMultiImg(searchVO);
			    }
	        }
	        
	        rs = "Y";
    	}catch(Exception e){
			e.printStackTrace();
		}
        return rs;
    }
    
    /*포트폴리오 상세페이지(마이페이지)*/
    @RequestMapping("/front/portMagmt/portDetail.do")
    public String detailTPtplInfoView(
            @ModelAttribute("searchVO") TPtplInfoVO searchVO, Model model, HttpSession session)
            throws Exception {
	    	TMemAccptVO loginVO = (TMemAccptVO) session.getAttribute("DlinkLogin");
			if(loginVO == null) {
				model.addAttribute("msg", "fail");
				return "redirect:/front/login.do";
			}
			TMemComVO setTMemComVO = new TMemComVO();
			setTMemComVO.setLoginId(loginVO.getLoginId());
			setTMemComVO = TMemComService.selectTMemCom(setTMemComVO);
			
			model.addAttribute("comInfo", setTMemComVO);
			
    		List<TCodeVO> codeList = new ArrayList<>();
        	TCodeVO tcodeVO = new TCodeVO();
    		try {
    		TPtplInfoVO tPtplInfoVO = frontTPtplInfoService.selectTPtplInfo(searchVO);
    		
    		/*tcodeVO.setGubun("PT");
            tcodeVO.setPagingYn("N");
    		codeList = tCodeService.selectTCodeList(tcodeVO);
    		
    		String[] gb_arr = null;
    		String gb_temp = "";
    		if(tPtplInfoVO.getPtplType() != null) {
	    		if(tPtplInfoVO.getPtplType().length()>1){
					gb_arr = tPtplInfoVO.getPtplType().split(",");
				}
	    		for(TCodeVO tmp : codeList) {
	    			for (int i = 0; i < gb_arr.length; i++) {
	    				if(tmp.getCode().equals(gb_arr[i])){
	    					if(gb_temp.length() > 1 ){
	    						gb_temp = gb_temp  + ", " + tmp.getCodeNm();
	    					} else {
	    						gb_temp = tmp.getCodeNm();
	    					}
	    				}
	    			}
	    		}
    		}
    		model.addAttribute("codeListPT", gb_temp);
    		
    		tcodeVO.setGubun("PS");
    		codeList = tCodeService.selectTCodeList(tcodeVO);
    		gb_temp = "";
    		if(tPtplInfoVO.getPtplStyle() != null) {
    			if(tPtplInfoVO.getPtplStyle().length()>1){
    				gb_arr = tPtplInfoVO.getPtplStyle().split(",");
    			} 
        		for(TCodeVO tmp : codeList) {
        			for (int i = 0; i < gb_arr.length; i++) {
        				if(tmp.getCode().equals(gb_arr[i])){
        					if(gb_temp.length() > 1 ){
        						gb_temp = gb_temp  + "," + tmp.getCodeNm();
        					} else {
        						gb_temp = tmp.getCodeNm();
        					}
        				}
        			}
        		}
    		} 
    		model.addAttribute("codeListPS", gb_temp);
    		
    		
    		tcodeVO.setGubun("AP");
    		codeList = tCodeService.selectTCodeList(tcodeVO);
    		gb_temp = "";
    		if(tPtplInfoVO.getAddOption() != null) {
	    		if(tPtplInfoVO.getAddOption().length()>1){
					gb_arr = tPtplInfoVO.getAddOption().split(",");
				}
	    		for(TCodeVO tmp : codeList) {
	    			for (int i = 0; i < gb_arr.length; i++) {
	    				if(tmp.getCode().equals(gb_arr[i])){
	    					if(gb_temp.length() > 1 ){
	    						gb_temp = gb_temp  + "," + tmp.getCodeNm();
	    					} else {
	    						gb_temp = tmp.getCodeNm();
	    					}
	    				}
	    			}
	    		}
    		}
    		model.addAttribute("codeListAP", gb_temp);*/
    		
    		model.addAttribute("resultList", tPtplInfoVO);
    		model.addAttribute("loginVO", loginVO);
       /* model.addAttribute("TPtplInfoVO", new TPtplInfoVO());*/
    		
    		}catch(Exception e){
    			e.printStackTrace();
    		}
    		return "/front/TPtplInfo/TPtplInfoDetail";
    }
    
    /*포트폴리오 수정(마이페이지)*/
    @RequestMapping("/front/portMagmt/portModi.do")
    public String modifyTPtplInfoView(
            @ModelAttribute("searchVO") TPtplInfoVO searchVO, Model model, HttpSession session)
            throws Exception {
    		
	    	TMemAccptVO loginVO = (TMemAccptVO) session.getAttribute("DlinkLogin");
			if(loginVO == null) {
				model.addAttribute("msg", "fail");
				return "redirect:/front/login.do";
			}
			TMemComVO setTMemComVO = new TMemComVO();
			setTMemComVO.setLoginId(loginVO.getLoginId());
			setTMemComVO = TMemComService.selectTMemCom(setTMemComVO);
			
			model.addAttribute("comInfo", setTMemComVO);
			
    		TCodeVO code = new TCodeVO();
    		code.setGubun("PA");
    		code.setPagingYn("N");
    		List<TCodeVO> codeListPA = tCodeService.selectTCodeList(code);
    		
    		TPtplInfoVO tPtplInfoVO = frontTPtplInfoService.selectTPtplInfo(searchVO);
    		
    		model.addAttribute("codeListPA", codeListPA);
    		model.addAttribute("resultList", tPtplInfoVO);
    		model.addAttribute("loginVO", loginVO);
       /* model.addAttribute("TPtplInfoVO", new TPtplInfoVO());*/
    		return "/front/TPtplInfo/TPtplInfoModify";
    }
    
    
    @RequestMapping("/front/portMagmt/updateTPtplInfo.do")
    @ResponseBody
    public String updateTPtplInfoView(
    		TPtplInfoVO TPtplInfoVO,
            @ModelAttribute("searchVO") TPtplInfoVO searchVO, Model model, HttpSession session)
            throws Exception {
    	String rs = "";
        /*TPtplInfoVO.setLoginId(loginId);        
        // 변수명은 CoC 에 따라 TPtplInfoVO */
        try{
        	TMemAccptVO loginVO = (TMemAccptVO) session.getAttribute("DlinkLogin");
			if(loginVO == null) {
				model.addAttribute("msg", "fail");
				return "redirect:/front/login.do";
			}
			
			TPtplInfoVO.setLoginId(loginVO.getLoginId());
			searchVO.setLoginId(loginVO.getLoginId());
			
	        frontTPtplInfoService.updateTPtplInfo(TPtplInfoVO);
	        
	        frontTPtplInfoService.deleteTPtplInfoImg(TPtplInfoVO);
	        
	        
	        frontTPtplInfoService.insertTPtplInfoImg(searchVO);
	        if(searchVO.getMultiFileSeq() !=  null) {
		        for(int i = 0; i < searchVO.getMultiFileSeq().length; i++) {
		        	searchVO.setFileSeq(searchVO.getMultiFileSeq()[i]);
		        	frontTPtplInfoService.insertTPtplInfoMultiImg(searchVO);
		        }
	        }
	        model.addAttribute(selectTPtplInfo(TPtplInfoVO, searchVO));
        
	        rs = "Y";
		}catch(Exception e){
			e.printStackTrace();
		}
        return rs;
    }
    
    /*코드값 선택 별 분류*/
    @RequestMapping("/front/portMagmt/selectCodeListJason.do")
    @ResponseBody 
    public ResponseEntity<String> selectCodeListJason(
            TPtplInfoVO TPtplInfoVO,
            TCodeVO tcodeVO,
            @ModelAttribute("searchVO") TPtplInfoDefaultVO searchVO, SessionStatus status)
            throws Exception {
    	HttpHeaders resHeaders = new HttpHeaders();
	    resHeaders.add("Content-Type", "application/json;charset=UTF-8");
	    
    	List<TCodeVO> codeList = null;
    	try{
    		tcodeVO.setPagingYn("N");
    		codeList = tCodeService.selectTCodeList(tcodeVO);
    		
    	}catch(Exception e){
			e.printStackTrace();
		}
    	
    	ObjectMapper om = new ObjectMapper();
    	String return_value = om.writeValueAsString(codeList);
    	
    	ResponseEntity<String> result = new ResponseEntity<String> (return_value, resHeaders, HttpStatus.CREATED);
        return result;
    }

    /*포트폴리오검색*/
    @RequestMapping(value="/front/portfolio/portfSearchList.do")
    public String searchTPtplInfoList(@ModelAttribute("searchVO") TPtplInfoVO searchVO, 
    		ModelMap model, HttpSession session)
            throws Exception {
    	
    	//사용자 로그인 확인 Start
		TMemAccptVO loginVO = (TMemAccptVO) session.getAttribute("DlinkLogin");
		/*if(loginVO == null) {
			model.addAttribute("msg", "fail");
			return "redirect:/front/login.do";
		}*/
		//사용자 로그인 확인 End
    			
		
    	/** EgovPropertyService.sample */
    	/*searchVO.setPageUnit(propertiesService.getInt("pageUnit"));
    	searchVO.setPageSize(propertiesService.getInt("pageSize"));*/
    	
    	/** pageing */
    	/*PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(searchVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(20);
		paginationInfo.setPageSize(searchVO.getPageSize());
		
		searchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		searchVO.setLastIndex(paginationInfo.getLastRecordIndex());
		searchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());*/
		
		
		
		/*
		List<String> listPT = new ArrayList<>();
		List<String> listPS = new ArrayList<>();
		List<String> listAP = new ArrayList<>();
		String arrVal = null;
		if(searchVO.getStrArr() != null) {
			
			String[] str = searchVO.getStrArr().split(",");
			searchVO.setArr(str);
			
			for(int i = 0; i < searchVO.getArr().length; i++) {
				
				
				if(!searchVO.getArr()[i].isEmpty()) {
					arrVal = searchVO.getArr()[i].substring(0,2);
					
					if(arrVal.equals("PT")) {    				
						listPT.add(searchVO.getArr()[i]);
					} else if(arrVal.equals("PS")) {
						listPS.add(searchVO.getArr()[i]);
					} else if(arrVal.equals("AP")) {
						listAP.add(searchVO.getArr()[i]);
					} else {
						
					}
				}
				
			}
			searchVO.setArrPtplType(listPT);
			searchVO.setArrPtplStyle(listPS);
			searchVO.setArrAddOption(listAP);
		}
		*/
		
		/*임시*/
		/*
		TCodeVO code = new TCodeVO();
        code.setGubun("PA");
        code.setPagingYn("N");
        List<TCodeVO> codeListPA = tCodeService.selectTCodeList(code);
        model.addAttribute("codeListPA", codeListPA);
        if(searchVO.getPtplPart() == null || searchVO.getPtplPart().isEmpty()) {
        	searchVO.setPtplPart(codeListPA.get(0).getCode());
        }
        
        List<?> TPtplInfoList = frontTPtplInfoService.selectTPtplInfoList(searchVO);
        model.addAttribute("resultList", TPtplInfoList);
        
        
        int totCnt = frontTPtplInfoService.selectTPtplInfoListTotCnt(searchVO);
		paginationInfo.setTotalRecordCount(totCnt);
        model.addAttribute("paginationInfo", paginationInfo);
        */
        // 의뢰하기 모달창에서 사용자 아이디 필요 
        model.addAttribute("loginVO", loginVO);
        
        return "/front/portfolio/portfSearchList";
    } 
    
    @RequestMapping("/front/portfolio/content/portfSearchListContent.do")    
    public String portfSearchListContent(
            @ModelAttribute("searchVO") TPtplInfoVO searchVO, Model model, HttpSession session)
            throws Exception {
	    	
    		model.addAttribute("searchKeyword2", searchVO.getSearchKeyword2());
		    /** EgovPropertyService.sample */
	    	searchVO.setPageUnit(propertiesService.getInt("pageUnit"));
	    	searchVO.setPageSize(propertiesService.getInt("pageSize"));
	    	
	    	/** pageing */
	    	PaginationInfo paginationInfo = new PaginationInfo();
			paginationInfo.setCurrentPageNo(searchVO.getPageIndex());
			paginationInfo.setRecordCountPerPage(20);
			paginationInfo.setPageSize(searchVO.getPageSize());
			
			searchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
			searchVO.setLastIndex(paginationInfo.getLastRecordIndex());
			searchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
			
			/*List<String> listPT = new ArrayList<>();
			List<String> listPS = new ArrayList<>();
			List<String> listAP = new ArrayList<>();
			String arrVal = null;
			if(searchVO.getStrArr() != null) {
				
				String[] str = searchVO.getStrArr().split(",");
				searchVO.setArr(str);
				
				for(int i = 0; i < searchVO.getArr().length; i++) {
					if(!searchVO.getArr()[i].isEmpty()) {
						
						arrVal = searchVO.getArr()[i].substring(0,2);
						
						if(arrVal.equals("PT")) {    				
							listPT.add(searchVO.getArr()[i]);
						} else if(arrVal.equals("PS")) {
							listPS.add(searchVO.getArr()[i]);
						} else if(arrVal.equals("AP")) {
							listAP.add(searchVO.getArr()[i]);
						} else {
							
						}
					}
					
				}
				searchVO.setArrPtplType(listPT);
				searchVO.setArrPtplStyle(listPS);
				searchVO.setArrAddOption(listAP);
			}*/    		
			
			TCodeVO code = new TCodeVO();
	        code.setGubun("PA");
	        code.setPagingYn("N");
	        List<TCodeVO> codeListPA = tCodeService.selectTCodeList(code);
	        model.addAttribute("codeListPA", codeListPA);
	        /*
	        if(searchVO.getPtplPart() == null || searchVO.getPtplPart().isEmpty()) {
	        	searchVO.setPtplPart(codeListPA.get(0).getCode());
	        }
	        */
	        searchVO.setSeed((int)session.getCreationTime());
	        List<?> TPtplInfoList = frontTPtplInfoService.selectTPtplInfoList(searchVO);
	        model.addAttribute("resultList", TPtplInfoList);
            
            int totCnt = frontTPtplInfoService.selectTPtplInfoListTotCnt(searchVO);
    		paginationInfo.setTotalRecordCount(totCnt);
            model.addAttribute("paginationInfo", paginationInfo);
            
            model.addAttribute("searchVO", searchVO);
    	
            return "/front/portfolio/content/portfSearchListContent";
    }
    
    @RequestMapping("/portfolio/searchPortfolio.do")    
    public String searchPortfolio(
            @ModelAttribute("searchVO") TPtplInfoVO searchVO, Model model)
            throws Exception {
	    	
    		model.addAttribute("searchKeyword2", searchVO.getSearchKeyword2());
		    /** EgovPropertyService.sample */
	    	searchVO.setPageUnit(propertiesService.getInt("pageUnit"));
	    	searchVO.setPageSize(propertiesService.getInt("pageSize"));
	    	
	    	/** pageing */
	    	PaginationInfo paginationInfo = new PaginationInfo();
			paginationInfo.setCurrentPageNo(searchVO.getPageIndex());
			paginationInfo.setRecordCountPerPage(20);
			paginationInfo.setPageSize(searchVO.getPageSize());
			
			searchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
			searchVO.setLastIndex(paginationInfo.getLastRecordIndex());
			searchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
			
			/*List<String> listPT = new ArrayList<>();
			List<String> listPS = new ArrayList<>();
			List<String> listAP = new ArrayList<>();
			String arrVal = null;
			if(searchVO.getStrArr() != null) {
				
				String[] str = searchVO.getStrArr().split(",");
				searchVO.setArr(str);
				
				for(int i = 0; i < searchVO.getArr().length; i++) {
					if(!searchVO.getArr()[i].isEmpty()) {
						
						arrVal = searchVO.getArr()[i].substring(0,2);
						
						if(arrVal.equals("PT")) {    				
							listPT.add(searchVO.getArr()[i]);
						} else if(arrVal.equals("PS")) {
							listPS.add(searchVO.getArr()[i]);
						} else if(arrVal.equals("AP")) {
							listAP.add(searchVO.getArr()[i]);
						} else {
							
						}
					}
					
				}
				searchVO.setArrPtplType(listPT);
				searchVO.setArrPtplStyle(listPS);
				searchVO.setArrAddOption(listAP);
			}*/
    		
			TCodeVO code = new TCodeVO();
	        code.setGubun("PA");
	        code.setPagingYn("N");
	        List<TCodeVO> codeListPA = tCodeService.selectTCodeList(code);
	        model.addAttribute("codeListPA", codeListPA);
	        if(searchVO.getPtplPart() == null || searchVO.getPtplPart().isEmpty()) {
	        	searchVO.setPtplPart(codeListPA.get(0).getCode());
	        }
	        
	        List<?> TPtplInfoList = frontTPtplInfoService.selectTPtplInfoList(searchVO);
	        model.addAttribute("resultList", TPtplInfoList);
            
            int totCnt = frontTPtplInfoService.selectTPtplInfoListTotCnt(searchVO);
    		paginationInfo.setTotalRecordCount(totCnt);
            model.addAttribute("paginationInfo", paginationInfo);
    	
            return "/include/TPtplInfo/SearchPortfolioList";
    }
    
    @RequestMapping("/front/portfolio/selectPortfolioJson.do")
    @ResponseBody
    public ResponseEntity<String> selectPortfolioJson(
            TPtplInfoVO TPtplInfoVO,
            @ModelAttribute("searchVO") TPtplInfoDefaultVO searchVO) throws Exception {
    	HttpHeaders resHeaders = new HttpHeaders();
    	String return_value = "";
    	try {
    		
    		resHeaders.add("Content-Type", "application/json;charset=UTF-8");
    		
    		TPtplInfoVO tPtplInfoVO = frontTPtplInfoService.selectTPtplInfo(TPtplInfoVO);
    		
    		ObjectMapper om = new ObjectMapper();
    		return_value = om.writeValueAsString(tPtplInfoVO);
    	} catch (Exception e) {
    		e.printStackTrace();
    	}
    	
    	ResponseEntity<String> result = new ResponseEntity<String> (return_value, resHeaders, HttpStatus.CREATED);
        return result;
    }
    
    @RequestMapping("/front/portfolio/selectCategoryNm.do")
    @ResponseBody
    public ResponseEntity<String> selectCategoryNm(
            TPtplInfoVO TPtplInfoVO) throws Exception {
    	HttpHeaders resHeaders = new HttpHeaders();
	    resHeaders.add("Content-Type", "application/json;charset=UTF-8");
	    List<String> list = new ArrayList<String>();
	    EgovMap map = new EgovMap();
	    String[] arr = TPtplInfoVO.getArr();
	    if(arr != null) {
	    	for(String s : arr) {
		    	list.add(s);
		    }
	    	map.put("list",list);
	    	
	    	list = frontTPtplInfoService.selectCategoryNm(map);	    	
	    }
	    
	    ObjectMapper om = new ObjectMapper();
    	String return_value = om.writeValueAsString(list);
    	
    	ResponseEntity<String> result = new ResponseEntity<String> (return_value, resHeaders, HttpStatus.CREATED);
        return result;
    }
    
    @RequestMapping("/front/portfolio/portfolioFavoriteAjax.do")
    @ResponseBody
    public String portfolioFavoriteAjax(
            TPtplInfoVO TPtplInfoVO, HttpSession session, Model model) throws Exception {
    	
    	String msg = "";
    	try {
	  //사용자 로그인 확인 Start
		TMemAccptVO loginVO = (TMemAccptVO) session.getAttribute("DlinkLogin");
		if(loginVO == null) {
			model.addAttribute("msg", "fail");
			return "redirect:/front/login.do";
		}
		//사용자 로그인 확인 End
		TPtplInfoVO.setLoginId(loginVO.getLoginId());
		TPtplInfoVO.setSelGb("ptpl");
    	
    	if(frontTPtplInfoService.selectPtplFavoriteCnt(TPtplInfoVO) > 0) {
    		frontTPtplInfoService.deleteTPtplFavorite(TPtplInfoVO);
    	} else {
    		frontTPtplInfoService.insertPtplFavorite(TPtplInfoVO);
    	}
    	
    	msg = "succes";
		} catch (Exception e) {
			msg = "fail";
			e.printStackTrace();
			
		}
	    
	    
	    
        return msg;
    }
    
    @RequestMapping("/front/portMagmt/deleteTPtplInfo.do")
    public String deleteTPtplInfo(
            dlink.admin.vo.TPtplInfoVO tPtplInfoVO,  
            @ModelAttribute("searchVO") SearchVO searchVO, SessionStatus status, RedirectAttributes redirect, HttpSession session)
            throws Exception {
    	TMemAccptVO loginVO = (TMemAccptVO) session.getAttribute("DlinkLogin");
    	tPtplInfoVO.setLoginId(loginVO.getLoginId());
    	TAttfileVO att = new TAttfileVO();
    	List<?> tPtplInfoImgList = new ArrayList<>();
    	try {	
    		tPtplInfoImgList = TPtplInfoService.selectTPtplInfoImgList(tPtplInfoVO);
    		
	        TPtplInfoService.deleteTPtplInfo(tPtplInfoVO);
	        TPtplInfoService.deleteTPtplInfoImg(tPtplInfoVO);
	        
	        if(tPtplInfoImgList != null) {
	        	for(int i = 0; i < tPtplInfoImgList.size(); i++) {
	        		EgovMap map1 = (EgovMap)tPtplInfoImgList.get(i);
	        		BigDecimal fileSeq = (BigDecimal)map1.get("fileSeq");

	        		att.setFileSeq(fileSeq);
					//파일 정보 삭제
					tAttfileService.deleteTAttfile(att);
	        	}
	        }
	        /*status.setComplete();
	        	*/
	    }catch(Exception e){
			e.printStackTrace();
		}
        return "redirect:/front/portMagmt/portInquiryList.do";
    }
    
    @RequestMapping("/TPtplInfo/selectTPtplInfo.do")
    public @ModelAttribute("TPtplInfoVO")
    TPtplInfoVO selectTPtplInfo(
            TPtplInfoVO TPtplInfoVO,
            @ModelAttribute("searchVO") TPtplInfoVO searchVO) throws Exception {
        return frontTPtplInfoService.selectTPtplInfo(TPtplInfoVO);
    }
    
    

    @RequestMapping("/TPtplInfo/updateTPtplInfo.do")
    public String updateTPtplInfo(
            TPtplInfoVO TPtplInfoVO,
            @ModelAttribute("searchVO") TPtplInfoDefaultVO searchVO, SessionStatus status)
            throws Exception {
        frontTPtplInfoService.updateTPtplInfo(TPtplInfoVO);
        
        status.setComplete();
        return "forward:/TPtplInfo/TPtplInfoList.do";
    }
    
    @RequestMapping("/TPtplInfo/deleteTPtplInfo.do")
    public String deleteTPtplInfo(
            TPtplInfoVO TPtplInfoVO,
            @ModelAttribute("searchVO") TPtplInfoDefaultVO searchVO, SessionStatus status)
            throws Exception {
        frontTPtplInfoService.deleteTPtplInfo(TPtplInfoVO);
        frontTPtplInfoService.deleteTPtplInfoImg(TPtplInfoVO);
        status.setComplete();
        return "forward:/TPtplInfo/TPtplInfoList.do";
    }
    
    
    @RequestMapping("/front/TPtplInfo/deleteTPtplInfoImg.do")
    @ResponseBody
    public String deleteTPtplInfoImg(
            TPtplInfoVO TPtplInfoVO,
            @ModelAttribute("searchVO") TPtplInfoDefaultVO searchVO, SessionStatus status)
            throws Exception {
        frontTPtplInfoService.deleteTPtplInfoImg(TPtplInfoVO);
        status.setComplete();
        return "Y";
    }

}
