package com.example.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.example.dto.BoardVO;

@Repository
public class BoardDAOImpl implements BoardDAO {

	@Inject
	private SqlSession sqlSession;
	
	private static final String Namespace = "com.example.mapper.boardMapper";
	
	@Override
	public List<BoardVO> selectBoard() throws Exception {

		return sqlSession.selectList(Namespace+".selectBoard");
	}
	
	@Override
	public void create(BoardVO vo) {
		sqlSession.delete(Namespace+".create", vo);
	}
	
	@Override
	public BoardVO view(int no){
		return sqlSession.selectOne(Namespace+".view", no);
		
	}
	
	@Override
	public void update(BoardVO vo) {
		sqlSession.update(Namespace+".update", vo);
	}
	
	@Override
	public void delete(int no){
		sqlSession.delete(Namespace+".delete", no);
	}

}
