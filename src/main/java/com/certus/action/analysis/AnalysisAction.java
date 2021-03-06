package com.certus.action.analysis;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.certus.action.BaseAction;
import com.certus.bo.BoResult;
import com.certus.bo.SampleBo;
import com.certus.service.AnalysisService;

@Service
public class AnalysisAction extends BaseAction {
	
    private static final Logger logger = Logger.getLogger(AnalysisAction.class);
    
    @Autowired
    private AnalysisService analysisService;
    
    /**
     * 
     */
    private static final long serialVersionUID = -3464057243853252923L;

    private String code;
    
    public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	@Action(value="/analysisAction/index",results={
            @Result(name="list", location="/WEB-INF/microUnion/analysis.jsp")
    })
    public String index(){
        return "list";
    }
    
    @Action(value="/analysisAction/list")
    public void listSamplesList(){
        BoResult bor = new BoResult();
        try {
            logger.info("begin:listSamplesList");
            SampleBo sampleBo = new SampleBo();
            if(!checkPageAndRows(page,rows)){
                bor.code = -1;
                bor.msg = "非法的显示设置";
                writeJson(bor);
                return;
            }
            sampleBo.setPage(page);
            sampleBo.setRows(rows);
            if(code != null && !"".equals(code)){
            	String searchCode = code.split("#")[0];
            	sampleBo.setHospitalCode(searchCode);
            }
            writeJson(analysisService.getSamplesList(sampleBo));
            logger.info("listSamplesList success");
        } catch (Exception e) {
            e.printStackTrace();
            logger.error(e.getMessage(),e);
            bor.code = -1;
            bor.msg = e.getMessage();
            writeJson(bor);
        } 
        finally{
            logger.info("end:listSamplesList");
        }
    }   
    
    @Action(value="/analysisAction/sampleDetail")
    public void sampleDetail(){
        BoResult bor = new BoResult();
        try {
            logger.info("begin:sampleDetail");
            String sampleId = request.getParameter("sampleId");
            if(StringUtils.isEmpty(sampleId) && !StringUtils.isNumeric(sampleId) ){
                bor.code = -1;
                bor.msg = "sampleId参数异常";
                writeJson(bor);
                return;
            }
            writeJson(analysisService.getSamplesDetailById(Integer.parseInt(sampleId)));
            logger.info("sampleDetail success");
        } catch (Exception e) {
            e.printStackTrace();
            logger.error(e.getMessage(),e);
            bor.code = -1;
            bor.msg = e.getMessage();
            writeJson(bor);
        } 
        finally{
            logger.info("end:sampleDetail");
        }
    }  
    
    @Action(value="/analysisAction/detectsDetail")
    public void detectsDetail(){
        BoResult bor = new BoResult();
        try {
            logger.info("detectsDetail");
            String parentId = request.getParameter("parentId");
            if(StringUtils.isEmpty(parentId) && !StringUtils.isNumeric(parentId) ){
                bor.code = -1;
                bor.msg = "parentId参数异常";
                writeJson(bor);
                return;
            }
            writeJson(analysisService.getDetectsByParentId(Integer.parseInt(parentId)));
            logger.info("detectsDetail success");
        } catch (Exception e) {
            e.printStackTrace();
            logger.error(e.getMessage(),e);
            bor.code = -1;
            bor.msg = e.getMessage();
            writeJson(bor);
        } 
        finally{
            logger.info("end:detectsDetail");
        }
    }
    
    /*@Action(value="/HostListAction/queryHost")
    public void getHost(){
        BoResult bor = new BoResult();
        try{
            logger.info("begin:getHost");
            String name = request.getParameter("name");
            if(StringUtils.isEmpty(name)){
                bor.code = -1;
                bor.msg = "主机名不能为空";
                writeJson(bor);
                return;
            }
            HostBo hostBo = new HostBo();
            if(!checkPageAndRows(page,rows)){
                bor.code = -2;
                bor.msg = "非法的显示设置";
                writeJson(bor);
                return;
            }
            hostBo.setName(name);
            hostBo.setPage(page);
            hostBo.setRows(rows);
            writeJson(analysisService.getHost(hostBo));
            logger.info("getHost success");
        } catch (Exception e) {
            e.printStackTrace();
            logger.error(e.getMessage(),e);
            bor.code = -1;
            bor.msg = e.getMessage();
            writeJson(bor);
        } 
        finally{
            logger.info("end:getHost");
        }
    }*/
}
