package com.ecsimsw.askq;

public class QuestionDTO implements Comparable<QuestionDTO>{
	int no = 0;
	String questioner ="";
	String receiver = "";
	String question = "";
	String answer = "";
	int status =0;
	
	public QuestionDTO(
		int no, String questioner, String receiver, String question,
		String answer, int status) 
	{
		this.no = no;
		this.questioner = questioner;
		this.receiver = receiver;
		this.question = question;
		this.answer = answer;
		this.status = status;		
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getQuestioner() {
		return questioner;
	}

	public void setQuestioner(String questioner) {
		this.questioner = questioner;
	}

	public String getReceiver() {
		return receiver;
	}

	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}

	public String getQuestion() {
		return question;
	}

	public void setQuestion(String question) {
		this.question = question;
	}

	public String getAnswer() {
		return answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	@Override
	public int compareTo(QuestionDTO o) {
		return ((QuestionDTO) o).getNo() < this.no ? -1 : 1;
	}
	
}
