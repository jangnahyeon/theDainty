package dlink_new.front.vo;

/**
 * @Class Name : TbMenuFooterVO.java
 * @Description : TbMenuFooter VO class
 * @Modification Information
 *
 * @author 김현재
 * @since 2023-01-24
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */
public class TbMenuFooterVO extends TbMenuFooterDefaultVO{
    private static final long serialVersionUID = 1L;
    
    /** MENU_SEQ */
    private int menuSeq;
    
    /** MENU_NM */
    private java.lang.String menuNm;
    
    /** MENU_URL */
    private java.lang.String menuUrl;
    
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
    
    public int getMenuSeq() {
        return this.menuSeq;
    }
    
    public void setMenuSeq(int menuSeq) {
        this.menuSeq = menuSeq;
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
    
}
