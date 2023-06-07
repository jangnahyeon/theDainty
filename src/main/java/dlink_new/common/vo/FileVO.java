package dlink_new.common.vo;

import java.math.BigDecimal;

import dlink_new.common.vo.SearchVO;

/**
 * @Class Name : TAttfileVO.java
 * @Description : TAttfile VO class
 * @Modification Information
 *
 * @author ���깆갔
 * @since 2022-04-08
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */
public class FileVO extends SearchVO{
    private static final long serialVersionUID = 1L;
    
    private BigDecimal fileSeq;
    private String saveNm;
    private String fileNm;
    private String fileSize;
    private String fileType;
    private String savePath;
    private String regDt;
    private String regId;
    private String updDt;
    private String updId;



	public String getSaveNm() {
		return saveNm;
	}

	public void setSaveNm(String saveNm) {
		this.saveNm = saveNm;
	}

	public String getFileNm() {
		return fileNm;
	}

	public void setFileNm(String fileNm) {
		this.fileNm = fileNm;
	}

	public String getFileSize() {
		return fileSize;
	}

	public void setFileSize(String fileSize) {
		this.fileSize = fileSize;
	}

	public String getFileType() {
		return fileType;
	}

	public void setFileType(String fileType) {
		this.fileType = fileType;
	}

	public String getSavePath() {
		return savePath;
	}

	public void setSavePath(String savePath) {
		this.savePath = savePath;
	}

	public String getRegDt() {
		return regDt;
	}

	public void setRegDt(String regDt) {
		this.regDt = regDt;
	}

	public String getRegId() {
		return regId;
	}

	public void setRegId(String regId) {
		this.regId = regId;
	}

	public String getUpdDt() {
		return updDt;
	}

	public void setUpdDt(String updDt) {
		this.updDt = updDt;
	}

	public String getUpdId() {
		return updId;
	}

	public void setUpdId(String updId) {
		this.updId = updId;
	}

	public BigDecimal getFileSeq() {
		return fileSeq;
	}

	public void setFileSeq(BigDecimal fileSeq) {
		this.fileSeq = fileSeq;
	}


}
