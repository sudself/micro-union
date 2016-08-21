package com.certus.vo;

public class ResultModel<T> {
	/**
	 * @Fields result : 返回结果
	 */
	protected int result;
	/**
	 * @Fields msg : 返回信息
	 */
	protected String msg;
	/**
	 * @Fields totalPageNum : 总页数
	 */
	protected int totalPageNum;
	/**
	 * @Fields totalSize : 总记录数
	 */
	private int totalSize;
	/**
	 * @Fields pageSize : 每页记录数
	 */
	private int pageSize;
	/**
	 * @Fields currentPageNum : 当前页数
	 */
	protected int currentPageNum;
	protected T data;

	/**
	 * 行编号开始序列
	 */
	private int startRowNo;

	public int exist = -1000;
	public int email_error = -1001;

	public int getStartRowNo() {
		return startRowNo;
	}

	public void setStartRowNo(int startRowNo) {
		this.startRowNo = startRowNo;
	}

	public ResultModel(T data) {
		this.result = ResultCode.success.number;
		this.data = data;
	}

	public ResultModel(int result, String msg) {
		this.result = result;
		this.msg = msg;
	}

	public ResultModel(int result, T data) {
		this.result = result;
		this.data = data;
	}

	public ResultModel(int result, String msg, T data) {
		this.result = result;
		this.msg = msg;
		this.data = data;
	}

	public int getResult() {
		return result;
	}

	public void setResult(int result) {
		this.result = result;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public T getData() {
		return data;
	}

	public void setData(T data) {
		this.data = data;
	}

	public int getTotalPageNum() {
		return totalPageNum;
	}

	public void setTotalPageNum(int totalPageNum) {
		this.totalPageNum = totalPageNum;
	}

	public int getCurrentPageNum() {
		return currentPageNum;
	}

	public void setCurrentPageNum(int currentPageNum) {
		this.currentPageNum = currentPageNum;
	}

	public enum ResultCode {
		LinkControlError(403), fail(-1), success(0);
		private final int number;

		ResultCode(int number) {
			this.number = number;
		}

		public int number() {
			return number;
		}

		@Override
		public String toString() {
			return String.valueOf(number);
		}
	}

	public int getTotalSize() {
		return totalSize;
	}

	public void setTotalSize(int totalSize) {
		this.totalSize = totalSize;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
}
