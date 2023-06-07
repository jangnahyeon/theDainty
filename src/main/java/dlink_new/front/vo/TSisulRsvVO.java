package dlink_new.front.vo;


/**
 * @Class Name : TSisulRsv.java
 * @Description : TSisulRsv VO class
 * @Modification Information
 *
 * @author 이재욱
 * @since 2023-01-04
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */
public class TSisulRsvVO extends FrontDefaultVO{
    private static final long serialVersionUID = 1L;
    
    /** RSV_SEQ */
    private int rsvSeq;
    
	/** SISUL_SEQ */
    private int sisulSeq;
    
    /** LOGIN_ID */
    private java.lang.String loginId;
    
    /** TITLE */
    private java.lang.String title;
    
    /** RSV_YEAR */
    private java.lang.String rsvYear;
    
    /** RSV_MONTH */
    private java.lang.String rsvMonth;
    
    /** RSV_DAY */
    private java.lang.String rsvDay;
    
    /** RSV_ST */
    private java.lang.String rsvSt;
    
    /** RSV_ET */
    private java.lang.String rsvEt;
    
    /** PROD_CNT */
    private java.lang.String prodCnt;
    
    /** PROD_1 */
    private java.lang.String prod1;
    
    /** PROD_2 */
    private java.lang.String prod2;
    
    /** PROD_SIZE_CD */
    private java.lang.String prodSizeCd;
    
    /** PROD_REF_CD */
    private java.lang.String prodRefCd;
    
    /** PURPOSE_CD */
    private java.lang.String purposeCd;
    
    /** PWD */
    private java.lang.String pwd;
    
    /** ACCEPT_YN */
    private java.lang.String acceptYn;
    
    /** REG_DT */
    private java.util.Date regDt;
    
    /** REG_ID */
    private java.lang.String regId;
    
    /** UPD_DT */
    private java.util.Date updDt;
    
    /** UPD_ID */
    private java.lang.String updId;

    
	/** t_sisul_rsv_file */
	/** RSV_FILE_SEQ */
	private int rsvFileSeq;
	
	/**FILE_SEQ*/
	private int fileSeq;
    
	/** 수정, 등록 화면 구분 */
    private String registerFlag;
	
	/** 추가 */
    private java.lang.String[] multiFileSeq;

	private java.lang.String multiSeq;
	
	private java.lang.String fileNm;

	public int getRsvSeq() {
        return this.rsvSeq;
    }
    
    public void setRsvSeq(int rsvSeq) {
        this.rsvSeq = rsvSeq;
    }

    public java.lang.String getTitle() {
		return title;
	}

	public void setTitle(java.lang.String title) {
		this.title = title;
	}
    
    public int getSisulSeq() {
        return this.sisulSeq;
    }
    
    public void setSisulSeq(int sisulSeq) {
        this.sisulSeq = sisulSeq;
    }
    
    public java.lang.String getLoginId() {
        return this.loginId;
    }
    
    public void setLoginId(java.lang.String loginId) {
        this.loginId = loginId;
    }
    
    public java.lang.String getRsvYear() {
        return this.rsvYear;
    }
    
    public void setRsvYear(java.lang.String rsvYear) {
        this.rsvYear = rsvYear;
    }
    
    public java.lang.String getRsvMonth() {
        return this.rsvMonth;
    }
    
    public void setRsvMonth(java.lang.String rsvMonth) {
        this.rsvMonth = rsvMonth;
    }
    
    public java.lang.String getRsvDay() {
        return this.rsvDay;
    }
    
    public void setRsvDay(java.lang.String rsvDay) {
        this.rsvDay = rsvDay;
    }
    
    public java.lang.String getRsvSt() {
        return this.rsvSt;
    }
    
    public void setRsvSt(java.lang.String rsvSt) {
        this.rsvSt = rsvSt;
    }
    
    public java.lang.String getRsvEt() {
        return this.rsvEt;
    }
    
    public void setRsvEt(java.lang.String rsvEt) {
        this.rsvEt = rsvEt;
    }
    
    public java.lang.String getProdCnt() {
        return this.prodCnt;
    }
    
    public void setProdCnt(java.lang.String prodCnt) {
        this.prodCnt = prodCnt;
    }
    
    public java.lang.String getProd1() {
        return this.prod1;
    }
    
    public void setProd1(java.lang.String prod1) {
        this.prod1 = prod1;
    }
    
    public java.lang.String getProd2() {
        return this.prod2;
    }
    
    public void setProd2(java.lang.String prod2) {
        this.prod2 = prod2;
    }
    
    public java.lang.String getProdSizeCd() {
        return this.prodSizeCd;
    }
    
    public void setProdSizeCd(java.lang.String prodSizeCd) {
        this.prodSizeCd = prodSizeCd;
    }
    
    public java.lang.String getProdRefCd() {
        return this.prodRefCd;
    }
    
    public void setProdRefCd(java.lang.String prodRefCd) {
        this.prodRefCd = prodRefCd;
    }
    
    public java.lang.String getPurposeCd() {
        return this.purposeCd;
    }
    
    public void setPurposeCd(java.lang.String purposeCd) {
        this.purposeCd = purposeCd;
    }
    
    public java.lang.String getPwd() {
        return this.pwd;
    }
    
    public void setPwd(java.lang.String pwd) {
        this.pwd = pwd;
    }
    
    public java.lang.String getAcceptYn() {
        return this.acceptYn;
    }
    
    public void setAcceptYn(java.lang.String acceptYn) {
        this.acceptYn = acceptYn;
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
    
    public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public String getRegisterFlag() {
		return registerFlag;
	}

	public void setRegisterFlag(String registerFlag) {
		this.registerFlag = registerFlag;
	}
	public int getRsvFileSeq() {
		return rsvFileSeq;
	}

	public int getFileSeq() {
		return fileSeq;
	}

	public void setRsvFileSeq(int rsvFileSeq) {
		this.rsvFileSeq = rsvFileSeq;
	}

	public void setFileSeq(int fileSeq) {
		this.fileSeq = fileSeq;
	}
	
    public java.lang.String[] getMultiFileSeq() {
		return multiFileSeq;
	}

	public java.lang.String getMultiSeq() {
		return multiSeq;
	}

	public void setMultiFileSeq(java.lang.String[] multiFileSeq) {
		this.multiFileSeq = multiFileSeq;
	}

	public void setMultiSeq(java.lang.String multiSeq) {
		this.multiSeq = multiSeq;
	}

	public java.lang.String getFileNm() {
		return fileNm;
	}

	public void setFileNm(java.lang.String fileNm) {
		this.fileNm = fileNm;
	}
}