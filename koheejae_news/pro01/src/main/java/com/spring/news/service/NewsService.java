package com.spring.news.service;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.spring.news.vo.NewsVO;

public interface NewsService {
	public List listNews() throws DataAccessException;
	public int addNews(NewsVO newsVO) throws DataAccessException;
	public int removeNews(int newsNO) throws DataAccessException;
	public int modNews(NewsVO newsVO) throws DataAccessException;
	public NewsVO modForm(int newsNO) throws DataAccessException;
}
