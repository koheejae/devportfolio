package com.spring.news.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.spring.news.vo.NewsVO;

public interface NewsDAO {
	public List selectAllNewsList() throws DataAccessException;
	public int insertNews(NewsVO newsVO) throws DataAccessException;
	public int deleteNews(int newsNO) throws DataAccessException;
	public int updateNews(NewsVO newsVO) throws DataAccessException;
	public NewsVO modForm(int newsNO) throws DataAccessException;
}
