package com.certus.service;

import java.util.List;

import com.certus.exception.BusinessException;
import com.certus.vo.UserVO;

/**
 * 用户管理类
 * 
 * @author zhoudr
 * 
 */
public interface UserService {

	/**
	 * 根据Id查询用户信息
	 * 
	 * @param id
	 * @return
	 */
	public UserVO getUserById(Long id);

	/**
	 * 保存用户
	 * 
	 * @param vo
	 * @return
	 * @throws BusinessException
	 */
	public Long saveUser(UserVO user) throws BusinessException;
	

	/**
	 * 根据条件查询用户
	 * 
	 * @param dto
	 * @return
	 * @throws BusinessException
	 */
	public List<UserVO> findUsers(UserVO vo);

}
