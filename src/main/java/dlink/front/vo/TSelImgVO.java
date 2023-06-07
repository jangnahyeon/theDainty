package dlink.front.vo;

import dlink.admin.vo.SearchVO;

/**
 * @Class Name : TSelImgVO.java
 * @Description : TSelImg VO class
 * @Modification Information
 *
 * @author 이효진
 * @since 2022-04-14
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */
public class TSelImgVO extends SearchVO{
    private static final long serialVersionUID = 1L;
    
    /** USER_ID */
    private java.lang.String userId;
    
    /** SEL_SEQ */
    private int selSeq;
    
    /** LOGIN_ID */
    private java.lang.String loginId;
    
    /** LOGIN_ID */
    private java.lang.String loginId2;
    
    /** PTPL_NO */
    private java.math.BigDecimal ptplNo;
    
    /** SEQ */
    private java.math.BigDecimal seq;
    
    /** SEL_GB */
    private java.lang.String selGb;
    
    /** DSN_NO */
    private java.lang.String dsnNo;
    
    /** SEL_DT */
    private java.sql.Date selDt;
    
    
    /** SEQ */
    private java.math.BigDecimal fileSeq;
    
    
    
    public java.math.BigDecimal getFileSeq() {
		return fileSeq;
	}

	public void setFileSeq(java.math.BigDecimal fileSeq) {
		this.fileSeq = fileSeq;
	}

	public java.lang.String getLoginId2() {
		return loginId2;
	}

	public void setLoginId2(java.lang.String loginId2) {
		this.loginId2 = loginId2;
	}

	public java.lang.String getUserId() {
        return this.userId;
    }
    
    public void setUserId(java.lang.String userId) {
        this.userId = userId;
    }
    
    public int getSelSeq() {
        return this.selSeq;
    }
    
    public void setSelSeq(int selSeq) {
        this.selSeq = selSeq;
    }
    
    public java.lang.String getLoginId() {
        return this.loginId;
    }
    
    public void setLoginId(java.lang.String loginId) {
        this.loginId = loginId;
    }
    
    public java.math.BigDecimal getPtplNo() {
        return this.ptplNo;
    }
    
    public void setPtplNo(java.math.BigDecimal ptplNo) {
        this.ptplNo = ptplNo;
    }
    
    public java.math.BigDecimal getSeq() {
        return this.seq;
    }
    
    public void setSeq(java.math.BigDecimal seq) {
        this.seq = seq;
    }
    
    public java.lang.String getSelGb() {
        return this.selGb;
    }
    
    public void setSelGb(java.lang.String selGb) {
        this.selGb = selGb;
    }
    
    public java.lang.String getDsnNo() {
        return this.dsnNo;
    }
    
    public void setDsnNo(java.lang.String dsnNo) {
        this.dsnNo = dsnNo;
    }
    
    public java.sql.Date getSelDt() {
        return this.selDt;
    }
    
    public void setSelDt(java.sql.Date selDt) {
        this.selDt = selDt;
    }
    
}
