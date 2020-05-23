package com.ecsimsw.askq;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.*;
import java.sql.SQLException;
import java.util.*;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class QuestionDAO {
    public static QuestionDAO questionDAO = null;
	
	DataSource dataSource = null;
	Connection conn = null;
	
	private QuestionDAO() {
	    try{
			Context init = new InitialContext();
			dataSource = (DataSource) init.lookup("java:comp/env/jdbc/myDBCP");
	    }catch(Exception e) {
	    	e.printStackTrace();
	    }
	}
	
	public static QuestionDAO getInstance() {
		if(questionDAO == null) {
			questionDAO = new QuestionDAO();
		}
		
		return questionDAO;
	}
	
	public int insertQuestion(QuestionDTO question) {
		Connection conn =null;
		PreparedStatement pstmt = null;
		String query = "INSERT INTO questions (questioner, receiver, question, answer, status) VALUES (?,?,?,?,?)";
		
		try {
			conn = dataSource.getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, question.getQuestioner());
			pstmt.setString(2,question.getReceiver());
			pstmt.setString(3, question.getQuestion());
			pstmt.setString(4,question.getAnswer());
			pstmt.setInt(5,question.getStatus());
			
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
	public int updateAnswer(int no, String answer, int status) {
		Connection conn =null;
		PreparedStatement pstmt = null;
		String query = "UPDATE questions SET answer = (?), status =(?) WHERE no =(?)";
		
		try {
			conn = dataSource.getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, answer);
			pstmt.setInt(2, status);
			pstmt.setInt(3, no);
			
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
	public ArrayList<QuestionDTO> searchPublicQ(String searchedUser) {
		Connection conn =null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "SELECT * FROM questions WHERE receiver = (?) and status != 0";
		
		ArrayList<QuestionDTO> searchedContent = new ArrayList<>();
		
		try {
			conn = dataSource.getConnection();
			
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, searchedUser);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int no = rs.getInt("no");
				String questioner = rs.getString("questioner");
				String receiver = rs.getString("receiver");
				String question = rs.getString("question");
				String answer = rs.getString("answer");
				int status = rs.getInt("status");
				
				searchedContent.add(
				new QuestionDTO(no,questioner,receiver,question,answer,status)
				);
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
		return searchedContent;
	}
	
	public ArrayList<QuestionDTO> searchNewQ(String searchedUser) {
		Connection conn =null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "SELECT * FROM questions WHERE receiver = (?) and status = 0";
		
		ArrayList<QuestionDTO> searchedContent = new ArrayList<>();
		
		try {
			conn = dataSource.getConnection();
			
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, searchedUser);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int no = rs.getInt("no");
				String questioner = rs.getString("questioner");
				String receiver = rs.getString("receiver");
				String question = rs.getString("question");
				String answer = rs.getString("answer");
				int status = rs.getInt("status");
				
				searchedContent.add(
				new QuestionDTO(no,questioner,receiver,question,answer,status)
				);
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
		return searchedContent;
	}
	
	public int deleteByNo(int no) {
		Connection conn =null;
		PreparedStatement pstmt = null;
		String query = "DELETE FROM questions WHERE no =(?)";
		
		try {
			conn = dataSource.getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, no);
			
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
	
	public QuestionDTO getQuestionByNo(int no) {
		Connection conn =null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "SELECT * FROM questions WHERE no=(?)";
		
		try {
			conn = dataSource.getConnection();
			
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, no);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				String questioner = rs.getString("questioner");
				String receiver = rs.getString("receiver");
				String question = rs.getString("question");
				String answer = rs.getString("answer");
				System.out.println("no: "+no+ " answer :"+answer);
				int status = rs.getInt("status");
					
				return new QuestionDTO
						(no,questioner,receiver,question,answer,status);
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
		
		return null;
	}
}
