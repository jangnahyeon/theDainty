package dlink.admin.vo;

/**
 * @Class Name : TSpecComVO.java
 * @Description : TSpecCom VO class
 * @Modification Information
 *
 * @author 이효진	
 * @since 2022-04-18
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */
public class TSpecComVO extends SearchVO{
    private static final long serialVersionUID = 1L;
    
    /** REQ_NO */
    private java.math.BigDecimal reqNo;
    
    /** LOGIN_ID */
    private java.lang.String loginId;
    
    /** SPEC_NO */
    private int specNo;
    
    /** SALES_AMT */
    private java.math.BigDecimal salesAmt;
    
    /** KEY_CUSTOMER */
    private java.lang.String keyCustomer;
    
    /** EMPLOY */
    private java.lang.String employ;
    
    /** ACCEPT_YN */
    private java.lang.String acceptDt;
    
    /** ACCEPT_CONT */
    private java.lang.String accepter;
    
    private int seq;
    
    private String birthday;
    
    private String staffNm;
    
    private String position;
    
    private String lstHakwi;
      
    private String junGong;
    
    private String junGongPart;
    
    private String career;

    private String[] arr;
    
    /** ACCEPT_YN */
    private java.lang.String acceptYn;
    
    /** ACCEPT_CONT */
    private java.lang.String acceptCont;
    
    /** REQ_DT */
    private java.sql.Date reqDt;
    
    /** REQUESTER */
    private java.lang.String requester;
    
   
    /** t_mem_com 테이블 변수명 */
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
    
    /** REG_DT */
    private java.lang.String regDt;
    
    /** IMG_PATH 파일첨부하기 */
    private java.lang.String imgPath;
    private java.lang.String fileSeq;
    private java.lang.String[] multiFileSeq;
    
    /** REQ_PART */
    private java.lang.String reqPart;
    
    /** SPEC_YN */
    private java.lang.String specYn;
    
    /** 수정, 등록 화면 구분 */
    private String registerFlag;
    
    /** REGISTER */
    private java.lang.String register;
       
    /** FILE_KIND */
    private java.lang.String fileKind;
   
    private String fileNm;
    
    private String ptplPart;
     
    
    
	public String getFileNm() {
		return fileNm;
	}

	public void setFileNm(String fileNm) {
		this.fileNm = fileNm;
	}

	public java.lang.String getRequester() {
		return requester;
	}

	public void setRequester(java.lang.String requester) {
		this.requester = requester;
	}

	public java.sql.Date getReqDt() {
		return reqDt;
	}

	public void setReqDt(java.sql.Date reqDt) {
		this.reqDt = reqDt;
	}

	public java.lang.String getAcceptCont() {
		return acceptCont;
	}

	public void setAcceptCont(java.lang.String acceptCont) {
		this.acceptCont = acceptCont;
	}

	public java.lang.String getAcceptYn() {
		return acceptYn;
	}
	
	public void setAcceptYn(java.lang.String acceptYn) {
		this.acceptYn = acceptYn;
	}

	public java.math.BigDecimal getReqNo() {
		return reqNo;
	}

	public void setReqNo(java.math.BigDecimal reqNo) {
		this.reqNo = reqNo;
	}

	public String[] getArr() {
		return arr;
	}

	public void setArr(String[] arr) {
		this.arr = arr;
	}

	public java.lang.String getLoginId() {
        return this.loginId;
    }
    
