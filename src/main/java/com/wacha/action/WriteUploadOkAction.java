	package com.wacha.action;
	
	import java.io.IOException;
	import java.io.PrintWriter;
import java.sql.Array;

import javax.servlet.http.HttpServletRequest;
	import javax.servlet.http.HttpServletResponse;
	
	import com.wacha.controller.Action;
	import com.wacha.controller.ActionForward;
	import com.wacha.model.WriteDAO;
	import com.wacha.model.WriteDTO;
	
	public class WriteUploadOkAction implements Action {
	
		@Override
		public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
			// write 테이블에 데이터를 추가하는 비지니스 로직.
			WriteDTO dto = new WriteDTO();
			
			String member_id = request.getParameter("member_id").trim();
			String write_title = request.getParameter("write_title").trim();
			String write_cont = request.getParameter("write_cont").trim();
			String write_pwd = request.getParameter("write_pwd");
			String write_radio = request.getParameter("show");
			
			if(write_pwd != null) {
				dto.setWrite_pwd(write_pwd);
			}else {
				dto.setWrite_pwd("");
			}
				dto.setMember_id(member_id);
				dto.setWrite_title(write_title);
				dto.setWrite_cont(write_cont);
				dto.setWrite_radio(write_radio);
				
				
				WriteDAO dao = WriteDAO.getInstance();
				
				int res = dao.insertWrite(dto);
				
				request.setAttribute("Upload", res);
				
				PrintWriter out = response.getWriter();
				
				ActionForward forward = new ActionForward();
				
				
				
				if(res > 0) {
					forward.setRedirect(true);
					forward.setPath("inquiry_main.do");
				}else {
					out.println("<script>");
					out.println("alert('추가 실패')");
					out.println("history.back()");
					out.println("</script>");
				}
				
				return forward;
			}
	
	}

	