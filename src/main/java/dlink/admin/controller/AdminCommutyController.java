package dlink.admin.controller;

import java.math.BigDecimal;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import dlink.admin.service.TCommutyService;
import dlink.admin.vo.SearchVO;
import dlink.admin.vo.TCommutyVO;
import dlink.admin.vo.TMemAccptVO;
import dlink.common.service.TAttfileService;
import dlink.common.vo.TAttfileVO;
import egovframework.cmmn.service.EgovStringUtil;

/**
 * @Class Name : TCommutyController.java
 * @Description : TCommuty Controller class
 * @Modification Information
 *
 * @author 이효진
 * @since 2022-03-30
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */

@Controller
@RequestMapping("/admin/commuty")
public class AdminCommutyController {

    @Resource(name = "TCommutyService")
    private TCommutyService TCommutyService;
    
    @Resource(name = "TAttfileService")
    private TAttfileService TAttfileService;
    
    /** EgovPropertyService */
    @Resource(name = "propertiesService")
    protected EgovPropertyService propertiesService;
	
    
    /**
	 * t_commuty 목록을 조회한다. (pageing)
	 * @param searchVO - 조회할 정보가 담긴 SerchVo
	 * @return "/TCommuty/TCommutyList"
	 * @exception Exception
	 */
    @RequestMapping(value="/commutyInquiryList.do")
    public String selectTCommutyList(@ModelAttribute("searchVO") SearchVO searchVO, 
    		 @RequestParam(value = "searchCondition", required=false) String searchCondition ,
    		 @RequestParam(value = "searchKeyword" , required=false) String searchKeyword ,
    		ModelMap model, HttpServletRequest request)
            throws Exception {
    	
    	String menuId = request.getParameter("menu_id");
    	
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
		searchVO.setMenuId(menuId);
		
        List<?> TCommutyList = TCommutyService.selectTCommutyList(searchVO);
        model.addAttribute("resultList", TCommutyList);
        
        int totCnt = TCommutyService.selectTCommutyListTotCnt(searchVO);
		paginationInfo.setTotalRecordCount(totCnt);
	
        model.addAttribute("paginationInfo", paginationInfo);
        model.addAttribute("menuId", menuId);
        
        return "/admin/commuty/commutyInquiryList";
    } 
    
    @RequestMapping("/addCommutyView.do")
    public String addTCommutyView(
    		@RequestParam("registerFlag") String registerFlag ,
    		@RequestParam("menuId") String menuId ,
            @ModelAttribute("searchVO") SearchVO searchVO, Model model)
            throws Exception {
    	
        model.addAttribute("TCommutyVO", new TCommutyVO());
        model.addAttribute("registerFlag", registerFlag);
        model.addAttribute("menuId", menuId);
        
        return "/admin/commuty/commutyMagmt";
    }
    
    @ResponseBody
    @RequestMapping("/addCommuty.do")
    public String addTCommuty(
    		HttpServletRequest request, ModelAndView view, ModelMap modelMap, 
    		HttpSession session, Model model,
            TCommutyVO TCommutyVO, 
            @RequestParam("menuId") String menuId ,
            @ModelAttribute("searchVO") SearchVO searchVO, SessionStatus status)
            throws Exception {
    	
    	String res = "";
    	
    	
    	//사용자 로그인 확인 Start
		TMemAccptVO loginVO = (TMemAccptVO) session.getAttribute("DlinkLogin");
		if(loginVO == null) {
			model.addAttribute("msg", "fail");
			return "redirect:/admin/login.do";
		}
		//사용자 로그인 확인 End
    	
		try {
			
			TCommutyVO setTCommutyVO = new TCommutyVO();
			
			setTCommutyVO.setMenuId(menuId);
			int postNo = TCommutyService.selectForInsertPostNo(setTCommutyVO); // 게시물번호 생성
			
			
			setTCommutyVO.setPostNo(postNo);
			int seq = TCommutyService.selectForInsertSeq(setTCommutyVO); // 게시순번 생성
			
			setTCommutyVO.setSeq(seq);
			
			
			setTCommutyVO.setTitle(TCommutyVO.getTitle());
		//	setTCommutyVO.setCont(setHtml(TCommutyVO.getCont()));    // 저장된 cont내용을 변환시켜서 cont로 담는다.
			 setTCommutyVO.setCont(EgovStringUtil.getHtmlStrCnvr(TCommutyVO.getCont()));   // 저장된 cont내용을 변환시켜서 cont로 담는다.
			 
			setTCommutyVO.setRegister(loginVO.getLoginId());	
			setTCommutyVO.setOpenYn(TCommutyVO.getOpenYn());
	//		setTCommutyVO.setPwd(TCommutyVO.getPwd());
	
			TCommutyService.insertTCommuty(setTCommutyVO);     // 게시물 내용 저장
		    //status.setComplete(); 
		     				
			
			if(TCommutyVO.getFile_attch() != null &&TCommutyVO.getFile_attch().length != 0) {
				for(int i = 0; i < TCommutyVO.getFile_attch().length; i++) {
					setTCommutyVO.setFileSeq(TCommutyVO.getFile_attch()[i]);
					TCommutyService.insertTCommutyFileS(setTCommutyVO);    // 커뮤니티파일정보 저장				
				}
			}
				
						
			res = "suc";
		}catch(Exception e){
			e.printStackTrace();
			return "fail";
		} finally {
			
		}
		
       
        return res;
    }
    
