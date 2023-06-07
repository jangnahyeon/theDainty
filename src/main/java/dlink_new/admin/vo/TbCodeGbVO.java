package dlink_new.admin.vo;

/**
 * @Class Name : TbCodeGbVO.java
 * @Description : TbCodeGb VO class
 * @Modification Information
 *
 * @author 김현재
 * @since 2023-01-17
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */
public class TbCodeGbVO extends TbCodeGbDefaultVO{
    private static final long serialVersionUID = 1L;
    
    /** GB_CD */
    private java.lang.String gbCd;
    
    /** GB_NM */
    private java.lang.String gbNm;
    
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
    
    public java.lang.String getGbCd() {
        return this.gbCd;
    }
    
    public void setGbCd(java.lang.String gbCd) {
        this.gbCd = gbCd;
    }
    
    public java.lang.String getGbNm() {
        return this.gbNm;
    }
    
    public void setGbNm(java.lang.String gbNm) {
        this.gbNm = gbNm;
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
