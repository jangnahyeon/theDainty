package dlink.admin.vo;

/**
 * @Class Name : TBannerVO.java
 * @Description : TBanner VO class
 * @Modification Information
 *
 * @author 안성찬
 * @since 2022-03-30
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */
public class TBannerVO extends SearchVO{
    private static final long serialVersionUID = 1L;
    
    /** BANNER_NO */
    private int bannerNo = 0;
    
    /** BANNER_AREA */
    private java.lang.String bannerArea;
    
    /** BANNER_NM */
    private java.lang.String bannerNm;
    
    /** BANNER_CONT */
    private java.lang.String bannerCont;
    
    /** FILE_SAVE */
    private java.lang.String fileSeq;
    
    /** ORD_SEQ */
    private int ordSeq;
    
    /** DIS_YN */
    private java.lang.String disYn;
    
    /** REG_DT */
    private java.sql.Date regDt;
    
    /** REGISTER */
    private java.lang.String register;
    
    private java.lang.String fileNm;
    public int getBannerNo() {
        return this.bannerNo;
    }
    
    public void setBannerNo(int bannerNo) {
        this.bannerNo = bannerNo;
    }
    
    public java.lang.String getBannerArea() {
        return this.bannerArea;
    }
    
    public void setBannerArea(java.lang.String bannerArea) {
        this.bannerArea = bannerArea;
    }
    
    public java.lang.String getBannerNm() {
        return this.bannerNm;
    }
    
    public void setBannerNm(java.lang.String bannerNm) {
        this.bannerNm = bannerNm;
    }
    
    public java.lang.String getBannerCont() {
        return this.bannerCont;
    }
    
    public void setBannerCont(java.lang.String bannerCont) {
        this.bannerCont = bannerCont;
    }
    
    public int getOrdSeq() {
        return this.ordSeq;
    }
    
    public void setOrdSeq(int ordSeq) {
        this.ordSeq = ordSeq;
    }
    
    public java.lang.String getDisYn() {
        return this.disYn;
    }
    
    public void setDisYn(java.lang.String disYn) {
        this.disYn = disYn;
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

	public java.lang.String getFileSeq() {
		return fileSeq;
	}

	public void setFileSeq(java.lang.String fileSeq) {
		this.fileSeq = fileSeq;
	}

	public java.lang.String getFileNm() {
		return fileNm;
	}

	public void setFileNm(java.lang.String fileNm) {
		this.fileNm = fileNm;
	}
    
    
}
