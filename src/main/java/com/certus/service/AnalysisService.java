package com.certus.service;

import com.certus.bo.SampleBo;
import com.certus.utils.PaginationModel;

public interface AnalysisService {
	
    public PaginationModel getSamplesList(SampleBo sampleBo);
    /**
     * 根据主机名称  模糊查询
     * @param sampleBo
     * @return
     */
   // public PaginationModel getHost(SampleBo sampleBo);
    
}
