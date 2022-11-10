package com.wacha.model;


public class WriteDTO {

	private int write_num;				// 글번호
	private String write_title;			// 글제목
	private String write_cont;			// 글내용
	private String write_pwd;			// 글 비밀번호
	private int write_hit;				// 글 조회수
	private String write_date;			// 글 작성일자
	private String member_id;			// 글 작성자 아이디
	private String write_radio;			// 글 비번 비공개 / 공개
	private String write_reply;

	
	public String getWrite_reply() {
		return write_reply;
	}
	public void setWrite_reply(String write_reply) {
		this.write_reply = write_reply;
	}
	public String getWrite_radio() {
		return write_radio;
	}
	public void setWrite_radio(String write_radio) {
		this.write_radio = write_radio;
	}
	public String getWrite_date() {
		return write_date;
	}
	public void setWrite_date(String write_date) {
		this.write_date = write_date;
	}
	public int getWrite_hit() {
		return write_hit;
	}
	public void setWrite_hit(int write_hit) {
		this.write_hit = write_hit;
	}
	public int getWrite_num() {
		return write_num;
	}
	public void setWrite_num(int write_num) {
		this.write_num = write_num;
	}
	public String getWrite_cont() {
		return write_cont;
	}
	public void setWrite_cont(String write_cont) {
		this.write_cont = write_cont;
	}
	public String getWrite_title() {
		return write_title;
	}
	public void setWrite_title(String write_title) {
		this.write_title = write_title;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getWrite_pwd() {
		return write_pwd;
	}
	public void setWrite_pwd(String write_pwd) {
		this.write_pwd = write_pwd;
	}
	
	
}
