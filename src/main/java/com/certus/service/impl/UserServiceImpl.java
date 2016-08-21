package com.certus.service.impl;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.certus.dao.UserDao;
import com.certus.exception.BusinessException;
import com.certus.helper.BeanConstants;
import com.certus.helper.Util;
import com.certus.service.UserService;
import com.certus.vo.UserVO;

/**
 * 用户管理实现类
 * 
 * @author zhoudr
 * 
 */
@Service(value = BeanConstants.USER_SERVICE)
public class UserServiceImpl implements UserService {

	/** 用户Dao */
	@Resource(name = BeanConstants.USER_DAO)
	private UserDao userDao;
	
	
	
	

	public UserVO getUserById(Long id) {
		UserVO user = userDao.getUserById(id);
		return user;
	}

	public Long saveUser(UserVO user) throws BusinessException {
		// 用户名是否已经注册
		List<UserVO> userList = userDao.findUsers(user);
		if (!Util.isNull(userList) && userList.size() >= 1) {
			throw new BusinessException("businessError", "name has been registered!");
		}
		Date systemDate = new Date();
		user.setInsertTime(systemDate);
		user.setUpdateTime(systemDate);
		userDao.save(user);
		return user.getId();
	}
	

	public List<UserVO> findUsers(UserVO user) {
		List<UserVO> userList = userDao.findUsers(user);
		return userList;
	}


}
