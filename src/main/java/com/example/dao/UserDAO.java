package com.example.dao;

import com.example.dto.UserVO;

public interface UserDAO {
	
	public void register(UserVO dto) throws Exception;
	
    public UserVO login(UserVO dto);
    
    public int idChk(UserVO dto) throws Exception;
     
}
