package dlink.common.vo;

/**
 * @Class Name : MtsAtalkAuthVO.java
 * @Description : MtsAtalkAuth VO class
 * @Modification Information
 *
 * @author 이은지
 * @since 2022-05-03
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */
public class MtsAtalkAuthVO extends SearchVO{
    private static final long serialVersionUID = 1L;
    /** SITE_CD */
    private java.lang.String siteCd;
    
    /** HP_NM */
    private java.lang.String hpNm;
    
    /** AUTH_NM */
    private java.lang.String authNm;
    
    /** REG_DT */
    private java.util.Date regDt;
    
    /** SESSION_VAL */
    private java.lang.String sessionVal;
    
    

	public java.lang.String getSiteCd() {
		return siteCd;
	}

	public void setSiteCd(java.lang.String siteCd) {
		this.siteCd = siteCd;
	}

	public java.lang.String getHpNm() {
		return hpNm;
	}

	public void setHpNm(java.lang.String hpNm) {
		this.hpNm = hpNm;
	}

	public java.lang.String getAuthNm() {
		return authNm;
	}

	public void setAuthNm(java.lang.String authNm) {
		this.authNm = authNm;
	}

	public java.util.Date getRegDt() {
		return regDt;
	}

	public void setRegDt(java.util.Date regDt) {
		this.regDt = regDt;
	}

	public java.lang.String getSessionVal() {
		return sessionVal;
	}

	public void setSessionVal(java.lang.String sessionVal) {
		this.sessionVal = sessionVal;
	}
    
   
    
   
    
}
