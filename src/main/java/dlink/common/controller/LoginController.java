package dlink.common.controller;

import java.security.MessageDigest;
import java.security.SecureRandom;
import java.util.Date;
import java.util.HashMap;
import java.util.logging.Logger;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import dlink.admin.vo.TMemAccptVO;
import dlink.common.vo.SearchVO;
import dlink.common.vo.LoginVO;
import dlink.common.vo.MtsAtalkAuthVO;
import dlink.front.vo.MtsAtalkMsgVO;

import dlink.admin.service.TMemAccptService;
import dlink.common.service.CommonHttpService;
import dlink.common.service.LoginService;
import dlink.common.service.MtsAtalkAuthService;
import dlink.common.service.MtsAtalkMsgService;
import dlink.common.service.EmailService;
import dlink.front.service.FrontMtsAtalkMsgService;



@Controller
public class LoginController {
	
	private final static Logger LOG = Logger.getGlobal();

	private static final String MtsAtalkAuthVO = null;
	
	@Resource(name = "MtsAtalkAuthService")
    private MtsAtalkAuthService MtsAtalkAuthService;
	
    @Resource(name = "TMemAccptService")
    private TMemAccptService tMemAccptService;
    
    @Resource(name = "CommonHttpService")
    private CommonHttpService CommonHttpService;
    
    @Resource(name = "LoginService")
    private LoginService LoginService;
    
    @Autowired
	private EmailService emailService;
    
    @Resource(name = "mtsAtalkMsgService")
    private FrontMtsAtalkMsgService mtsAtalkMsgService;
    
    /** 알림톡 */
    @Resource(name = "MtsAtalkMsgService")
    private MtsAtalkMsgService MtsAtalkMsgService;
    
    final String FAIL = "fail";
    
	//관리자 로그인화면
	@RequestMapping(value="/admin/login.do")
    public String adminLogin(HttpServletRequest req, HttpServletResponse response, ModelMap model)
            throws Exception {
		
		if(FAIL.equals(req.getParameter("msg"))) {
			CommonHttpService.alert(response, "로그인 정보를 다시 확인해주세요");
		}
		
		return "login/admin_login";
    } 
	
	
	//관리자 로그인 작동
	@RequestMapping(value="/admin/loginSel.do")
    public String adminLoginSel(
    		ModelMap model,
    		HttpServletRequest req,
    		HttpSession session
    		)
            throws Exception {
		//아이디 및 패스워드 설정(패스워드 암호화)
		TMemAccptVO vo = loginInfo(req);
		//관리자 코드
		vo.setUserType("MG0003");
		TMemAccptVO loginVO = tMemAccptService.selectLogin(vo); 
		
		if(loginVO == null) {
			model.addAttribute("msg", FAIL);
			return "redirect:/admin/login.do";
		}else {
			session.setAttribute("DlinkLogin", loginVO);
			return "redirect:/admin/code/codeMagmtList.do";
		}
    }
	
	
	//일반사용자 체크 인증번호 확인
	@ResponseBody
	@RequestMapping(value="/front/userCheck.do")
    public String userCheck(HttpServletRequest req, HttpServletResponse response, ModelMap model, HttpSession session,
    		@RequestParam(value = "mobileNo", required=false)String mobileNo)
    
            throws Exception {
						
		String alrim = this.getRamdomNumber(6); //알림톡 발송 번호
		String phoneNum = "";
		
		//여러번 신청 할 경우 값이 쌓임
		if(session.getAttribute("DlinkImsi") != null) {
			//데이터 삭제 필요 (테이블 : mts_atalk_auth)
			
		}
		
		session.setAttribute("DlinkImsi", getRamdomPassword(10));
		System.out.println(session.getAttribute("DlinkImsi"));
		//임시번호 테이블(mts_atalk_auth) 값을 저장
		//세션 DlinkImsi, alrim
		
		//알림톡을 발송 mts_atalk_auth 데이터를 입력
		// 상담등록시 알림톡 발송
		MtsAtalkMsgVO altVo = new MtsAtalkMsgVO();
		altVo.setMobileNo(mobileNo.replaceAll("-", ""));
		altVo.setTranTmplCd("sendTalk_mst001");
		altVo.setTranMsg(alrim);
		MtsAtalkMsgService.sendTalk_Default(altVo);
		
		//phoneNum 핸드폰번호로 alrim를 발송
		MtsAtalkAuthVO reqvo = new MtsAtalkAuthVO();
		reqvo.setAuthNm(alrim);//인증번호
		reqvo.setHpNm(mobileNo.replaceAll("-", ""));
		reqvo.setSessionVal((String) session.getAttribute("DlinkImsi"));
		MtsAtalkAuthService.insertMtsAtalkAuth(reqvo);
		
		return alrim;
    } 
	@ResponseBody
	@RequestMapping(value="/front/userCheckResult.do")
    public String userCheckResult(HttpServletRequest req, HttpServletResponse response, ModelMap model, HttpSession session,SearchVO searchVO,
    		@RequestParam(value = "mobileNo", required=false)String mobileNo,
    		@RequestParam(value = "authNm", required=false)String authNm )
    
