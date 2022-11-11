package com.wacha.action;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.wacha.controller.Action;
import com.wacha.controller.ActionForward;
import com.wacha.model.FreeWriteDAO;
import com.wacha.model.FreeWriteDTO;

public class FreeUploadAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		FreeWriteDTO dto = new FreeWriteDTO();
	
		String saveFolder = "C:\\Users\\by\\Desktop\\이범용_개발\\eclipse_pj\\eclipse-workspace(jsp)\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\WatchaProject\\free_write_file";

		int fileSize = 10 * 1024 * 1024;
		
		MultipartRequest multi = new MultipartRequest(
				request,
				saveFolder,
				fileSize,
				"UTF-8",
				new DefaultFileRenamePolicy()
				);
		
		String member_id = multi.getParameter("member_id").trim();
		String free_title = multi.getParameter("free_title").trim();
		String free_cont = multi.getParameter("free_cont").trim();
		int free_radio = Integer.parseInt(multi.getParameter("show"));
		File free_file = multi.getFile("free_file");

		if(free_file != null) {
			
			String fileName = free_file.getName();
			
			// 날짜 객체 생성
			Calendar cal = Calendar.getInstance();
			
			int year = cal.get(Calendar.YEAR);
			
			int month = cal.get(Calendar.MONTH) + 1;
			
			int day = cal.get(Calendar.DAY_OF_MONTH);
			
			// ....../upload/2022-10-11
			String homedir = saveFolder+"/"+year+"-"+month+"-"+day;
			
			File path1 = new File(homedir);
			
			if(!path1.exists()) {  // 폴더가 존재하지 않는 경우
				path1.mkdir();  // 실제 폴더를 만들어 주는 메서드.
			}
			
			// 파일을 만들어 보자 ==> 예) 홍길동_파일명
			// ....../upload/2022-10-11/홍길동_파일명
			String reFileName = member_id +"_"+fileName;
			
			free_file.renameTo(new File(homedir+"/"+reFileName));
			
			// 실제로 DB에 저장되는 파일 이름
			// "/2022-10-11/홍길동_파일명" 으로 저장할 예정.
			String fileDBName = "/"+year+"-"+month+"-"+day+"/"+reFileName;			
			
			dto.setFree_file(fileDBName);
		}		
		
		dto.setMember_id(member_id);
		dto.setFree_title(free_title);
		dto.setFree_radio(free_radio);
		dto.setFree_cont(free_cont);

		ActionForward forward = new ActionForward();
		FreeWriteDAO dao = FreeWriteDAO.getInstance();
		
		int res = dao.insertFreeUpload(dto);
		
		PrintWriter out = response.getWriter();
		
		
		if(res > 0) {
			forward.setRedirect(true);
			forward.setPath("free_main.do");
		}else {
			out.println("<script>");
			out.println("alert('빈칸을 입력하세요.')");
			out.println("history.back()");
			out.println("</script>");
			
		}
		
		return forward;
		
		
	}

}
