package com.certus.service.impl;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.certus.dao.Users;
import com.certus.dao.UsersMapper;
import com.certus.service.UsersService;

@Service(value="users")
public class UsersServiceImpl implements UsersService {
    
    private static final Logger log = Logger.getLogger(UsersServiceImpl.class);
    
    @Autowired
    UsersMapper usersMapper;

    @Override
    public Users getUserByName(String name) {
        Users user = null;
        try{
            user = usersMapper.getUserByName(name);
        }catch(Exception e){
            log.error(e);
        }
        return user;
    }

}
