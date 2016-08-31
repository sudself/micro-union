package com.certus.action.experiment;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;

import com.certus.action.BaseAction;


/**实验跟进**/
public class ScanCodeAction extends BaseAction {

    private static final long serialVersionUID = 1L;
    
    @Action(value="/experiment/index",results={@Result(name = "index", location = "/WEB-INF/view/experiment/index.jsp")})
    public String Index(){
        return "index";
    }

}
