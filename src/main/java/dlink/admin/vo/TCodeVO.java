package dlink.admin.vo;

/**
 * @Class Name : TCodeVO.java
 * @Description : TCode VO class
 * @Modification Information
 *
 * @author 안성찬
 * @since 2022-03-30
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */
public class TCodeVO extends SearchVO{
    private static final long serialVersionUID = 1L;
    
    /** CODE */
    private java.lang.String code;
    
    /** CODE_NM */
    private java.lang.String codeNm;
    
    /** USE_YN */
    private java.lang.String useYn  = "Y";
    
    /** REF_CODE */
    private java.lang.String refCode;
    
    /** USER_DEFINE */
    private java.lang.String userDefine;
    
    /** CONT */
    private java.lang.String cont;
    
    /** REG_DT */
    private java.sql.Date regDt;
    
    /** REGISTER */
    private java.lang.String register;
    
    /** UPD_DT */
    private java.sql.Date updDt;
    
    /** UPDATER */
    private java.lang.String updater;
    
    private java.lang.String gubun;
    
    private java.lang.String beforCode;
    
    public java.lang.String getCode() {
        return this.code;
    }
    
    public void setCode(java.lang.String code) {
        this.code = code;
    }
    
    public java.lang.String getCodeNm() {
        return this.codeNm;
    }
    
    public void setCodeNm(java.lang.String codeNm) {
        this.codeNm = codeNm;
    }
    
    public java.lang.String getUseYn() {
        return this.useYn;
    }
    
    public void setUseYn(java.lang.String useYn) {
        this.useYn = useYn;
    }
    
    public java.lang.String getRefCode() {
        return this.refCode;
    }
    
    public void setRefCode(java.lang.String refCode) {
        this.refCode = refCode;
    }
    
    public java.lang.String getUserDefine() {
        return this.userDefine;
    }
    
    public void setUserDefine(java.lang.String userDefine) {
        this.userDefine = userDefine;
    }
    
    public java.lang.String getCont() {
        return this.cont;
    }
    
    public void setCont(java.lang.String cont) {
        this.cont = cont;
    }
    
    public java.sql.Date getRegDt() {
        return this.regDt;
    }
    
    public void setRegDt(java.sql.Date regDt) {
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

	public java.lang.String getGubun() {
		return gubun;
	}

	public void setGubun(java.lang.String gubun) {
		this.gubun = gubun;
	}

	public java.lang.String getBeforCode() {
		return beforCode;
	}

	public void setBeforCode(java.lang.String beforCode) {
		this.beforCode = beforCode;
	}
    
	
}
