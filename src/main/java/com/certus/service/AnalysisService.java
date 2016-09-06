package com.certus.service;

import java.util.List;
import java.util.Map;

import com.certus.bo.SampleBo;
import com.certus.utils.PaginationModel;

public interface AnalysisService {
	
    public PaginationModel getSamplesList(SampleBo sampleBo);
    
    public PaginationModel getSamplesDetailById(Integer sampleId);
    /**
     * 根据主机名称  模糊查询
     * @param sampleBo
     * @return
     */
   // public PaginationModel getHost(SampleBo sampleBo);
    
}
