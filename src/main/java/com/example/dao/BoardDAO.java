package com.example.dao;

import java.util.List;

import com.example.dto.BoardVO;

public interface BoardDAO {
	
	public List<BoardVO> selectBoard() throws Exception;
	
	public void create(BoardVO vo);
	
	public BoardVO view(int no);
	
	public void update(BoardVO vo);
	
	public void delete(int no);

}
