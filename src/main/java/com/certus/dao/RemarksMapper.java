package com.certus.dao;

import java.util.List;

import com.certus.dao.Remarks;

public interface RemarksMapper extends BaseDao{
    int deleteByPrimaryKey(Integer id);

    int insert(Remarks record);

    int insertSelective(Remarks record);

    Remarks selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Remarks record);

    int updateByPrimaryKey(Remarks record);
    
    List<Remarks>  queryRmarksList(int sampleTypeId);
}