package com.certus.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.certus.dao.SampleType;
import com.certus.dao.SampleTypeMapper;
import com.certus.service.SampleInputService;

@Service(value="sampleInputService")
public class SampleInputServiceImpl implements SampleInputService{

	@Autowired
	private SampleTypeMapper sampleType;
	
	@Override
	public List<SampleType> querySamplesTypes() {
		return sampleType.querySamplesTypes();
	}

	
}
