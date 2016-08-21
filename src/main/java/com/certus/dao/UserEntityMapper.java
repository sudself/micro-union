package com.certus.dao;

import java.util.List;

import com.certus.filter.UserSearchFilter;
import com.certus.vo.UserVO;

public interface UserEntityMapper extends BaseDao{
	public List<UserVO> findAll(UserSearchFilter filter);
	
	public List<UserVO> findByStatusAndName(UserSearchFilter filter);
	
	public UserVO findById(Long id);
}
