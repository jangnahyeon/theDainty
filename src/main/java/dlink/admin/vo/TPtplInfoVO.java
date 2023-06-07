package dlink.admin.vo;

/**
 * @Class Name : TPtplInfoVO.java
 * @Description : TPtplInfo VO class
 * @Modification Information
 *
 * @author 장나현
 * @since 2022-03-30
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */
public class TPtplInfoVO extends SearchVO{
    private static final long serialVersionUID = 1L;
    
    /** LOGIN_ID */
    private java.lang.String loginId;
    
    /** PTPL_NO */
    private java.math.BigDecimal ptplNo;
    
    private java.lang.String comNm;
    /** PTPL_NM */
    private java.lang.String ptplNm;
    private java.math.BigDecimal fileSeq;
    private java.lang.String multiSeq;
    private java.lang.String[] multiFileSeq;
    private java.lang.String titleYn;
    
    /** PTPL_PART */
    private java.lang.String ptplPart;
    private java.lang.String ptplPartNm;
    /** PTPL_YOUHAENG */
    private java.lang.String ptplYouhaeng;
    private java.lang.String  ptplYouhaengNm;
    
    /** PTPL_TYPE */
    private java.lang.String ptplType;
    
    /** PTPL_STYLE */
    private java.lang.String ptplStyle;
    
    /** ADD_OPTION */
    private java.lang.String addOption;
    
    /** REF_WORD */
    private java.lang.String refWord;
    
    /** CONCEPT */
    private java.lang.String concept;
    
    /** REG_DT */
    private java.sql.Date regDt;
    private java.lang.String regDtStrt;
    private java.lang.String regDtEnd;
    
    /** REGISTER */
    private java.lang.String register;
    
    /** UPD_DT */
    private java.sql.Date updDt;
    
    /** UPDATER */
    private java.lang.String updater;
    
    public java.lang.String getLoginId() {
        return this.loginId;
    }
    
    public void setLoginId(java.lang.String loginId) {
        this.loginId = loginId;
    }
    
    public java.math.BigDecimal getPtplNo() {
        return this.ptplNo;
    }
    
    public void setPtplNo(java.math.BigDecimal ptplNo) {
        this.ptplNo = ptplNo;
    }
    
    public java.lang.String getPtplNm() {
        return this.ptplNm;
    }
    
    public void setPtplNm(java.lang.String ptplNm) {
        this.ptplNm = ptplNm;
    }
    
    public java.lang.String getPtplPart() {
        return this.ptplPart;
    }
    
    public void setPtplPart(java.lang.String ptplPart) {
        this.ptplPart = ptplPart;
    }
    
    public java.lang.String getPtplYouhaeng() {
        return this.ptplYouhaeng;
    }
    
    public void setPtplYouhaeng(java.lang.String ptplYouhaeng) {
        this.ptplYouhaeng = ptplYouhaeng;
    }
    
    public java.lang.String getPtplType() {
        return this.ptplType;
    }
    
    public void setPtplType(java.lang.String ptplType) {
        this.ptplType = ptplType;
    }
    
    public java.lang.String getPtplStyle() {
        return this.ptplStyle;
    }
    
    public void setPtplStyle(java.lang.String ptplStyle) {
        this.ptplStyle = ptplStyle;
    }
    
    public java.lang.String getAddOption() {
        return this.addOption;
    }
    
    public void setAddOption(java.lang.String addOption) {
        this.addOption = addOption;
    }
    
    public java.lang.String getRefWord() {
        return this.refWord;
    }
    
    public void setRefWord(java.lang.String refWord) {
        this.refWord = refWord;
    }
    
    public java.lang.String getConcept() {
        return this.concept;
    }
    
    public void setConcept(java.lang.String concept) {
        this.concept = concept;
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
    
    public java.sql.Date getUpdDt() {
        return this.updDt;
    }
    
    public void setUpdDt(java.sql.Date updDt) {
        this.updDt = updDt;
    }
    
    public java.lang.String getUpdater() {
        return this.updater;
    }
    
    public void setUpdater(java.lang.String updater) {
        this.updater = updater;
    }

	public java.lang.String getPtplPartNm() {
		return ptplPartNm;
	}

	public void setPtplPartNm(java.lang.String ptplPartNm) {
		this.ptplPartNm = ptplPartNm;
	}

	public java.lang.String getPtplYoujaengNm() {
		return ptplYouhaengNm;
	}

	public void setPtplYoujaengNm(java.lang.String ptplYoujaengNm) {
		this.ptplYouhaengNm = ptplYoujaengNm;
	}

	public java.math.BigDecimal getFileSeq() {
		return fileSeq;
	}

	public void setFileSeq(java.math.BigDecimal fileSeq) {
		this.fileSeq = fileSeq;
	}

	public java.lang.String[] getMultiFileSeq() {
		return multiFileSeq;
	}

	public void setMultiFileSeq(java.lang.String[] multiFileSeq) {
		this.multiFileSeq = multiFileSeq;
	}

	public java.lang.String getRegDtStrt() {
		return regDtStrt;
	}

	public void setRegDtStrt(java.lang.String regDtStrt) {
		this.regDtStrt = regDtStrt;
	}

	public java.lang.String getRegDtEnd() {
		return regDtEnd;
	}

	public void setRegDtEnd(java.lang.String regDtEnd) {
		this.regDtEnd = regDtEnd;
	}

	public java.lang.String getMultiSeq() {
		return multiSeq;
	}

	public void setMultiSeq(java.lang.String multiSeq) {
		this.multiSeq = multiSeq;
	}

	public java.lang.String getComNm() {
		return comNm;
	}

	public void setComNm(java.lang.String comNm) {
		this.comNm = comNm;
	}

	public java.lang.String getTitleYn() {
		return titleYn;
	}

	public void setTitleYn(java.lang.String titleYn) {
		this.titleYn = titleYn;
	}
    
}
