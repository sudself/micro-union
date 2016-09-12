package com.certus.service;

import java.util.List;

import com.certus.dao.DetectType;
import com.certus.dao.Detects;
import com.certus.dao.JingJianType;
import com.certus.dao.Samples;

public interface ShiYanChuLiService {

    public List<DetectType> getDetectType(String sampleTypeId,String detectMothod,String pre);
    
    Samples getSampleByCode(String code);

	public boolean addDetect(Detects detect);
	
	public List<JingJianType> getJingJianType(String detectTypeId);
}
