package com.myself.util;

import java.io.Serializable;


public class PageCondition implements Serializable{

	private static final long serialVersionUID = 1374399911004594172L;
	
	/** 分页大小*/
	private int size=10;

	/*** 页数 */
	private int pageNow = 1;

	/** 开始记录*/
	private int start = 0;
	
	/** 关键词*/
	private String keyWord="";	
	
	/**是否是分页查询 1.是*/
	private int isPage;
	
	/** 排序字段*/
	private String sortField;
	
	/** 排序方式*/
	private String sortOrder;
	
	public void init(){
	    this.isPage = 1;
		if(this.pageNow>=1){
			this.start = (this.pageNow-1)*size;
		}
	}

	public int getSize() {
		return size;
	}

	public void setSize(int size) {
		this.size = size;
	}

	public int getPageNow() {
		return pageNow;
	}

	public void setPageNow(int pageNow) {
		this.pageNow = pageNow;
	}

	public int getStart() {
		return start;
	}

	public void setStart(int start) {
		this.start = start;
	}

	public String getKeyWord() {
		return keyWord;
	}

	public void setKeyWord(String keyWord) {
		this.keyWord = keyWord;
	}

	public int getIsPage() {
		return isPage;
	}

	public void setIsPage(int isPage) {
		this.isPage = isPage;
	}

	public String getSortField() {
		return sortField;
	}

	public void setSortField(String sortField) {
		this.sortField = sortField;
	}

	public String getSortOrder() {
		return sortOrder;
	}

	public void setSortOrder(String sortOrder) {
		this.sortOrder = sortOrder;
	}

	
}
