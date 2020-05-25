package com.ecsimsw.askq;

import java.sql.*;
import java.util.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MemberDAO{
	public static MemberDAO memberDAO = null;
	
	DataSource dataSource = null;
	Connection conn = null;
	
	private MemberDAO() {
	    try{
			Context init = new InitialContext();
			dataSource = (DataSource) init.lookup("java:comp/env/jdbc/myDBCP");
	    }catch(Exception e) {
	    	e.printStackTrace();
	    }
	}
	
	public static MemberDAO getInstance() {
		if(memberDAO == null) {
			memberDAO = new MemberDAO();
		}
		
		return memberDAO;
	}
	public LinkedList<String> getMemebersIdList(){
		LinkedList<String> idList = new LinkedList<String>();
		
		int result = MemberDAO.USER_NONEXISTENT;
		
		Connection conn =null;
		Statement stmt = null;
		ResultSet rs = null;
		String query = "select id from members";
		
		try {
			conn = dataSource.getConnection();
			stmt = conn.createStatement();
			
			rs=stmt.executeQuery(query);

			String id= null;
			while(rs.next()) {
			    id =rs.getString("id");
			    idList.add(id);
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			try {
				if(conn != null) conn.close();
				if(stmt != null) stmt.close();
				if(rs != null) rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return idList;
	}
	
	
	public int insertMember(MemberDTO newMember) {
		Connection conn =null;
		PreparedStatement pstmt = null;
		String query = "insert into members values (?,?)";
		
		try {
			conn = dataSource.getConnection();
			
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
			conn = dataSource.getConnection();
			
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
			else { return MemberDAO.VALID_USER;}
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
