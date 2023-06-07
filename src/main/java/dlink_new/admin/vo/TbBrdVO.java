package dlink_new.admin.vo;

import java.util.List;

/**
 * @Class Name : TbBrdVO.java
 * @Description : TbBrd VO class
 * @Modification Information
 *
 * @author 김현재
 * @since 2023-01-25
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */
public class TbBrdVO extends TbBrdDefaultVO{
    private static final long serialVersionUID = 1L;
    
    /** BRD_SEQ */
    private int brdSeq;
    
    /** MENU_SEQ */
    private int menuSeq;
    
    /** MEM_SEQ */
    private int memSeq;
    
    /** MEM_ID */
    private java.lang.String memId;
    
    /** TITLE */
    private java.lang.String title;
    
    /** CONT */
    private java.lang.String cont;
    
    private String srcNm;
    
    private int readCnt;
    
    /** REG_DT */
    private String regDt;
    
    /** REG_ID */
    private java.lang.String regId;
    
    /** UPD_DT */
    private java.util.Date updDt;
    
    /** UPD_ID */
    private java.lang.String updId;
    
    private TbMemVO memVO;
    
    private List<TbBrdFileVO> brdFileVOList;
    
    private int brdCmtCnt;
    
    private int brdFileCnt;
    
    private int fileSeq;
    
    private int cmt;
    
    private String link;

	public int getBrdSeq() {
        return this.brdSeq;
    }
    
    public void setBrdSeq(int brdSeq) {
        this.brdSeq = brdSeq;
    }
    
    public int getMenuSeq() {
        return this.menuSeq;
    }
    
    public void setMenuSeq(int menuSeq) {
        this.menuSeq = menuSeq;
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
    
    public String getSrcNm() {
		return srcNm;
	}

	public void setSrcNm(String srcNm) {
		this.srcNm = srcNm;
	}

	public int getReadCnt() {
		return readCnt;
	}

	public void setReadCnt(int readCnt) {
		this.readCnt = readCnt;
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

	public TbMemVO getMemVO() {
		return memVO;
	}

	public void setMemVO(TbMemVO memVO) {
		this.memVO = memVO;
	}

	public List<TbBrdFileVO> getBrdFileVOList() {
		return brdFileVOList;
	}

	public void setBrdFileVOList(List<TbBrdFileVO> brdFileVOList) {
		this.brdFileVOList = brdFileVOList;
	}

	public int getBrdCmtCnt() {
		return brdCmtCnt;
	}

	public void setBrdCmtCnt(int brdCmtCnt) {
		this.brdCmtCnt = brdCmtCnt;
	}

	public int getBrdFileCnt() {
		return brdFileCnt;
	}

	public void setBrdFileCnt(int brdFileCnt) {
		this.brdFileCnt = brdFileCnt;
	}

	public int getFileSeq() {
		return fileSeq;
	}

	public void setFileSeq(int fileSeq) {
		this.fileSeq = fileSeq;
	}
    
    public int getCmt() {
		return cmt;
	}

	public void setCmt(int cmt) {
		this.cmt = cmt;
	}

	public String getLink() {
		return link;
	}

	public void setLink(String link) {
		this.link = link;
	}
    
}
