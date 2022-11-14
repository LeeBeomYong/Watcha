package com.admin.action;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.wacha.controller.Action;
import com.wacha.controller.ActionForward;
import com.wacha.model.ImageDAO;
import com.wacha.model.ImageDTO;
import com.wacha.model.MovieDAO;
import com.wacha.model.MovieDTO;

public class AdminMovieWriteOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {

		MovieDTO dto = new MovieDTO();

		ImageDTO dto1 = new ImageDTO();
		// 첨부파일이 저장될 위치(경로) 설정

		String saveFolder = "C:\\Users\\by\\Desktop\\이범용_개발\\eclipse_pj\\eclipse-workspace(jsp)\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\WatchaProject\\image";


		// 첨부파일 용량 (크기)제한 -파일 업로드 최대 크기

		int fileSize = 100 * 1024 * 1024;// 10mb

		// 이미지파일 업로드를 위한 객체생성
		MultipartRequest multi = new MultipartRequest(request, // 일반적인 request 객체
				saveFolder, // 첨부파일 이 저장될 경로
				fileSize, // 업로드할 첨부파일의 최대 크기
				"UTF-8", // 문자인코딩
				new DefaultFileRenamePolicy() // 파일의 이름이같은경우 중복이 안되게 설정
		);

		String movie_title = multi.getParameter("movie_title").trim();

		String movie_time = multi.getParameter("movie_time").trim();

		String movie_cont = multi.getParameter("movie_cont").trim();

		String movie_date = multi.getParameter("movie_date").trim();

		String movie_genre = multi.getParameter("movie_genre").trim();

		String movie_age = multi.getParameter("movie_age").trim();

		String movie_country = multi.getParameter("movie_country").trim();

		String movie_director = multi.getParameter("movie_director").trim();
		
		String movie_video=multi.getParameter("movie_video").trim();
		
		  String movie_main = multi.getParameter("movie_main");
		  
		  String movie_gallery1 = multi.getParameter("movie_gallery1");
		  
		  String movie_gallery2 = multi.getParameter("movie_gallery2");
		 
		  String movie_directpic= multi.getFilesystemName("movie_dpic");
		

		  String movie_poster = multi.getFilesystemName("movie_poster").trim();

		
		 String res ="";
		 
		 res+=movie_main+","; res+=movie_gallery1+","; res+=movie_gallery2;
		 
		  
		 saveFolder+="/"+movie_main;
		  
		  System.out.println(movie_main+","+movie_gallery1+","+movie_gallery2);
		 

		System.out.println(movie_poster);

		dto.setMovie_title(movie_title);

		dto.setMovie_cont(movie_cont);

		dto.setMovie_time(movie_time);

		dto.setMovie_date(movie_date);

		dto.setMovie_age(movie_age);

		dto.setMovie_genre(movie_genre);

		dto.setMovie_director(movie_director);

		dto.setMovie_country(movie_country);
		
		dto.setMovie_video(movie_video);
		
		
		 dto1.setImage_loc(movie_poster);	
		 
		 dto1.setImage_temp(res); 
		

		 dto1.setDirector_image(movie_directpic); 

		MovieDAO dao = MovieDAO.getInstance();

		ImageDAO dao1 = ImageDAO.getInstance();

		int check = dao.insertMovie(dto);

		int check2 = dao1.insertMovieImage(dto1);

		ActionForward forward = new ActionForward();

		PrintWriter out = response.getWriter();
		System.out.println(check);
		if (check > 0) {
			forward.setRedirect(true);
			forward.setPath("admin_movie_list.do");
			if (check2 > 0) {
				forward.setRedirect(true);
				forward.setPath("admin_movie_list.do");
			} else {
				out.println("<script>");
				out.println("alert('이미지등록실패')");
				out.println("history.back()");
				out.println("</script>");

			}
		} else {
			out.println("<script>");
			out.println("alert('영화등록실패')");
			out.println("history.back()");
			out.println("</script>");

		}

		return forward;

	}

}
