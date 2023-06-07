package dlink_new.common.vo;

/**
 * @Class Name : TbAtalkTmplVO.java
 * @Description : TbAtalkTmpl VO class
 * @Modification Information
 *
 * @author 김현재
 * @since 2023-02-07
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */
public class TbAtalkTmplVO extends TbAtalkTmplDefaultVO{
    private static final long serialVersionUID = 1L;
    
    /** TMPL_SEQ */
    private int tmplSeq;
    
    /** TMPL_CD */
    private java.lang.String tmplCd;
    
    /** TRAN_SENDER_KEY */
    private java.lang.String tranSenderKey;
    
    /** TRAN_PHONE */
    private java.lang.String tranPhone;
    
    /** TRAN_MSG */
    private java.lang.String tranMsg;
    
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
    
    public int getTmplSeq() {
        return this.tmplSeq;
    }
    
    public void setTmplSeq(int tmplSeq) {
        this.tmplSeq = tmplSeq;
    }
    
    public java.lang.String getTmplCd() {
        return this.tmplCd;
    }
    
    public void setTmplCd(java.lang.String tmplCd) {
        this.tmplCd = tmplCd;
    }
    
    public java.lang.String getTranSenderKey() {
        return this.tranSenderKey;
    }
    
    public void setTranSenderKey(java.lang.String tranSenderKey) {
        this.tranSenderKey = tranSenderKey;
    }
    
    public java.lang.String getTranPhone() {
        return this.tranPhone;
    }
    
    public void setTranPhone(java.lang.String tranPhone) {
        this.tranPhone = tranPhone;
    }
    
    public java.lang.String getTranMsg() {
        return this.tranMsg;
    }
    
    public void setTranMsg(java.lang.String tranMsg) {
        this.tranMsg = tranMsg;
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
