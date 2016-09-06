package com.certus.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
public interface SampleRemarkRelMapper extends BaseDao{
    int deleteByPrimaryKey(Integer id);

    int insert(SampleRemarkRel record);

    int insertSelective(SampleRemarkRel record);

    SampleRemarkRel selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(SampleRemarkRel record);

    int updateByPrimaryKey(SampleRemarkRel record);
    
    void addSampleRemarkRelBatch(@Param("sampleId") Integer sampleId,@Param("list") List<Integer> list);
}