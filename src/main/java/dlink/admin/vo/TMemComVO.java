package dlink.admin.vo;

import java.math.BigDecimal;

/**
 * @Class Name : TMemComVO.java
 * @Description : TMemCom VO class
 * @Modification Information
 *
 * @author 이은지
 * @since 2022-03-30
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */
public class TMemComVO extends SearchVO{
    private static final long serialVersionUID = 1L;
    
    /** LOGIN_ID */
    private java.lang.String loginId;
    
    /** COM_NM */
    private java.lang.String comNm;
    
    /** COM_TYPE */
    private java.lang.String comType;
    
    /** CEO_NM */
    private java.lang.String ceoNm;
    
    /** SEX */
    private java.lang.String sex;
    
    /** COM_NO */
    private java.lang.String comNo;
    
    /** COM_ADDR */
    private java.lang.String comAddr;
    
    /** COM_DTL_ADDR */
    private java.lang.String comDtlAddr;
    
    /** COM_ZIP */
    private java.lang.String comZip;
    
    /** COM_URL */
    private java.lang.String comUrl;
    
    /** CEO_MOBILE_NO */
    private java.lang.String ceoMobileNo;
    
    /** DAMDANG_NM */
    private java.lang.String damdangNm;
    
    /** DAMDANG_DEPT */
    private java.lang.String damdangDept;
    
    /** DAMDANG_POS */
    private java.lang.String damdangPos;
    
    /** DAMDANG_MOBILE_NO */
    private java.lang.String damdangMobileNo;
    
    /** DAMDANG_EMAIL */
    private java.lang.String damdangEmail;
    
    /** REG_DT */
    private java.lang.String regDt;
    
    /** IMG_PATH 파일첨부하기 */
    private java.lang.String imgPath;
    private int fileSeq;
    private int[] multiFileSeq;   
    
    /** REQ_PART */
    private java.lang.String reqPart;
    
    /** SPEC_YN */
    private java.lang.String specYn;
    
    /** 수정, 등록 화면 구분 */
    private String registerFlag;
    
    /** REGISTER */
    private java.lang.String register;
       
    /** FILE_KIND */
    private java.lang.String fileKind[]; 
    
           
    private String ptplPart;
       
    
   
	/** TMemAccptVO */
    /** LOGIN_PWD */
    private java.lang.String loginPwd;
    
    /** USER_TYPE */
    private java.lang.String userType;
    
    /** MEM_DT */
    private java.sql.Date memDt;
    
    /** PWD_CHG_DT */
    private java.sql.Date pwdChgDt;
    
    /** NEXT_CHG_DT */
    private java.sql.Date nextChgDt;
    
    /** SMS_YN */
    private java.lang.String smsYn;
    
    /** MAIL_YN */
    private java.lang.String mailYn;
    
    /** OUT_DT */
    private java.sql.Date outDt;
      
  	

	/** TSpecReqComVO */
    /** REQ_NO */
    private java.math.BigDecimal reqNo;
    
    /** SALES_AMT */
    private java.math.BigDecimal salesAmt = new BigDecimal(0);
    
    /** KEY_CUSTOMER */
    private java.lang.String keyCustomer;
    
    /** EMPLOY */
    private java.lang.String employ;
    
    /** ACCEPT_YN */
    private java.lang.String acceptYn;
    
    /** ACCEPT_CONT */
    private java.lang.String acceptCont;
    
    /** REQ_DT */
    private java.sql.Date reqDt;
    
    /** REQUESTER */
    private java.lang.String requester;
    
    /** CONT */
    private java.lang.String cont;
    
    
    /** TPTPLINFO 테이블 */
    /** PTPL_NO */
    private java.math.BigDecimal ptplNo;
    /** PTPL_NM */
    private java.lang.String ptplNm;
       
    /** PTPL_YOUHAENG */
    private java.lang.String ptplYouhaeng;
   
    /** PTPL_TYPE */
    private java.lang.String ptplType;
   
    /** PTPL_STYLE */
    private java.lang.String ptplStyle;

