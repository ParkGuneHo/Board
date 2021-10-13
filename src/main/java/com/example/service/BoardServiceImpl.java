package com.example.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.example.dao.BoardDAO;
import com.example.dto.BoardVO;

@Service
public class BoardServiceImpl implements BoardService {

	@Inject
	private BoardDAO dao;
	
	@Override
	public List<BoardVO> selectBoard() throws Exception {

		return dao.selectBoard();
	}
	
	@Override
	public void create(BoardVO vo) {
		dao.create(vo);
	}
	
	@Override
	public BoardVO view(int no){
		return dao.view(no);
	}
	
	@Override
	public void update(BoardVO vo) {
		dao.update(vo);
	}
	
	@Override
	public void delete(int no) {
		dao.delete(no);
	}
}
