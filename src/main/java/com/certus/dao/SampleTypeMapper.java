package com.certus.dao;

import com.certus.dao.SampleType;

public interface SampleTypeMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(SampleType record);

    int insertSelective(SampleType record);

    SampleType selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(SampleType record);

    int updateByPrimaryKey(SampleType record);
}