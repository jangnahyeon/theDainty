package dlink_new.admin.vo;

import java.math.BigDecimal;

/**
 * @Class Name : TbPortfVO.java
 * @Description : TbPortf VO class
 * @Modification Information
 *
 * @author 김현재
 * @since 2023-01-21
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */
public class TbPortfVO extends TbPortfDefaultVO{
    private static final long serialVersionUID = 1L;
    
    /** PORTF_SEQ */
    private Integer portfSeq;
    
    private String code;
    
    /** MEM_SEQ */
    private Integer memSeq;
    
    /** MEM_ID */
    private java.lang.String memId;
    
    /** TITLE */
    private java.lang.String title;
    
    /** FILE_SEQ */
    private Integer fileSeq;
    
    /** REG_DT */
    private String regDt;
    
    /** REG_ID */
    private java.lang.String regId;
    
    /** UPD_DT */
    private java.util.Date updDt;
    
    /** UPD_ID */
    private java.lang.String updId;
    
    private String fileNm;
    
    private java.lang.String orderNo;
    
    private Integer target_portfSeq;

	public Integer getPortfSeq() {
        return this.portfSeq;
    }
    
    public void setPortfSeq(Integer portfSeq) {
        this.portfSeq = portfSeq;
    }
    
    public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public Integer getMemSeq() {
        return this.memSeq;
    }
    
    public void setMemSeq(Integer memSeq) {
        this.memSeq = memSeq;
    }
    
    public java.lang.String getMemId() {
        return this.memId;
    }
    
    public void setMemId(java.lang.String memId) {
        this.memId = memId;
    }
    
    public java.lang.String getTitle() {
        return this.title;
    }
    
    public void setTitle(java.lang.String title) {
        this.title = title;
    }
    
    public Integer getFileSeq() {
        return this.fileSeq;
    }
    
    public void setFileSeq(Integer fileSeq) {
        this.fileSeq = fileSeq;
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

	public String getFileNm() {
		return fileNm;
	}

	public void setFileNm(String fileNm) {
		this.fileNm = fileNm;
	}
    
    public java.lang.String getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(java.lang.String orderNo) {
		this.orderNo = orderNo;
	}

	public Integer getTarget_portfSeq() {
		return target_portfSeq;
	}

	public void setTarget_portfSeq(Integer target_portfSeq) {
		this.target_portfSeq = target_portfSeq;
	}
    
}
