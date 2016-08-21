package com.certus.dao;

import com.certus.dao.DetectResult;

public interface DetectResultMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(DetectResult record);

    int insertSelective(DetectResult record);

    DetectResult selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(DetectResult record);

    int updateByPrimaryKey(DetectResult record);
}