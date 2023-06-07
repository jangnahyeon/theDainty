package dlink.front.vo;

/**
 * @Class Name : TReqComVO.java
 * @Description : TReqCom VO class
 * @Modification Information
 *
 * @author 이은지
 * @since 2022-04-13
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */
public class TReqComVO extends FrontSearchVO{
    private static final long serialVersionUID = 1L;
    
    /** COM_ID */
    private java.lang.String comId;
    
    /** COM_NM */
    private java.lang.String comNm;
    
    /** COM_TYPE */
    private java.lang.String comType;
    
    /** CEO_NM */
    private java.lang.String ceoNm;
    
    /** SEX */
    private java.lang.String sex;
    
    /** COM_NO */
    private java.lang.String comNo;
    
    /** COM_ADDR */
    private java.lang.String comAddr;
    
    /** COM_DTL_ADDR */
    private java.lang.String comDtlAddr;
    
    /** COM_ZIP */
    private java.lang.String comZip;
    
    /** COM_URL */
    private java.lang.String comUrl;
    
    /** CEO_MOBILE_NO */
    private java.lang.String ceoMobileNo;
    
    /** DAMDANG_NM */
    private java.lang.String damdangNm;
    
    /** DAMDANG_DEPT */
    private java.lang.String damdangDept;
    
    /** DAMDANG_POS */
    private java.lang.String damdangPos;
    
    /** DAMDANG_MOBILE_NO */
    private java.lang.String damdangMobileNo;
    
    /** DAMDANG_EMAIL */
    private java.lang.String damdangEmail;
    
    /** REQ_DT */
    private String reqDt;
    
    /** REQ_PART */
    private java.lang.String reqPart;
    
    /** ACCEPT_YN */
    private java.lang.String acceptYn;
    
    /** ACCEPT_CAUSE */
    private java.lang.String acceptCause;
    
    /** REG_DT */
    private java.sql.Date regDt;
    
    /** 파일첨부 */
    private java.lang.String imgUrl;
    private java.math.BigDecimal fileSeq;
    private int[] multiFileSeq;
    
    /** FILE_KIND */
    private java.lang.String fileKind[]; 
       
    /** LOGIN_PWD */
    private java.lang.String loginPwd;
    
    /** 회원등록 구분 */
    private String registerFlag;
    
    private String register;
    
    /* 알림톡인증번호 mts_atalk_auth  */
    /** AUTH_NM */
    private java.lang.String authNm;
    
    
    private java.lang.String loginId;
    
    
    
    public java.lang.String getLoginId() {
		return loginId;
	}

	public void setLoginId(java.lang.String loginId) {
		this.loginId = loginId;
	}

	public java.lang.String getAuthNm() {
		return authNm;
	}

	public void setAuthNm(java.lang.String authNm) {
		this.authNm = authNm;
	}

	public void setFileSeq(java.math.BigDecimal fileSeq) {
		this.fileSeq = fileSeq;
	}

	public void setMultiFileSeq(int[] multiFileSeq) {
		this.multiFileSeq = multiFileSeq;
	}

	
	public java.lang.String[] getFileKind() {
		return fileKind;
	}

	public void setFileKind(java.lang.String[] fileKind) {
		this.fileKind = fileKind;
	}
	public java.math.BigDecimal getFileSeq() {
		return fileSeq;
	}

	public int[] getMultiFileSeq() {
		return multiFileSeq;
	}

	public String getRegister() {
		return register;
	}

	public void setRegister(String register) {
		this.register = register;
	}

	public String getReqDt() {
		return reqDt;
	}

	public void setReqDt(String reqDt) {
		this.reqDt = reqDt;
	}

	public String getRegisterFlag() {
		return registerFlag;
	}

	public void setRegisterFlag(String registerFlag) {
		this.registerFlag = registerFlag;
	}

	public java.lang.String getComId() {
        return this.comId;
    }
    
    public void setComId(java.lang.String comId) {
        this.comId = comId;
    }
    
    public java.lang.String getComNm() {
        return this.comNm;
    }
    
