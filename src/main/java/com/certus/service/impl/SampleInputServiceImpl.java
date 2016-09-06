package com.certus.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.certus.dao.Remarks;
import com.certus.dao.RemarksMapper;
import com.certus.dao.SampleRemarkRelMapper;
import com.certus.dao.SampleType;
import com.certus.dao.SampleTypeMapper;
import com.certus.dao.Samples;
import com.certus.dao.SamplesMapper;
import com.certus.service.SampleInputService;

@Service(value="sampleInputService")
public class SampleInputServiceImpl implements SampleInputService{

	@Autowired
	private SampleTypeMapper sampleType;
	
	@Autowired
	private RemarksMapper remarks;
	
	@Autowired
	private SamplesMapper samples;
	
	@Autowired
	private SampleRemarkRelMapper rel;
	
	@Override
	public List<SampleType> querySamplesTypes() {
		return sampleType.querySamplesTypes();
	}

	@Override
	public List<Remarks> queryRmarksList(int sampleTypeId) {
		return remarks.queryRmarksList(sampleTypeId);
	}

	@Override
	public boolean addSample(Samples sample,String remarkIds) {
		samples.insertSelective(sample);
		int sampleId=sample.getId();
		List<Integer> list=new ArrayList<Integer>();
		if(sampleId>0&&remarkIds!=null){
			String[] remarkIdList=remarkIds.split(",");
			for(String remarkId:remarkIdList){
				list.add(Integer.parseInt(remarkId));
			}
		}
		if(list.size()>0){
			rel.addSampleRemarkRelBatch(sampleId, list);
		}
		return sampleId>0;
	}

}
