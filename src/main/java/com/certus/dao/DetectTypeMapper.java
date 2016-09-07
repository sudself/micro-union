package com.certus.dao;

import java.util.List;

public interface DetectTypeMapper extends BaseDao{
    int deleteByPrimaryKey(Integer id);

    int insert(DetectType record);

    int insertSelective(DetectType record);

    DetectType selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(DetectType record);

    int updateByPrimaryKey(DetectType record);
    
    List<DetectType> getDetectTypeList(DetectType detectType);
}