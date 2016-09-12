package com.certus.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.certus.dao.JingJianType;

public interface JingJianTypeMapper extends BaseDao{
    int deleteByPrimaryKey(Integer id);

    int insert(JingJianType record);

    int insertSelective(JingJianType record);

    JingJianType selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(JingJianType record);

    int updateByPrimaryKey(JingJianType record);
    
    List<JingJianType> getTypeByDetectType(@Param("detectTypeId") String detectTypeId);
    
}