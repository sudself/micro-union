package com.certus.dao;

import java.util.List;

import com.certus.dao.DetectResult;

public interface DetectResultMapper extends BaseDao{
    int deleteByPrimaryKey(Integer id);

    int insert(DetectResult record);

    int insertSelective(DetectResult record);

    DetectResult selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(DetectResult record);

    int updateByPrimaryKey(DetectResult record);
    
    List<DetectResult> getTypeByDetectType(int detectTypeId );
    
}