package dlink.admin.vo;

/**
 * @Class Name : TMemComFileVO.java
 * @Description : TMemComFile VO class
 * @Modification Information
 *
 * @author 이은지
 * @since 2022-03-30
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */
public class TMemComFileVO extends SearchVO{
    private static final long serialVersionUID = 1L;
  
    
    /** LOGIN_ID */
    private java.lang.String loginId;
    
    private int fileSeq;
    
    private java.lang.String fileKind;

    private String fileNm;
    
    private String fileKindNm;
    
    
	public String getFileKindNm() {
		return fileKindNm;
	}

	public void setFileKindNm(String fileKindNm) {
		this.fileKindNm = fileKindNm;
	}

	public String getFileNm() {
		return fileNm;
	}

	public void setFileNm(String fileNm) {
		this.fileNm = fileNm;
	}

	public java.lang.String getLoginId() {
		return loginId;
	}

	public void setLoginId(java.lang.String loginId) {
		this.loginId = loginId;
	}

	public int getFileSeq() {
		return fileSeq;
	}

	public void setFileSeq(int fileSeq) {
		this.fileSeq = fileSeq;
	}

	public java.lang.String getFileKind() {
		return fileKind;
	}

	public void setFileKind(java.lang.String fileKind) {
		this.fileKind = fileKind;
	}
    
    
    
    
    
    
}
