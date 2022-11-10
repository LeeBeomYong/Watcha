package com.wacha.action;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.wacha.controller.Action;
import com.wacha.controller.ActionForward;
import com.wacha.model.FreeWriteDAO;
import com.wacha.model.FreeWriteDTO;

public class FreeModifyOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
	
		// 첨부파일이 저장될 위치(경로) 설정.
		String saveFolder = "C:\\NCS\\workspace(jsp)\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\WatchaProject\\free_write_file";

		int fileSize = 10 * 1024 * 1024;
		
		MultipartRequest multi = new MultipartRequest(
				request,
				saveFolder,
				fileSize,
				"UTF-8",
				new DefaultFileRenamePolicy()
				);
		
		
		
		String free_title = multi.getParameter("free_title").trim();
		
		String free_cont = multi.getParameter("free_cont").trim();
		
		int free_num = Integer.parseInt(multi.getParameter("free_num").trim());
		
		String free_file = multi.getFilesystemName("free_file");
		
		if(free_file == null) {
			free_file = multi.getParameter("free_file_old");
		}
		
		FreeWriteDTO dto = new FreeWriteDTO();
		
		dto.setFree_title(free_title);
		dto.setFree_cont(free_cont);
		dto.setFree_num(free_num);
		dto.setFree_file(free_file);
		
		
		FreeWriteDAO dao = FreeWriteDAO.getInstance();
		
		int res = dao.freeModify(dto);
		
		ActionForward forward = new ActionForward();
		
		PrintWriter out = response.getWriter();
		
		if(res > 0) {
			forward.setRedirect(true);
			forward.setPath("free_content.do?num="+free_num);
			out.println("<script>");
			out.println("alert('수정완료')");
			out.println("</script>");
		}else {
			out.println("<script>");
			out.println("alert('수정시류ㅐ')");
			out.println("history.back()");
			out.println("</script>");
		}
		
		return forward;
		
		
	}

}
