package com.example.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.example.dto.ReplyVO;

@Repository
public class ReplyDAOImpl implements ReplyDAO {
    @Inject
    SqlSession sqlSession;
    
    private static final String Namespace = "com.example.mapper.replyMapper";
    
    // 댓글 목록
    @Override
    public List<ReplyVO> list(Integer bno) {
        return sqlSession.selectList(Namespace+".listReply", bno);
    }
    // 댓글 작성
    @Override
    public void create(ReplyVO vo) {
        sqlSession.insert(Namespace+".insertReply", vo);
    }
    // 댓글 수정
    @Override
    public void update(ReplyVO vo) {
        sqlSession.update(Namespace+".updateReply", vo);
 
    }
    // 댓글 삭제
    @Override
    public void delete(Integer rno) {
    	sqlSession.delete(Namespace+".deleteReply", rno);
    }
    
 
}
 
