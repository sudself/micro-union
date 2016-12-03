package com.certus.service.impl;

import java.util.List;
import java.util.Map;

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

    @Override
    public String querySampleTables(String code) {
        String result = "weiLuRu";//默认给出未录入状态
        Samples sample = samples.getSampleByCode(code);
        
        if(null != sample){//条码已经被录入到系统中
            
            result = "goDealOrPrint"+"-"+sample.getSampleType();
            
            /**根据条码获取所有处理数据**//*
            List<Detects> listDetescts = detectsMapper.getDetectsByCode(code);
            if(null == listDetescts || listDetescts.size() == 0 ){
                //表示已经录入到系统但是还未处理，跳转到处理选择页面、处理打印条码
                result = "goDealOrPrint";
                return result;
            }else{
                boolean isFinished = false;
                for(int i=0;i<listDetescts.size();i++){
                    if("处理完成".equals(listDetescts.get(i).getStatus())){
                        result = "analysis";//跳转到分析页面
                        isFinished = true;
                        break;
                    }
                }
                
                if(!isFinished){//有记录、取最近一次的处理状态进行跳转
                    Detects latest = listDetescts.get(0);
                    int detectTypeId = latest.getDetectTypeId();
                    DetectType detectType = detectTypeMapper.selectByPrimaryKey(detectTypeId);
                    if(null != detectType && "1".equals(detectType.getDetectMethod())){
                        result = "jingJian";
                    }
                    
                    if(null != detectType && "2".equals(detectType.getDetectMethod())){
                        result = "ranSe";
                    }
                }
            }*/
            
        }else{//未录入跳转到录入页面
            return result;
        }
        
        return result;
    }

    @Override
    public Map<String,Object> queryDetectsByCode(String code) {
        String hospitalcode = code.split("#")[0];
        String childCode = code.split("#")[1];
        Map<String,Object> result = detectsMapper.queryDetectsByCode(hospitalcode, Integer.valueOf(childCode));
        return result;
    }

    /**生成实验的次数**/
    /* (non-Javadoc)
     * params code 医院条码
     * return 已经实验的次数
     * @see com.certus.service.ShiYanChuLiService#createCode(java.lang.String, java.lang.String)
     */
    @Override
    public String createCode(String code, String parentId) {
        
        List<Detects> listDetescts = detectsMapper.getDetectsByCode(code);
        
        if(null == listDetescts || listDetescts.size() == 0){
            return "1";
        }else{
            return ""+(listDetescts.get(0).getChildId()+1);
        }
    }

}
