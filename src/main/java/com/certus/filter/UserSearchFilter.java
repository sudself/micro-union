package com.certus.filter;

import com.certus.vo.BaseVo;

public class UserSearchFilter extends BaseVo {
	private static final long serialVersionUID = -7315513201387482895L;

	/** 用户名 */
	private String userName;

	/** 用户状态 */
	private Integer userStatus;

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public Integer getUserStatus() {
		return userStatus;
	}

	public void setUserStatus(Integer userStatus) {
		this.userStatus = userStatus;
	}

}
