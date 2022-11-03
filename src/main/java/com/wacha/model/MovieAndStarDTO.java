package com.wacha.model;

public class MovieAndStarDTO {

	private String movie_country;
	private String movie_genre;
	private int movie_country_count;
	private int movie_genre_count;
	
	private String movie_date;
	private String movie_title;
	private String movie_director;
	private String movie_imageloc;
	private double movie_avgstar;
	
	
	
	public String getMovie_date() {
		return movie_date;
	}
	public void setMovie_date(String movie_date) {
		this.movie_date = movie_date;
	}
	public String getMovie_title() {
		return movie_title;
	}
	public void setMovie_title(String movie_title) {
		this.movie_title = movie_title;
	}
	public String getMovie_director() {
		return movie_director;
	}
	public void setMovie_director(String movie_director) {
		this.movie_director = movie_director;
	}
	public String getMovie_imageloc() {
		return movie_imageloc;
	}
	
	public double getMovie_avgstar() {
		return movie_avgstar;
	}
	public void setMovie_avgstar(double movie_avgstar) {
		this.movie_avgstar = movie_avgstar;
	}
	public void setMovie_imageloc(String movie_imageloc) {
		this.movie_imageloc = movie_imageloc;
	}
	
	
	public int getMovie_genre_count() {
		return movie_genre_count;
	}
	public void setMovie_genre_count(int movie_genre_count) {
		this.movie_genre_count = movie_genre_count;
	}
	public String getMovie_country() {
		return movie_country;
	}
	public void setMovie_country(String movie_country) {
		this.movie_country = movie_country;
	}
	public String getMovie_genre() {
		return movie_genre;
	}
	public void setMovie_genre(String movie_genre) {
		this.movie_genre = movie_genre;
	}
	public int getMovie_country_count() {
		return movie_country_count;
	}
	public void setMovie_country_count(int movie_country_count) {
		this.movie_country_count = movie_country_count;
	}
	

}
