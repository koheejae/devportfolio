package boad;

import java.util.List;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MemberDAO {
	private Connection con;
	private PreparedStatement pstmt;
	private DataSource dataFactory;
	
	public MemberDAO() {
		try {
			Context ctx = new InitialContext();
			Context envContext = (Context) ctx.lookup("java:/comp/env");
			dataFactory = (DataSource)envContext.lookup("jdbc/protest");
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	public List listMember() {
		List memberList = new ArrayList();
		try {
			con = dataFactory.getConnection();
			String query = "select * from studentlists order by id";
			System.out.println(query);
			pstmt = con.prepareStatement(query);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				
				int id = rs.getInt("id");
				String username = rs.getString("pwd");
				String univ = rs.getString("name");
				Date birth = rs.getDate("birth");
				String email = rs.getString("email");
				MemberVO memberVO = new MemberVO(id,username,univ,birth,email);
				memberList.add(memberVO);
			}
			rs.close();
			pstmt.close();
			con.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return memberList;
	}
	public void addMember(MemberVO m) {
		try {
			con = dataFactory.getConnection();
			int id = m.getId();
			String username = m.getUsername();
			String univ = m.getUniv();
			Date birth = m.getBirth();
			String email = m.getEmail();
			String query = "INSERT INTO studentlists(username,univ,birth,email)" + "VALUES(?,?,?,?)";
			System.out.println(query);
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, username);
			pstmt.setString(2, univ);
			pstmt.setDate(3, birth);
			pstmt.setString(4, email);
			pstmt.executeUpdate();
			pstmt.close();
			con.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
}
