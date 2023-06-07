package dlink.admin.vo;

import java.io.Serializable;
import org.apache.commons.lang3.builder.ToStringBuilder;

/**
 * @Class Name : SearchVo.java
 * @Description : Search VO class
 * @Modification Information
 *
 * @author 안성찬
 * @since 2022-03-30
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */
public class SearchVO implements Serializable {

	private static final long serialVersionUID = 1L;
	
	/** 검색조건 */
    private String searchCondition = "";
    
    /** 검색조건 */
    private String searchCondition2 = "";
    
    /** 검색조건 */
    private String searchCondition3 = "";
    
    /** 검색조건 */
    private String searchCondition4 = "";
    
    /** 검색조건 */
    private String searchCondition5 = "";
    
    /** 검색Keyword */
    private String searchKeyword = "";
    
    /** 검색Keyword */
    private String searchKeyword2 = "";
    
    /** 검색Keyword */
    private String searchKeyword3 = "";
    
    /** 검색사용여부 */
    private String searchUseYn = "";
    
    /** 현재페이지 */
    private int pageIndex = 1;
    
    /** 페이지갯수 */
    private int pageUnit = 10;
    
    /** 페이지사이즈 */
    private int pageSize = 10;

    /** firstIndex */
    private int firstIndex = 1;

    /** lastIndex */
    private int lastIndex = 1;

    /** recordCountPerPage */
    private int recordCountPerPage = 10;
    
    private String pagingYn = "";
    
    private String userId;
    
    /** LOGIN_ID */
    private java.lang.String loginId;
    
    /** 업체검색에서 업체분야 구분 */
    private String ptplPart;
    
    /** 전문업체 구분 */
    private java.lang.String specYn;
    
    /** 사용자페이지 상담관리, 공지사항 menu_id parameter */
    private String menuId;
    
    /** 관리자,사용자 페이지 구분 */
    private String Register;
    
    /** 관심정보 전문회사, 포트폴리오, 이미지 구분값 */
    private String selGb;
    
    /** 기업대표이미지 변수 */
    private String imgPath;
    
    /** USER_TYPE */
    private java.lang.String userType;
    
    private String ptLoginId;
    
    
	public String getPtLoginId() {
		return ptLoginId;
	}

	public void setPtLoginId(String ptLoginId) {
		this.ptLoginId = ptLoginId;
	}

	public java.lang.String getUserType() {
		return userType;
	}

	public void setUserType(java.lang.String userType) {
		this.userType = userType;
	}

	public String getImgPath() {
		return imgPath;
	}

	public void setImgPath(String imgPath) {
		this.imgPath = imgPath;
	}

	public String getSelGb() {
		return selGb;
	}

	public void setSelGb(String selGb) {
		this.selGb = selGb;
	}

	public String getRegister() {
		return Register;
	}

	public void setRegister(String register) {
		Register = register;
	}

	public java.lang.String getLoginId() {
		return loginId;
	}

	public void setLoginId(java.lang.String loginId) {
		this.loginId = loginId;
	}

	public java.lang.String getSpecYn() {
		return specYn;
	}

	public void setSpecYn(java.lang.String specYn) {
		this.specYn = specYn;
	}

	public int getFirstIndex() {
		return firstIndex;
	}

	public void setFirstIndex(int firstIndex) {
		this.firstIndex = firstIndex;
	}

	public int getLastIndex() {
		return lastIndex;
	}

	public void setLastIndex(int lastIndex) {
		this.lastIndex = lastIndex;
	}

	public int getRecordCountPerPage() {
		return recordCountPerPage;
	}

	public void setRecordCountPerPage(int recordCountPerPage) {
		this.recordCountPerPage = recordCountPerPage;
	}

	public String getSearchCondition() {
        return searchCondition;
    }

    public void setSearchCondition(String searchCondition) {
        this.searchCondition = searchCondition;
    }

    public String getSearchKeyword() {
        return searchKeyword;
    }

    public void setSearchKeyword(String searchKeyword) {
        this.searchKeyword = searchKeyword;
    }

    public String getSearchUseYn() {
        return searchUseYn;
    }

    public void setSearchUseYn(String searchUseYn) {
        this.searchUseYn = searchUseYn;
    }

    public int getPageIndex() {
        return pageIndex;
    }

    public void setPageIndex(int pageIndex) {
        this.pageIndex = pageIndex;
    }

    public int getPageUnit() {
        return pageUnit;
    }

    public void setPageUnit(int pageUnit) {
        this.pageUnit = pageUnit;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public String toString() {
        return ToStringBuilder.reflectionToString(this);
    }

	public String getSearchCondition2() {
		return searchCondition2;
	}

	public void setSearchCondition2(String searchCondition2) {
		this.searchCondition2 = searchCondition2;
	}

	public String getSearchCondition3() {
		return searchCondition3;
	}

	public void setSearchCondition3(String searchCondition3) {
		this.searchCondition3 = searchCondition3;
	}

	public String getSearchCondition4() {
		return searchCondition4;
	}

	public void setSearchCondition4(String searchCondition4) {
		this.searchCondition4 = searchCondition4;
	}

	public String getSearchCondition5() {
		return searchCondition5;
	}

	public void setSearchCondition5(String searchCondition5) {
		this.searchCondition5 = searchCondition5;
	}

	public String getSearchKeyword2() {
		return searchKeyword2;
	}

	public void setSearchKeyword2(String searchKeyword2) {
		this.searchKeyword2 = searchKeyword2;
	}

	public String getSearchKeyword3() {
		return searchKeyword3;
	}

	public void setSearchKeyword3(String searchKeyword3) {
		this.searchKeyword3 = searchKeyword3;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public String getPagingYn() {
		return pagingYn;
	}

	public void setPagingYn(String pagingYn) {
		this.pagingYn = pagingYn;
	}

	public String getMenuId() {
		return menuId;
	}

	public void setMenuId(String menuId) {
		this.menuId = menuId;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getPtplPart() {
		return ptplPart;
	}

	public void setPtplPart(String ptplPart) {
		this.ptplPart = ptplPart;
	}
	
	
}
