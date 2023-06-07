package dlink.admin.controller;

import java.io.File;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import dlink.admin.service.TCodeService;
import dlink.admin.service.TPtplInfoService;
import dlink.admin.vo.SearchVO;
import dlink.admin.vo.TCodeVO;
import dlink.admin.vo.TMemAccptVO;
import dlink.admin.vo.TPtplInfoVO;
import dlink.common.service.CommProperties;
import dlink.common.service.TAttfileService;
import dlink.common.vo.TAttfileVO;

/**
 * @Class Name : TPtplInfoController.java
 * @Description : TPtplInfo Controller class
 * @Modification Information
 *
 * @author 장나현
 * @since 2022-03-30
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */

@Controller
@RequestMapping("/admin/portfolio")
public class TPtplInfoController {

    @Resource(name = "TPtplInfoService")
    private TPtplInfoService TPtplInfoService;
    
    @Resource(name = "TCodeService")
    private TCodeService tCodeService;
	
    /** EgovPropertyService */
    @Resource(name = "propertiesService")
    protected EgovPropertyService propertiesService;
    
    @Resource(name = "TAttfileService")
    private TAttfileService tAttfileService;
	
    /**
	 * t_ptpl_info 목록을 조회한다. (pageing)
	 * @param searchVO - 조회할 정보가 담긴 SerchVo
	 * @return "/TPtplInfo/TPtplInfoList"
	 * @exception Exception
	 */
    @RequestMapping(value="/portfInquiryList.do")
    public String selectTPtplInfoList(
    		@ModelAttribute("searchVO") TPtplInfoVO searchVO, HttpSession session,
    		ModelMap model)
            throws Exception {

    	TMemAccptVO loginVO = (TMemAccptVO) session.getAttribute("DlinkLogin");
		if(loginVO == null) {
			model.addAttribute("msg", "fail");
			return "redirect:/admin/login.do";
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
		
		model.addAttribute("regDtStrt", searchVO.getRegDtStrt());
		model.addAttribute("regDtEnd", searchVO.getRegDtEnd());
		model.addAttribute("searchKeyword", searchVO.getSearchKeyword());
		model.addAttribute("searchCondition", searchVO.getSearchCondition());
		
        List<?> TPtplInfoList = TPtplInfoService.selectTPtplInfoList(searchVO);
        model.addAttribute("resultList", TPtplInfoList);
        
        int totCnt = TPtplInfoService.selectTPtplInfoListTotCnt(searchVO);
		paginationInfo.setTotalRecordCount(totCnt);
        model.addAttribute("paginationInfo", paginationInfo);
        
        return "/admin/TPtplInfo/TPtplInfoList";
    } 
    
    @RequestMapping(value="/portfDetail.do")
    public String selectTPtplInfo(@ModelAttribute("searchVO") TPtplInfoVO searchVO, HttpSession session,
    		ModelMap model)
            throws Exception {
    	TMemAccptVO loginVO = (TMemAccptVO) session.getAttribute("DlinkLogin");
		if(loginVO == null) {
			model.addAttribute("msg", "fail");
			return "redirect:/admin/login.do";
		}
		
    	List<TCodeVO> codeList = new ArrayList<>();
    	TCodeVO tcodeVO = new TCodeVO();
    	List<TPtplInfoVO> tPtplInfoImgList = new ArrayList<>();
    	try{
    		searchVO = TPtplInfoService.selectTPtplInfo(searchVO);
            model.addAttribute("searchVO", searchVO);
            
            tPtplInfoImgList = TPtplInfoService.selectTPtplInfoImgList(searchVO);
            model.addAttribute("imgList", tPtplInfoImgList);
            
            tcodeVO.setGubun("PT");
            tcodeVO.setPagingYn("N");
    		codeList = tCodeService.selectTCodeList(tcodeVO);
    		
    		String[] gb_arr = null;
    		String gb_temp = "";
    		if(searchVO.getPtplType().length()>1){
				gb_arr = searchVO.getPtplType().split(",");
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
    		model.addAttribute("codeListPT", gb_temp);
    		
    		tcodeVO.setGubun("PS");
    		codeList = tCodeService.selectTCodeList(tcodeVO);
    		if(searchVO.getPtplStyle().length()>1){
				gb_arr = searchVO.getPtplStyle().split(",");
			}
    		gb_temp = "";
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
    		model.addAttribute("codeListPS", gb_temp);
    		
    		
    		tcodeVO.setGubun("AP");
    		codeList = tCodeService.selectTCodeList(tcodeVO);
    		if(searchVO.getAddOption().length()>1){
				gb_arr = searchVO.getAddOption().split(",");
			}
    		gb_temp = "";
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
    		model.addAttribute("codeListAP", gb_temp);
    		
    	}catch(Exception e){
			e.printStackTrace();
		}
        
        return "/admin/TPtplInfo/TPtplInfoDetail";
    } 
    
    @RequestMapping("/deleteTPtplInfo.do")
    public String deleteTPtplInfo(
            TPtplInfoVO tPtplInfoVO,  
            @ModelAttribute("searchVO") SearchVO searchVO, SessionStatus status, RedirectAttributes redirect)
            throws Exception {
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
        return "redirect:/admin/portfolio/portfInquiryList.do";
    }
    
    
    @RequestMapping("/TPtplInfo/addTPtplInfoView.do")
    public String addTPtplInfoView(
            @ModelAttribute("searchVO") SearchVO searchVO, Model model)
            throws Exception {
        model.addAttribute("TPtplInfoVO", new TPtplInfoVO());
        return "/TPtplInfo/TPtplInfoRegister";
    }
    
    @RequestMapping("/TPtplInfo/addTPtplInfo.do")
    public String addTPtplInfo(
            TPtplInfoVO TPtplInfoVO,
            @ModelAttribute("searchVO") SearchVO searchVO, SessionStatus status)
            throws Exception {
        TPtplInfoService.insertTPtplInfo(TPtplInfoVO);
        status.setComplete();
        return "forward:/TPtplInfo/TPtplInfoList.do";
    }
    
    @RequestMapping("/TPtplInfo/updateTPtplInfoView.do")
    public String updateTPtplInfoView(
            @RequestParam("loginId") java.lang.String loginId ,
            @ModelAttribute("searchVO") SearchVO searchVO, Model model)
            throws Exception {
        TPtplInfoVO TPtplInfoVO = new TPtplInfoVO();
        TPtplInfoVO.setLoginId(loginId);        
        // 변수명은 CoC 에 따라 TPtplInfoVO
        model.addAttribute(selectTPtplInfo(TPtplInfoVO, searchVO));
        return "/TPtplInfo/TPtplInfoRegister";
    }

    @RequestMapping("/TPtplInfo/selectTPtplInfo.do")
    public @ModelAttribute("TPtplInfoVO")
    TPtplInfoVO selectTPtplInfo(
            TPtplInfoVO TPtplInfoVO,
            @ModelAttribute("searchVO") SearchVO searchVO) throws Exception {
        return TPtplInfoService.selectTPtplInfo(TPtplInfoVO);
    }

    @RequestMapping("/TPtplInfo/updateTPtplInfo.do")
    public String updateTPtplInfo(
            TPtplInfoVO TPtplInfoVO,
            @ModelAttribute("searchVO") SearchVO searchVO, SessionStatus status)
            throws Exception {
        TPtplInfoService.updateTPtplInfo(TPtplInfoVO);
        status.setComplete();
        return "forward:/TPtplInfo/TPtplInfoList.do";
    }
    

}
