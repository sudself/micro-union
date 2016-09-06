package com.certus.action.sampleInput;


import java.util.Date;

import javax.servlet.http.HttpSession;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;

import com.certus.action.BaseAction;
import com.certus.dao.Samples;
import com.certus.dao.Users;
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
    
    @Action(value="/sampleInput/sampleRemarks/remarksList")
    public void sampleRemarks(){
    	int sampleTypeId=Integer.parseInt(request.getParameter("sampleTypeId"));
    	writeJson(sampleInputService.queryRmarksList(sampleTypeId));
    }
    
    @Action(value="/sampleInput/sampleScan/addSample")
    public void addSample(){
    	HttpSession session = request.getSession();
    	Users user=(Users) session.getAttribute("user");
    	sample.setUserid(user.getId());
    	sample.setReceiveTime(new Date());
    	sample.setStatus("标本录入");
    	String remarkIds=request.getParameter("chkValue");
    	writeJson(sampleInputService.addSample(sample, remarkIds));
    }
    
    
    private Samples sample=new Samples();

	public Samples getSample() {
		return sample;
	}

	public void setSample(Samples sample) {
		this.sample = sample;
	}
    
    
}
