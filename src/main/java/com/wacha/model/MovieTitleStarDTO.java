package com.wacha.model;

public class MovieTitleStarDTO {

	private int movie_num;
	private String image_loc;
	private String movie_title;
	private double movie_star;
	
	
	
	
	public int getMovie_num() {
		return movie_num;
	}
	public void setMovie_num(int movie_num) {
		this.movie_num = movie_num;
	}
	public String getImage_loc() {
		return image_loc;
	}
	public void setImage_loc(String image_loc) {
		this.image_loc = image_loc;
	}
	public String getMovie_title() {
		return movie_title;
	}
	public void setMovie_title(String movie_title) {
		this.movie_title = movie_title;
	}
	public double getMovie_star() {
		return movie_star;
	}
	public void setMovie_star(Double movie_star) {
		this.movie_star = movie_star;
	}
	
	
}
