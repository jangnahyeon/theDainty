package dlink.front.controller;

import java.math.BigDecimal;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import dlink.admin.vo.SearchVO;
import dlink.admin.vo.TCodeVO;
import dlink.admin.vo.TMemAccptVO;
import dlink.admin.vo.TMemComVO;
import dlink.front.vo.TPtplInfoVO;
import dlink.front.vo.TReqUserVO;
import dlink.front.vo.TSelImgVO;
import dlink.admin.service.TCodeService;
import dlink.admin.service.TMemComService;
import dlink.front.service.FrontTPtplInfoService;

import dlink.common.service.TptplimgService;
import dlink.common.vo.TPtplimgVO;

import dlink.front.service.TSelImgService;
/**
 * @Class Name : FrontAgencyController.java
 * @Description : FrontAgency Controller class
 * @Modification Information
 *
 * @author 이효진
 * @since 2022-04-11
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */

@Controller
//@SessionAttributes(types=TSpecReqComVO.class)
@RequestMapping("/front/agency")
public class FrontAgencyController {

    @Resource(name = "TMemComService")
    private TMemComService TMemComService;
    
    @Resource(name = "TSelImgService")
    private TSelImgService TSelImgService;
    
    
    /** EgovPropertyService */
    @Resource(name = "propertiesService")
    protected EgovPropertyService propertiesService;
    
    @Resource(name = "FrontTPtplInfoService")
    private FrontTPtplInfoService FrontTPtplInfoService;
	
    @Resource(name = "TCodeService")
    private TCodeService tCodeService;
    
    @Resource(name = "TptplimgService")
    private TptplimgService TptplimgService;
    
    /**
	 * t_spec_req_com 목록을 조회한다. (pageing)
	 * @param searchVO - 조회할 정보가 담긴 SearchVO
	 * @return "/member/mJoinInquiryList"
	 * @exception Exception
	 */
    @RequestMapping(value="/agSearchList.do")
    public String agSearchList(@ModelAttribute("searchVO") SearchVO searchVO, 
    		 @RequestParam(value = "searchCondition", required=false) String searchCondition ,
    		 @RequestParam(value = "searchKeyword" , required=false) String searchKeyword ,
    		 @RequestParam(value = "ptplPart" , required=false) String ptplPart ,
    		ModelMap model, HttpSession session )
            throws Exception {
    	
    	//사용자 로그인 확인 Start
		TMemAccptVO loginVO = (TMemAccptVO) session.getAttribute("DlinkLogin");
		/*if(loginVO == null) {
			model.addAttribute("msg", "fail");
			return "redirect:/front/login.do";
		}*/
		//사용자 로그인 확인 End
    	
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
		searchVO.setSearchCondition(searchCondition);
		searchVO.setSearchKeyword(searchKeyword);
		searchVO.setSpecYn("Y");
		
        List<?> agSearchList = TMemComService.selectTMemComList(searchVO);
        
        
        int totCnt = TMemComService.selectTMemComListTotCnt(searchVO);
		paginationInfo.setTotalRecordCount(totCnt);
        model.addAttribute("paginationInfo", paginationInfo);
        
        
        
        for (int i = 0; i < agSearchList.size(); i++) {
        	EgovMap map = (EgovMap)agSearchList.get(i);
        	      	
        	// 전문업체 등록된 아이디로 포트폴리오 정보 가지고 오기
        	String loginId = (String)map.get("loginId");
        	TPtplimgVO TPtplimgVO = new TPtplimgVO();
        	TPtplimgVO.setLoginId(loginId);
        	
        	//2.파일 List를 가지고옴(포트폴리오 이미지 파일 정보)
        	// List<?> fileList = TMemComService.selectagSearchList(searchVO);
        	List<?> imgList = TptplimgService.selectTptplimgList(TPtplimgVO);
        	
        	//3.파일 리스트를 map에 담아줌
        	map.put("imgList", imgList);
        	
		}
        
        
        // 의뢰하기 모달창에서 사용자구분 필요
        TCodeVO CPcode = new TCodeVO();
        CPcode.setGubun("CP");
        CPcode.setPagingYn("N");
        List<TCodeVO> codeListCP = tCodeService.selectTCodeList(CPcode);
        model.addAttribute("codeListCP", codeListCP);
        
        model.addAttribute("resultList", agSearchList);
        model.addAttribute("loginVO", loginVO);
        return "/front/agency/agSearchList";
    } 
    
    
    @RequestMapping("/portfolioFavoriteAjax.do")
    @ResponseBody
    public String portfolioFavoriteAjax( 
    		@ModelAttribute("searchVO") TSelImgVO searchVO,
    		@RequestParam(required=false, defaultValue="", value="loginId") String loginId,  		
    		@RequestParam(required=false, defaultValue="", value="fileSeq") BigDecimal fileSeq,  		
    		HttpSession session, Model model
    ) throws Exception {
    	
    	String msg = "";
    	try {
	  //사용자 로그인 확인 Start
		TMemAccptVO loginVO = (TMemAccptVO) session.getAttribute("DlinkLogin");
		if(loginVO == null) {
			model.addAttribute("msg", "fail");
			return "redirect:/front/login.do";
		}
		//사용자 로그인 확인 End
		searchVO.setLoginId(loginId);
		searchVO.setUserId(loginVO.getLoginId());
		searchVO.setSelGb("agency");
		
		TSelImgVO TSelImgVO = new TSelImgVO();
		
    	if(TSelImgService.selectTSelImgFavoriteCnt(searchVO) > 0) {
    		
    		TSelImgVO.setLoginId(loginId);
    		TSelImgVO.setUserId(loginVO.getLoginId());
    		TSelImgVO.setSelGb("agency");
    		TSelImgService.deleteTSelImg(TSelImgVO);
    		
    	}
    	
    	// 대표이미지 널값 체크
		if(fileSeq != null){
			TSelImgVO.setFileSeq(fileSeq);			
		}else{
			TSelImgVO.setFileSeq(null);
		}	
    	
	  		    	
		TSelImgVO.setUserId(loginVO.getLoginId());
		TSelImgVO.setLoginId(loginId);		
		TSelImgVO.setSelGb("agency");
		
		TSelImgService.insertTSelImg(TSelImgVO);
    		
    	
    	
    	msg = "succes";
		} catch (Exception e) {
			msg = "fail";
			e.printStackTrace();
			
		}
	    
	    
	    
        return msg;
    }
    
   
    
