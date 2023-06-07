package dlink_new.front.vo;

import java.math.BigDecimal;

/**
 * @Class Name : TSisulRsvFile.java
 * @Description : TSisulRsvFile VO class
 * @Modification Information
 *
 * @author 이재욱
 * @since 2023-01-11
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */
public class TbSisulRsvFileVO {
	private static final long serialVersionUID = 1L;
	

	
	/** RSV_FILE_SEQ */
	private int rsvFileSeq;
	
	/** RSV_SEQ */
	private int rsvSeq;
	
	/**FILE_SEQ*/
	private BigDecimal fileSeq;
	
	/**REG_DT*/
	private java.util.Date regDt;
	
	/**REG_ID*/
	private java.lang.String regId;
	
	/**UPD_DT*/
	private java.util.Date updDt;
	
	/** UPD_ID */
	private java.lang.String updId;
	
	/** 추가 */
	/** FILE_NM */
	private java.lang.String fileNm;

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public int getRsvFileSeq() {
		return rsvFileSeq;
	}

	public int getRsvSeq() {
		return rsvSeq;
	}

	public BigDecimal getFileSeq() {
		return fileSeq;
	}

	public java.util.Date getRegDt() {
		return regDt;
	}

	public java.lang.String getRegId() {
		return regId;
	}

	public java.util.Date getUpdDt() {
		return updDt;
	}

	public java.lang.String getUpdId() {
		return updId;
	}

	public void setRsvFileSeq(int rsvFileSeq) {
		this.rsvFileSeq = rsvFileSeq;
	}

	public void setRsvSeq(int rsvSeq) {
		this.rsvSeq = rsvSeq;
	}

	public void setFileSeq(BigDecimal fileSeq) {
		this.fileSeq = fileSeq;
	}

	public void setRegDt(java.util.Date regDt) {
		this.regDt = regDt;
	}

	public void setRegId(java.lang.String regId) {
		this.regId = regId;
	}

	public void setUpdDt(java.util.Date updDt) {
		this.updDt = updDt;
	}

	public void setUpdId(java.lang.String updId) {
		this.updId = updId;
	}
	
	public java.lang.String getFileNm() {
		return fileNm;
	}

	public void setFileNm(java.lang.String fileNm) {
		this.fileNm = fileNm;
	}
}
