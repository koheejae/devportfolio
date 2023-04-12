package com.spring.ex02.board.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.spring.ex02.board.dao.BoardDAOImpl;
import com.spring.ex02.board.vo.ArticleVO;

@Service("boardService")
@Transactional(propagation = Propagation.REQUIRED)
public class BoardServiceImpl implements BoardService{
	@Autowired
	BoardDAOImpl boardDAO;
	
	public List<ArticleVO> listArticles() throws Exception{
		List<ArticleVO> articlesList = boardDAO.selectAllArticlesList();
		return articlesList;
	}
	
	public int addNewArticle(Map articleMap) throws Exception{
		return boardDAO.insertNewArticle(articleMap);
	}
	
	/*
	 * public int addNewArticle(Map articleMap) throws Exception{ int articleNO =
	 * boardDAO.insertNewArticle(articleMap); articleMap.put("articleNO",
	 * articleNO); boardDAO.insertNewArticle(articleMap); return articleNO; }
	 */
	
	/*
	 * public Map viewArticle(int articleNO) throws Exception{ Map articleMap = new
	 * HashMap(); ArticleVO articleVO = boardDAO.selectArticle(articleNO);
	 * List<ImageVO> imageFileList = boardDAO.selectImageFileList(articleNO);
	 * articleMap.put("article", articleVO); articleMap.put("imageFileList",
	 * imageFileList); return articleMap; }
	 */
	
	public ArticleVO viewArticle(int articleNO) throws Exception{
		ArticleVO articleVO = boardDAO.selectArticle(articleNO);
		return articleVO;
	}
	
	public void modArticle(Map articleMap) throws Exception{
		boardDAO.updateArticle(articleMap);
	}
	
	public void removeArticle(int articleNO) throws Exception{
		boardDAO.deleteArticle(articleNO);
	}
}
