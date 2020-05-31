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
	
	public String getPwById(String id) {
		String pw = null;
		
		Connection conn =null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "select pw from members where id=(?)";
		
		try {
			conn = dataSource.getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, id);
			
			rs=pstmt.executeQuery();

			while(rs.next()) {
			    pw =rs.getString("pw");
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
		
		return pw;
	}
	
	public String getIntroduceById(String id) {
		String pw = null;
		
		Connection conn =null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "select introduce from members where id=(?)";
		
		try {
			conn = dataSource.getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, id);
			
			rs=pstmt.executeQuery();

			while(rs.next()) {
			    pw =rs.getString("introduce");
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
		
		return pw;
	}
	
	public LinkedList<String> getMemebersIdList(){
		LinkedList<String> idList = new LinkedList<String>();
		
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
	
	public int insertMember(String new_id, String new_pw) {
		Connection conn =null;
		PreparedStatement pstmt = null;
		String query = "insert into members (id,pw,introduce,status,icon, asked, answered) values (?,?,?,?,?,?,?)";
		
		try {
			conn = dataSource.getConnection();
			
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, new_id);
			pstmt.setString(2, new_pw);
			pstmt.setString(3, "Welcome!"); // delfault introduce is welcome
			pstmt.setInt(4, 0);    // defautl status is 0
			pstmt.setInt(5, 0);    // default icon is 0
			pstmt.setInt(6, 0);    // defautl asked is 0
			pstmt.setInt(7, 0);    // default answered is 0
			
			pstmt.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
			return -1;
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
	
	public int loginCheck(String inputId, String inputPw) {
		int result = MemberDAO.USER_NONEXISTENT;
		
		Connection conn =null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "select * from members where id =(?)";
		
		try {
			conn = dataSource.getConnection();
			
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, inputId);
			
			rs = pstmt.executeQuery();
			
			String id = null;
			String pw = null;
			
			while(rs.next()) {
				id = rs.getString("id");
				pw = rs.getString("pw");
			}
			
			if(id == null) return MemberDAO.USER_NONEXISTENT;
			else if(!inputPw.equals(pw)) return MemberDAO.WRONG_PASSWORD;
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
	
	public int changePwById(String currentId, String newPw) {
		Connection conn =null;
		PreparedStatement pstmt = null;
		String query = "UPDATE members SET pw =(?) WHERE id =(?)";
		
		try {
			conn = dataSource.getConnection();
			
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, newPw);
			pstmt.setString(2, currentId);
			
			pstmt.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();

			return -1;
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

	public int getAskedById(String id) {
		Connection conn =null;
		PreparedStatement pstmt = null;
		String query = "select asked from members WHERE id =(?)";
		ResultSet rs = null;
		int asked = -1;
		
		try {
			conn = dataSource.getConnection();
			
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				asked = rs.getInt("asked");
			}
			return asked;
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
		return asked;
	}
	
	public int getAnsweredById(String id) {
		Connection conn =null;
		PreparedStatement pstmt = null;
		String query = "select answered from members WHERE id =(?)";
		ResultSet rs = null;
		int answered = -1;
		
		try {
			conn = dataSource.getConnection();
			
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				answered = rs.getInt("answered");
			}
			return answered;
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
		return answered;
	}

	public int changeAskedById(String id, int asked) {
		Connection conn =null;
		PreparedStatement pstmt = null;
		String query = "UPDATE members SET asked =(?) WHERE id =(?)";
		
		try {
			conn = dataSource.getConnection();
			
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, asked);
			pstmt.setString(2, id);
			
			pstmt.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();

			return -1;
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
	public int changeAnswereddById(String id, int answered) {
		Connection conn =null;
		PreparedStatement pstmt = null;
		String query = "UPDATE members SET answered =(?) WHERE id =(?)";
		
		try {
			conn = dataSource.getConnection();
			
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, answered);
			pstmt.setString(2, id);
			
			pstmt.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();

			return -1;
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

	public int changeIntroduceById(String id, String introduce) {
		Connection conn =null;
		PreparedStatement pstmt = null;
		String query = "UPDATE members SET introduce =(?) WHERE id =(?)";
		
		try {
			conn = dataSource.getConnection();
			
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, introduce);
			pstmt.setString(2, id);
			
			pstmt.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();

			return -1;
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
}
