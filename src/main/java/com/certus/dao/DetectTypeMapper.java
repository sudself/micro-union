package com.certus.dao;

import com.certus.dao.DetectType;

public interface DetectTypeMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(DetectType record);

    int insertSelective(DetectType record);

    DetectType selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(DetectType record);

    int updateByPrimaryKey(DetectType record);
}