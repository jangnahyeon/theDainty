package dlink.admin.vo;

import java.math.BigDecimal;

import javax.management.loading.PrivateClassLoader;

/**
 * @Class Name : TCommutyVO.java
 * @Description : TCommuty VO class
 * @Modification Information
 *
 * @author 이효진
 * @since 2022-03-30
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */
public class TCommutyVO extends SearchVO{
    private static final long serialVersionUID = 1L;
    
    /** MENU_ID */
    private java.lang.String menuId;
    
    /** POST_NO */
    private int postNo;
    
    /** SEQ */
    private int seq;
    
    /** TITLE */
    private java.lang.String title;
    
    /** CONT */
    private java.lang.String cont;
    
    /** REGISTER */
    private java.lang.String register;
    
    /** REG_DT */
    private java.sql.Date regDt;
    
    /** OPEN_YN */
    private java.lang.String openYn;
    
    /** PWD */
    private java.lang.String pwd;
    
    /** 수정, 등록 화면 구분 */
    private String registerFlag;
    
    /** loginId */
    private String loginId;
    
    /** 등록 년도 */
    private String reg_dt_year;
   
    /** 등록 월 */
    private String reg_dt_month;
    
    /** 등록 일자 */
    private String reg_dt_day;
    
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
    
    public java.lang.String getCont() {
        return this.cont;
    }
    
    public void setCont(java.lang.String cont) {
        this.cont = cont;
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
    
    public java.lang.String getOpenYn() {
        return this.openYn;
    }
    
    public void setOpenYn(java.lang.String openYn) {
        this.openYn = openYn;
    }
    
    public java.lang.String getPwd() {
        return this.pwd;
    }
    
    public void setPwd(java.lang.String pwd) {
        this.pwd = pwd;
    }

	public String getRegisterFlag() {
		return registerFlag;
	}

	public void setRegisterFlag(String registerFlag) {
		this.registerFlag = registerFlag;
	}

	public String getLoginId() {
		return loginId;
	}

	public void setLoginId(String loginId) {
		this.loginId = loginId;
	}

	public String getReg_dt_year() {
		return reg_dt_year;
	}

	public void setReg_dt_year(String reg_dt_year) {
		this.reg_dt_year = reg_dt_year;
	}

	public String getReg_dt_month() {
		return reg_dt_month;
	}

	public void setReg_dt_month(String reg_dt_month) {
		this.reg_dt_month = reg_dt_month;
	}

	public String getReg_dt_day() {
		return reg_dt_day;
	}

	public void setReg_dt_day(String reg_dt_day) {
		this.reg_dt_day = reg_dt_day;
	}
	
	public String getFileNm() {
		return fileNm;
	}

	public void setFileNm(String fileNm) {
		this.fileNm = fileNm;
	}

	public String[] getFile_attch() {
		return file_attch;
	}

	public void setFile_attch(String[] file_attch) {
		this.file_attch = file_attch;
	}

	public String getFileSeq() {
		return fileSeq;
	}

	public void setFileSeq(String fileSeq) {
		this.fileSeq = fileSeq;
	}
	
	

}
