package dlink.admin.vo;

/**
 * @Class Name : TMemAccptVO.java
 * @Description : TMemAccpt VO class
 * @Modification Information
 *
 * @author 이은지
 * @since 2022-03-30
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */
public class TMemAccptVO extends SearchVO{
    private static final long serialVersionUID = 1L;
    
    /** 카스아이 알림톡 키값 */
    private String site_z_key;
    
    /** LOGIN_ID */
    private java.lang.String loginId;
    
    /** LOGIN_PWD */
    private java.lang.String loginPwd;
    private java.lang.String loginPwdAfter;
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
    
    /** REG_DT */
    private java.sql.Date regDt;
    
    /** UPD_DT */
    private java.sql.Date updDt;
    
    /** UPDATER */
    private java.lang.String updater;
    
    /** REGISTER */
    private java.lang.String register;
    
    /** 수정, 등록 화면 구분 */
    private String registerFlag;
    
  

	public java.lang.String getLoginPwdAfter() {
		return loginPwdAfter;
	}

	public void setLoginPwdAfter(java.lang.String loginPwdAfter) {
		this.loginPwdAfter = loginPwdAfter;
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
    
    public java.lang.String getLoginPwd() {
        return this.loginPwd;
    }
    
    public void setLoginPwd(java.lang.String loginPwd) {
        this.loginPwd = loginPwd;
    }
    
    public java.lang.String getUserType() {
        return this.userType;
    }
    
    public void setUserType(java.lang.String userType) {
        this.userType = userType;
    }
    
    public java.sql.Date getMemDt() {
        return this.memDt;
    }
    
    public void setMemDt(java.sql.Date memDt) {
        this.memDt = memDt;
    }
    
    public java.sql.Date getPwdChgDt() {
        return this.pwdChgDt;
    }
    
    public void setPwdChgDt(java.sql.Date pwdChgDt) {
        this.pwdChgDt = pwdChgDt;
    }
    
    public java.sql.Date getNextChgDt() {
        return this.nextChgDt;
    }
    
    public void setNextChgDt(java.sql.Date nextChgDt) {
        this.nextChgDt = nextChgDt;
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
    
    public java.sql.Date getOutDt() {
        return this.outDt;
    }
    
    public void setOutDt(java.sql.Date outDt) {
        this.outDt = outDt;
    }
    
    public java.sql.Date getRegDt() {
        return this.regDt;
    }
    
    public void setRegDt(java.sql.Date regDt) {
        this.regDt = regDt;
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
    
    public java.lang.String getRegister() {
        return this.register;
    }
    
    public void setRegister(java.lang.String register) {
        this.register = register;
    }

	public String getSite_z_key() {
		return site_z_key;
	}

	public void setSite_z_key(String site_z_key) {
		this.site_z_key = site_z_key;
	}
    
}
