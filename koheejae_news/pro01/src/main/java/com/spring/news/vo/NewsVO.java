package com.spring.news.vo;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.sql.Date;

public class NewsVO {
	private int newsNO;
	private String newsName;
	private String newsContent;
	private String imageFileName;
	private Date writeDate;
	
	public Date getWriteDate() {
		return writeDate;
	}

	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
	}

	public NewsVO() {}
	
	public NewsVO(int newsNO, String newsName, String newsContent, String imageFileName) {
		this.newsNO = newsNO;
		this.newsName = newsName;
		this.newsContent = newsContent;
		this.imageFileName = imageFileName;
	}


	public int getNewsNO() {
		return newsNO;
	}

	public void setNewsNO(int newsNO) {
		this.newsNO = newsNO;
	}

	public String getNewsName() {
		return newsName;
	}

	public void setNewsName(String newsName) {
		this.newsName = newsName;
	}

	public String getNewsContent() {
		return newsContent;
	}

	public void setNewsContent(String newsContent) {
		this.newsContent = newsContent;
	}

	public String getImageFileName() {
		try {
			if(imageFileName != null && imageFileName.length() != 0) {
				imageFileName = URLDecoder.decode(imageFileName, "utf-8");
			}
		}catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return imageFileName;
	}

	public void setImageFileName(String imageFileName) {
		try {
			if(imageFileName != null && imageFileName.length()!=0) {
				this.imageFileName = URLEncoder.encode(imageFileName,"utf-8");
			}
			}catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
	}
}
