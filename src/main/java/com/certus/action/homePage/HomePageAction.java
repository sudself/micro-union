package com.certus.action.homePage;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;

import com.certus.action.BaseAction;

public class HomePageAction extends BaseAction {
    
    private static final long serialVersionUID = -4749945630269273002L;
    
    @Action(value="/homePage/index",results={ 
            @Result(name = "index", location = "/WEB-INF/homePage/homePage.jsp")})
    public String Index(){
        return "index";
    }
    

}
