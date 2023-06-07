package dlink_new.admin.vo;

import dlink_new.common.vo.FileVO;

/**
 * @Class Name : TbBrdFileVO.java
 * @Description : TbBrdFile VO class
 * @Modification Information
 *
 * @author 김현재
 * @since 2023-02-02
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */
public class TbBrdFileVO extends TbBrdFileDefaultVO{
    private static final long serialVersionUID = 1L;
    
    /** BRD_FILE_SEQ */
    private int brdFileSeq;
    
    /** BRD_SEQ */
    private int brdSeq;
    
    /** FILE_SEQ */
    private int fileSeq;
    
    /** REG_DT */
    private java.util.Date regDt;
    
    /** REG_ID */
    private java.lang.String regId;
    
    /** UPD_DT */
    private java.util.Date updDt;
    
    /** UPD_ID */
    private java.lang.String updId;
    
    private FileVO fileVO;    
    
    public int getBrdFileSeq() {
        return this.brdFileSeq;
    }
    
    public void setBrdFileSeq(int brdFileSeq) {
        this.brdFileSeq = brdFileSeq;
    }
    
    public int getBrdSeq() {
        return this.brdSeq;
    }
    
    public void setBrdSeq(int brdSeq) {
        this.brdSeq = brdSeq;
    }
    
    public int getFileSeq() {
        return this.fileSeq;
    }
    
    public void setFileSeq(int fileSeq) {
        this.fileSeq = fileSeq;
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

	public FileVO getFileVO() {
		return fileVO;
	}

	public void setFileVO(FileVO fileVO) {
		this.fileVO = fileVO;
	}	 
}
