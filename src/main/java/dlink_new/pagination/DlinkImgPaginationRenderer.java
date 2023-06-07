package dlink_new.pagination;

import javax.servlet.ServletContext;

import org.springframework.web.context.ServletContextAware;

public class DlinkImgPaginationRenderer extends DlinkAbstractPaginationRenderer implements ServletContextAware {

	private ServletContext servletContext;

	public DlinkImgPaginationRenderer() {
		// no-op
	}

	/**
	* PaginationRenderer
	*
	* @see 개발프레임웍크 실행환경 개발팀
	*/
	public void initVariables() {

		firstPageLabel = "<a href=\"#\" onclick=\"{0}({1}); return false;\" class=\"direction first\">" + "처음 페이지로" + "</a>";
		previousPageLabel = "<a href=\"#\" onclick=\"{0}({1}); return false;\" class=\"direction prev\">" + "이전 페이지로" + "</a>";
		currentPageLabel = "<strong>{0}</strong>";
		otherPageLabel = "<a href=\"#\" onclick=\"{0}({1}); return false;\">{2}</a>";
		nextPageLabel = "<a href=\"#\" onclick=\"{0}({1}); return false;\" class=\"direction next\">" + "다음 페이지로" + "</a>";
		lastPageLabel = "<a href=\"#\" onclick=\"{0}({1}); return false;\" class=\"direction last\">" + "마지막 페이지로" + "</a>";
		
		firstPageLabelNoLink = "<a class=\"direction first\">" + "처음 페이지로" + "</a>";
		previousPageLabelNoLink = "<a class=\"direction prev\">" + "이전 페이지로" + "</a>";		
		nextPageLabelNoLink = "<a class=\"direction next\">" + "다음 페이지로" + "</a>";
		lastPageLabelNoLink = "<a class=\"direction last\">" + "마지막 페이지로" + "</a>";
	}

	@Override
	public void setServletContext(ServletContext servletContext) {
		this.servletContext = servletContext;
		initVariables();
	}
}