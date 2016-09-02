package com.certus.action.sampleInput;


import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;

import com.certus.action.BaseAction;
import com.certus.service.SampleInputService;
public class SampleInputAction  extends BaseAction{

	private static final long serialVersionUID = 1L;

	@Autowired
	private SampleInputService sampleInputService;
	
	
    @Action(value="/sampleInput/sampleType/index",results={@Result(name = "index", location = "/WEB-INF/microUnion/sampleType.jsp")})
    public String Index(){
        return "index";
    }
    
    @Action(value="/sampleInput/sampleType/querySamplesTypes")
    public void querySamplesTypes(){
    	writeJson(sampleInputService.querySamplesTypes());
    }
    
    @Action(value="/sampleInput/sampleScan/scanIndex",results={@Result(name = "scanIndex", location = "/WEB-INF/microUnion/sampleScan.jsp")})
    public String scanIndex(){
        return "scanIndex";
    }
}
