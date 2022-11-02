package com.admin.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.wacha.controller.Action;
import com.wacha.controller.ActionForward;
import com.wacha.model.MovieDAO;
import com.wacha.model.MovieDTO;

public class AdminMovieModifyOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		
		//첨부파일이 저장될 위치(경로) 설정
		String saveFolder="C:\\Users\\user\\git\\Kh_semiWatcha\\WebContent\\image";
		
		//첨부파일 용량 (크기)제한 -파일 업로드 최대 크기
		
		int fileSize=10*1024*1024;//10mb
		
		//이미지파일 업로드를 위한 객체생성
		MultipartRequest multi = new MultipartRequest(
				request, //일반적인 request 객체
				saveFolder, 	//첨부파일 이 저장될 경로
				fileSize,	//업로드할 첨부파일의 최대 크기
				"UTF-8",	//문자인코딩
				new DefaultFileRenamePolicy() // 파일의 이름이같은경우 중복이 안되게 설정
				);
			
		String movie_title=multi.getParameter("movie_title").trim();
		
		String movie_cont=multi.getParameter("movie_cont").trim();
		
		String movie_time=multi.getParameter("movie_time").trim();
		
		String movie_date=multi.getParameter("movie_date").trim();
		
		String movie_age=multi.getParameter("movie_age").trim();
		
		String movie_genre=multi.getParameter("movie_genre").trim();
		
		String movie_director=multi.getParameter("movie_director").trim();
		
		String movie_country=multi.getParameter("movie_country").trim();
		
		int movie_num=Integer.parseInt(multi.getParameter("movie_num").trim());
		
		String movie_video=multi.getFilesystemName("movie_new_video");
		
		if(movie_video==null) {
			movie_video=multi.getParameter("movie_old_video");
			
		}
		MovieDTO dto = new MovieDTO();
		
		 dto.setMovie_num(movie_num);
		
		dto.setMovie_title(movie_title);
		
		dto.setMovie_cont(movie_cont);
		
		dto.setMovie_time(movie_time);
		
		dto.setMovie_date(movie_date);
		
		dto.setMovie_age(movie_age);
		
		dto.setMovie_genre(movie_genre);
		
		dto.setMovie_director(movie_director);
		
		dto.setMovie_country(movie_country);
		
		MovieDAO dao = MovieDAO.getInstance();
		
		int check=dao.updateMovie(dto);
		
		System.out.println("check>>"+check);
		
		ActionForward forward = new ActionForward();
		
		
		PrintWriter out =response.getWriter();
		
		if(check>0) {
			forward.setRedirect(true);
			forward.setPath("admin_movie_list.do");
		}else {
			out.println("<script>");
			out.println("alert('영화정보 수정실패')");
			out.println("history.back()");
			out.println("</script>");
		}
		
		return forward;
	}

}
