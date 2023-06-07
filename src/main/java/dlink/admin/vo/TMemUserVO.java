package dlink.admin.vo;

/**
 * @Class Name : TMemUserVO.java
 * @Description : TMemUser VO class
 * @Modification Information
 *
 * @author 이은지
 * @since 2022-04-06
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */
public class TMemUserVO extends SearchVO{
	private static final long serialVersionUID = 1L;
       
    /** LOGIN_ID */
    private java.lang.String loginId;
    
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
    
    /** REG_DT */
    private java.lang.String regDt;
    
    /** REQ_DT */
    private java.lang.String reqDt;
    
    /** REGISTER */
    private java.lang.String register;
    
    /** UPD_DT */
    private java.sql.Date updDt;
    
    /** UPDATER */
    private java.lang.String updater;
    
    /** 수정, 등록 화면 구분 */
    private String registerFlag;
    
    
    
    
    
    
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

	public String getRegisterFlag() {
		return registerFlag;
	}

	public void setRegisterFlag(String registerFlag) {
		this.registerFlag = registerFlag;
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
    
    public java.lang.String getRegDt() {
        return this.regDt;
    }
    
    public void setRegDt(java.lang.String regDt) {
        this.regDt = regDt;
    }
    
    public java.lang.String getRegister() {
        return this.register;
    }
    
    public void setRegister(java.lang.String register) {
        this.register = register;
    }
    
    public java.sql.Date getUpdDt() {
        return this.updDt;
    }
    
    public void setUpdDt(java.sql.Date updDt) {
        this.updDt = updDt;
    }
    
    public java.lang.String getUpdater() {
        return this.updater;
    }
    
    public void setUpdater(java.lang.String updater) {
        this.updater = updater;
    }

	public java.lang.String getReqDt() {
		return reqDt;
	}

	public void setReqDt(java.lang.String reqDt) {
		this.reqDt = reqDt;
	}
    
}