    @RequestMapping("/updateCommutyView.do")
    public String updateTCommutyView(
            @ModelAttribute("searchVO") SearchVO searchVO, 
            @RequestParam("menuId") String menuId ,
            @RequestParam("postNo") int postNo ,
            @RequestParam("seq") int seq ,
            @RequestParam("registerFlag") String registerFlag ,
            Model model)
            throws Exception {
    	
        TCommutyVO TCommutyVO = new TCommutyVO();
        TCommutyVO setTCommutyVO = new TCommutyVO();
        TCommutyVO.setMenuId(menuId);    
        TCommutyVO.setPostNo(postNo);  
        TCommutyVO.setSeq(seq);  
       
        setTCommutyVO = TCommutyService.selectTCommuty(TCommutyVO);
        
        List<?> selectTCommutyFileList= TCommutyService.selectTCommutyFileList(TCommutyVO);
        
        // 변수명은 CoC 에 따라 TCommutyVO
        model.addAttribute(selectTCommuty(TCommutyVO, searchVO));
        model.addAttribute("registerFlag", registerFlag);
        model.addAttribute("setTCommutyVO", setTCommutyVO);
        model.addAttribute("selectTCommutyFileList", selectTCommutyFileList);
        model.addAttribute("menuId", menuId);
        model.addAttribute("postNo", postNo);
        model.addAttribute("seq", seq);
        
        return "/admin/commuty/commutyMagmt";
    }

    @RequestMapping("/selectCommuty.do")
    public @ModelAttribute("TCommutyVO")
    TCommutyVO selectTCommuty(
            TCommutyVO TCommutyVO,
            @ModelAttribute("searchVO") SearchVO searchVO) throws Exception {
        return TCommutyService.selectTCommuty(TCommutyVO);
    }
    