            throws Exception {
		
		String sessionNm = (String) session.getAttribute("DlinkImsi");
		String alrim = this.getRamdomNumber(6);
		//sessionNm 값, alrim 값이랑 동일하면 사용자 인증이 끝남.
		
		MtsAtalkAuthVO reqvo = new MtsAtalkAuthVO();
		
		reqvo.setAuthNm(authNm);
		reqvo.setHpNm(mobileNo.replaceAll("-", ""));
		reqvo.setSessionVal(sessionNm);
		
		int totCnt = MtsAtalkAuthService.selectMtsAtalkAuthListTotCnt(reqvo);
 				
		return String.valueOf(totCnt);
		
		//데이터 삭제
    }
	
	
	//사용자 로그인
	@RequestMapping(value="/front/login.do")
    public String loginInfo(HttpServletRequest req, HttpServletResponse response, ModelMap model)
            throws Exception {
		if(FAIL.equals(req.getParameter("msg"))) {
			CommonHttpService.alert(response, "로그인 정보를 다시 확인해주세요");
		}
		
		return "login/front_login";
    } 
	
	//사용자 로그인 작동
	@RequestMapping(value="/front/loginSel.do")
    public String loginInfoSel(
    		ModelMap model,
    		HttpServletRequest req,
    		HttpSession session
    		)
            throws Exception {
		//아이디 및 패스워드 설정(패스워드 암호화)
		TMemAccptVO vo = loginInfo(req);
		
		TMemAccptVO loginVO = tMemAccptService.selectLogin(vo); 
		
		if(loginVO == null) {
			model.addAttribute("msg", FAIL);
			return "redirect:/front/login.do";
		}else {
			session.setAttribute("DlinkLogin", loginVO);
			return "redirect:/front/main.do";
		}
    }
	
	//사용자 로그인 작동
	@RequestMapping(value="/logout/{idx}.do")
    public String logout(
    		@PathVariable String idx,
    		ModelMap model,
    		HttpServletRequest req,
    		HttpSession session,
    		HttpServletResponse response)
            throws Exception {
		session.removeAttribute("DlinkLogin");
		
		if("admin".equals(idx)) {
			return "redirect:/admin/login.do";
		}else {
			return "redirect:/front/main.do";
		}
    }
	
	//로그인 및 패스워드 폼
	@RequestMapping(value="/front/login/fdmInfo.do")
    public String fdmInfo(HttpServletRequest req, HttpServletResponse response, ModelMap model)
            throws Exception {
		return "login/fdmInfo";
    } 
	
	//로그인 및 패스워드 폼
	@ResponseBody
	@RequestMapping(value="/front/loginSearch/{url}.do", produces = "application/text; charset=utf8")
    public String loginSearch(@PathVariable String url,HttpServletRequest req, HttpServletResponse response, ModelMap model,LoginVO loginVO)
            throws Exception {
		//임시비밀번호
		String tempPsw = "";
		//email 내용
		String content = "";
		
		try {
			//사용자 정보 찾기
			loginVO = LoginService.selectUserInfo(loginVO);
			
			//사용자 정보가 없을때 fail
			if(loginVO == null) {
				return "infoFail";
			}
			
			//패스워드 수정
			if("searchPsw".equals(url)) {
				tempPsw = getRamdomPassword(5);
				TMemAccptVO vo = new TMemAccptVO();
				vo.setLoginId(loginVO.getLoginId());
				vo.setLoginPwd(LoginService.SHA256Encrypt(tempPsw));
				tMemAccptService.updateUserPsw(vo);
				
				if("MG0002".equals(loginVO.getUserType())) {
					loginVO.setEmailAddr(loginVO.getDamdangEmail());
				}
				content = "회원님의 비밀번호는 : " + tempPsw + " 입니다.";
			} else {
				content = "회원님의 아이디는 : " + loginVO.getLoginId() + " 입니다.";
			}
			
			HashMap map = new HashMap<String, String>();
			map.put("subject", "Dlink에서 보내드립니다.");
			map.put("context", content);
			map.put("toEmail", loginVO.getEmailAddr());
			emailService.sendMail(map);
			
		} catch (Exception e) {
			e.printStackTrace();
			return "fail";			
		}
		
		return "suc";
    } 
	
	
	//로그인정보 vo에 담기 및 비밀번호 암호화
	public TMemAccptVO loginInfo(HttpServletRequest req)
            throws Exception {
    	String id = req.getParameter("user_id");
    	String pw = req.getParameter("user_pw");
		TMemAccptVO vo = new TMemAccptVO();
		
		vo.setLoginId(id);
		vo.setLoginPwd(LoginService.SHA256Encrypt(pw));
        
        return vo;
    } 
	
	
	
	
	//임시번호 생성기
	public String getRamdomPassword(int size) {
		char[] charSet = new char[] {
		'0', '1', '2', '3', '4', '5', '6', '7', '8', '9',
		'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z',
		'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z',
		'!', '@', '#', '$', '%', '^', '&' };
		StringBuffer sb = new StringBuffer();
		SecureRandom sr = new SecureRandom();
		sr.setSeed(new Date().getTime());
		int idx = 0;
		int len = charSet.length;
		for (int i=0; i<size; i++) {
		// idx = (int) (len * Math.random());
		idx = sr.nextInt(len); // 강력한 난수를 발생시키기 위해 SecureRandom을 사용한다.
		sb.append(charSet[idx]);
		}
		return sb.toString();
	}
	
	//임시번호 생성기
	public String getRamdomNumber(int size) {
		char[] charSet = new char[] {
		'0', '1', '2', '3', '4', '5', '6', '7', '8', '9'};
		StringBuffer sb = new StringBuffer();
		SecureRandom sr = new SecureRandom();
		sr.setSeed(new Date().getTime());
		int idx = 0;
		int len = charSet.length;
		for (int i=0; i<size; i++) {
			idx = sr.nextInt(len); // 강력한 난수를 발생시키기 위해 SecureRandom을 사용한다.
			sb.append(charSet[idx]);
		}
		return sb.toString();
	}
	
}
