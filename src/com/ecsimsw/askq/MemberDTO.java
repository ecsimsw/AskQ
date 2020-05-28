package com.ecsimsw.askq;

public class MemberDTO {
	
	int no;
	String id =null;
	String pw =null;
	String introduce = null;
	int status;
	int icon;
	
	
	public MemberDTO(int no, String id, String pw, String introduce, int status, int icon) {
		this.no = no;
		this.id = id;
		this.pw = pw;
		this.introduce = introduce;
		this.status = status;
		this.icon = icon;
	}


	public String getIntroduce() {
		return introduce;
	}


	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}


	public int getNo() {
		return no;
	}


	public void setNo(int no) {
		this.no = no;
	}


	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
	}


	public String getPw() {
		return pw;
	}


	public void setPw(String pw) {
		this.pw = pw;
	}


	public int getStatus() {
		return status;
	}


	public void setStatus(int status) {
		this.status = status;
	}


	public int getIcon() {
		return icon;
	}


	public void setIcon(int icon) {
		this.icon = icon;
	}

	
}
