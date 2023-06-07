package dlink.admin.vo;

/**
 * @Class Name : TFaqVO.java
 * @Description : TFaq VO class
 * @Modification Information
 *
 * @author 이효진
 * @since 2022-03-30
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */
public class TFaqVO extends SearchVO{
    private static final long serialVersionUID = 1L;
    
    /** FAQ_NO */
    private int faqNo;
    
    /** QUESTION */
    private java.lang.String question;
    
    /** ANSWER */
    private java.lang.String answer;
    
    /** OPEN_YN */
    private java.lang.String openYn;
    
    /** REGISTER */
    private java.lang.String register;
    
    /** REG_DT */
    private java.sql.Date regDt;
    
    private String registerFlag;
    
    
    public int getFaqNo() {
        return this.faqNo;
    }
    
    public void setFaqNo(int faqNo) {
        this.faqNo = faqNo;
    }
    
    public java.lang.String getQuestion() {
        return this.question;
    }
    
    public void setQuestion(java.lang.String question) {
        this.question = question;
    }
    
    public java.lang.String getAnswer() {
        return this.answer;
    }
    
    public void setAnswer(java.lang.String answer) {
        this.answer = answer;
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
