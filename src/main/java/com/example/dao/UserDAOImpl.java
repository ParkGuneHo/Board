package com.example.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.example.dto.UserVO;

@Repository
public class UserDAOImpl implements UserDAO {
	@Inject
	private SqlSession sqlSession;
	
	private static final String Namespace = "com.example.mapper.userMapper";
     
	@Override
	public void register(UserVO dto) throws Exception {
		sqlSession.insert(Namespace+".register", dto);		
	}
	
    @Override
    public UserVO login(UserVO dto) {
        return sqlSession.selectOne(Namespace+".login", dto);
    }
    
    @Override
    public int idChk(UserVO dto) throws Exception {
    	int result = sqlSession.selectOne(Namespace+".idChk", dto);
    	return result;
    }

}


