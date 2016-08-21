package com.certus.dao;

import com.certus.dao.Users;

public interface UsersMapper extends BaseDao{
    int deleteByPrimaryKey(Integer id);

    int insert(Users record);

    int insertSelective(Users record);

    Users selectByPrimaryKey(Integer id);
    
    Users getUserByName(String name);

    int updateByPrimaryKeySelective(Users record);

    int updateByPrimaryKey(Users record);
}