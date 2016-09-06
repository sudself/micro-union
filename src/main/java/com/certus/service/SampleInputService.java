package com.certus.service;

import java.util.List;

import com.certus.dao.Remarks;
import com.certus.dao.SampleType;
import com.certus.dao.Samples;

public interface SampleInputService {

	List<SampleType> querySamplesTypes();
	
	List<Remarks>  queryRmarksList(int sampleTypeId);
	
	boolean addSample(Samples sample,String remarkIds);
}