    // view페이지
    @RequestMapping("/viewCommuty.do")
    public String viewTCommuty(
    		 @RequestParam("menuId") String menuId ,
             @RequestParam("postNo") int postNo ,
             @RequestParam("seq") int seq ,
             @RequestParam("registerFlag") String registerFlag ,
            @ModelAttribute("searchVO") SearchVO searchVO, Model model)
            throws Exception {
        
    	  TCommutyVO TCommutyVO = new TCommutyVO();
    	  TCommutyVO setTCommutyVO = new TCommutyVO();
    	  TCommutyVO.setMenuId(searchVO.getMenuId());    
    	  TCommutyVO.setPostNo(postNo);
    	  TCommutyVO.setSeq(seq);
          
          setTCommutyVO = TCommutyService.selectTCommuty(TCommutyVO);
          
                
          List<?> selectTCommutyFileList= TCommutyService.selectTCommutyFileList(TCommutyVO);
          
          
        // 변수명은 CoC 에 따라 TWordVO
        model.addAttribute(selectTCommuty(TCommutyVO, searchVO));
        model.addAttribute("registerFlag", registerFlag);
        model.addAttribute("setTCommutyVO", setTCommutyVO);
        model.addAttribute("selectTCommutyFileList", selectTCommutyFileList);
        model.addAttribute("menuId", menuId);
        model.addAttribute("postNo", postNo);
        model.addAttribute("seq", seq);
     
        return "/admin/commuty/commutyDetail";
    }
    
    
    // 게시판 수정
    @ResponseBody
    @RequestMapping("/updateCommuty.do")
    public String updateTCommuty(
            TCommutyVO TCommutyVO, HttpSession session, Model model,
            @ModelAttribute("searchVO") SearchVO searchVO, SessionStatus status)
            throws Exception {
    	
    	String res = "";
    	//사용자 로그인 확인 Start
		TMemAccptVO loginVO = (TMemAccptVO) session.getAttribute("DlinkLogin");
		if(loginVO == null) {
			model.addAttribute("msg", "fail");
			return "redirect:/admin/login.do";
		}
		//사용자 로그인 확인 End
    	
		try {
			TCommutyVO setTCommutyVO = new TCommutyVO();
			
			setTCommutyVO.setMenuId(TCommutyVO.getMenuId());						
			setTCommutyVO.setPostNo(TCommutyVO.getPostNo());			
			setTCommutyVO.setSeq(TCommutyVO.getSeq());
			setTCommutyVO.setTitle(TCommutyVO.getTitle());
			 setTCommutyVO.setCont(EgovStringUtil.getHtmlStrCnvr(TCommutyVO.getCont()));   // 저장된 cont내용을 변환시켜서 cont로 담는다.			 
			setTCommutyVO.setRegister(loginVO.getLoginId());	
			setTCommutyVO.setOpenYn(TCommutyVO.getOpenYn());
		
			 TCommutyService.updateTCommuty(setTCommutyVO);  // 수정된 게시물 내용 
		       //status.setComplete();
			 
				
			if(TCommutyVO.getFile_attch() != null &&TCommutyVO.getFile_attch().length != 0) {
				for(int i = 0; i < TCommutyVO.getFile_attch().length; i++) {
					setTCommutyVO.setFileSeq(TCommutyVO.getFile_attch()[i]);
					  TCommutyService.deleteTCommutyFile(setTCommutyVO);    // t_commuty_file 게시물 첨부파일 삭제
				      				
					setTCommutyVO.setFileSeq(TCommutyVO.getFile_attch()[i]);
					TCommutyService.insertTCommutyFileS(setTCommutyVO);    // 커뮤니티파일정보 저장		
				}
			}
					

			res = "upsuc";
				
		}catch(Exception e){
			
			e.printStackTrace();
			return "fail";
			
		} finally {
			
		}
		   
        return res;
    }
    
    // 게시판 삭제
    @ResponseBody
    @RequestMapping("/deleteCommuty.do")
    public String deleteTCommuty(
            TCommutyVO TCommutyVO,HttpSession session, Model model,
            @ModelAttribute("searchVO") SearchVO searchVO, SessionStatus status)
            throws Exception {
    	

        String res = "";
    	//사용자 로그인 확인 Start
		TMemAccptVO loginVO = (TMemAccptVO) session.getAttribute("DlinkLogin");
		if(loginVO == null) {
			model.addAttribute("msg", "fail");
			return "redirect:/admin/login.do";
		}
		//사용자 로그인 확인 End
    	
		try {
			TCommutyVO setTCommutyVO = new TCommutyVO();
			
			setTCommutyVO.setMenuId(TCommutyVO.getMenuId());						
			setTCommutyVO.setPostNo(TCommutyVO.getPostNo());
			setTCommutyVO.setSeq(TCommutyVO.getSeq());
			
	        TCommutyService.deleteTCommuty(setTCommutyVO);    // 게시물 삭제
	        //status.setComplete();
	        
	        
	    	if(TCommutyVO.getFile_attch() != null &&TCommutyVO.getFile_attch().length != 0) {
				for(int i = 0; i < TCommutyVO.getFile_attch().length; i++) {
					setTCommutyVO.setFileSeq(TCommutyVO.getFile_attch()[i]);
					  TCommutyService.deleteTCommutyFile(setTCommutyVO);    // t_commuty_file 게시물 첨부파일 삭제
				      
					  String fileSeq = setTCommutyVO.getFileSeq();
					  BigDecimal FileSeq = new BigDecimal(fileSeq);
					  
					  TAttfileVO TAttfileVO= new TAttfileVO();
					  TAttfileVO.setFileSeq(FileSeq);
					  TAttfileService.deleteTAttfile(TAttfileVO);	// t_attfile 테이블 파일 삭제
				}
			}
					
	          
			res = "suc";
				
		}catch(Exception e){
			
			e.printStackTrace();
			return "fail";
			
		} finally {
			
		}
		
        return res;
           
    }
    
    
    // 게시판 파일삭제
    @ResponseBody
    @RequestMapping("/deleteFileCommuty.do")
    public String deleteFileCommuty(
            TCommutyVO TCommutyVO,HttpSession session, Model model,
            @ModelAttribute("searchVO") SearchVO searchVO, SessionStatus status)
            throws Exception {
    	

        String res = "";
    	
		try {
			
			TCommutyService.deleteTCommutyFile(TCommutyVO);    // t_commuty_file 게시물 첨부파일 삭제
	      
			  String fileSeq = TCommutyVO.getFileSeq();
			  BigDecimal FileSeq = new BigDecimal(fileSeq);
			  
			  TAttfileVO TAttfileVO= new TAttfileVO();
			  TAttfileVO.setFileSeq(FileSeq);
			  TAttfileService.deleteTAttfile(TAttfileVO);	// t_attfile 테이블 파일 삭제
				
					
	          
			  res = "suc";
				
		}catch(Exception e){
			
			e.printStackTrace();
			return "fail";
			
		} finally {
			
		}
		
        return res;
           
    }
    
