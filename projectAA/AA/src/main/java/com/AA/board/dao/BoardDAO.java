package com.AA.board.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.AA.board.vo.ArticleVO;


public interface BoardDAO {
	public List selectAllArticlesList() throws DataAccessException;
	public int insertNewArticle(Map articleMap) throws DataAccessException;
	//public void insertNewImage(Map articleMap) throws DataAccessException;
	public  void updateView(int board_num) throws Exception;

	public ArticleVO selectArticle(int board_num) throws DataAccessException;
	public void updateArticle(Map articleMap) throws DataAccessException;
	public void deleteArticle(int board_num) throws DataAccessException;
	public List selectImageFileList(int board_num) throws DataAccessException;
	
}
