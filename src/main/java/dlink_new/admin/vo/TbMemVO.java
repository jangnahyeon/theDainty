package dlink_new.admin.vo;

import java.math.BigDecimal;

/**
 * @Class Name : TbMemVO.java
 * @Description : TbMem VO class
 * @Modification Information
 *
 * @author 김현재
 * @since 2023-01-18
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */
public class TbMemVO extends TbMemDefaultVO{
    private static final long serialVersionUID = 1L;
    
    /** MEM_SEQ */
    private Integer memSeq;
    
    /** CODE */
    private java.lang.String code;
    
    /** MEM_ID */
    private java.lang.String memId;
    
    /** MEM_PW */
    private java.lang.String memPw;
    
    /** MEM_NM */
    private java.lang.String memNm;
    
    private String birth;
    
    private String jobGbCd;
    
    private String hp;
    
    private String email;
    
    private String addr;
    
    private String addrDtl;
    
    private String comAddr;
    
    private String comAddrDtl;
    
    private Integer comFileSeq;
    
    private Integer smBizFileSeq;
    
    private String smsYn;
    
    private String emailYn;
    
    private String outReason;
    
    private String leaveMsg;
    
    private String acceptYn;
    
    /** REG_DT */
    private String regDt;
    
    /** REG_ID */
    private java.lang.String regId;
    
    /** UPD_DT */
    private java.util.Date updDt;
    
    /** UPD_ID */
    private java.lang.String updId;
    
    private int rsvFileSeq;
    private String fileNm;
    private String rejectMsg;
    private String comNm;
    private String comNo;
    private String damdangNm;
    private String comType;
    
    public Integer getMemSeq() {
        return this.memSeq;
    }
    
    public void setMemSeq(Integer memSeq) {
        this.memSeq = memSeq;
    }
    
    public java.lang.String getCode() {
        return this.code;
    }
    
    public void setCode(java.lang.String code) {
        this.code = code;
    }
    
    public java.lang.String getMemId() {
        return this.memId;
    }
    
    public void setMemId(java.lang.String memId) {
        this.memId = memId;
    }
    
    public java.lang.String getMemPw() {
        return this.memPw;
    }
    
    public void setMemPw(java.lang.String memPw) {
        this.memPw = memPw;
    }
    
    public java.lang.String getMemNm() {
        return this.memNm;
    }
    
    public void setMemNm(java.lang.String memNm) {
        this.memNm = memNm;
    }
    
    public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public String getHp() {
		return hp;
	}

	public void setHp(String hp) {
		this.hp = hp;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getOutReason() {
		return outReason;
	}

	public void setOutReason(String outReason) {
		this.outReason = outReason;
	}

	public String getLeaveMsg() {
		return leaveMsg;
	}

	public void setLeaveMsg(String leaveMsg) {
		this.leaveMsg = leaveMsg;
	}

	public String getAcceptYn() {
		return acceptYn;
	}

	public void setAcceptYn(String acceptYn) {
		this.acceptYn = acceptYn;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getAddrDtl() {
		return addrDtl;
	}

	public void setAddrDtl(String addrDtl) {
		this.addrDtl = addrDtl;
	}

	public String getComAddr() {
		return comAddr;
	}

	public void setComAddr(String comAddr) {
		this.comAddr = comAddr;
	}

	public String getComAddrDtl() {
		return comAddrDtl;
	}

	public void setComAddrDtl(String comAddrDtl) {
		this.comAddrDtl = comAddrDtl;
	}

	public Integer getComFileSeq() {
		return comFileSeq;
	}

	public void setComFileSeq(Integer comFileSeq) {
		this.comFileSeq = comFileSeq;
	}

	public Integer getSmBizFileSeq() {
		return smBizFileSeq;
	}

	public void setSmBizFileSeq(Integer smBizFileSeq) {
		this.smBizFileSeq = smBizFileSeq;
	}

	public String getSmsYn() {
		return smsYn;
	}

	public void setSmsYn(String smsYn) {
		this.smsYn = smsYn;
	}

	public String getEmailYn() {
		return emailYn;
	}

	public void setEmailYn(String emailYn) {
		this.emailYn = emailYn;
	}

	public String getRegDt() {
        return this.regDt;
    }
    
    public void setRegDt(String regDt) {
        this.regDt = regDt;
    }
    
    public java.lang.String getRegId() {
        return this.regId;
    }
    
    public void setRegId(java.lang.String regId) {
        this.regId = regId;
    }
    
    public java.util.Date getUpdDt() {
        return this.updDt;
    }
    
    public void setUpdDt(java.util.Date updDt) {
        this.updDt = updDt;
    }
    
    public java.lang.String getUpdId() {
        return this.updId;
    }
    
    public void setUpdId(java.lang.String updId) {
        this.updId = updId;
    }

	public int getRsvFileSeq() {
		return rsvFileSeq;
	}

	public void setRsvFileSeq(int rsvFileSeq) {
		this.rsvFileSeq = rsvFileSeq;
	}

	public String getFileNm() {
		return fileNm;
	}

	public void setFileNm(String fileNm) {
		this.fileNm = fileNm;
	}

	public String getRejectMsg() {
		return rejectMsg;
	}

	public void setRejectMsg(String rejectMsg) {
		this.rejectMsg = rejectMsg;
	}

	public String getComNm() {
		return comNm;
	}

	public void setComNm(String comNm) {
		this.comNm = comNm;
	}

	public String getComNo() {
		return comNo;
	}

	public void setComNo(String comNo) {
		this.comNo = comNo;
	}

	public String getDamdangNm() {
		return damdangNm;
	}

	public void setDamdangNm(String damdangNm) {
		this.damdangNm = damdangNm;
	}

	public String getComType() {
		return comType;
	}

	public void setComType(String comType) {
		this.comType = comType;
	}

	public String getJobGbCd() {
		return jobGbCd;
	}

	public void setJobGbCd(String jobGbCd) {
		this.jobGbCd = jobGbCd;
	}
	
}