    /** ADD_OPTION */
    private java.lang.String addOption;
    /** REF_WORD */
    private java.lang.String refWord;
    
    /** CONCEPT */
    private java.lang.String concept;
    
    private String ptplPartNm;
    
    
    
    /** TSpecReqMemVO */    
    /** SEQ */
    private java.math.BigDecimal seq;
    
    /** STAFF_NM */
    private java.lang.String staffNm[];
    
    /** POSITION */
    private java.lang.String position[];
    
    /** BIRTHDAY */
    private java.lang.String birthday[];
    
    /** LST_HAKWI */
    private java.lang.String lstHakwi[];
    
    /** JUNGONG */
    private java.lang.String jungong[];
    
    /** JUNGONG_PART */
    private java.lang.String jungongPart[];
    
    /** CAREER */
    private java.lang.String career[];
    
    /** school */
    private java.lang.String school[];
    
    /** acquisition_year */
    private java.lang.String acquisitionYear[];
    
    /** SEX */
    private java.lang.String mSex[];
    
    
    
    

	public java.lang.String[] getmSex() {
		return mSex;
	}

	public void setmSex(java.lang.String[] mSex) {
		this.mSex = mSex;
	}

	public java.lang.String getCont() {
		return cont;
	}

	public void setCont(java.lang.String cont) {
		this.cont = cont;
	}

	public java.lang.String[] getSchool() {
		return school;
	}

	public void setSchool(java.lang.String[] school) {
		this.school = school;
	}	

	public java.lang.String[] getAcquisitionYear() {
		return acquisitionYear;
	}

	public void setAcquisitionYear(java.lang.String[] acquisitionYear) {
		this.acquisitionYear = acquisitionYear;
	}

	public java.lang.String getLoginId() {
		return loginId;
	}

	public void setLoginId(java.lang.String loginId) {
		this.loginId = loginId;
	}

	public java.lang.String getComNm() {
		return comNm;
	}

	public void setComNm(java.lang.String comNm) {
		this.comNm = comNm;
	}

	public java.lang.String getComType() {
		return comType;
	}

	public void setComType(java.lang.String comType) {
		this.comType = comType;
	}

	public java.lang.String getCeoNm() {
		return ceoNm;
	}

	public void setCeoNm(java.lang.String ceoNm) {
		this.ceoNm = ceoNm;
	}

	public java.lang.String getSex() {
		return sex;
	}

	public void setSex(java.lang.String sex) {
		this.sex = sex;
	}

	public java.lang.String getComNo() {
		return comNo;
	}

	public void setComNo(java.lang.String comNo) {
		this.comNo = comNo;
	}

	public java.lang.String getComAddr() {
		return comAddr;
	}

	public void setComAddr(java.lang.String comAddr) {
		this.comAddr = comAddr;
	}

	public java.lang.String getComDtlAddr() {
		return comDtlAddr;
	}

	public void setComDtlAddr(java.lang.String comDtlAddr) {
		this.comDtlAddr = comDtlAddr;
	}

	public java.lang.String getComZip() {
		return comZip;
	}

	public void setComZip(java.lang.String comZip) {
		this.comZip = comZip;
	}

	public java.lang.String getComUrl() {
		return comUrl;
	}

	public void setComUrl(java.lang.String comUrl) {
		this.comUrl = comUrl;
	}

	public java.lang.String getCeoMobileNo() {
		return ceoMobileNo;
	}

	public void setCeoMobileNo(java.lang.String ceoMobileNo) {
		this.ceoMobileNo = ceoMobileNo;
	}

	public java.lang.String getDamdangNm() {
		return damdangNm;
	}

	public void setDamdangNm(java.lang.String damdangNm) {
		this.damdangNm = damdangNm;
	}

	public java.lang.String getDamdangDept() {
		return damdangDept;
	}

	public void setDamdangDept(java.lang.String damdangDept) {
		this.damdangDept = damdangDept;
	}

	public java.lang.String getDamdangPos() {
		return damdangPos;
	}

