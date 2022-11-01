package com.wacha.model;

public class StarDTO {

	private int movie_num;
	private String member_id;
	private double movie_star;
	private int movie_heart;
	private int movie_watch;
	
	
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
	public double getMovie_star() {
		return movie_star;
	}
	public void setMovie_star(double movie_star) {
		this.movie_star = movie_star;

	}
	public int getMovie_heart() {
		return movie_heart;
	}
	public void setMovie_heart(int movie_heart) {
		this.movie_heart = movie_heart;
	}
	public int getMovie_watch() {
		return movie_watch;
	}
	public void setMovie_watch(int movie_watch) {
		this.movie_watch = movie_watch;
	}
	

}
