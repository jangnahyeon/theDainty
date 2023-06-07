package dlink_new.pagination;

import java.text.MessageFormat;

import org.egovframe.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import org.egovframe.rte.ptl.mvc.tags.ui.pagination.PaginationRenderer;

public abstract class DlinkAbstractPaginationRenderer implements PaginationRenderer {

	protected String firstPageLabel;
	protected String previousPageLabel;
	protected String currentPageLabel;
	protected String otherPageLabel;
	protected String nextPageLabel;
	protected String lastPageLabel;
	
	protected String firstPageLabelNoLink;
	protected String previousPageLabelNoLink;
	protected String nextPageLabelNoLink;
	protected String lastPageLabelNoLink;

	public String renderPagination(PaginationInfo paginationInfo, String jsFunction) {

		StringBuffer strBuff = new StringBuffer();

		int firstPageNo = paginationInfo.getFirstPageNo();
		int firstPageNoOnPageList = paginationInfo.getFirstPageNoOnPageList();
		int totalPageCount = paginationInfo.getTotalPageCount();
		int pageSize = paginationInfo.getPageSize();
		int lastPageNoOnPageList = paginationInfo.getLastPageNoOnPageList();
		int currentPageNo = paginationInfo.getCurrentPageNo();
		int lastPageNo = paginationInfo.getLastPageNo();

		if (totalPageCount > pageSize) {
			if (firstPageNoOnPageList > pageSize) {
				strBuff.append(MessageFormat.format(firstPageLabel, new Object[] { jsFunction, Integer.toString(firstPageNo) }));
				strBuff.append(MessageFormat.format(previousPageLabel, new Object[] { jsFunction, Integer.toString(firstPageNoOnPageList - 1) }));
			} else {
				strBuff.append(MessageFormat.format(firstPageLabel, new Object[] { jsFunction, Integer.toString(firstPageNo) }));
				strBuff.append(MessageFormat.format(previousPageLabel, new Object[] { jsFunction, Integer.toString(firstPageNo) }));
			}
		} else {
			// 화살표 페이지 버튼 기본 노출
			//strBuff.append(MessageFormat.format(firstPageLabelNoLink, new Object[] { }));
			//strBuff.append(MessageFormat.format(previousPageLabelNoLink, new Object[] { }));
			
			// 이미 첫번째 페이지는 이벤트 없음
			if(firstPageNoOnPageList == currentPageNo) {
				strBuff.append(MessageFormat.format(firstPageLabelNoLink, new Object[] { }));
			} else {			
				strBuff.append(MessageFormat.format(firstPageLabel, new Object[] { jsFunction, Integer.toString(firstPageNo) }));
			}
			
			strBuff.append(MessageFormat.format(previousPageLabelNoLink, new Object[] { }));
		}

		for (int i = firstPageNoOnPageList; i <= lastPageNoOnPageList; i++) {
			if (i == currentPageNo) {
				strBuff.append(MessageFormat.format(currentPageLabel, new Object[] { Integer.toString(i) }));
			} else {
				strBuff.append(MessageFormat.format(otherPageLabel, new Object[] { jsFunction, Integer.toString(i), Integer.toString(i) }));
			}
		}

		if (totalPageCount > pageSize) {
			if (lastPageNoOnPageList < totalPageCount) {
				strBuff.append(MessageFormat.format(nextPageLabel, new Object[] { jsFunction, Integer.toString(firstPageNoOnPageList + pageSize) }));
				strBuff.append(MessageFormat.format(lastPageLabel, new Object[] { jsFunction, Integer.toString(lastPageNo) }));
			} else {
				strBuff.append(MessageFormat.format(nextPageLabel, new Object[] { jsFunction, Integer.toString(lastPageNo) }));
				strBuff.append(MessageFormat.format(lastPageLabel, new Object[] { jsFunction, Integer.toString(lastPageNo) }));
			}
		} else {
			// 화살표 페이지 버튼 기본 노출
			//strBuff.append(MessageFormat.format(nextPageLabelNoLink, new Object[] { }));
			//strBuff.append(MessageFormat.format(lastPageLabelNoLink, new Object[] { }));
			
			strBuff.append(MessageFormat.format(nextPageLabelNoLink, new Object[] { }));
			
			// 이미 마지막 페이지는 이벤트 없음
			if(lastPageNoOnPageList == currentPageNo) {
				strBuff.append(MessageFormat.format(lastPageLabelNoLink, new Object[] { }));				
			} else {
				strBuff.append(MessageFormat.format(lastPageLabel, new Object[] { jsFunction, Integer.toString(lastPageNo) }));	
			}
		}
		
		
		return strBuff.toString();
	}
	

}
