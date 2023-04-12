package com.spring.pro04.ex02;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MailController {
	@Autowired
	private MailService mailService;

	@RequestMapping(value = "/sendMail.do", method = RequestMethod.GET)
	public void sendSimpleMail(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html:charset=utf-8");
		PrintWriter out = response.getWriter();
		/* StringBuffer 변수 sb를 선언합니다. */
		StringBuffer sb = new StringBuffer();

		/* 문자열로 HTML태그를 작성한후 sb에 저장합니다. */
		/*
		  sb.append("<html><body>"); sb.
		  sb.append("<meta http-equiv='Content-Type' content='text/html; charset=euc-kr'>");
		  sb.append("<h1>" + "제품소개" + "<h1><br>"); sb.append("신간 도서를 소개합니다.<br><br>");
		  sb.append(
		  "<a href='http://www.kyobobook.co.kr/product/detailViewKor.laf?ejkGb=KOR&mallGb=KOR&barcode=9788956746425&orderClick=LAG&Kc=#N'>"
		  ); sb.
		  append("<img  src='http://image.kyobobook.co.kr/images/book/xlarge/425/x9788956746425.jpg' /> </a><br>"
		  ); sb.append("</a>"); sb.append(
		  "<a href='http://www.kyobobook.co.kr/product/detailViewKor.laf?ejkGb=KOR&mallGb=KOR&barcode=9788956746425&orderClick=LAG&Kc=#N'>상품보기</a>"
		 ); sb.append("</body></html>");
		 */
		
		sb.append("<html><body>");
		sb.append("<meta http-equiv='Content-Type' content='text/html; charset=euc-kr'>");
		sb.append("<h1>" + "양꼬치" + "<h1><br>");
		sb.append("저녁메뉴 양꼬치.<br><br>");
		sb.append(
				"<a href='https://www.siksinhot.com/theme/magazine/1360?mid=1360'>");
		sb.append("<img  src='https://img.siksinhot.com/article/1505966107595408.jpg' /> </a><br>");
		sb.append("</a>");
		sb.append(
				"<a href='https://www.siksinhot.com/theme/magazine/1360?mid=1360'>내용보기</a>");
		sb.append("</body></html>");

		/* 문자열로 변환합니다. */
		String str = sb.toString();

		/* 수신자// HTML 형식의 내용을 메일로 보냅니다. */
		mailService.sendMail("refailer@naver.com", "신상품을 소개합니다.", str);

		out.print("메일을 보냈습니다!!");
	}
}
