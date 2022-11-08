package com.wacha.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wacha.controller.Action;
import com.wacha.controller.ActionForward;
import com.wacha.model.FreeWriteDAO;

public class FreeReplyDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		PrintWriter out = response.getWriter();
		
		int rfree_no = Integer.parseInt(request.getParameter("no").trim());
		
		int free_no = Integer.parseInt(request.getParameter("nno").trim());
		
		System.out.println("reply delete >>> " + rfree_no);
		 
		FreeWriteDAO dao = FreeWriteDAO.getInstance();
		
		int res = dao.deleteReplyList(rfree_no);
		
		dao.deleteReplyCount(free_no);
		
		out.println(res);
		
		return null;
		
		
	}

}
