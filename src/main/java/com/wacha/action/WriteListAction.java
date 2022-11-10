package com.wacha.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wacha.controller.Action;
import com.wacha.controller.ActionForward;
import com.wacha.model.NoticeDTO;
import com.wacha.model.WriteDAO;
import com.wacha.model.WriteDTO;

public class WriteListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		// 페이징 처리 작업 진행
		
		// 한 페이지당 보여질 게시물의 수
		int rowsize = 8;
		
		// 아래에 보여질 페이지의 최대 블럭 수
		int block = 10;
		// 예) [1][2][3] / [4][5][6] / [7][8][9] 잡은 만큼 뒤에도 그렇게 계속 나온다.
		
		// DB 상의 게시물의 전체 수
		int totalRecord = 0;
		
		// 필요한 이유 - 전체 페이지 수 체크해야돼서.. // 전체 게시물의 수 /(나누기) 한 페이지 당 보여질 게시물의 수
		int allPage = 0;
		
		int page = 0;		// 현재 페이지 변수
		
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page").trim()); 	
		}else {
			// 처음으로 "전체 게시물 목록" a 태그를 클릭한 경우.
			page = 1;
		}
		// 해당 페이지에서 시작번호
		int startNo = (page * rowsize) - (rowsize - 1);
		
		// 해당 페이지에서 끝 번호
		int endNo = (page * rowsize);
		
		
		// 해당 페이지에서 시작 블럭
		int startBlock = (((page - 1) / block) * block) + 1;
		
		// 해당 페이지에서 끝 블럭
		int endBlock = (((page - 1) / block) * block) + block;		
		
		
		// write 테이블에 있는 전체 데이터 조회하여 전체 리스트를 view page로 이동시킴.
		WriteDAO dao = WriteDAO.getInstance();
		totalRecord = dao.getWriteCount();
		
		// 전체 게시물의 수를 한 페이지당 보여질 게시물의 수로 나누어 주어야 함.
		// 이 과정을 거치면 전체 페이지수가 나오게 됨.
		// 전체 페이지 수가 나올 때 나머지가 있으면 무조건 페이지 수를 하나 올려 주어야 한다.
		allPage = (int)Math.ceil(totalRecord / (double)rowsize);
		
		if(endBlock > allPage) {	// 데이터가 더이상 없으면 페이지는 없애주는 작업.
			endBlock = allPage;
		}
		
		List<NoticeDTO> list_1 = dao.getNoticeList();
		
		List<WriteDTO> list = dao.getWriteList(page, rowsize);
		
		// 지금까지 페이징 처리 시 작업했던 모든 값들을 view page로 이동시키자.
		request.setAttribute("page", page);
		request.setAttribute("rowsize", rowsize);
		request.setAttribute("block", block);
		request.setAttribute("totalRecord", totalRecord);
		request.setAttribute("allPage", allPage);
		request.setAttribute("startNo", startNo);
		request.setAttribute("endNo", endNo);
		request.setAttribute("startBlock", startBlock);
		request.setAttribute("endBlock", endBlock);	
		request.setAttribute("List_1", list_1);
		request.setAttribute("List", list);
		
		ActionForward forward = new ActionForward();
		
		forward.setRedirect(false);

		forward.setPath("write/inquiry_main.jsp");

		return forward;
		
		
	}

}