    // view페이지
    @RequestMapping("/DetailCommentsCommuty.do")
    public String viewTFaq(    		
            @RequestParam("menuId") String menuId , 
            @RequestParam("postNo") int postNo ,
            @RequestParam("seq") int seq ,
            @RequestParam("registerFlag") String registerFlag ,
            @ModelAttribute("searchVO") SearchVO searchVO,
            Model model ) throws Exception {
    	
    	TCommutyVO TCommutyVO = new TCommutyVO();
    	TCommutyVO setTCommutyVO = new TCommutyVO();
    	//TCommutyVO CommentTCommutyVO = new TCommutyVO();
    	
    	TCommutyVO.setMenuId(menuId);  
    	TCommutyVO.setPostNo(postNo);  
    	TCommutyVO.setSeq(seq); 
    	setTCommutyVO = TCommutyService.selectTCommuty(TCommutyVO);
    	
    	// 답글 리스트
    	TCommutyVO.setMenuId(menuId);  
    	TCommutyVO.setPostNo(postNo);  
    	List<?> CommentTCommutyList = TCommutyService.selectCommentsTCommutyList(TCommutyVO);
    	
         // 변수명은 CoC 에 따라 TFaqVO
         model.addAttribute(selectTCommuty(TCommutyVO, searchVO));
         model.addAttribute("registerFlag", registerFlag);
         model.addAttribute("setTCommutyVO", setTCommutyVO);
         model.addAttribute("CommentList", CommentTCommutyList);
         model.addAttribute("menuId", menuId);
         
        return "/admin/commuty/commutyDetail";
    }
    
    
    // 답변페이지
    @RequestMapping("/CommentsCommutyDetail.do")
    public String CommentsCommuty(    		
            @RequestParam("menuId") String menuId , 
            @RequestParam("postNo") int postNo ,
            @RequestParam("seq") int seq ,
            @RequestParam("registerFlag") String registerFlag ,
            @ModelAttribute("searchVO") SearchVO searchVO,
            Model model ) throws Exception {
    	
    	TCommutyVO TCommutyVO = new TCommutyVO();
    	TCommutyVO setTCommutyVO = new TCommutyVO();
    	//TCommutyVO CommentTCommutyVO = new TCommutyVO();
    	
    	TCommutyVO.setMenuId(menuId);  
    	TCommutyVO.setPostNo(postNo);  
    	TCommutyVO.setSeq(seq); 
    	setTCommutyVO = TCommutyService.selectTCommuty(TCommutyVO);
    	
    	// 답글 리스트
    	TCommutyVO.setMenuId(menuId);  
    	TCommutyVO.setPostNo(postNo);  
    	List<?> CommentTCommutyList = TCommutyService.selectCommentsTCommutyList(TCommutyVO);
    	
         // 변수명은 CoC 에 따라 TFaqVO
         model.addAttribute(selectTCommuty(TCommutyVO, searchVO));
         model.addAttribute("registerFlag", registerFlag);
         model.addAttribute("setTCommutyVO", setTCommutyVO);
         model.addAttribute("CommentList", CommentTCommutyList);
         model.addAttribute("menuId", menuId);
         
        return "/admin/commuty/commutyDetail";
    }
    
 
    
    
    // 답변 등록
    @ResponseBody
    @RequestMapping("/CommentsCommuty.do")
    public String CommentsCommuty(
            TCommutyVO TCommutyVO, HttpSession session, Model model,
            @RequestParam("menuId") String menuId , 
            @RequestParam("postNo") int postNo ,
            @RequestParam("registerFlag") String registerFlag ,
            @ModelAttribute("searchVO") SearchVO searchVO, SessionStatus status)
            throws Exception {
    	
    	String res = "";
    	//사용자 로그인 확인 Start
		TMemAccptVO loginVO = (TMemAccptVO) session.getAttribute("DlinkLogin");
		if(loginVO == null) {
			model.addAttribute("msg", "fail");
			return "redirect:/admin/login.do";
		}
		//사용자 로그인 확인 End
    	
		try {
			TCommutyVO setTCommutyVO = new TCommutyVO();
			
			setTCommutyVO.setMenuId(menuId);								
			setTCommutyVO.setPostNo(postNo);
			
			int seq = TCommutyService.selectForInsertSeq(setTCommutyVO); // 게시순번 생성
			
			setTCommutyVO.setSeq(seq);
			setTCommutyVO.setTitle(TCommutyVO.getTitle());
			setTCommutyVO.setCont(TCommutyVO.getCont());
			  
			setTCommutyVO.setRegister(loginVO.getLoginId());	
			setTCommutyVO.setOpenYn(TCommutyVO.getOpenYn());
			setTCommutyVO.setPwd(TCommutyVO.getPwd());
			
			 TCommutyService.insertCommentsTCommuty(setTCommutyVO);
		       //status.setComplete();
			
			res = "suc";
				
		}catch(Exception e){
			
			e.printStackTrace();
			return "fail";
			
		} finally {
			
		}
		   
        return res;
    }
    
