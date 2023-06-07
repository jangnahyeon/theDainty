package dlink_new.admin.vo;

/**
 * @Class Name : TbBrdCmtVO.java
 * @Description : TbBrdCmt VO class
 * @Modification Information
 *
 * @author 김현재
 * @since 2023-02-02
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */
public class TbBrdCmtVO extends TbBrdCmtDefaultVO{
    private static final long serialVersionUID = 1L;
    
    /** CMT_SEQ */
    private int cmtSeq;
    
    /** BRD_SEQ */
    private int brdSeq;
    
    /** MEM_SEQ */
    private int memSeq;
    
    /** MEM_ID */
    private java.lang.String memId;
    
    /** CONT */
    private java.lang.String cont;
    
    /** REG_DT */
    private java.util.Date regDt;
    
    /** REG_ID */
    private java.lang.String regId;
    
    /** UPD_DT */
    private java.util.Date updDt;
    
    /** UPD_ID */
    private java.lang.String updId;
    
    private TbMemVO memVO;
    private String contUpdate;
    
    public int getCmtSeq() {
        return this.cmtSeq;
    }
    
    public void setCmtSeq(int cmtSeq) {
        this.cmtSeq = cmtSeq;
    }
    
    public int getBrdSeq() {
        return this.brdSeq;
    }
    
    public void setBrdSeq(int brdSeq) {
        this.brdSeq = brdSeq;
    }
    
    public int getMemSeq() {
        return this.memSeq;
    }
    
    public void setMemSeq(int memSeq) {
        this.memSeq = memSeq;
    }
    
    public java.lang.String getMemId() {
        return this.memId;
    }
    
    public void setMemId(java.lang.String memId) {
        this.memId = memId;
    }
    
    public java.lang.String getCont() {
        return this.cont;
    }
    
    public void setCont(java.lang.String cont) {
        this.cont = cont;
    }
    
    public java.util.Date getRegDt() {
        return this.regDt;
    }
    
    public void setRegDt(java.util.Date regDt) {
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

	public TbMemVO getMemVO() {
		return memVO;
	}

	public void setMemVO(TbMemVO memVO) {
		this.memVO = memVO;
	}

	public String getContUpdate() {
		return contUpdate;
	}

	public void setContUpdate(String contUpdate) {
		this.contUpdate = contUpdate;
	}
    
}
