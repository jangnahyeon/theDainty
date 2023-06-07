package dlink_new.admin.vo;

/**
 * @Class Name : TbSisulHldVO.java
 * @Description : TbSisulHld VO class
 * @Modification Information
 *
 * @author 이재욱
 * @since 2023-03-08
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */
public class TbSisulHldVO extends TbSisulHldDefaultVO{
    private static final long serialVersionUID = 1L;
    
    /** HLD_SEQ */
    private int hldSeq;
    
    /** SISUL_SEQ */
    private int sisulSeq;
    
    /** HLD_NM */
    private java.lang.String hldNm;
    
    /** HLD_DT */
    private java.lang.String hldDt;
    
    /** REG_DT */
    private java.lang.String regDt;
    
    /** REG_ID */
    private java.lang.String regId;
    
    public int getHldSeq() {
        return this.hldSeq;
    }
    
    public void setHldSeq(int hldSeq) {
        this.hldSeq = hldSeq;
    }
    
    public int getSisulSeq() {
        return this.sisulSeq;
    }
    
    public void setSisulSeq(int sisulSeq) {
        this.sisulSeq = sisulSeq;
    }
    
    public java.lang.String getHldNm() {
        return this.hldNm;
    }
    
    public void setHldNm(java.lang.String hldNm) {
        this.hldNm = hldNm;
    }
    
    public java.lang.String getHldDt() {
        return this.hldDt;
    }
    
    public void setHldDt(java.lang.String hldDt) {
        this.hldDt = hldDt;
    }
    
    public java.lang.String getRegDt() {
        return this.regDt;
    }
    
    public void setRegDt(java.lang.String regDt) {
        this.regDt = regDt;
    }
    
    public java.lang.String getRegId() {
        return this.regId;
    }
    
    public void setRegId(java.lang.String regId) {
        this.regId = regId;
    }
    
}
