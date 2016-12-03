package com.certus.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

public interface DetectsMapper  extends BaseDao{
    int deleteByPrimaryKey(Integer id);

    int insert(Detects record);

    int insertSelective(Detects record);

    Detects selectByPrimaryKey(Integer id);
    
    Map<String,Object> queryDetectsByCode(@Param("code")String code,@Param("childCode")Integer childCode);

    int updateByPrimaryKeySelective(Detects record);

    int updateByPrimaryKey(Detects record);
    
    /**按实验层级的倒序排列,即第一条数据是最新的处理结果**/
    List<Detects> getDetectsByCode(@Param("code") String code);
}