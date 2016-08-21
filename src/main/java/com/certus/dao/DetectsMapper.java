package com.certus.dao;

import com.certus.dao.Detects;

public interface DetectsMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Detects record);

    int insertSelective(Detects record);

    Detects selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Detects record);

    int updateByPrimaryKey(Detects record);
}