package dlink.admin.vo;

/**
 * @Class Name : TSpecReqComVO.java
 * @Description : TSpecReqCom VO class
 * @Modification Information
 *
 * @author 이은지
 * @since 2022-04-07
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */
public class TSpecReqComVO extends SearchVO{
    private static final long serialVersionUID = 1L;
    
    /** LOGIN_ID */
    private java.lang.String loginId;
    
    /** REQ_NO */
    private java.math.BigDecimal reqNo;
    
    /** SALES_AMT */
    private java.math.BigDecimal salesAmt;
    
    /** KEY_CUSTOMER */
    private java.lang.String keyCustomer;
    
    /** EMPLOY */
    private java.lang.String employ;
    
    /** ACCEPT_YN */
    private java.lang.String acceptYn;
    
    /** ACCEPT_CONT */
    private java.lang.String acceptCont;
    
    /** REQ_DT */
    private java.sql.Date reqDt;
    
    /** REQUESTER */
    private java.lang.String requester;
    
    /** 수정, 등록 화면 구분 */
    private String registerFlag;
    
    /** REGISTER */
    private java.lang.String register;
    
    /** CONT */
    private java.lang.String cont;
    
    
    private String[] arr;
    private String[] SpecMemarr;
    
    
    
    /** TSpecReqMemVO */    
    
    /** SEQ */
    private java.math.BigDecimal seq;
    
    /** STAFF_NM */
    private java.lang.String staffNm;
    
    /** POSITION */
    private java.lang.String position;
    
    /** BIRTHDAY */
    private java.lang.String birthday;
    
    /** LST_HAKWI */
    private java.lang.String lstHakwi;
    
    /** JUNGONG */
    private java.lang.String jungong;
    
    /** JUNGONG_PART */
    private java.lang.String jungongPart;
    
    /** CAREER */
    private java.lang.String career;
    
    /** SEX */
    private java.lang.String mSex;
    
    /** school */
    private java.lang.String school;
    
    /** acquisition_year */
    private java.lang.String acquisitionYear;
    
    
    
    /** 기업회원파일 정보 */
    private int fileSeq;
    
    private String fileKind;
    
    
    
    
	

	

	
	public java.lang.String getmSex() {
		return mSex;
	}

	public void setmSex(java.lang.String mSex) {
		this.mSex = mSex;
	}

	public java.lang.String getSchool() {
		return school;
	}

	public void setSchool(java.lang.String school) {
		this.school = school;
	}

	public java.lang.String getAcquisitionYear() {
		return acquisitionYear;
	}

	public void setAcquisitionYear(java.lang.String acquisitionYear) {
		this.acquisitionYear = acquisitionYear;
	}

	public java.lang.String getCont() {
		return cont;
	}

	public void setCont(java.lang.String cont) {
		this.cont = cont;
	}

	public String[] getSpecMemarr() {
		return SpecMemarr;
	}

	public void setSpecMemarr(String[] specMemarr) {
		SpecMemarr = specMemarr;
	}

	public int getFileSeq() {
		return fileSeq;
	}

	public void setFileSeq(int fileSeq) {
		this.fileSeq = fileSeq;
	}

	public String getFileKind() {
		return fileKind;
	}

	public void setFileKind(String fileKind) {
		this.fileKind = fileKind;
	}

	public String[] getArr() {
		return arr;
	}

	public void setArr(String[] arr) {
		this.arr = arr;
	}

	public java.math.BigDecimal getSeq() {
		return seq;
	}

	public void setSeq(java.math.BigDecimal seq) {
		this.seq = seq;
	}
	public java.lang.String getStaffNm() {
		return staffNm;
	}

	public void setStaffNm(java.lang.String staffNm) {
		this.staffNm = staffNm;
	}

	public java.lang.String getPosition() {
		return position;
	}

	public void setPosition(java.lang.String position) {
		this.position = position;
	}

	public java.lang.String getBirthday() {
		return birthday;
	}

	public void setBirthday(java.lang.String birthday) {
		this.birthday = birthday;
	}

	public java.lang.String getLstHakwi() {
		return lstHakwi;
	}

	public void setLstHakwi(java.lang.String lstHakwi) {
		this.lstHakwi = lstHakwi;
	}

	public java.lang.String getJungong() {
		return jungong;
	}

	public void setJungong(java.lang.String jungong) {
		this.jungong = jungong;
	}

	public java.lang.String getJungongPart() {
		return jungongPart;
	}

	public void setJungongPart(java.lang.String jungongPart) {
		this.jungongPart = jungongPart;
	}

	public java.lang.String getCareer() {
		return career;
	}

	public void setCareer(java.lang.String career) {
		this.career = career;
	}

	public java.lang.String getRegister() {
		return register;
	}

	public void setRegister(java.lang.String register) {
		this.register = register;
	}

	public String getRegisterFlag() {
		return registerFlag;
	}

	public void setRegisterFlag(String registerFlag) {
		this.registerFlag = registerFlag;
	}

	public java.lang.String getLoginId() {
        return this.loginId;
    }
    
    public void setLoginId(java.lang.String loginId) {
        this.loginId = loginId;
    }
    
    public java.math.BigDecimal getReqNo() {
        return this.reqNo;
    }
    
    public void setReqNo(java.math.BigDecimal reqNo) {
        this.reqNo = reqNo;
    }
    
    public java.math.BigDecimal getSalesAmt() {
        return this.salesAmt;
    }
    
    public void setSalesAmt(java.math.BigDecimal salesAmt) {
        this.salesAmt = salesAmt;
    }
    
    public java.lang.String getKeyCustomer() {
        return this.keyCustomer;
    }
    
    public void setKeyCustomer(java.lang.String keyCustomer) {
        this.keyCustomer = keyCustomer;
    }
    
    public java.lang.String getEmploy() {
        return this.employ;
    }
    
    public void setEmploy(java.lang.String employ) {
        this.employ = employ;
    }
    
    public java.lang.String getAcceptYn() {
        return this.acceptYn;
    }
    
    public void setAcceptYn(java.lang.String acceptYn) {
        this.acceptYn = acceptYn;
    }
    
    public java.lang.String getAcceptCont() {
        return this.acceptCont;
    }
    
    public void setAcceptCont(java.lang.String acceptCont) {
        this.acceptCont = acceptCont;
    }
    
    public java.sql.Date getReqDt() {
        return this.reqDt;
    }
    
    public void setReqDt(java.sql.Date reqDt) {
        this.reqDt = reqDt;
    }
    
    public java.lang.String getRequester() {
        return this.requester;
    }
    
    public void setRequester(java.lang.String requester) {
        this.requester = requester;
    }
    
}
