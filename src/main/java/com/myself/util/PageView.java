package com.myself.util;

import java.io.Serializable;

public class PageView implements Serializable{
	private static final long serialVersionUID = -9198461526712948607L;
	/**返回码：01 成功  00 失败*/
	private String code = "01";
	/**消息*/
	private String msg = "success";
	/**代理类*/
	private String target;
	/**结果类型：1.普通JSON 2.列表  3.分页数据*/
	private String dtype = "1";
	/**实体类*/
	private Object resp;
	/**记录数*/
	private long total;
	
	/*** 总页数 */
	private long totalPages;
	
	private int size;

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public String getTarget() {
		return target;
	}

	public void setTarget(String target) {
		this.target = target;
	}

	public String getDtype() {
		return dtype;
	}

	public void setDtype(String dtype) {
		this.dtype = dtype;
	}

	public Object getResp() {
		return resp;
	}

	public void setResp(Object resp) {
		this.resp = resp;
	}

	public long getTotal() {
		return total;
	}
	
	public int getSize()
    {
        return size;
    }

    public void setSize(int size)
    {
        this.size = size;
    }

    public void setTotal(long total) {
		this.total = total;
		this.size = 10;
		this.totalPages=this.total % 10 == 0 ? this.total
				/ 10 : this.total / 10 + 1;
	}
	public void setTotal(long total,int sise) {
		this.total = total;
		this.size = sise;
		this.totalPages=this.total % sise == 0 ? this.total
				/ sise : this.total / sise + 1;
	}
	public long getTotalPages() {
		return totalPages;
	}

	public void setTotalPages(long totalPages) {
		this.totalPages = totalPages;
	}



}
