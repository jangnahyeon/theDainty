package dlink_new.admin.vo;

import java.math.BigDecimal;

/**
 * @Class Name : TbSisulRsvVO.java
 * @Description : TbSisulRsv VO class
 * @Modification Information
 *
 * @author 김현재
 * @since 2023-01-21
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */
public class TbSisulRsvVO extends TbSisulRsvDefaultVO{
    private static final long serialVersionUID = 1L;
    
    private String rsvGbCd;
    
    /** RSV_SEQ */
    private Integer rsvSeq;
    
    /** SISUL_SEQ */
    private int sisulSeq;
    
    /** MEM_SEQ */
    private int memSeq;
    
    /** MEM_ID */
    private java.lang.String memId;
    
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
    
    /** FILE_SEQ */
    private int fileSeq;
    
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
    
    private BigDecimal cmtSeq;
    private String cont;  
    private String contUpdate;
    private int rsvFileSeq;
    private String fileNm;
    private String smBizFileSeq;
    private String rejectMsg;
    private String zipFileSeq;
    private String zipFileNm;
    private String comNm;
    private java.lang.String startDate;
    private java.lang.String endDate;
    private String surveyLink;

	public Integer getRsvSeq() {
        return this.rsvSeq;
    }
    
    public void setRsvSeq(Integer rsvSeq) {
        this.rsvSeq = rsvSeq;
    }
    
    public int getSisulSeq() {
        return this.sisulSeq;
    }
    
    public void setSisulSeq(int sisulSeq) {
        this.sisulSeq = sisulSeq;
    }
    
    public int getMemSeq() {
        return this.memSeq;
    }
    
    public void setMemSeq(int memSeq) {
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
    
    public int getFileSeq() {
        return this.fileSeq;
    }
    
    public void setFileSeq(int fileSeq) {
        this.fileSeq = fileSeq;
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

	public java.lang.String getCont() {
		return cont;
	}

	public void setCont(java.lang.String cont) {
		this.cont = cont;
	}

	public BigDecimal getCmtSeq() {
		return cmtSeq;
	}

	public void setCmtSeq(BigDecimal cmtSeq) {
		this.cmtSeq = cmtSeq;
	}

	public java.lang.String getContUpdate() {
		return contUpdate;
	}

	public void setContUpdate(java.lang.String contUpdate) {
		this.contUpdate = contUpdate;
	}

	public int getRsvFileSeq() {
		return rsvFileSeq;
	}

	public void setRsvFileSeq(int rsvFileSeq) {
		this.rsvFileSeq = rsvFileSeq;
	}

	public String getFileNm() {
		return fileNm;
	}

	public void setFileNm(String fileNm) {
		this.fileNm = fileNm;
	}

	public String getSmBizFileSeq() {
		return smBizFileSeq;
	}

	public void setSmBizFileSeq(String smBizFileSeq) {
		this.smBizFileSeq = smBizFileSeq;
	}

	public String getRejectMsg() {
		return rejectMsg;
	}

	public void setRejectMsg(String rejectMsg) {
		this.rejectMsg = rejectMsg;
	}
    
    public String getComNm() {
		return comNm;
	}

	public void setComNm(String comNm) {
		this.comNm = comNm;
	}

	public String getZipFileNm() {
		return zipFileNm;
	}

	public void setZipFileNm(String zipFileNm) {
		this.zipFileNm = zipFileNm;
	}

	public String getZipFileSeq() {
		return zipFileSeq;
	}

	public void setZipFileSeq(String zipFileSeq) {
		this.zipFileSeq = zipFileSeq;
	}

	public java.lang.String getStartDate() {
		return startDate;
	}

	public void setStartDate(java.lang.String startDate) {
		this.startDate = startDate;
	}

	public java.lang.String getEndDate() {
		return endDate;
	}

	public void setEndDate(java.lang.String endDate) {
		this.endDate = endDate;
	}

	public String getSurveyLink() {
		return surveyLink;
	}

	public void setSurveyLink(String surveyLink) {
		this.surveyLink = surveyLink;
	}

	public String getRsvGbCd() {
		return rsvGbCd;
	}

	public void setRsvGbCd(String rsvGbCd) {
		this.rsvGbCd = rsvGbCd;
	}
}
