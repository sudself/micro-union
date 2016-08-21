package com.certus.dao;

import com.certus.dao.UserLogs;

public interface UserLogsMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(UserLogs record);

    int insertSelective(UserLogs record);

    UserLogs selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(UserLogs record);

    int updateByPrimaryKey(UserLogs record);
}