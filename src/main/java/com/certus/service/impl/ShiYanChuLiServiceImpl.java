package com.certus.service.impl;

import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.certus.dao.DetectType;
import com.certus.dao.DetectTypeMapper;
import com.certus.service.ShiYanChuLiService;

@Service(value="shiyanchuli")
public class ShiYanChuLiServiceImpl implements ShiYanChuLiService{
    
    private static final Logger log = Logger.getLogger(ShiYanChuLiServiceImpl.class);
    
    @Autowired
    private DetectTypeMapper detectTypeMapper;

    @Override
    public List<DetectType> getDetectType(String sampleTypeId,String detectMothod,String pre) {
        DetectType params = new DetectType();
        if(StringUtils.isNotBlank(sampleTypeId)){
            params.setSampleTypeId(Integer.valueOf(sampleTypeId));
        }
        params.setDetectMethod(detectMothod);
        params.setPrintPrefix(pre);
        
        List<DetectType> result = detectTypeMapper.getDetectTypeList(params);
        return result;
    }

}
