package com.certus.action.experiment;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;

import com.certus.action.BaseAction;


/**实验跟进---标本处理**/
public class ScanCodeAction extends BaseAction {

    private static final long serialVersionUID = 1L;
    
    @Action(value="/experiment/index",results={@Result(name = "index", location = "/WEB-INF/view/experiment/experiIndex.jsp")})
    public String Index(){
        return "index";
    }
    
    
    /**标本处理选择页面**/
    @Action(value="/experiment/sampleHander",results={@Result(name = "sampleHander", location = "/WEB-INF/view/experiment/sampleHandler.jsp")})
    public String sampleHander(){
        
        String codeName = request.getParameter("codeName");
        System.out.println(codeName);
        
        return "sampleHander";
    }
    
    
    /**染色镜检**/
    @Action(value="/experiment/jingjian",results={@Result(name = "jingjian", location = "/WEB-INF/view/experiment/ranSeJingJian.jsp")})
    public String jingjian(){
        
        String codeName = request.getParameter("codeName");
        System.out.println(codeName);
        
        return "jingjian";
    }
    
    /**转种平板**/
    @Action(value="/experiment/pingban",results={@Result(name = "pingban", location = "/WEB-INF/view/experiment/zhuanZhongPingBan.jsp")})
    public String pingban(){
        
        String codeName = request.getParameter("codeName");
        System.out.println(codeName);
        
        return "pingban";
    }
    
    
    /**直接鉴定**/
    @Action(value="/experiment/jianding",results={@Result(name = "jianding", location = "/WEB-INF/view/experiment/zhiJieJianDing.jsp")})
    public String jianding(){
        
        String codeName = request.getParameter("codeName");
        System.out.println(codeName);
        
        return "jianding";
    }
    

}
