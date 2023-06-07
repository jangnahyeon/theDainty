package dlink.admin.vo;

/**
 * @Class Name : TDsnBankVO.java
 * @Description : TDsnBank VO class
 * @Modification Information
 *
 * @author 장나현
 * @since 2022-04-11
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */
public class TDsnBankVO extends SearchVO{
    private static final long serialVersionUID = 1L;
    
    /** DSN_NO */
    private java.lang.String dsnNo;
    
    /** DSN_NM */
    private java.lang.String dsnNm;
    
    /** DSN_PART */
    private java.lang.String dsnPart;
    
    /** REF_WORD */
    private java.lang.String refWord;
    
    /** CONCEPT */
    private java.lang.String concept;
    
    /** FILE_SEQ */
    private java.math.BigDecimal fileSeq;
    
    private java.lang.String fileNm;
    
    /** REG_DT */
    private java.sql.Date regDt;
    
    /** REGISTER */
    private java.lang.String register;
    
    private java.lang.String dsnPartNm; 
    
    
    public java.lang.String getDsnPartNm() {
		return dsnPartNm;
	}

	public void setDsnPartNm(java.lang.String dsnPartNm) {
		this.dsnPartNm = dsnPartNm;
	}

	public java.lang.String getDsnNo() {
        return this.dsnNo;
    }
    
    public void setDsnNo(java.lang.String dsnNo) {
        this.dsnNo = dsnNo;
    }
    
    public java.lang.String getDsnNm() {
        return this.dsnNm;
    }
    
    public void setDsnNm(java.lang.String dsnNm) {
        this.dsnNm = dsnNm;
    }
    
    public java.lang.String getDsnPart() {
        return this.dsnPart;
    }
    
    public void setDsnPart(java.lang.String dsnPart) {
        this.dsnPart = dsnPart;
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
    
    public java.math.BigDecimal getFileSeq() {
        return this.fileSeq;
    }
    
    public void setFileSeq(java.math.BigDecimal fileSeq) {
        this.fileSeq = fileSeq;
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

	public java.lang.String getFileNm() {
		return fileNm;
	}

	public void setFileNm(java.lang.String fileNm) {
		this.fileNm = fileNm;
	}

}
