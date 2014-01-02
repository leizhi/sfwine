package com.mooo.mycoz.framework.component;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.mooo.mycoz.framework.util.ParamUtil;

public class Page {

	private static Log log = LogFactory.getLog(Page.class);
	
	private Integer totalRows;
	private Integer pageSize;
	private Integer currentPage;
	private Integer totalPages;
	private Integer offset;

	private String forward;
	
	public Page() {
		totalRows = 0;
		pageSize = 24;
		currentPage = 0;
		totalPages = 0;
		offset = 1;
	}

	public Integer getTotalRows() {
		return totalRows;
	}
	public void setTotalRows(Integer totalRows) {
		this.totalRows = totalRows;
	}
	public Integer getPageSize() {
		return pageSize;
	}
	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}
	public Integer getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(Integer currentPage) {
		this.currentPage = currentPage;
	}
	public Integer getTotalPages() {
		return totalPages;
	}
	public void setTotalPages(Integer totalPages) {
		this.totalPages = totalPages;
	}
	
	public Integer getOffset() {
		return offset;
	}

	public void setOffset(Integer offset) {
		this.offset = offset;
	}

	public String getForward() {
		return forward;
	}

	public void setForward(String forward) {
		this.forward = forward;
	}

	public void buildComponent(HttpServletRequest request,Integer totalRows) {
		ParamUtil.bindData(request, this, "page");

		// handling pagination
		if(totalRows < 1){
			return;
		}
		
		this.totalRows = totalRows;
		
		totalPages = totalRows / pageSize;

		if ((totalRows % pageSize) > 0) {
			totalPages++;
		}

		if (!(currentPage > 0))
			currentPage = 1;
		if (!(currentPage < totalPages))
			currentPage = totalPages;

		offset = (currentPage - 1) * pageSize;

		// 获取当前执行的方法，首页，前一页，后一页，尾页.
		if (log.isDebugEnabled()) log.debug("forward=>"+forward);
		if (forward != null) {
			if (forward.equals("<<")) {
				first();
			} else if (forward.equals("<")) {
				previous();
			} else if (forward.equals(">")) {
				next();
			} else if (forward.equals(">>")) {
				last();
			} else if (forward.equals("->")) {
				jump();
			}
		}
		
		request.setAttribute("page", this);

		// end if
	}
	
	public void first() {
		currentPage = 1;
		offset = 0;
	}

	public void previous() {
		if (currentPage == 1) {
			return;
		}
		currentPage--;
		offset = (currentPage - 1) * pageSize;
	}

	public void next() {

		if (currentPage < totalPages) {
			currentPage++;
		}
		offset = (currentPage - 1) * pageSize;
		
		if (log.isDebugEnabled()) log.debug("currentPage=>"+currentPage);
		if (log.isDebugEnabled()) log.debug("totalPages=>"+totalPages);
		if (log.isDebugEnabled()) log.debug("pageSize=>"+pageSize);
		if (log.isDebugEnabled()) log.debug("offset=>"+offset);

	}

	public void last() {
		if (log.isDebugEnabled()) log.debug(currentPage);
		if (log.isDebugEnabled()) log.debug(totalPages);
		currentPage = totalPages;
		offset = (currentPage - 1) * pageSize;
	}

	public void jump() {
		if (currentPage < totalPages + 1 && currentPage > 0)
			offset = (currentPage - 1) * pageSize;
	}

	public List<Object> getRecords(List<Object> results) {
		List<Object> records = new ArrayList<Object>();
		for(int i=getOffset();i<getPageSize()+getOffset();i++){
			if(i<results.size())
				records.add(results.get(i));
		}
		return records;
	}
}
