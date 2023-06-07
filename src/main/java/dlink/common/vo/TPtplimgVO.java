package dlink.common.vo;

/**
 * @Class Name : TPtplInfoVO.java
 * @Description : TPtplInfo VO class
 * @Modification Information
 *
 * @author 이효진
 * @since 2022-04-15
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */
public class TPtplimgVO extends SearchVO{
    private static final long serialVersionUID = 1L;
    
    /** LOGIN_ID */
    private java.lang.String loginId;
    
    /** PTPL_NO */
    private java.math.BigDecimal ptplNo;
    
    private java.lang.String fileSeq;
    
    private java.lang.String titleYn;
      
    /** REG_DT */
    private java.sql.Date regDt;
    
    /** REGISTER */
    private java.lang.String register;
    


    
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

	public java.lang.String getFileSeq() {
		return fileSeq;
	}

	public void setFileSeq(java.lang.String fileSeq) {
		this.fileSeq = fileSeq;
	}

	public java.lang.String getTitleYn() {
		return titleYn;
	}

	public void setTitleYn(java.lang.String titleYn) {
		this.titleYn = titleYn;
	}

	public java.sql.Date getRegDt() {
		return regDt;
	}

	public void setRegDt(java.sql.Date regDt) {
		this.regDt = regDt;
	}

	public java.lang.String getRegister() {
		return register;
	}

	public void setRegister(java.lang.String register) {
		this.register = register;
	}
    
  
}
