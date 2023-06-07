package dlink_new.admin.vo;

import java.math.BigDecimal;

/**
 * @Class Name : TbSisulVO.java
 * @Description : TbSisul VO class
 * @Modification Information
 *
 * @author 김현재
 * @since 2023-01-21
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */
public class TbSisulVO extends TbSisulDefaultVO{
    private static final long serialVersionUID = 1L;
    
    /** SISUL_SEQ */
    private BigDecimal sisulSeq;
    
    /** SISUL_NM */
    private java.lang.String sisulNm;
    
    /** FILE_SEQ */
    private int fileSeq;
    
    /** USE_YN */
    private java.lang.String useYn;
    
    /** REG_DT */
    private String regDt;
    
    /** REG_ID */
    private java.lang.String regId;
    
    /** UPD_DT */
    private java.util.Date updDt;
    
    /** UPD_ID */
    private java.lang.String updId;
    
    public BigDecimal getSisulSeq() {
        return this.sisulSeq;
    }
    
    public void setSisulSeq(BigDecimal sisulSeq) {
        this.sisulSeq = sisulSeq;
    }
    
    public java.lang.String getSisulNm() {
        return this.sisulNm;
    }
    
    public void setSisulNm(java.lang.String sisulNm) {
        this.sisulNm = sisulNm;
    }
    
    public int getFileSeq() {
        return this.fileSeq;
    }
    
    public void setFileSeq(int fileSeq) {
        this.fileSeq = fileSeq;
    }
    
    public java.lang.String getUseYn() {
        return this.useYn;
    }
    
    public void setUseYn(java.lang.String useYn) {
        this.useYn = useYn;
    }
    
    public String getRegDt() {
        return this.regDt;
    }
    
    public void setRegDt(String regDt) {
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
