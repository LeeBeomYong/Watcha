package com.admin.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wacha.controller.Action;
import com.wacha.controller.ActionForward;
import com.wacha.model.WriteDAO;

public class AdminDeleteWriteList implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
	
	 String member_id=request.getParameter("id").trim();
	
	 int write_num = Integer.parseInt(request.getParameter("num").trim());
		
	 WriteDAO dao = WriteDAO.getInstance();
	 
	 
	 
	 int check = dao.writeDelete(write_num);
	 
	 
	 
	 ActionForward forward = new ActionForward();
	 
	 PrintWriter out = response.getWriter();
	 
		if(check>0) {
			forward.setRedirect(true);
			forward.setPath("admin_member_content.do?id="+member_id);
		}else {
			
			out.println("<script>");
			out.println("alert('삭제완료')");
			out.println("history.back()");
			out.println("</script>");
		}
		return forward;
		
	}

}
