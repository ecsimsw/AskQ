package com.ecsimsw.askq;

import java.sql.*;
import java.util.*;

public class MemberDAO {
	public static MemberDAO memberDAO = null;
	
	private MemberDAO() {}
	
	public static MemberDAO getInstance() {
		if(memberDAO == null) {
			memberDAO = new MemberDAO();
		}
		
		return memberDAO;
	}
	
	public int insertMember(MemberDTO newMember) {
		Connection conn =null;
		PreparedStatement pstmt = null;
		String query = "insert into members values (?,?)";
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://localhost:3306/askq?serverTimezone=UTC";
			conn = DriverManager.getConnection(url,"root","root");
			
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, newMember.getId());
			pstmt.setString(2, newMember.getPw());
			
			pstmt.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			try {
				if(conn != null) conn.close();
				if(pstmt != null) pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return 0;
	}
	
	public static int USER_NONEXISTENT = 1;
	public static int WRONG_PASSWORD = 2;
	public static int VALID_USER = 0;
	
	public int loginCheck(MemberDTO inputMember) {
		int result = MemberDAO.USER_NONEXISTENT;
		
		Connection conn =null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "select * from members where id =(?)";
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://localhost:3306/askq?serverTimezone=UTC";
			conn = DriverManager.getConnection(url,"root","root");
			
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, inputMember.getId());
			
			rs = pstmt.executeQuery();
			
			String id = null;
			String pw = null;
			
			while(rs.next()) {
				id = rs.getString("id");
				pw = rs.getString("pw");
			}
			
			if(id == null) return MemberDAO.USER_NONEXISTENT;
			else if(!inputMember.getPw().equals(pw)) return MemberDAO.WRONG_PASSWORD;
			else {
				return MemberDAO.VALID_USER;
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			try {
				if(conn != null) conn.close();
				if(pstmt != null) pstmt.close();
				if(rs != null) rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return result;
	}

}
