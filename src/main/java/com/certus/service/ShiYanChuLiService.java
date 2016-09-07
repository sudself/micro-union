package com.certus.service;

import java.util.List;

import com.certus.dao.DetectType;

public interface ShiYanChuLiService {

    public List<DetectType> getDetectType(String sampleTypeId,String detectMothod,String pre);
    
}
