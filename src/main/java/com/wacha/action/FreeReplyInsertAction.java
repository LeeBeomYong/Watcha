package com.wacha.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wacha.controller.Action;
import com.wacha.controller.ActionForward;
import com.wacha.model.FreeReplyDTO;
import com.wacha.model.FreeWriteDAO;

public class FreeReplyInsertAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 답변 폼에서 넘어온 데이터를 가지고 DB에 저장하는 비지니스 로직. 
		String reply_writer = request.getParameter("writer").trim();
		String reply_content = request.getParameter("content").trim();
		int reply_bno = Integer.parseInt(request.getParameter("bno").trim());
		
		FreeReplyDTO dto = new FreeReplyDTO();
		
		dto.setFree_num(reply_bno);
		dto.setMember_id(reply_writer);
		dto.setR_free_cont(reply_content);
		
		FreeWriteDAO dao = FreeWriteDAO.getInstance();
		int check = dao.replyInsert(dto);

		
		PrintWriter out = response.getWriter();
		
		
		if(check > 0) {
			dao.freeReplyCount(reply_bno);
		}
		out.println(check);
		// 결과값을 클라이언트(ajax)에 보내주면 됨.
		

		return null;
		
		
	}

}
