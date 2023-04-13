package com.AA.board.vo;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("articleVO")
public class ArticleVO {
	private int  level;
	private int board_num;
	private String board_title;
	private String board_content;
	private String imageFileName;
	private String id;
	private Date  writeDate;
	private int viewCnt;
	private String status;
	
	
	public String getStatus() {
		return status;
	}



	public void setStatus(String status) {
		this.status = status;
	}



	public ArticleVO() {
		System.out.println("ArticleVO �깮�꽦�옄 �샇異�");
	}

	

	public String getImageFileName() {
		try {
			if (imageFileName != null && imageFileName.length() != 0) {
				imageFileName = URLDecoder.decode(imageFileName, "UTF-8");
			}
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return imageFileName;
	}

	public void setImageFileName(String imageFileName) {
		try {
			if(imageFileName!= null && imageFileName.length()!=0) {
				this.imageFileName = URLEncoder.encode(imageFileName,"UTF-8");
			}
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
	}
	
	

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public Date getWriteDate() {
		return writeDate;
	}

	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
	}

	public int getViewCnt() {
		return viewCnt;
	}

	public void setViewCnt(int viewCnt) {
		this.viewCnt = viewCnt;
	}



	public int getLevel() {
		return level;
	}



	public void setLevel(int level) {
		this.level = level;
	}



	public int getBoard_num() {
		return board_num;
	}



	public void setBoard_num(int board_num) {
		this.board_num = board_num;
	}



	public String getBoard_title() {
		return board_title;
	}



	public void setBoard_title(String board_title) {
		this.board_title = board_title;
	}



	public String getBoard_content() {
		return board_content;
	}



	public void setBoard_content(String board_content) {
		this.board_content = board_content;
	}


	
	
}