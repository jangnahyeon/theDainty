package dlink_new.common.vo;

import java.io.Serializable;
import org.apache.commons.lang3.builder.ToStringBuilder;

/**
 * @Class Name : SearchVo.java
 * @Description : Search VO class
 * @Modification Information
 *
 * @author ���깆갔
 * @since 2022-03-30
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */
public class SearchVO implements Serializable {

	private static final long serialVersionUID = 1L;
	
	/** 寃���議곌굔 */
    private String searchCondition = "";
    
    /** 寃���議곌굔 */
    private String searchCondition2 = "";
    
    /** 寃���議곌굔 */
    private String searchCondition3 = "";
    
    /** 寃���議곌굔 */
    private String searchCondition4 = "";
    
    /** 寃���議곌굔 */
    private String searchCondition5 = "";
    
    /** 寃���Keyword */
    private String searchKeyword = "";
    
    /** 寃���Keyword */
    private String searchKeyword2 = "";
    
    /** 寃���Keyword */
    private String searchKeyword3 = "";
    
    /** 寃����ъ�⑹�щ� */
    private String searchUseYn = "";
    
    /** ���ы���댁� */
    private int pageIndex = 1;
    
    /** ���댁�媛��� */
    private int pageUnit = 10;
    
    /** ���댁��ъ�댁� */
    private int pageSize = 10;

    /** firstIndex */
    private int firstIndex = 1;

    /** lastIndex */
    private int lastIndex = 1;

    /** recordCountPerPage */
    private int recordCountPerPage = 10;
    
    private String pagingYn = "";
    
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

}