    public void setComNm(java.lang.String comNm) {
        this.comNm = comNm;
    }
    
    public java.lang.String getComType() {
        return this.comType;
    }
    
    public void setComType(java.lang.String comType) {
        this.comType = comType;
    }
    
    public java.lang.String getCeoNm() {
        return this.ceoNm;
    }
    
    public void setCeoNm(java.lang.String ceoNm) {
        this.ceoNm = ceoNm;
    }
    
    public java.lang.String getSex() {
        return this.sex;
    }
    
    public void setSex(java.lang.String sex) {
        this.sex = sex;
    }
    
    public java.lang.String getComNo() {
        return this.comNo;
    }
    
    public void setComNo(java.lang.String comNo) {
        this.comNo = comNo;
    }
    
    public java.lang.String getComAddr() {
        return this.comAddr;
    }
    
    public void setComAddr(java.lang.String comAddr) {
        this.comAddr = comAddr;
    }
    
    public java.lang.String getComDtlAddr() {
        return this.comDtlAddr;
    }
    
    public void setComDtlAddr(java.lang.String comDtlAddr) {
        this.comDtlAddr = comDtlAddr;
    }
    
    public java.lang.String getComZip() {
        return this.comZip;
    }
    
    public void setComZip(java.lang.String comZip) {
        this.comZip = comZip;
    }
    
    public java.lang.String getComUrl() {
        return this.comUrl;
    }
    
    public void setComUrl(java.lang.String comUrl) {
        this.comUrl = comUrl;
    }
    
    public java.lang.String getCeoMobileNo() {
        return this.ceoMobileNo;
    }
    
    public void setCeoMobileNo(java.lang.String ceoMobileNo) {
        this.ceoMobileNo = ceoMobileNo;
    }
    
    public java.lang.String getDamdangNm() {
        return this.damdangNm;
    }
    
    public void setDamdangNm(java.lang.String damdangNm) {
        this.damdangNm = damdangNm;
    }
    
    public java.lang.String getDamdangDept() {
        return this.damdangDept;
    }
    
    public void setDamdangDept(java.lang.String damdangDept) {
        this.damdangDept = damdangDept;
    }
    
    public java.lang.String getDamdangPos() {
        return this.damdangPos;
    }
    
    public void setDamdangPos(java.lang.String damdangPos) {
        this.damdangPos = damdangPos;
    }
    
    public java.lang.String getDamdangMobileNo() {
        return this.damdangMobileNo;
    }
    
    public void setDamdangMobileNo(java.lang.String damdangMobileNo) {
        this.damdangMobileNo = damdangMobileNo;
    }
    
    public java.lang.String getDamdangEmail() {
        return this.damdangEmail;
    }
    
    public void setDamdangEmail(java.lang.String damdangEmail) {
        this.damdangEmail = damdangEmail;
    }
    
    
    public java.lang.String getReqPart() {
        return this.reqPart;
    }
    
    public void setReqPart(java.lang.String reqPart) {
        this.reqPart = reqPart;
    }
    
    public java.lang.String getAcceptYn() {
        return this.acceptYn;
    }
    
    public void setAcceptYn(java.lang.String acceptYn) {
        this.acceptYn = acceptYn;
    }
    
    public java.lang.String getAcceptCause() {
        return this.acceptCause;
    }
    
    public void setAcceptCause(java.lang.String acceptCause) {
        this.acceptCause = acceptCause;
    }
    
    public java.sql.Date getRegDt() {
        return this.regDt;
    }
    
    public void setRegDt(java.sql.Date regDt) {
        this.regDt = regDt;
    }
    
    public java.lang.String getImgUrl() {
        return this.imgUrl;
    }
    
    public void setImgUrl(java.lang.String imgUrl) {
        this.imgUrl = imgUrl;
    }
    
    public java.lang.String getLoginPwd() {
        return this.loginPwd;
    }
    
    public void setLoginPwd(java.lang.String loginPwd) {
        this.loginPwd = loginPwd;
    }
    
}
