package dlink.front.vo;

/**
 * @Class Name : TReqUserVO.java
 * @Description : TReqUser VO class
 * @Modification Information
 *
 * @author 이은지
 * @since 2022-04-11
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */
public class TReqUserVO extends FrontSearchVO{
    private static final long serialVersionUID = 1L;
    
    /** LOGIN_ID */
    private java.lang.String loginId;
    
    /** LOGIN_PWD */
    private java.lang.String loginPwd;
    
    /** USER_NM */
    private java.lang.String userNm;
        
	/** SEX */
    private java.lang.String sex;
    
    /** BIRTHDAY */
    private java.lang.String birthday;
    
    /** MOBILE_NO */
    private java.lang.String mobileNo;
    
    /** EMAIL_ADDR */
    private java.lang.String emailAddr;
    
    /** ZIP_CD */
    private java.lang.String zipCd;
    
    /** ADDR */
    private java.lang.String addr;
    
    /** DTL_ADDR */
    private java.lang.String dtlAddr;
    
    /** SMS_YN */
    private java.lang.String smsYn;
    
    /** MAIL_YN */
    private java.lang.String mailYn;
    
    /** REQ_DT */
    private java.lang.String reqDt;
    
    /** ACCEPT_YN */
    private java.lang.String acceptYn;
    
    /** ACCEPT_CONT */
    private java.lang.String acceptCont;
    
    /** REG_DT */
    private java.lang.String regDt;
    
    /** 회원등록 구분 */
    private String registerFlag;
         
  /* 알림톡인증번호 mts_atalk_auth  */
    /** AUTH_NM */
    private java.lang.String authNm;
    
    private java.lang.String updDt;
    
    private java.lang.String updater;
    
    
    
   
    
    
    
	public java.lang.String getAuthNm() {
		return authNm;
	}

	public void setAuthNm(java.lang.String authNm) {
		this.authNm = authNm;
	}

	public String getRegisterFlag() {
		return registerFlag;
	}

	public void setRegisterFlag(String registerFlag) {
		this.registerFlag = registerFlag;
	}

	public java.lang.String getLoginPwd() {
		return loginPwd;
	}

	public void setLoginPwd(java.lang.String loginPwd) {
		this.loginPwd = loginPwd;
	}
	
	public java.lang.String getLoginId() {
        return this.loginId;
    }
    
    public void setLoginId(java.lang.String loginId) {
        this.loginId = loginId;
    }
    
    public java.lang.String getUserNm() {
        return this.userNm;
    }
    
    public void setUserNm(java.lang.String userNm) {
        this.userNm = userNm;
    }
    
    public java.lang.String getSex() {
        return this.sex;
    }
    
    public void setSex(java.lang.String sex) {
        this.sex = sex;
    }
    
    public java.lang.String getBirthday() {
        return this.birthday;
    }
    
    public void setBirthday(java.lang.String birthday) {
        this.birthday = birthday;
    }
    
    public java.lang.String getMobileNo() {
        return this.mobileNo;
    }
    
    public void setMobileNo(java.lang.String mobileNo) {
        this.mobileNo = mobileNo;
    }
    
    public java.lang.String getEmailAddr() {
        return this.emailAddr;
    }
    
    public void setEmailAddr(java.lang.String emailAddr) {
        this.emailAddr = emailAddr;
    }
    
    public java.lang.String getZipCd() {
        return this.zipCd;
    }
    
    public void setZipCd(java.lang.String zipCd) {
        this.zipCd = zipCd;
    }
    
    public java.lang.String getAddr() {
        return this.addr;
    }
    
    public void setAddr(java.lang.String addr) {
        this.addr = addr;
    }
    
    public java.lang.String getDtlAddr() {
        return this.dtlAddr;
    }
    
    public void setDtlAddr(java.lang.String dtlAddr) {
        this.dtlAddr = dtlAddr;
    }
    
    public java.lang.String getSmsYn() {
        return this.smsYn;
    }
    
    public void setSmsYn(java.lang.String smsYn) {
        this.smsYn = smsYn;
    }
    
    public java.lang.String getMailYn() {
        return this.mailYn;
    }
    
    public void setMailYn(java.lang.String mailYn) {
        this.mailYn = mailYn;
    }
    
    public java.lang.String getReqDt() {
        return this.reqDt;
    }
    
    public void setReqDt(java.lang.String reqDt) {
        this.reqDt = reqDt;
    }
    
    public java.lang.String getAcceptYn() {
        return this.acceptYn;
    }
    
    public void setAcceptYn(java.lang.String acceptYn) {
        this.acceptYn = acceptYn;
    }
    
    public java.lang.String getAcceptCont() {
        return this.acceptCont;
    }
    
    public void setAcceptCont(java.lang.String acceptCont) {
        this.acceptCont = acceptCont;
    }
    
    public java.lang.String getRegDt() {
        return this.regDt;
    }
    
    public void setRegDt(java.lang.String regDt) {
        this.regDt = regDt;
    }

	public java.lang.String getUpdDt() {
		return updDt;
	}

	public void setUpdDt(java.lang.String updDt) {
		this.updDt = updDt;
	}

	public java.lang.String getUpdater() {
		return updater;
	}

	public void setUpdater(java.lang.String updater) {
		this.updater = updater;
	}
    
}
