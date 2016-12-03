package com.certus.action.experiment;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;

import com.alibaba.fastjson.JSONObject;
import com.certus.action.BaseAction;
import com.certus.dao.DetectType;
import com.certus.dao.Detects;
import com.certus.dao.JingJianType;
import com.certus.dao.Samples;
import com.certus.dao.Users;
import com.certus.service.ShiYanChuLiService;


/**实验跟进---标本处理**/
public class ScanCodeAction extends BaseAction {

    private static final long serialVersionUID = 1L;
    
    @Autowired
    private ShiYanChuLiService shiYanChuLiService;
    
    @Action(value="/experiment/index",results={@Result(name = "index", location = "/WEB-INF/view/experiment/experiIndex.jsp")})
    public String Index(){
        return "index";
    }
    
    
    /**标本处理选择页面**/
    @Action(value="/experiment/sampleHander",results={@Result(name = "sampleHander", location = "/WEB-INF/view/experiment/sampleHandler.jsp")})
    public String sampleHander(){
        
        return "sampleHander";
    }
    
    
    /**染色镜检**/
    @Action(value="/experiment/jingjian",results={@Result(name = "jingjian", location = "/WEB-INF/view/experiment/ranSeJingJian.jsp")})
    public String jingjian(){
        return "jingjian";
    }
    
    
    //单独的镜检页面
    @Action(value="/experiment/jingJianSingle",results={@Result(name = "jingJianSingle", location = "/WEB-INF/view/experiment/jingJianSingle.jsp")})
    public String jingJianSingle(){
        
        return "jingJianSingle";
    }
    
    
    /**获取镜检或平板的类型列表**/
    @Action(value="/experiment/getDetectTypeList")
    public void getDetectTypeList(){
        String sampleTypeId = request.getParameter("sampleTypeId");
        String detectMothod = request.getParameter("detectMothod");
        
        List<DetectType> resultList = shiYanChuLiService.getDetectType(sampleTypeId, detectMothod, null);
        writeJson(resultList);
    }
    
    
    /**获取镜检小类型列表**/
    @Action(value="/experiment/getJingJianTypeList")
    public void getJingJianTypeList(){
        String detectTypeId = request.getParameter("detectTypeId");
        
        List<JingJianType> resultList = shiYanChuLiService.getJingJianType(detectTypeId);
        JSONObject json = new JSONObject();
        json.put("resultList", resultList);
        DetectType detectType = shiYanChuLiService.selectByPrimaryKey(detectTypeId);
        if(detectType != null){
            json.put("name", detectType.getDetectType());
        }
        
        writeJson(json);
    }
    
    
    @Action(value="/experiment/handle")
    public void handleSample(){
    	HttpSession session = request.getSession();
    	Users user=(Users) session.getAttribute("user");
    	
    	String detectTypeId = request.getParameter("detectTypeId");
        String codeName = request.getParameter("codeName");
        String sampleTypeId = request.getParameter("sampleTypeId");
        String parentId = request.getParameter("parentId");
        String shiYanCiShu = shiYanChuLiService.createCode(codeName, parentId);
//        String printCode = codeName+"#"+shiYanCiShu;//打印的条码，格式：code+#+实验次数
        
        String hCode = codeName;//后续要根据code算法，截取hospitalCode的部分
        Samples sample = shiYanChuLiService.getSampleByCode(hCode);
        Detects detect = new Detects();
        detect.setSampleId(sample.getId());
        detect.setSampleTypeId(Integer.parseInt(sampleTypeId));
        detect.setDetectTypeId(Integer.parseInt(detectTypeId));
        detect.setPrintTime(new Date());
        detect.setPrintUserId(user.getId());
        detect.setCodeNo(codeName); //这里用的是printCode，不是codeName
        detect.setDealTime(new Date());
        detect.setDealUserId(user.getId());
        detect.setChildId(Integer.valueOf(shiYanCiShu));
        if(null != parentId && "" !=parentId){
            detect.setParentId(Integer.valueOf(parentId));
        }
        
        detect.setStatus("打印条码完成");
        //后续还有判断是否要加childId
    	writeJson(shiYanChuLiService.addDetect(detect));
    }
    
    /**转种平板**/
    @Action(value="/experiment/pingban",results={@Result(name = "pingban", location = "/WEB-INF/view/experiment/zhuanZhongPingBan.jsp")})
    public String pingban(){
        return "pingban";
    }
    
    /**直接鉴定**/
    @Action(value="/experiment/jianding",results={@Result(name = "jianding", location = "/WEB-INF/view/experiment/zhiJieJianDing.jsp")})
    public String jianding(){
        return "jianding";
    }
    
    /**根据条码查询，当前条码代表的记录**/
    @Action(value="/experiment/queryDetectsByCode")
    public void queryDetectsByCode(){
        String code = request.getParameter("code");
        HttpSession session = request.getSession();
        Map<String,Object> detectsInfo= shiYanChuLiService.queryDetectsByCode(code);
        session.setAttribute("detectsInfo",com.alibaba.fastjson.JSON.toJSON(detectsInfo));
        writeJson(detectsInfo);
    }
    
    
    /**根据医院条码，确认需要跳转的页面，code中不包含#**/
    @Action(value="/experiment/querySampleTables")
    public void querySampleTables(){
        String code = request.getParameter("code");
        writeJson(shiYanChuLiService.querySampleTables(code));
    }
    
    
}
