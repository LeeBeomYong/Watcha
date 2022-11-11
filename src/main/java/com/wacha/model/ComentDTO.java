package com.wacha.model;

public class ComentDTO {

	private int coment_num;
	private int movie_num;
	private String member_id;
	private String movie_coment;
	private int coment_num_son;
	private int coment_hit;	//좋아용
	private int coment_nohit;//싫어용
	private String cocoment_likelist;	
	private String cocoment_hatelist;
	private int cocoment_count;
	private int member_star;
	private String user_img;
	
	
	public String getUser_img() {
		return user_img;
	}
	public void setUser_img(String user_img) {
		this.user_img = user_img;
	}
	public int getMember_star() {
		return member_star;
	}
	public void setMember_star(int member_star) {
		this.member_star = member_star;
	}
	public int getComent_num() {
		return coment_num;
	}
	public void setComent_num(int coment_num) {
		this.coment_num = coment_num;
	}
	public int getMovie_num() {
		return movie_num;
	}
	public void setMovie_num(int movie_num) {
		this.movie_num = movie_num;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getMovie_coment() {
		return movie_coment;
	}
	public void setMovie_coment(String movie_coment) {
		this.movie_coment = movie_coment;
	}
	public int getComent_num_son() {
		return coment_num_son;
	}
	public void setComent_num_son(int coment_num_son) {
		this.coment_num_son = coment_num_son;
	}
	public int getComent_hit() {
		return coment_hit;
	}
	public void setComent_hit(int coment_hit) {
		this.coment_hit = coment_hit;
	}
	public int getComent_nohit() {
		return coment_nohit;
	}
	public void setComent_nohit(int coment_nohit) {
		this.coment_nohit = coment_nohit;
	}
	public String getCocoment_likelist() {
		return cocoment_likelist;
	}
	public void setCocoment_likelist(String cocoment_likelist) {
		this.cocoment_likelist = cocoment_likelist;
	}
	public String getCocoment_hatelist() {
		return cocoment_hatelist;
	}
	public void setCocoment_hatelist(String cocoment_hatelist) {
		this.cocoment_hatelist = cocoment_hatelist;
	}
	public int getCocoment_count() {
		return cocoment_count;
	}
	public void setCocoment_count(int cocoment_count) {
		this.cocoment_count = cocoment_count;
	}
	

	

	
	
	
	
	
}
