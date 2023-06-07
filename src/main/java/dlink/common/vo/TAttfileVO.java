package dlink.common.vo;

/**
 * @Class Name : TAttfileVO.java
 * @Description : TAttfile VO class
 * @Modification Information
 *
 * @author 안성찬
 * @since 2022-04-08
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */
public class TAttfileVO extends SearchVO{
    private static final long serialVersionUID = 1L;
    
    /** FILE_SEQ */
    private java.math.BigDecimal fileSeq;
    
    /** FILE_SAVE_NM */
    private java.lang.String fileSaveNm;
    
    /** FILE_NM */
    private java.lang.String fileNm;
    
    /** FILE_SIZE */
    private java.lang.String fileSize;
    
    /** FILE_TYPE */
    private java.lang.String fileType;
    
    /** SAVE_PATH */
    private java.lang.String savePath;
    
    /** REG_DT */
    private java.sql.Date regDt;
    
    /** REGISTER */
    private java.lang.String register;
    
    /** 커뮤니티 파일 삭제시 T_COMMUTY_FILE테이블 삭제 구분*/
    private String CommutyFile;
    
    public java.math.BigDecimal getFileSeq() {
        return this.fileSeq;
    }
    
    public void setFileSeq(java.math.BigDecimal fileSeq) {
        this.fileSeq = fileSeq;
    }
    
    public java.lang.String getFileSaveNm() {
        return this.fileSaveNm;
    }
    
    public void setFileSaveNm(java.lang.String fileSaveNm) {
        this.fileSaveNm = fileSaveNm;
    }
    
    public java.lang.String getFileNm() {
        return this.fileNm;
    }
    
    public void setFileNm(java.lang.String fileNm) {
        this.fileNm = fileNm;
    }
    
    public java.lang.String getFileSize() {
        return this.fileSize;
    }
    
    public void setFileSize(java.lang.String fileSize) {
        this.fileSize = fileSize;
    }
    
    public java.lang.String getFileType() {
        return this.fileType;
    }
    
    public void setFileType(java.lang.String fileType) {
        this.fileType = fileType;
    }
    
    public java.lang.String getSavePath() {
        return this.savePath;
    }
    
    public void setSavePath(java.lang.String savePath) {
        this.savePath = savePath;
    }
    
    public java.sql.Date getRegDt() {
        return this.regDt;
    }
    
    public void setRegDt(java.sql.Date regDt) {
        this.regDt = regDt;
    }
    
    public java.lang.String getRegister() {
        return this.register;
    }
    
    public void setRegister(java.lang.String register) {
        this.register = register;
    }

	public String getCommutyFile() {
		return CommutyFile;
	}

	public void setCommutyFile(String commutyFile) {
		CommutyFile = commutyFile;
	}
    
}
