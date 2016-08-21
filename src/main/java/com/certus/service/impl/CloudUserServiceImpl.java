package com.certus.service.impl;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.certus.dao.CloudUserMapper;
import com.certus.service.CloudUserService;
import com.certus.vo.CloudUser;

@Service(value="cus")
public class CloudUserServiceImpl implements CloudUserService {
	private static final Logger log = Logger.getLogger(CloudUserServiceImpl.class);
	@Autowired
	CloudUserMapper cuMapper;
	
	@Override
	public CloudUser getCloudUser(String username) {
		CloudUser cu = null;
		try {
			cu = cuMapper.selectCloudUser(username);
		} catch (Exception e) {
			log.error(e);
		}
		return cu;
	}
}
