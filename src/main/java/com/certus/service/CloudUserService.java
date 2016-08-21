package com.certus.service;

import com.certus.vo.CloudUser;

/**
 * 帐号管理类
 * @author xuhj
 *
 */
public interface CloudUserService {
	public CloudUser getCloudUser(String username);
}
