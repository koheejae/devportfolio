package com.spring.news.service;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.spring.news.dao.NewsDAO;
import com.spring.news.vo.NewsVO;

public class NewsServiceImpl implements NewsService {
	private NewsDAO newsDAO;
	public void setNewsDAO(NewsDAO newsDAO) {
		this.newsDAO = newsDAO;
	}
	
	public List listNews() throws DataAccessException{
		List newsList = null;
		newsList = newsDAO.selectAllNewsList();
		return newsList;
	}
	
	public int addNews(NewsVO newsVO) throws DataAccessException{
		return newsDAO.insertNews(newsVO);
	}
	public int removeNews(int newsNO) throws DataAccessException{
		return newsDAO.deleteNews(newsNO);
	}
	public int modNews(NewsVO newsVO) throws DataAccessException{
		return newsDAO.updateNews(newsVO);
	}
	public NewsVO modForm(int newsNO) throws DataAccessException{
		return newsDAO.modForm(newsNO);
	}

}
