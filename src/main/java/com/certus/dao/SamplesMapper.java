package com.certus.dao;

import java.util.List;
import java.util.Map;

import com.certus.bo.SampleBo;


public interface SamplesMapper extends BaseDao{
    int deleteByPrimaryKey(Integer id);

    int insert(Samples record);

    int insertSelective(Samples record);

    Samples selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Samples record);

    int updateByPrimaryKey(Samples record);
    
    List<Map<String,Object>> querySamplesList(SampleBo sampleBo);
    
    int countSamplesList(SampleBo sampleBo);

	List<Map<String, Object>> getSamplesDetailById(Integer sampleId);
	
	Samples getSampleByCode(String code);
}