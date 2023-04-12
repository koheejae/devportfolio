package com.spring.ex02.board.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.spring.ex02.board.vo.ArticleVO;
import com.spring.ex02.board.vo.ImageVO;

@Repository("boardDAO")
public class BoardDAOImpl implements BoardDAO{
	@Autowired
	private SqlSession sqlSession;
	
	public List selectAllArticlesList() throws DataAccessException{
		List<ArticleVO> articlesList = articlesList = sqlSession.selectList("mapper.board.selectAllArticlesList");
		return articlesList;
	}
	
	public int insertNewArticle(Map articleMap) throws DataAccessException{
		int articleNO = selectNewArticleNO();
		articleMap.put("articleNO", articleNO);
		sqlSession.insert("mapper.board.insertNewArticle", articleMap);
		return articleNO;
	}
	
	/*
	 * public void insertNewImage(Map articleMap) throws DataAccessException{
	 * List<ImageVO> imageFileList = (ArrayList) articleMap.get("imageFileList");
	 * int articleNO = (Integer)articleMap.get("articleNO"); int imageFileNO =
	 * selectNewImageFileNO(); for(ImageVO imageVO : imageFileList) {
	 * imageVO.setImageFileNO(++imageFileNO); imageVO.setArticleNO(articleNO); }
	 * sqlSession.insert("mapper.board.insertNewImage", imageFileList); }
	 */
	
	public ArticleVO selectArticle(int articleNO) throws DataAccessException{
		return sqlSession.selectOne("mapper.board.selectArticle", articleNO);
	}
	
	public void updateArticle(Map articleMap) throws DataAccessException{
		sqlSession.update("mapper.board.updateArticle", articleMap);
	}
	
	public void deleteArticle(int articleNO) throws DataAccessException{
		sqlSession.delete("mapper.board.deleteArticle", articleNO);
	}
	
	public List selectImageFileList(int articleNO) throws DataAccessException{
		List<ImageVO> imageFileList = null;
		imageFileList = sqlSession.selectList("mapper.board.selectImageFileList", articleNO);
		return imageFileList;
	}
	
	private int selectNewArticleNO() throws DataAccessException{
		return sqlSession.selectOne("mapper.board.selectNewArticleNO");
	}
	
	private int selectNewImageFileNO() throws DataAccessException{
		return sqlSession.selectOne("mapper.board.selectNewImageFileNO");
	}
	
}
