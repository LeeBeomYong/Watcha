package com.wacha.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wacha.controller.Action;
import com.wacha.controller.ActionForward;
import com.wacha.model.WriteDAO;
import com.wacha.model.WriteDTO;



public class WriteModifyOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		WriteDTO dto = new WriteDTO();
		
		String write_title = request.getParameter("write_title").trim();
		String write_cont = request.getParameter("write_cont").trim();
		int write_num = Integer.parseInt(request.getParameter("write_num").trim());
		
		dto.setWrite_title(write_title);
		dto.setWrite_cont(write_cont);
		dto.setWrite_num(write_num);
		
		WriteDAO dao = WriteDAO.getInstance();
		
		int res = dao.writeModify(dto);
		
		ActionForward forward = new ActionForward();
		
		PrintWriter out = response.getWriter();
		
		if(res > 0) {
			forward.setRedirect(true);
			forward.setPath("write_content.do?num="+write_num);
			out.println("<script>");
			out.println("alert('수정이 완료되었습니다.')");
			out.println("</script>");
		}else {
			out.println("<script>");
			out.println("alert('수정 실패..')");
			out.println("history.back()");
			out.println("</script>");
			
			
		}
		
		return forward;

		
	}

}
