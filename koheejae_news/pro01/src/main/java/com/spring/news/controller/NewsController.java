package com.spring.news.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.dao.DataAccessException;
import org.springframework.web.servlet.ModelAndView;

public interface NewsController {
	public ModelAndView listNews(HttpServletRequest request, HttpServletResponse response)throws Exception;
	public ModelAndView addNews(HttpServletRequest request, HttpServletResponse response)throws Exception;
	public ModelAndView removeNews(HttpServletRequest request, HttpServletResponse response)throws Exception;
	public ModelAndView modForm(HttpServletRequest request, HttpServletResponse response)throws Exception;
	public ModelAndView modNews(HttpServletRequest request, HttpServletResponse response)throws Exception;
	public ModelAndView newsInfo(HttpServletRequest request, HttpServletResponse response)throws Exception;
}
