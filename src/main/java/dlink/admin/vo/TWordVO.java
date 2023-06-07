package dlink.admin.vo;

/**
 * @Class Name : TWordVO.java
 * @Description : TWord VO class
 * @Modification Information
 *
 * @author 이효진
 * @since 2022-03-30
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */
public class TWordVO extends SearchVO{
    private static final long serialVersionUID = 1L;
    
    /** 관리번호 */
    private int wordNo;
    
    /** 용어 */
    private java.lang.String wordNm;
    
    /** 설명 */
    private java.lang.String cont;
    
    /** 사용여부 */
    private java.lang.String openYn;
    
    /** 등록자 */
    private java.lang.String register;
    
    /** 등록일 */
    private java.sql.Date regDt;
    
    /** 수정, 등록 화면 구분 */
    private String registerFlag;
    
    public int getWordNo() {
        return this.wordNo;
    }
    
    public void setWordNo(int wordNo) {
        this.wordNo = wordNo;
    }
    
    public java.lang.String getWordNm() {
        return this.wordNm;
    }
    
    public void setWordNm(java.lang.String wordNm) {
        this.wordNm = wordNm;
    }
    
    public java.lang.String getCont() {
        return this.cont;
    }
    
    public void setCont(java.lang.String cont) {
        this.cont = cont;
    }
    
    public java.lang.String getOpenYn() {
        return this.openYn;
    }
    
    public void setOpenYn(java.lang.String openYn) {
        this.openYn = openYn;
    }
    
    public java.lang.String getRegister() {
        return this.register;
    }
    
    public void setRegister(java.lang.String register) {
        this.register = register;
    }
    
    public java.sql.Date getRegDt() {
        return this.regDt;
    }
    
    public void setRegDt(java.sql.Date regDt) {
        this.regDt = regDt;
    }

	public String getRegisterFlag() {
		return registerFlag;
	}

	public void setRegisterFlag(String registerFlag) {
		this.registerFlag = registerFlag;
	}
    
}
