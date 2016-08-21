package com.certus.dao;

import com.certus.dao.SampleRemarkRel;

public interface SampleRemarkRelMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(SampleRemarkRel record);

    int insertSelective(SampleRemarkRel record);

    SampleRemarkRel selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(SampleRemarkRel record);

    int updateByPrimaryKey(SampleRemarkRel record);
}