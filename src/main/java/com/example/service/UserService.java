package com.example.service;


import com.example.dto.UserVO;

public interface UserService {
	public void register(UserVO dto) throws Exception;
	
    public UserVO login(UserVO dto);
    
    public int idChk(UserVO dto) throws Exception;
}
