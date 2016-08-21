package com.certus.dao;

import com.certus.vo.CloudUser;

public interface CloudUserMapper extends BaseDao{
    int deleteUser(String name);

    int insert(CloudUser record);

    CloudUser selectCloudUser(String name);

    int updateUserPasswd(CloudUser record);
}