    //탭상세페이지
    @RequestMapping("/AgencyDetailTab.do")
    public String AgencyDetailTab( HttpSession session,
    		@RequestParam(value = "comNm", required=false) String comNm ,
    		@RequestParam(value = "ptLoginId", required=false) String ptLoginId ,
    		@RequestParam(value = "registerFlag", required=false) String registerFlag ,
    		@RequestParam(value = "ptplPart" , required=false) String ptplPart ,
        @ModelAttribute("searchVO") SearchVO searchVO, Model model)
    
        throws Exception {

    	//사용자 로그인 확인 Start
		TMemAccptVO loginVO = (TMemAccptVO) session.getAttribute("DlinkLogin");
		/*if(loginVO == null) {
			model.addAttribute("msg", "fail");
			return "redirect:/front/login.do";
		}*/
		//사용자 로그인 확인 End
    	
    	/** pageing */
    	PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(searchVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(searchVO.getPageUnit());
		paginationInfo.setPageSize(searchVO.getPageSize());
		
		//searchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		//searchVO.setLastIndex(paginationInfo.getLastRecordIndex());
		//searchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		
    		TMemComVO TMemComVO = new TMemComVO();
    		TMemComVO setTMemComVO = new TMemComVO();

    		TMemComVO.setComNm(comNm);  
    		TMemComVO.setLoginId(ptLoginId); 
	        setTMemComVO = TMemComService.selectTMemCom(TMemComVO);
	        
	        TPtplInfoVO TPtplInfoVO = new TPtplInfoVO();
	        TPtplInfoVO.setLoginId(ptLoginId);
	        TPtplInfoVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
	        TPtplInfoVO.setLastIndex(paginationInfo.getLastRecordIndex());
	        TPtplInfoVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
	        TPtplInfoVO.setPtplPart(ptplPart);
			
	        List<?> setTPtplInfoVO = FrontTPtplInfoService.selectTPtplInfoList(TPtplInfoVO);
	        
	        int totCnt = FrontTPtplInfoService.selectTPtplInfoListTotCnt(TPtplInfoVO);
			paginationInfo.setTotalRecordCount(totCnt);
	        model.addAttribute("paginationInfo", paginationInfo);
	       
	      /*  TCodeVO code = new TCodeVO();
	        code.setGubun("MG");
	        code.setPagingYn("N");
	        List<TCodeVO> codeListMG = tCodeService.selectTCodeList(code);
	        model.addAttribute("codeListMG", codeListMG);*/
	        
	    model.addAttribute(selectTMemCom(TMemComVO, searchVO));
	    model.addAttribute("comNm", comNm);
	    model.addAttribute("ptLoginId", ptLoginId);
	    model.addAttribute("loginVO", loginVO);
        model.addAttribute("registerFlag", registerFlag);
        model.addAttribute("setTMemComVO", setTMemComVO);
        model.addAttribute("setTPtplInfoVO", setTPtplInfoVO);
     //   model.addAttribute("loginVO",loginVO);
        
        return "/front/agency/agDetail";
    }

    
    
    //상세페이지
    @RequestMapping("/AgencyDetail.do")
    public String AgencyDetail( HttpSession session,
    		@RequestParam(value = "comNm", required=false) String comNm ,
    		@RequestParam(value = "loginId", required=false) String loginId ,
    		@RequestParam(value = "registerFlag", required=false) String registerFlag ,
    		@RequestParam(value = "ptplPart" , required=false) String ptplPart ,
        @ModelAttribute("searchVO") SearchVO searchVO, Model model)
    
        throws Exception {

    	//사용자 로그인 확인 Start
		TMemAccptVO loginVO = (TMemAccptVO) session.getAttribute("DlinkLogin");
		/*if(loginVO == null) {
			model.addAttribute("msg", "fail");
			return "redirect:/front/login.do";
		}*/
		//사용자 로그인 확인 End
    	
    	/** pageing */
    	PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(searchVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(searchVO.getPageUnit());
		paginationInfo.setPageSize(searchVO.getPageSize());
		
		//searchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		//searchVO.setLastIndex(paginationInfo.getLastRecordIndex());
		//searchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		
    		TMemComVO TMemComVO = new TMemComVO();
    		TMemComVO setTMemComVO = new TMemComVO();

    		TMemComVO.setComNm(comNm);  
    		TMemComVO.setLoginId(loginId); 
	        setTMemComVO = TMemComService.selectTMemCom(TMemComVO);
	        
	        TPtplInfoVO TPtplInfoVO = new TPtplInfoVO();
	        TPtplInfoVO.setLoginId(loginId);
	        TPtplInfoVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
	        TPtplInfoVO.setLastIndex(paginationInfo.getLastRecordIndex());
	        TPtplInfoVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
	        TPtplInfoVO.setPtplPart(ptplPart);
			
	        List<?> setTPtplInfoVO = FrontTPtplInfoService.selectTPtplInfoList(TPtplInfoVO);
	        
	        int totCnt = FrontTPtplInfoService.selectTPtplInfoListTotCnt(TPtplInfoVO);
			paginationInfo.setTotalRecordCount(totCnt);
	        model.addAttribute("paginationInfo", paginationInfo);
	       
	      /*  TCodeVO code = new TCodeVO();
	        code.setGubun("MG");
	        code.setPagingYn("N");
	        List<TCodeVO> codeListMG = tCodeService.selectTCodeList(code);
	        model.addAttribute("codeListMG", codeListMG);*/
	        
	    model.addAttribute(selectTMemCom(TMemComVO, searchVO));
	    model.addAttribute("comNm", comNm);
	    model.addAttribute("loginId", loginId);
	    model.addAttribute("loginVO", loginVO);
        model.addAttribute("registerFlag", registerFlag);
        model.addAttribute("setTMemComVO", setTMemComVO);
        model.addAttribute("setTPtplInfoVO", setTPtplInfoVO);
     //   model.addAttribute("loginVO",loginVO);
        
        return "/front/agency/agDetail";
    }

    @RequestMapping("/selectTMemCom.do")
    public @ModelAttribute("TMemComVO")
    TMemComVO selectTMemCom(
            TMemComVO TMemComVO,
            @ModelAttribute("searchVO") SearchVO searchVO) throws Exception {
        return TMemComService.selectTMemCom(TMemComVO);
    }
    
    
    @RequestMapping("/tabSearch.do")
    public String addTReqUser(
    		HttpServletRequest request, ModelAndView view, ModelMap modelMap, HttpSession session,
            TReqUserVO TReqUserVO, Model model,
            @RequestParam(value = "ptplPart" , required=false) String ptplPart , 
            @ModelAttribute("searchVO") SearchVO searchVO, 
            SessionStatus status)
            throws Exception {
    	
    	
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
    		searchVO.setPtplPart(ptplPart);
    		
            List<?> resultList = TMemComService.selectagSearchList(searchVO);
            model.addAttribute("resultList", resultList);
            
            int totCnt = TMemComService.selectagSearchListTotCnt(searchVO);
    		paginationInfo.setTotalRecordCount(totCnt);
            model.addAttribute("paginationInfo", paginationInfo);
    		
       } catch (Exception e) {
			
			e.printStackTrace();
			return "fail";
		}finally {
			
		}
                	        
        return "/front/agency/agSearchList";
    }
    
    
    @ResponseBody
    @RequestMapping("/AgencyDetailAjax.do")
    public String AgencyDetailAjax( 
    		@ModelAttribute("searchVO") TMemComVO searchVO, 
    		@RequestParam(required=false, defaultValue="", value="selGb") String selGb,
    		@RequestParam(required=false, defaultValue="", value="ptplNo") BigDecimal ptplNo,  		
    		@RequestParam(required=false, defaultValue="", value="imgPath") String imgPath,  			
    		 HttpSession session, ModelMap model, HttpServletResponse response
    ) throws Exception {
    	
    	String msg = "";
    	try {
	  //사용자 로그인 확인 Start
		TMemAccptVO loginVO = (TMemAccptVO) session.getAttribute("DlinkLogin");
		if(loginVO == null) {
			model.addAttribute("msg", "fail");
			return "redirect:/front/login.do";
		}
		//사용자 로그인 확인 End
		TSelImgVO Tselvo = new TSelImgVO();
		Tselvo.setLoginId(searchVO.getLoginId());
		Tselvo.setUserId(loginVO.getLoginId());
		Tselvo.setSelGb("agency");
		
		TSelImgVO TSelImgVO = new TSelImgVO();
		
    	if(TSelImgService.selectTSelImgFavoriteCnt(Tselvo) > 0) {
    		
    		TSelImgVO.setLoginId(searchVO.getLoginId());
    		TSelImgVO.setUserId(loginVO.getLoginId());
    		TSelImgVO.setSelGb("agency");
    		TSelImgService.deleteTSelImg(TSelImgVO);
    		
    	} 
    	
    	// 파일 형변환 사용
        // searchVO imgPath변수 String 
    	
		if(selGb.equals("agency")){
			// 포트폴리오 널값체크
	    	if(ptplNo != null){
				TSelImgVO.setPtplNo(ptplNo);
			}else{
				TSelImgVO.setPtplNo(null);
			}
	    	
			// 대표이미지 널값 체크
			if(imgPath != null && imgPath != ""){
				TSelImgVO.setFileSeq(null);
			}else{
				// TSelImgVO FileSeq변수 BigDecimal			
			    BigDecimal fileSeq  = new BigDecimal(imgPath);		        
				TSelImgVO.setFileSeq(fileSeq);			
			}	
			
			TSelImgVO.setUserId(loginVO.getLoginId());
    		TSelImgVO.setLoginId(searchVO.getLoginId());
    		TSelImgVO.setSelGb("agency");
    		
    		TSelImgService.insertTSelImg(TSelImgVO);
    		
		}else if(selGb.equals("ptpl")){
			// 포트폴리오 널값체크
	    	if(ptplNo != null){
				TSelImgVO.setPtplNo(ptplNo);
			}else{
				TSelImgVO.setPtplNo(null);
			}
	    	
	    	// 대표이미지 널값 체크
			if(imgPath != null){
				// TSelImgVO FileSeq변수 BigDecimal
		       BigDecimal fileSeq  = new BigDecimal(imgPath);		        
				TSelImgVO.setFileSeq(fileSeq);
			}else{
				TSelImgVO.setFileSeq(null);
			}
			
					
			TSelImgVO.setUserId(loginVO.getLoginId());
    		TSelImgVO.setLoginId(searchVO.getLoginId());
    		TSelImgVO.setSelGb("ptpl");
    		
    		TSelImgService.insertTSelImg(TSelImgVO);
    		
    		
    	}
    	
    	msg = "succes";
		} catch (Exception e) {
			msg = "fail";
			e.printStackTrace();
			
		}
	    
	    
	    
        return msg;
    }
    
}
