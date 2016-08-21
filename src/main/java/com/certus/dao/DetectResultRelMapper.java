package com.certus.dao;

import com.certus.dao.DetectResultRel;

public interface DetectResultRelMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(DetectResultRel record);

    int insertSelective(DetectResultRel record);

    DetectResultRel selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(DetectResultRel record);

    int updateByPrimaryKey(DetectResultRel record);
}