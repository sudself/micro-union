package com.certus.dao;

import com.certus.dao.Samples;

public interface SamplesMapper extends BaseDao{
    int deleteByPrimaryKey(Integer id);

    int insert(Samples record);

    int insertSelective(Samples record);

    Samples selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Samples record);

    int updateByPrimaryKey(Samples record);
}