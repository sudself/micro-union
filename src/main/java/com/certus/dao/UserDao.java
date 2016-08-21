package com.certus.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import com.certus.helper.BeanConstants;
import com.certus.vo.UserVO;

@Repository(value = BeanConstants.USER_DAO)
public interface UserDao extends BaseDao {

	/**
	 * 根据条件查询用户
	 * 
	 * @param user
	 *            用户信息
	 * @return
	 */
	public List<UserVO> findUsers(@Param("user") UserVO user);

	/**
	 * 根据Id查询用户信息
	 * 
	 * @param id
	 *            用户主键
	 * @return
	 */
	public UserVO getUserById(@Param("id") Long id);

	/**
	 * 保存用户信息
	 * 
	 * @param user
	 * @return
	 */
	public Long save(UserVO user);

}