	public void setDamdangPos(java.lang.String damdangPos) {
		this.damdangPos = damdangPos;
	}

	public java.lang.String getDamdangMobileNo() {
		return damdangMobileNo;
	}

	public void setDamdangMobileNo(java.lang.String damdangMobileNo) {
		this.damdangMobileNo = damdangMobileNo;
	}

	public java.lang.String getDamdangEmail() {
		return damdangEmail;
	}

	public void setDamdangEmail(java.lang.String damdangEmail) {
		this.damdangEmail = damdangEmail;
	}

	public java.lang.String getRegDt() {
		return regDt;
	}

	public void setRegDt(java.lang.String regDt) {
		this.regDt = regDt;
	}

	public java.lang.String getImgPath() {
		return imgPath;
	}

	public void setImgPath(java.lang.String imgPath) {
		this.imgPath = imgPath;
	}

	public int getFileSeq() {
		return fileSeq;
	}

	public void setFileSeq(int fileSeq) {
		this.fileSeq = fileSeq;
	}

	public int[] getMultiFileSeq() {
		return multiFileSeq;
	}

	public void setMultiFileSeq(int[] multiFileSeq) {
		this.multiFileSeq = multiFileSeq;
	}

	public java.lang.String getReqPart() {
		return reqPart;
	}

	public void setReqPart(java.lang.String reqPart) {
		this.reqPart = reqPart;
	}

	public java.lang.String getSpecYn() {
		return specYn;
	}

	public void setSpecYn(java.lang.String specYn) {
		this.specYn = specYn;
	}

	public String getRegisterFlag() {
		return registerFlag;
	}

	public void setRegisterFlag(String registerFlag) {
		this.registerFlag = registerFlag;
	}

	public java.lang.String getRegister() {
		return register;
	}

	public void setRegister(java.lang.String register) {
		this.register = register;
	}

	public java.lang.String[] getFileKind() {
		return fileKind;
	}

	public void setFileKind(java.lang.String[] fileKind) {
		this.fileKind = fileKind;
	}

	public String getPtplPart() {
		return ptplPart;
	}

	public void setPtplPart(String ptplPart) {
		this.ptplPart = ptplPart;
	}

	public java.lang.String getLoginPwd() {
		return loginPwd;
	}

	public void setLoginPwd(java.lang.String loginPwd) {
		this.loginPwd = loginPwd;
	}

	public java.lang.String getUserType() {
		return userType;
	}

	public void setUserType(java.lang.String userType) {
		this.userType = userType;
	}

	public java.sql.Date getMemDt() {
		return memDt;
	}

	public void setMemDt(java.sql.Date memDt) {
		this.memDt = memDt;
	}

	public java.sql.Date getPwdChgDt() {
		return pwdChgDt;
	}

	public void setPwdChgDt(java.sql.Date pwdChgDt) {
		this.pwdChgDt = pwdChgDt;
	}

	public java.sql.Date getNextChgDt() {
		return nextChgDt;
	}

	public void setNextChgDt(java.sql.Date nextChgDt) {
		this.nextChgDt = nextChgDt;
	}

	public java.lang.String getSmsYn() {
		return smsYn;
	}

	public void setSmsYn(java.lang.String smsYn) {
		this.smsYn = smsYn;
	}

	public java.lang.String getMailYn() {
		return mailYn;
	}

	public void setMailYn(java.lang.String mailYn) {
		this.mailYn = mailYn;
	}

	public java.sql.Date getOutDt() {
		return outDt;
	}

	public void setOutDt(java.sql.Date outDt) {
		this.outDt = outDt;
	}

	public java.math.BigDecimal getReqNo() {
		return reqNo;
	}

	public void setReqNo(java.math.BigDecimal reqNo) {
		this.reqNo = reqNo;
	}

	public java.math.BigDecimal getSalesAmt() {
		return salesAmt;
	}

	public void setSalesAmt(java.math.BigDecimal salesAmt) {
		this.salesAmt = salesAmt;
	}

	public java.lang.String getKeyCustomer() {
		return keyCustomer;
	}

