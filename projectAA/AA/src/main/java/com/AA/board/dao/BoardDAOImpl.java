package com.AA.board.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.AA.board.vo.ArticleVO;
import com.AA.board.vo.ImageVO;


@Repository("boardDAO")
public class BoardDAOImpl implements BoardDAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List selectAllArticlesList() throws DataAccessException {
		List<ArticleVO> articlesList = articlesList = sqlSession.selectList("mapper.board.selectAllArticlesList");
		return articlesList;
	}

	
	@Override
	public int insertNewArticle(Map articleMap) throws DataAccessException {
		int board_num = selectNewboard_num();
		articleMap.put("board_num", board_num);
		sqlSession.insert("mapper.board.insertNewArticle",articleMap);
		return board_num;
	}
    
	//다중 파일 업로드
	/*
	@Override
	public void insertNewImage(Map articleMap) throws DataAccessException {
		List<ImageVO> imageFileList = (ArrayList)articleMap.get("imageFileList");
		int board_num = (Integer)articleMap.get("board_num");
		int imageFileNO = selectNewImageFileNO();
		for(ImageVO imageVO : imageFileList){
			imageVO.setImageFileNO(++imageFileNO);
			imageVO.setboard_num(board_num);
		}
		sqlSession.insert("mapper.board.insertNewImage",imageFileList);
	}
	
   */
	
	@Override
	public ArticleVO selectArticle(int board_num) throws DataAccessException {
		return sqlSession.selectOne("mapper.board.selectArticle", board_num);
	}

	@Override
	public void updateArticle(Map articleMap) throws DataAccessException {
		sqlSession.update("mapper.board.updateArticle", articleMap);
	}

	@Override
	public void deleteArticle(int board_num) throws DataAccessException {
		sqlSession.delete("mapper.board.deleteArticle", board_num);
		
	}
	 @Override
	  public void updateView(int articleMap) throws Exception {
	    sqlSession.update("mapper.board.updateView", articleMap);
	  }
	@Override
	public List selectImageFileList(int board_num) throws DataAccessException {
		List<ImageVO> imageFileList = null;
		imageFileList = sqlSession.selectList("mapper.board.selectImageFileList",board_num);
		return imageFileList;
	}
	
	private int selectNewboard_num() throws DataAccessException {
		return sqlSession.selectOne("mapper.board.selectNewArticleNO");
	}
	
	private int selectNewImageFileNO() throws DataAccessException {
		return sqlSession.selectOne("mapper.board.selectNewImageFileNO");
	}

}