package dlink.common.vo;

/**
 * @Class Name : TMemAccptVO.java
 * @Description : TMemAccpt VO class
 * @Modification Information
 *
 * @author 안성찬
 * @since 2022-04-07
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */
public class LoginVO extends SearchVO{
    private static final long serialVersionUID = 1L;
    
    /** LOGIN_ID */
    private java.lang.String loginId;
    
    /** EMAIL */
    private java.lang.String email;
    
    private java.lang.String name;

    private java.lang.String userType;
    private java.lang.String emailAddr;
    private java.lang.String userNm;
    private java.lang.String damdangEmail;
    private java.lang.String comNm;
	
	
	public java.lang.String getLoginId() {
		return loginId;
	}

	public void setLoginId(java.lang.String loginId) {
		this.loginId = loginId;
	}

	public java.lang.String getEmail() {
		return email;
	}

	public void setEmail(java.lang.String email) {
		this.email = email;
	}

	public java.lang.String getName() {
		return name;
	}

	public void setName(java.lang.String name) {
		this.name = name;
	}

	public java.lang.String getUserType() {
		return userType;
	}

	public void setUserType(java.lang.String userType) {
		this.userType = userType;
	}
	
	public java.lang.String getEmailAddr() {
		return emailAddr;
	}

	public void setEmailAddr(java.lang.String emailAddr) {
		this.emailAddr = emailAddr;
	}

	public java.lang.String getUserNm() {
		return userNm;
	}

	public void setUserNm(java.lang.String userNm) {
		this.userNm = userNm;
	}

	public java.lang.String getDamdangEmail() {
		return damdangEmail;
	}

	public void setDamdangEmail(java.lang.String damdangEmail) {
		this.damdangEmail = damdangEmail;
	}

	public java.lang.String getComNm() {
		return comNm;
	}

	public void setComNm(java.lang.String comNm) {
		this.comNm = comNm;
	}

    
    
}