    // 게시판 수정
    @RequestMapping("/updateCommentsCommuty.do")
    public String updateCommentsCommuty(
            TCommutyVO TCommutyVO, HttpSession session, Model model,
            @ModelAttribute("searchVO") SearchVO searchVO, SessionStatus status)
            throws Exception {
    	
    	String res = "";
    	//사용자 로그인 확인 Start
		TMemAccptVO loginVO = (TMemAccptVO) session.getAttribute("DlinkLogin");
		if(loginVO == null) {
			model.addAttribute("msg", "fail");
			return "redirect:/admin/login.do";
		}
		//사용자 로그인 확인 End
    	
		try {
			TCommutyVO setTCommutyVO = new TCommutyVO();
			
			setTCommutyVO.setMenuId(TCommutyVO.getMenuId());						
			setTCommutyVO.setPostNo(TCommutyVO.getPostNo());
			setTCommutyVO.setSeq(TCommutyVO.getSeq());
			setTCommutyVO.setTitle(TCommutyVO.getTitle());
			setTCommutyVO.setCont(TCommutyVO.getCont());
			setTCommutyVO.setRegister(loginVO.getLoginId());	
			setTCommutyVO.setOpenYn(TCommutyVO.getOpenYn());
			setTCommutyVO.setPwd(TCommutyVO.getPwd());
			
			 TCommutyService.updateCommentsTCommuty(setTCommutyVO);
		       //status.setComplete();
			
			res = "upsuc";
				
		}catch(Exception e){
			
			e.printStackTrace();
			return "fail";
			
		} finally {
			
		}
		   
        return res;
    }
    
    
    // 스마트에디터 태그 변환 
  /*  public String setHtml(String contents){
    	String result = contents;
  	  
  	  result = result.replaceAll("&lt;", "<");
  	  result = result.replaceAll("&gt;", ">");
  	  result = result.replaceAll("&quot;", "\""); 
  	  result = result.replaceAll("&nbsp;", ""); 
  	  result = result.replaceAll("&amp;", "&"); 
  	 
  	  return result;
    }*/
}
