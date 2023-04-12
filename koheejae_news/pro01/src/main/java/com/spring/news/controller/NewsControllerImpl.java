package com.spring.news.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

import com.spring.news.service.NewsService;
import com.spring.news.service.NewsServiceImpl;
import com.spring.news.vo.NewsVO;

public class NewsControllerImpl extends MultiActionController implements NewsController {
	private NewsService newsService;

	public void setNewsService(NewsServiceImpl newsService) {
		this.newsService = newsService;
	}
	public ModelAndView listNews(HttpServletRequest request, HttpServletResponse response) throws Exception{
		String viewName = getViewName(request);
		List newsList = newsService.listNews();
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("newsList", newsList);
		return mav;
	}

	public ModelAndView addNews(HttpServletRequest request, HttpServletResponse response) throws Exception{
		request.setCharacterEncoding("utf-8");
		NewsVO newsVO = new NewsVO();
		bind(request, newsVO);
		int result = 0;
		result = newsService.addNews(newsVO);
		ModelAndView mav = new ModelAndView("redirect:/news/listNews.do");
		return mav;
	}
	
	public ModelAndView removeNews(HttpServletRequest request, HttpServletResponse reponse)throws Exception{
		request.setCharacterEncoding("utf-8");
		int newsNO = Integer.parseInt(request.getParameter("newsNO"));
		newsService.removeNews(newsNO);
		ModelAndView mav = new ModelAndView("redirect:/news/listNews.do");
		return mav;
	}
	public ModelAndView modForm(HttpServletRequest request, HttpServletResponse reponse)throws Exception{
		request.setCharacterEncoding("utf-8");
		int newsNO = Integer.parseInt(request.getParameter("newsNO"));
		NewsVO newsVO = newsService.modForm(newsNO);
		String viewName = getViewName(request);
		ModelAndView mav = new ModelAndView();
		mav.addObject("news", newsVO);
		mav.setViewName(viewName);
		return mav;
	}
	public ModelAndView modNews(HttpServletRequest request, HttpServletResponse reponse)throws Exception{
		request.setCharacterEncoding("utf-8");
		NewsVO newsVO = new NewsVO();
		bind(request,newsVO);
		int result = 0;
		result = newsService.modNews(newsVO);
		ModelAndView mav = new ModelAndView("redirect:/news/listNews.do");
		return mav;
	}
	public ModelAndView newsInfo(HttpServletRequest request, HttpServletResponse reponse)throws Exception{
		request.setCharacterEncoding("utf-8");
		int newsNO = Integer.parseInt(request.getParameter("newsNO"));
		NewsVO newsVO = newsService.modForm(newsNO);
		String viewName = getViewName(request);
		ModelAndView mav = new ModelAndView();
		mav.addObject("news", newsVO);
		mav.setViewName(viewName);
		return mav;
		
	}
	
	private String getViewName(HttpServletRequest request) throws Exception{
		String contextPath = request.getContextPath();
		String uri = (String) request.getAttribute("javax.servlet.include.request_uri");
		if(uri == null || uri.trim().equals("")) {
			uri = request.getRequestURI();
		}
		int begin = 0;
		if(!((contextPath == null) || ("".equals(contextPath)))) {
			begin = contextPath.length();
		}
		int end;
		if(uri.indexOf(";") != -1) {
			end = uri.indexOf(";");
		}else if(uri.indexOf("?")!= -1) {
			end = uri.indexOf("?");
		}else {
			end = uri.length();
		}
		
		String fileName = uri.substring(begin,end);
		if(fileName.indexOf(".")!=-1) {
			fileName = fileName.substring(0,fileName.lastIndexOf("."));
		}
		if(fileName.lastIndexOf("/")!= -1) {
			fileName = fileName.substring(fileName.lastIndexOf("/"), fileName.length());
		}
		return fileName;
		
	}
}
