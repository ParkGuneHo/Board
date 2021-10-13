package com.example.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.example.dao.UserDAO;
import com.example.dto.UserVO;

@Service
public class UserServiceImpl implements UserService {
	
    @Inject
    private UserDAO dao;
     
    @Override
	public void register(UserVO dto) throws Exception {
		dao.register(dto);
	}
    
    @Override
    public UserVO login(UserVO dto) {
        return dao.login(dto);
    }
    
    @Override
    public int idChk(UserVO dto) throws Exception {
    	int result = dao.idChk(dto);
    	return result;
    }
}