    public void setLoginId(java.lang.String loginId) {
        this.loginId = loginId;
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

	public int getSpecNo() {
		return specNo;
	}

	public void setSpecNo(int specNo) {
		this.specNo = specNo;
	}

	public java.lang.String getAcceptDt() {
		return acceptDt;
	}

	public void setAcceptDt(java.lang.String acceptDt) {
		this.acceptDt = acceptDt;
	}

	public java.lang.String getAccepter() {
		return accepter;
	}

	public void setAccepter(java.lang.String accepter) {
		this.accepter = accepter;
	}

	

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

	public String getStaffNm() {
		return staffNm;
	}

	public void setStaffNm(String staffNm) {
		this.staffNm = staffNm;
	}

	public String getPosition() {
		return position;
	}

	public void setPosition(String position) {
		this.position = position;
	}

	public String getLstHakwi() {
		return lstHakwi;
	}

	public void setLstHakwi(String lstHakwi) {
		this.lstHakwi = lstHakwi;
	}

	public String getJunGong() {
		return junGong;
	}

	public void setJunGong(String junGong) {
		this.junGong = junGong;
	}

	public String getJunGongPart() {
		return junGongPart;
	}

	public void setJunGongPart(String junGongPart) {
		this.junGongPart = junGongPart;
	}

	public String getCareer() {
		return career;
	}

	public void setCareer(String career) {
		this.career = career;
	}

	public java.lang.String getComNm() {
		return comNm;
	}

	public void setComNm(java.lang.String comNm) {
		this.comNm = comNm;
	}

	public java.lang.String getComType() {
		return comType;
	}

	public void setComType(java.lang.String comType) {
		this.comType = comType;
	}

	public java.lang.String getCeoNm() {
		return ceoNm;
	}

	public void setCeoNm(java.lang.String ceoNm) {
		this.ceoNm = ceoNm;
	}

	public java.lang.String getSex() {
		return sex;
	}

	public void setSex(java.lang.String sex) {
		this.sex = sex;
	}

	public java.lang.String getComNo() {
		return comNo;
	}

	public void setComNo(java.lang.String comNo) {
		this.comNo = comNo;
	}

	public java.lang.String getComAddr() {
		return comAddr;
	}

	public void setComAddr(java.lang.String comAddr) {
		this.comAddr = comAddr;
	}

	public java.lang.String getComDtlAddr() {
		return comDtlAddr;
	}

	public void setComDtlAddr(java.lang.String comDtlAddr) {
		this.comDtlAddr = comDtlAddr;
	}

	public java.lang.String getComZip() {
		return comZip;
	}

	public void setComZip(java.lang.String comZip) {
		this.comZip = comZip;
	}

	public java.lang.String getComUrl() {
		return comUrl;
	}

	public void setComUrl(java.lang.String comUrl) {
		this.comUrl = comUrl;
	}

	public java.lang.String getCeoMobileNo() {
		return ceoMobileNo;
	}

	public void setCeoMobileNo(java.lang.String ceoMobileNo) {
		this.ceoMobileNo = ceoMobileNo;
	}

	public java.lang.String getDamdangNm() {
		return damdangNm;
	}

	public void setDamdangNm(java.lang.String damdangNm) {
		this.damdangNm = damdangNm;
	}

	public java.lang.String getDamdangDept() {
		return damdangDept;
	}

	public void setDamdangDept(java.lang.String damdangDept) {
		this.damdangDept = damdangDept;
	}

	public java.lang.String getDamdangPos() {
		return damdangPos;
	}

	public void setDamdangPos(java.lang.String damdangPos) {
		this.damdangPos = damdangPos;
	}

	public java.lang.String getDamdangMobileNo() {
		return damdangMobileNo;
	}

	public void setDamdangMobileNo(java.lang.String damdangMobileNo) {
		this.damdangMobileNo = damdangMobileNo;
	}

	public java.lang.String getDamdangEmail() {
		return damdangEmail;
	}

	public void setDamdangEmail(java.lang.String damdangEmail) {
		this.damdangEmail = damdangEmail;
	}

	public java.lang.String getRegDt() {
		return regDt;
	}

	public void setRegDt(java.lang.String regDt) {
		this.regDt = regDt;
	}

	public java.lang.String getImgPath() {
		return imgPath;
	}

	public void setImgPath(java.lang.String imgPath) {
		this.imgPath = imgPath;
	}

	public java.lang.String getFileSeq() {
		return fileSeq;
	}

	public void setFileSeq(java.lang.String fileSeq) {
		this.fileSeq = fileSeq;
	}

	public java.lang.String[] getMultiFileSeq() {
		return multiFileSeq;
	}

	public void setMultiFileSeq(java.lang.String[] multiFileSeq) {
		this.multiFileSeq = multiFileSeq;
	}

	public java.lang.String getReqPart() {
		return reqPart;
	}

	public void setReqPart(java.lang.String reqPart) {
		this.reqPart = reqPart;
	}

	public java.lang.String getSpecYn() {
		return specYn;
	}

	public void setSpecYn(java.lang.String specYn) {
		this.specYn = specYn;
	}

	public String getRegisterFlag() {
		return registerFlag;
	}

	public void setRegisterFlag(String registerFlag) {
		this.registerFlag = registerFlag;
	}

	public java.lang.String getRegister() {
		return register;
	}

	public void setRegister(java.lang.String register) {
		this.register = register;
	}

	public java.lang.String getFileKind() {
		return fileKind;
	}

	public void setFileKind(java.lang.String fileKind) {
		this.fileKind = fileKind;
	}

	public String getPtplPart() {
		return ptplPart;
	}

	public void setPtplPart(String ptplPart) {
		this.ptplPart = ptplPart;
	}
    
    
}