package dlink.admin.vo;

/**
 * @Class Name : TMenuVO.java
 * @Description : TMenu VO class
 * @Modification Information
 *
 * @author 안성찬
 * @since 2022-03-31
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */
public class TMenuVO extends SearchVO{
    private static final long serialVersionUID = 1L;
    
    /** MEMU_ID */
    private java.lang.String menuId;
    
    /** MENU_NM */
    private java.lang.String menuNm;
    
    /** UP_MENU_ID */
    private java.lang.String upMenuId;
    
    /** MENU_PATH */
    private java.lang.String menuPath;
    
    /** ORD_SEQ */
    private int ordSeq;
    
    /** DIS_YN */
    private java.lang.String disYn;
    
    /** MENU_CONT */
    private java.lang.String menuCont;
    
    /** REG_DT */
    private java.sql.Date regDt;
    
    /** REGISTER */
    private java.lang.String register;
    
    private java.lang.String menuGubun;
    
    private java.lang.String menuDepth;
    
    public java.lang.String getMemuId() {
        return this.menuId;
    }
    
    public void setMemuId(java.lang.String menuId) {
        this.menuId = menuId;
    }
    
    public java.lang.String getMenuNm() {
        return this.menuNm;
    }
    
    public void setMenuNm(java.lang.String menuNm) {
        this.menuNm = menuNm;
    }
    
    public java.lang.String getUpMenuId() {
        return this.upMenuId;
    }
    
    public void setUpMenuId(java.lang.String upMenuId) {
        this.upMenuId = upMenuId;
    }
    
    public java.lang.String getMenuPath() {
        return this.menuPath;
    }
    
    public void setMenuPath(java.lang.String menuPath) {
        this.menuPath = menuPath;
    }
    
    public int getOrdSeq() {
        return this.ordSeq;
    }
    
    public void setOrdSeq(int ordSeq) {
        this.ordSeq = ordSeq;
    }
    
    public java.lang.String getDisYn() {
        return this.disYn;
    }
    
    public void setDisYn(java.lang.String disYn) {
        this.disYn = disYn;
    }
    
    public java.lang.String getMenuCont() {
        return this.menuCont;
    }
    
    public void setMenuCont(java.lang.String menuCont) {
        this.menuCont = menuCont;
    }
    
    public java.sql.Date getRegDt() {
        return this.regDt;
    }
    
    public void setRegDt(java.sql.Date regDt) {
        this.regDt = regDt;
    }
    
    public java.lang.String getRegister() {
        return this.register;
    }
    
    public void setRegister(java.lang.String register) {
        this.register = register;
    }

	public java.lang.String getMenuId() {
		return menuId;
	}

	public void setMenuId(java.lang.String menuId) {
		this.menuId = menuId;
	}

	public java.lang.String getMenuGubun() {
		return menuGubun;
	}

	public void setMenuGubun(java.lang.String menuGubun) {
		this.menuGubun = menuGubun;
	}

	public java.lang.String getMenuDepth() {
		return menuDepth;
	}

	public void setMenuDepth(java.lang.String menuDepth) {
		this.menuDepth = menuDepth;
	}
	
    
}
