package dlink.front.vo;

import java.util.List;

/**
 * @Class Name : TPtplInfoVO.java
 * @Description : TPtplInfo VO class
 * @Modification Information
 *
 * @author 장나현
 * @since 2022-03-31
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */
public class TPtplInfoVO extends TPtplInfoDefaultVO{
    private static final long serialVersionUID = 1L;
    
    /** LOGIN_ID */
    private java.lang.String loginId;
    
    /** PTPL_NO */
    private java.math.BigDecimal ptplNo;
    
    private java.lang.String fileSeq;
    private java.lang.String[] multiFileSeq;
    private java.lang.String multiSeq;
    private java.lang.String titleYn;
    private java.lang.String selGb;
    private java.lang.String comNm;
    
    /** PTPL_NM */
    private java.lang.String ptplNm;
    
    /** PTPL_PART */
    private java.lang.String ptplPart;
    private java.lang.String ptplPartNm;
    
    /** PTPL_YOUHAENG */
    private java.lang.String ptplYouhaeng;
    private java.lang.String ptplYouhaengNm;
    
    /** PTPL_TYPE */
    private java.lang.String ptplType;
    private List<String> arrPtplType;
    
    /** PTPL_STYLE */
    private java.lang.String ptplStyle;
    private List<String> arrPtplStyle;
    
    /** ADD_OPTION */
    private java.lang.String addOption;
    private List<String> arrAddOption;
    
    private java.lang.String[] arr;
    private java.lang.String strArr;
    private java.lang.String[] categoryNm;
    
    
    /** REF_WORD */
    private java.lang.String refWord;
    
    /** CONCEPT */
    private java.lang.String concept;
    
    /** REG_DT */
    private java.sql.Date regDt;
    
    /** REGISTER */
    private java.lang.String register;
    
    /** UPD_DT */
    private java.sql.Date updDt;
    
    /** UPDATER */
    private java.lang.String updater;
    
    private String selDt;
    
  
     
	public String getSelDt() {
		return selDt;
	}

	public void setSelDt(String selDt) {
		this.selDt = selDt;
	}

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

	public java.lang.String getPtplYouhaengNm() {
		return ptplYouhaengNm;
	}

	public void setPtplYouhaengNm(java.lang.String ptplYouhaengNm) {
		this.ptplYouhaengNm = ptplYouhaengNm;
	}

	public java.lang.String[] getArr() {
		return arr;
	}

	public void setArr(java.lang.String[] arr) {
		this.arr = arr;
	}

	public java.lang.String[] getCategoryNm() {
		return categoryNm;
	}

	public void setCategoryNm(java.lang.String[] categoryNm) {
		this.categoryNm = categoryNm;
	}

	public List<String> getArrPtplType() {
		return arrPtplType;
	}

	public void setArrPtplType(List<String> listPT) {
		this.arrPtplType = listPT;
	}

	public List<String> getArrPtplStyle() {
		return arrPtplStyle;
	}

	public void setArrPtplStyle(List<String> listPT) {
		this.arrPtplStyle = listPT;
	}

	public List<String> getArrAddOption() {
		return arrAddOption;
	}

	public void setArrAddOption(List<String> listAP) {
		this.arrAddOption = listAP;
	}

	public java.lang.String getStrArr() {
		return strArr;
	}

	public void setStrArr(java.lang.String strArr) {
		this.strArr = strArr;
	}

	public java.lang.String getFileSeq() {
		return fileSeq;
	}

	public void setFileSeq(String string) {
		this.fileSeq = string;
	}

	public java.lang.String[] getMultiFileSeq() {
		return multiFileSeq;
	}

	public void setMultiFileSeq(java.lang.String[] multiFileSeq) {
		this.multiFileSeq = multiFileSeq;
	}

	public java.lang.String getTitleYn() {
		return titleYn;
	}

	public void setTitleYn(java.lang.String titleYn) {
		this.titleYn = titleYn;
	}

	public java.lang.String getMultiSeq() {
		return multiSeq;
	}

	public void setMultiSeq(java.lang.String multiSeq) {
		this.multiSeq = multiSeq;
	}

	public java.lang.String getSelGb() {
		return selGb;
	}

	public void setSelGb(java.lang.String selGb) {
		this.selGb = selGb;
	}

	public java.lang.String getComNm() {
		return comNm;
	}

	public void setComNm(java.lang.String comNm) {
		this.comNm = comNm;
	}





    
}
