package com.admin.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wacha.controller.Action;
import com.wacha.controller.ActionForward;
import com.wacha.model.ImageDAO;
import com.wacha.model.ImageDTO;
import com.wacha.model.MovieDAO;
import com.wacha.model.MovieDTO;

public class AdminMovieListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		int rowsize = 5;
		//아래에 보여질 페이지의 최대 블럭 수 - 
		int block=5;
		//예[1] [2] [3]  [4] [5] / [6] [7] [8] [9] [10]
	
		
		//db상의 전체물의 전체수 
		int totalRecord=0;
		//전체 페이지 수 - 
		//전체 게시물의 수 /(나누기)한 페이지 당 보여질 게시물
		int allPage=0;
		int page=1; //현재 페이지 변수
		
		if(request.getParameter("page")!=null) {
			
			 page = Integer.parseInt(request.getParameter("page").trim());
	}else {//parameter 값을 받지않은경우 //전체 게시물 목록 a 태그를 클릭한 경우
		page=1;
		
	}
		//해당페이지 에서 시작번호
		int startNo = (page*rowsize)-(rowsize-1);
		
		//해당페이지 끝 번호
		int endNo=(page*rowsize);
		
		//해당페이지에서 시작 블럭
		int startBlock=(((page-1)/block)*block)+1;
		//해당페이지에서 끝 블럭
		int endBlock=(((page-1)/block)*block)+block;

		
		MovieDAO dao = MovieDAO.getInstance();
		
		totalRecord=dao.getMovieCount();
		
		allPage=(int)Math.ceil(totalRecord/(double)rowsize);
		
		if(endBlock > allPage){
			endBlock=allPage;
		}
		
		List<MovieDTO>movieList=dao.getmovieList(page,rowsize);
		
		
		request.setAttribute( "movieList", movieList);
		
		request.setAttribute("page", page);
		
		request.setAttribute("rowsize", rowsize);
		
		request.setAttribute("block", block);
		
		request.setAttribute("totalRecord", totalRecord);
		
		request.setAttribute("allPage", allPage);
		
		request.setAttribute("startNo", startNo);
		
		request.setAttribute("endNo", endNo);
		
		request.setAttribute("startBlock", startBlock);
		
		request.setAttribute("endBlock", endBlock );
		
		ActionForward forward = new ActionForward();
		
		forward.setRedirect(false);
		
		forward.setPath("admin/admin_movie_list.jsp");
		
		return forward;
	}

}
