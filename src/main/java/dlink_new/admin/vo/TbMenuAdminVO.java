package dlink_new.admin.vo;

/**
 * @Class Name : TMenuAdminVO.java
 * @Description : TMenuAdmin VO class
 * @Modification Information
 *
 * @author 김현재
 * @since 2023.01.16
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */
public class TbMenuAdminVO extends TbMenuAdminDefaultVO{
    private static final long serialVersionUID = 1L;
    
    /** MENU_SEQ */
    private int menuSeq;
    
    /** UP_MENU_SEQ */
    private int upMenuSeq;
    
    /** MENU_NM */
    private java.lang.String menuNm;
    
    /** MENU_URL */
    private java.lang.String menuUrl;
    
    /** MENU_DEPTH */
    private int menuDepth;
    
    /** MENU_ORDER */
    private int menuOrder;
    
    /** USE_YN */
    private java.lang.String useYn;
    
    /** REG_DT */
    private java.util.Date regDt;
    
    /** REG_ID */
    private java.lang.String regId;
    
    /** UPD_DT */
    private java.util.Date updDt;
    
    /** UPD_ID */
    private java.lang.String updId;
    
    private String auth;
    
    public int getMenuSeq() {
        return this.menuSeq;
    }
    
    public void setMenuSeq(int menuSeq) {
        this.menuSeq = menuSeq;
    }
    
    public int getUpMenuSeq() {
        return this.upMenuSeq;
    }
    
    public void setUpMenuSeq(int upMenuSeq) {
        this.upMenuSeq = upMenuSeq;
    }
    
    public java.lang.String getMenuNm() {
        return this.menuNm;
    }
    
    public void setMenuNm(java.lang.String menuNm) {
        this.menuNm = menuNm;
    }
    
    public java.lang.String getMenuUrl() {
        return this.menuUrl;
    }
    
    public void setMenuUrl(java.lang.String menuUrl) {
        this.menuUrl = menuUrl;
    }
    
    public int getMenuDepth() {
        return this.menuDepth;
    }
    
    public void setMenuDepth(int menuDepth) {
        this.menuDepth = menuDepth;
    }
    
    public int getMenuOrder() {
        return this.menuOrder;
    }
    
    public void setMenuOrder(int menuOrder) {
        this.menuOrder = menuOrder;
    }
    
    public java.lang.String getUseYn() {
        return this.useYn;
    }
    
    public void setUseYn(java.lang.String useYn) {
        this.useYn = useYn;
    }
    
    public java.util.Date getRegDt() {
        return this.regDt;
    }
    
    public void setRegDt(java.util.Date regDt) {
        this.regDt = regDt;
    }
    
    public java.lang.String getRegId() {
        return this.regId;
    }
    
    public void setRegId(java.lang.String regId) {
        this.regId = regId;
    }
    
    public java.util.Date getUpdDt() {
        return this.updDt;
    }
    
    public void setUpdDt(java.util.Date updDt) {
        this.updDt = updDt;
    }
    
    public java.lang.String getUpdId() {
        return this.updId;
    }
    
    public void setUpdId(java.lang.String updId) {
        this.updId = updId;
    }

	public String getAuth() {
		return auth;
	}

	public void setAuth(String auth) {
		this.auth = auth;
	}
    
}
