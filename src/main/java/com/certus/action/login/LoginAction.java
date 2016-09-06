package com.certus.action.login;

import javax.servlet.http.HttpSession;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;

import com.certus.action.BaseAction;
import com.certus.dao.Users;
import com.certus.service.UsersService;

public class LoginAction extends BaseAction {
    private static final long serialVersionUID = -4749945630269273002L;
    @Autowired
    UsersService cus;
       
    @Action(value="/loginAction/login")
    public void login(){
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        Users cu = cus.getUserByName(username);
        if (cu==null) {
            writeJson("failed");
        }else if (password.equals(cu.getPassword())) {
        	HttpSession session = request.getSession();
            session.setAttribute("loginName", username);
            session.setAttribute("user", cu);
            writeJson("success");
        }else {
            writeJson("failed");
        }
    }
    
    @Action(value="/homeAction/loginOut")
    public void loginOut(){
        HttpSession session = request.getSession();
        String username = String.valueOf(session.getAttribute("loginName"));
        if (!"null".equals(username)||username != null) {
            session.invalidate();
        }
        writeJson("success");
    }
    
    
    @Action(value="/loginAction/logout",results={@Result(name = "index", location = "/WEB-INF/login.jsp")})
    public String Index(){
    	HttpSession session = request.getSession();
        String username = String.valueOf(session.getAttribute("loginName"));
        if (!"null".equals(username)||username != null) {
            session.invalidate();
        }
        return "index";
    }
}

