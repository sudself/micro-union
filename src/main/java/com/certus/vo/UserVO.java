package com.certus.vo;

import java.util.Date;
import com.certus.helper.Constants;

public class UserVO {
	
	private Long id;

	/** 插入时间 */
	private Date insertTime;

	/** 更新时间 */
	private Date updateTime;
	
	/** 回收标志位 */
	private short recycleSign = Constants.RECYCLE_SIGN_NORMAL;

	/** 用户名 */
	private String name;

	/** 密码 */
	private String password;

	/** 电子邮箱 */
	private String email;
	
	private String telephone;
	private String tenant_name;

	/** 描述 */
	private String description;

	/** 提供者 */
	private String provider;

	/** 用户状态(0:未处理;1:审核成功;2:审核失败) */
	private short status;
	
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Date getInsertTime() {
		return insertTime;
	}

	public void setInsertTime(Date insertTime) {
		this.insertTime = insertTime;
	}

	public Date getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}

	public short getRecycleSign() {
		return recycleSign;
	}

	public void setRecycleSign(short recycleSign) {
		this.recycleSign = recycleSign;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getTelephone() {
		return telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}

	public String getTenant_name() {
		return tenant_name;
	}

	public void setTenant_name(String tenant_name) {
		this.tenant_name = tenant_name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getProvider() {
		return provider;
	}

	public void setProvider(String provider) {
		this.provider = provider;
	}

	public short getStatus() {
		return status;
	}

	public void setStatus(short status) {
		this.status = status;
	}

}