package com.certus.service.impl;

import java.util.List;
import java.util.Map;


import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.certus.bo.SampleBo;
import com.certus.dao.SamplesMapper;
import com.certus.service.AnalysisService;
import com.certus.utils.CommonUtil;
import com.certus.utils.PaginationModel;

@Service(value ="AnalysisService")
public class AnalysisServiceImpl implements AnalysisService {

    private static final Logger logger = Logger.getLogger(AnalysisServiceImpl.class);
    
    
    @Autowired
    private SamplesMapper samplesMapper;
    
    @Override
    public PaginationModel getSamplesList(SampleBo sampleBo) {
    	List<Map<String,Object>> mapList = samplesMapper.querySamplesList(sampleBo);
        return CommonUtil.buildPageModel(sampleBo.getPage(), sampleBo.getRows(),samplesMapper.countSamplesList(sampleBo), mapList);
    }

	@Override
	public PaginationModel getSamplesDetailById(Integer sampleId) {
		List<Map<String,Object>> mapList = samplesMapper.getSamplesDetailById(sampleId);
        return CommonUtil.buildPageModel(1, 30,mapList.size(), mapList);
	}
    
	@Override
	public PaginationModel getDetectsByParentId(Integer parentId) {
		List<Map<String,Object>> mapList = samplesMapper.getDetectsByParentId(parentId);
        return CommonUtil.buildPageModel(1, 30,mapList.size(), mapList);
	}
	
   /* @Override
    public PaginationModel getHost(HostBo hostBo) {
        // TODO Auto-generated method stub
        if(hostBo==null || !hostBo.verify()){
            logger.error("null hostbo or false check of hostBo!");
            return null;
        }
        try{
            List<HostVO> list = new ArrayList<HostVO>();
            Iterator<HostVO> itr = this.hostCache.iterator();
            while(itr.hasNext()){
                HostVO host= itr.next();
                if(host.getName().indexOf(hostBo.getName())!=-1){
                    logger.info("hit host:"+hostBo.getName());
                    list.add(host);
                }
            }
            return CommonUtil.buildPageModel(hostBo.getPage(), hostBo.getRows(),
                    list.size(), list);        
        }
        catch(Exception e){
            logger.error(e.getMessage());
        }
        return null;
    }*/
    
}
