package boad;

import java.sql.Date;

public class MemberVO {
  int id;
  String username;
  String univ;
  Date birth;
  String email;
  


public MemberVO() {
	System.out.println("MemberVO 객체생성");
}

public MemberVO(int id, String username, String univ,Date birth,String email) {
	this.id = id;
	this.username = username;
	this.univ = univ;
	this.birth = birth;
	this.email = email;
}
public MemberVO(String username, String univ,Date birth,String email) {
	this.username = username;
	this.univ = univ;
	this.birth = birth;
	this.email = email;
}

public int getId() {
	return id;
}

public void setId(int id) {
	this.id = id;
}

public String getUsername() {
	return username;
}

public void setUsername(String username) {
	this.username = username;
}

public String getUniv() {
	return univ;
}

public void setUniv(String univ) {
	this.univ = univ;
}

public Date getBirth() {
	return birth;
}

public void setBirth(Date birth) {
	this.birth = birth;
}

public String getEmail() {
	return email;
}

public void setEmail(String email) {
	this.email = email;
}

}