package dlink.front.vo;

/**
 * @Class Name : TReqComFileVO.java
 * @Description : TReqComFile VO class
 * @Modification Information
 *
 * @author 2022-04-25
 * @since 이은지
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */
public class TReqComFileVO extends FrontSearchVO{
    private static final long serialVersionUID = 1L;
    
    /** REQ_DT */
    private java.util.Date reqDt;
    
    /** COM_ID */
    private java.lang.String comId;
    
    /** FILE_SEQ */
    private java.math.BigDecimal fileSeq;
        
    /** FILE_KIND */
    private java.lang.String fileKind;
    
    /** LOGIN_ID */
    private java.lang.String loginId;
    
    
    
    public java.lang.String getLoginId() {
		return loginId;
	}

	public void setLoginId(java.lang.String loginId) {
		this.loginId = loginId;
	}

	public java.util.Date getReqDt() {
        return this.reqDt;
    }
    
    public void setReqDt(java.util.Date reqDt) {
        this.reqDt = reqDt;
    }
    
    public java.lang.String getComId() {
        return this.comId;
    }
    
    public void setComId(java.lang.String comId) {
        this.comId = comId;
    }
    
    public java.math.BigDecimal getFileSeq() {
        return this.fileSeq;
    }
    
    public void setFileSeq(java.math.BigDecimal fileSeq) {
        this.fileSeq = fileSeq;
    }
    
    public java.lang.String getFileKind() {
        return this.fileKind;
    }
    
    public void setFileKind(java.lang.String fileKind) {
        this.fileKind = fileKind;
    }
    
}
