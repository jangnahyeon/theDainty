package dlink.common.service;

import java.time.LocalDate;

import javax.annotation.Resource;

import org.egovframe.rte.fdl.property.EgovPropertyService;
import org.springframework.stereotype.Service;

import dlink.front.service.FrontMtsAtalkMsgService;
import dlink.front.vo.MtsAtalkMsgVO;

/**
 * @Class Name : MtsAtalkMsgService.java
 * @Description : MtsAtalkMsg Service class
 * @Modification Information
 *
 * @author 이효진
 * @since 2022-04-07
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */

@Service("MtsAtalkMsgService")
public class MtsAtalkMsgService {
	
    @Resource(name = "mtsAtalkMsgService")
    private FrontMtsAtalkMsgService mtsAtalkMsgService;
    
    /** EgovPropertyService */
    @Resource(name = "propertiesService")
    protected EgovPropertyService propertiesService;
	
    
    final static String SITE_KEY = CommProperties.getProperty("talk.siteKey");
    final static String DLINK_PHONE = CommProperties.getProperty("dlink.phone");
    /**
	 * mts_atalk_msg 목록을 조회한다. (pageing)
	 * @param searchVO - 조회할 정보가 담긴 MtsAtalkMsgDefaultVO
	 * @return "/mtsAtalkMsg/MtsAtalkMsgList"
	 * @exception Exception
	 */

	
	//  회원가입 완료시 관리자 알림톡 	
	public int sendTalk_Default(MtsAtalkMsgVO reqvo) {
		String tranMsg = "";
		try {
			tranMsg = sendMsg(reqvo);
			reqvo.setSite_z_key(SITE_KEY);
			reqvo.setTranCallback(DLINK_PHONE);//관리자 핸드폰번호
			reqvo.setTranPhone(reqvo.getMobileNo());
			reqvo.setTranSubject(sendSubj(reqvo));
			reqvo.setTranMsg(tranMsg);
			reqvo.setTranReplaceMsg(tranMsg);
			reqvo.setTranId("base");
			reqvo.setTranReplaceType("L"); // S : SMS , L : LMS
			mtsAtalkMsgService.insertMtsAtalkMsg(reqvo);

			return 1;
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}
	}
	
	
	public String sendMsg(MtsAtalkMsgVO reqvo){
		String msg = "";
		String header = "[디링크] 디자인을 잇다 \n";
		String toofer = "바로가기 > http://www.jejudesign.kr \n";
		LocalDate now = LocalDate.now();
		 
		int year = now.getYear();  // 년
		int month = now.getMonthValue(); // 월
		int day = now.getDayOfMonth(); //일
		 
		switch (reqvo.getTranTmplCd()) {
			case "sendTalk_mst001":  msg =  header + "본인인증번호는 "+ reqvo.getTranMsg() + " 입니다.";
			break;
			case "sendTalk_mst002":  msg =  header + "제주디자인링크 홈페이지의 회원가입이 완료되었습니다.\n 더많은 기능 " + toofer; //회원가입 신청완료
	        break;
			case "sendTalk_mst003":  msg =  header + reqvo.getUserNm() + " 의 전문회사 전환 신청이 정상적으로 접수되었습니다. ";
	        break;
			case "sendTalk_mst004":  msg =  header + reqvo.getUserNm() + " 의 전문회사 전환 신청이 접수되었습니다.\n 세부서류 확인하여주시길바랍니다.";
	        break;
			case "sendTalk_mst005":  
				msg += header + year + "년" + month + "월" + day + "일" + "신청하신 전문업체 전환 신청이 승인되었습니다.\n";
				msg +="축하합니다! 더많은 기능 " + toofer;
	        break;
			case "sendTalk_mst006":  
				msg += header + year + "년" + month + "월" + day + "일" + "신청하신 전문업체 전환신청이 반려되었습니다.\n";			
				msg +="반려사유를 확인해주세요!\n";
				msg +="디링크 " + toofer;
	        break;
			case "sendTalk_mst007":
				msg += header + reqvo.getPtplNm() + "포트폴리오에 상담의뢰가 접수 되었습니다.\n";	
				msg +="고객님의 답변을 기다려요. \n";
				msg +="디링크 " + toofer;
	        break;
			case "sendTalk_mst008":  
				msg += header +  reqvo.getPtplNm() + "포트폴리오에 상담건에 대한 답변이 등록되었습니다.\n";	
				msg +="디링크 " + toofer;
	        break;
	        
	        default: msg = "error";
            break;
		}
		return msg;
	}
	
	
	public String sendSubj(MtsAtalkMsgVO reqvo){
		String result = "";
		
		 switch (reqvo.getTranTmplCd()) {
			case "sendTalk_mst005":  result =  "승인처리";
	        break;
			case "sendTalk_mst006":  result =  "반려처리";
	        break;
			case "sendTalk_mst008":  result = "반려처리";
	        break;
	        default: result = "Dlink에서 알려드립니다";
         break;
		}
		 
		 
		return result;
	}
	
}
