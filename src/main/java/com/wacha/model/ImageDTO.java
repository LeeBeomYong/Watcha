package com.wacha.model;

public class ImageDTO {
	
	private int movie_num;
	private String image_loc;  //포스터
	private String image_temp;	//메인이미지 갤러리
	private String director_image;	//감독사진
	
	
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
	public String getImage_temp() {
		return image_temp;
	}
	public void setImage_temp(String image_temp) {
		this.image_temp = image_temp;
	}
	public String getDirector_image() {
		return director_image;
	}
	public void setDirector_image(String director_image) {
		this.director_image = director_image;
	}
	
	
	
	
	
}
