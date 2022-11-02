package com.wacha.model;

public class ContentDTO {

	private String movie_title;
	private int coment_num;
	private int coment_num_son;
	private String member_id;
	private int coment_hit;
	private int coment_nohit;
	private int movie_num;
	private String moive_coment;
	
	public String getMovie_coment() {
		return moive_coment;
	}
	public void setMovie_coment(String movie_coment) {
		this.moive_coment = movie_coment;
	}
	public String getMovie_title() {
		return movie_title;
	}
	public void setMovie_title(String movie_title) {
		this.movie_title = movie_title;
	}
	public int getComent_num() {
		return coment_num;
	}
	public void setComent_num(int coment_num) {
		this.coment_num = coment_num;
	}
	public int getComent_num_son() {
		return coment_num_son;
	}
	public void setComent_num_son(int coment_num_son) {
		this.coment_num_son = coment_num_son;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
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

	public int getMovie_num() {
		return movie_num;
	}
	public void setMovie_num(int movie_num) {
		this.movie_num = movie_num;
	}

}
