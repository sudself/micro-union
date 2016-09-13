package com.certus.service.impl;

import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.certus.dao.DetectType;
import com.certus.dao.DetectTypeMapper;
import com.certus.dao.Detects;
import com.certus.dao.DetectsMapper;
import com.certus.dao.JingJianType;
import com.certus.dao.JingJianTypeMapper;
import com.certus.dao.Samples;
import com.certus.dao.SamplesMapper;
import com.certus.service.ShiYanChuLiService;

@Service(value="shiyanchuli")
public class ShiYanChuLiServiceImpl implements ShiYanChuLiService{
    
//    private static final Logger log = Logger.getLogger(ShiYanChuLiServiceImpl.class);
    
    @Autowired
    private DetectTypeMapper detectTypeMapper;
    
    @Autowired
	private SamplesMapper samples;

    @Autowired
	private DetectsMapper detectsMapper;
    
    @Autowired
    private JingJianTypeMapper jingJianTypeMapper;
    
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

	@Override
	public Samples getSampleByCode(String code) {
		return samples.getSampleByCode(code);
	}

	@Override
	public boolean addDetect(Detects detect) {
		int res = detectsMapper.insert(detect);
		return res>0;
	}
	
    @Override
    public List<JingJianType> getJingJianType(String detectTypeId) {
        List<JingJianType> resultList = jingJianTypeMapper.getTypeByDetectType(detectTypeId);
        return resultList;
    }

    @Override
    public DetectType selectByPrimaryKey(String id) {
        return detectTypeMapper.selectByPrimaryKey(Integer.valueOf(id));
    }

}
