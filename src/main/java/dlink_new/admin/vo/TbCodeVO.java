package dlink_new.admin.vo;

/**
 * @Class Name : TbCodeVO.java
 * @Description : TbCode VO class
 * @Modification Information
 *
 * @author 김현재
 * @since 2023-01-18
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */
public class TbCodeVO extends TbCodeDefaultVO{
    private static final long serialVersionUID = 1L;
    
    /** CODE */
    private java.lang.String code;
    
    /** GB_CD */
    private java.lang.String gbCd;
    
    /** CODE_NM */
    private java.lang.String codeNm;
    
    /** USE_YN */
    private java.lang.String useYn;
    
    /** REG_DT */
    private java.util.Date regDt;
    
    /** REG_ID */
    private java.lang.String regId;
    
    /** UPD_DT */
    private java.util.Date updDt;
    
    /** UPD_ID */
    private java.lang.String updId;
    
    private TbCodeGbVO codeGbVO;
    
    public java.lang.String getCode() {
        return this.code;
    }
    
    public void setCode(java.lang.String code) {
        this.code = code;
    }
    
    public java.lang.String getGbCd() {
        return this.gbCd;
    }
    
    public void setGbCd(java.lang.String gbCd) {
        this.gbCd = gbCd;
    }
    
    public java.lang.String getCodeNm() {
        return this.codeNm;
    }
    
    public void setCodeNm(java.lang.String codeNm) {
        this.codeNm = codeNm;
    }
    
    public java.lang.String getUseYn() {
        return this.useYn;
    }
    
    public void setUseYn(java.lang.String useYn) {
        this.useYn = useYn;
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

	public TbCodeGbVO getCodeGbVO() {
		return codeGbVO;
	}

	public void setCodeGbVO(TbCodeGbVO codeGbVO) {
		this.codeGbVO = codeGbVO;
	}
    
}
