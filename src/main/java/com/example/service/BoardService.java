package com.example.service;

import java.util.List;

import com.example.dto.BoardVO;

public interface BoardService {
	
	public List<BoardVO> selectBoard() throws Exception;
	
	public void create(BoardVO vo);
	
	public BoardVO view(int no);
	
	public void update(BoardVO vo);
	
	public void delete(int no);
}