	public void setKeyCustomer(java.lang.String keyCustomer) {
		this.keyCustomer = keyCustomer;
	}

	public java.lang.String getEmploy() {
		return employ;
	}

	public void setEmploy(java.lang.String employ) {
		this.employ = employ;
	}

	public java.lang.String getAcceptYn() {
		return acceptYn;
	}

	public void setAcceptYn(java.lang.String acceptYn) {
		this.acceptYn = acceptYn;
	}

	public java.lang.String getAcceptCont() {
		return acceptCont;
	}

	public void setAcceptCont(java.lang.String acceptCont) {
		this.acceptCont = acceptCont;
	}

	public java.sql.Date getReqDt() {
		return reqDt;
	}

	public void setReqDt(java.sql.Date reqDt) {
		this.reqDt = reqDt;
	}

	public java.lang.String getRequester() {
		return requester;
	}

	public void setRequester(java.lang.String requester) {
		this.requester = requester;
	}

	public java.math.BigDecimal getPtplNo() {
		return ptplNo;
	}

	public void setPtplNo(java.math.BigDecimal ptplNo) {
		this.ptplNo = ptplNo;
	}

	public java.lang.String getPtplNm() {
		return ptplNm;
	}

	public void setPtplNm(java.lang.String ptplNm) {
		this.ptplNm = ptplNm;
	}

	public java.lang.String getPtplYouhaeng() {
		return ptplYouhaeng;
	}

	public void setPtplYouhaeng(java.lang.String ptplYouhaeng) {
		this.ptplYouhaeng = ptplYouhaeng;
	}

	public java.lang.String getPtplType() {
		return ptplType;
	}

	public void setPtplType(java.lang.String ptplType) {
		this.ptplType = ptplType;
	}

	public java.lang.String getPtplStyle() {
		return ptplStyle;
	}

	public void setPtplStyle(java.lang.String ptplStyle) {
		this.ptplStyle = ptplStyle;
	}

	public java.lang.String getAddOption() {
		return addOption;
	}

	public void setAddOption(java.lang.String addOption) {
		this.addOption = addOption;
	}

	public java.lang.String getRefWord() {
		return refWord;
	}

	public void setRefWord(java.lang.String refWord) {
		this.refWord = refWord;
	}

	public java.lang.String getConcept() {
		return concept;
	}

	public void setConcept(java.lang.String concept) {
		this.concept = concept;
	}

	public String getPtplPartNm() {
		return ptplPartNm;
	}

	public void setPtplPartNm(String ptplPartNm) {
		this.ptplPartNm = ptplPartNm;
	}

	public java.math.BigDecimal getSeq() {
		return seq;
	}

	public void setSeq(java.math.BigDecimal seq) {
		this.seq = seq;
	}

	public java.lang.String[] getStaffNm() {
		return staffNm;
	}

	public void setStaffNm(java.lang.String[] staffNm) {
		this.staffNm = staffNm;
	}

	public java.lang.String[] getPosition() {
		return position;
	}

	public void setPosition(java.lang.String[] position) {
		this.position = position;
	}

	public java.lang.String[] getBirthday() {
		return birthday;
	}

	public void setBirthday(java.lang.String[] birthday) {
		this.birthday = birthday;
	}

	public java.lang.String[] getLstHakwi() {
		return lstHakwi;
	}

	public void setLstHakwi(java.lang.String[] lstHakwi) {
		this.lstHakwi = lstHakwi;
	}

	public java.lang.String[] getJungong() {
		return jungong;
	}

	public void setJungong(java.lang.String[] jungong) {
		this.jungong = jungong;
	}

	public java.lang.String[] getJungongPart() {
		return jungongPart;
	}

	public void setJungongPart(java.lang.String[] jungongPart) {
		this.jungongPart = jungongPart;
	}

	public java.lang.String[] getCareer() {
		return career;
	}

	public void setCareer(java.lang.String[] career) {
		this.career = career;
	}
    
    
    
    
    
    
    
  

	
    
}
