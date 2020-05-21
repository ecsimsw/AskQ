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
	
	public ArrayList<QuestionDTO> searchByReceiver(String searchedUser) {
		Connection conn =null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "SELECT * FROM questions WHERE receiver = (?)";
		
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
}
