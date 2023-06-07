package dlink.front.vo;

/**
 * @Class Name : BusinessVO.java
 * @Description : Business VO class
 * @Modification Information
 *
 * @author 이효진
 * @since 2022-04-06
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */
public class BusinessVO extends FrontSearchVO{
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
    
    /** 관리번호 */
    private int wordNo;
    
    /** 용어 */
    private java.lang.String wordNm;
    
    /** 설명 */
    private java.lang.String cont;
    
    /** MENU_ID */
    private java.lang.String menuId;
    
    /** POST_NO */
    private int postNo;
    
    /** SEQ */
    private int seq;
    
    /** TITLE */
    private java.lang.String title;
   
    
    /** PWD */
    private java.lang.String pwd;
    
    
    /** loginId */
    private String loginId;
    
    /** 커뮤니티파일정보 
     * 파일관리번호 */
    private String fileSeq;
    
    private String[] file_attch;
    
    private String fileNm;
    
    public java.lang.String getMenuId() {
        return this.menuId;
    }
    
    public void setMenuId(java.lang.String menuId) {
        this.menuId = menuId;
    }
    
    public int getPostNo() {
        return this.postNo;
    }
    
    public void setPostNo(int postNo) {
        this.postNo = postNo;
    }
    
    public int getSeq() {
        return this.seq;
    }
    
    public void setSeq(int seq) {
        this.seq = seq;
    }
    
    public java.lang.String getTitle() {
        return this.title;
    }
    
    public void setTitle(java.lang.String title) {
        this.title = title;
    }
    
    public java.lang.String getPwd() {
        return this.pwd;
    }
    
    public void setPwd(java.lang.String pwd) {
        this.pwd = pwd;
    }

	public String getLoginId() {
		return loginId;
	}

	public void setLoginId(String loginId) {
		this.loginId = loginId;
	}
  
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

	public String getFileSeq() {
		return fileSeq;
	}

	public void setFileSeq(String fileSeq) {
		this.fileSeq = fileSeq;
	}

	public String[] getFile_attch() {
		return file_attch;
	}

	public void setFile_attch(String[] file_attch) {
		this.file_attch = file_attch;
	}

	public String getFileNm() {
		return fileNm;
	}

	public void setFileNm(String fileNm) {
		this.fileNm = fileNm;
	}
	
}
