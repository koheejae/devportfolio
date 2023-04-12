package com.spring.news.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.dao.DataAccessException;

import com.spring.news.vo.NewsVO;

public class NewsDAOImpl implements NewsDAO{
	private SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public List selectAllNewsList() throws DataAccessException{
		List<NewsVO> newsList = null;
		newsList = sqlSession.selectList("mapper.news.selectAllNewsList");
		return newsList;
	}
	
	public int insertNews(NewsVO newsVO) throws DataAccessException{
		int result = sqlSession.insert("mapper.news.insertNews",newsVO);
		return result;
	}
	
	public int deleteNews(int newsNO) throws DataAccessException{
		int result = sqlSession.delete("mapper.news.deleteNews",newsNO);
		return result;
	}
	public int updateNews(NewsVO newsVO) throws DataAccessException{
		int result = sqlSession.update("mapper.news.updateNews",newsVO);
		return result;
	}
	public NewsVO modForm(int newsNO) throws DataAccessException{
		NewsVO result = (NewsVO) sqlSession.selectOne("mapper.news.selectNewsByNewsNO",newsNO);
		return result;
	}

	
}
