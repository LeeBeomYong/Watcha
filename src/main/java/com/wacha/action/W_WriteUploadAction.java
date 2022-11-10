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
import com.wacha.model.W_WriteDTO;
import com.wacha.model.WriteDAO;

public class W_WriteUploadAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		//  
		
		W_WriteDTO dto = new W_WriteDTO();
		
		String saveFolder = "C:\\NCS\\workspace(jsp)\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\WatchaProject\\image\\profileupload";
		
		int fileSize = 10 * 1024 * 1024;
		
		MultipartRequest multi = new MultipartRequest(
				request,
				saveFolder,
				fileSize,
				"UTF-8",
				new DefaultFileRenamePolicy()
				);
				
		String w_id = multi.getParameter("w_id").trim();		
		String w_cont = multi.getParameter("w_cont").trim();
		
		File w_file = multi.getFile("w_file");
		
		if(w_file != null) {
			
			String fileName = w_file.getName();
			
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
			String reFileName = w_id +"_"+fileName;
			
			w_file.renameTo(new File(homedir+"/"+reFileName));
			
			// 실제로 DB에 저장되는 파일 이름
			// "/2022-10-11/홍길동_파일명" 으로 저장할 예정.
			String fileDBName = "/"+year+"-"+month+"-"+day+"/"+reFileName;			
			
			dto.setW_file(fileDBName);
		}
		
		dto.setW_id(w_id);
		dto.setW_cont(w_cont);
		
		WriteDAO dao = WriteDAO.getInstance();
		
		int res = dao.insertW_Write(dto);
		
		ActionForward forward = new ActionForward();
		
		PrintWriter out = response.getWriter();
		
		if(res > 0) {
			out.println("<script>");
			out.println("alert('1:1답변 등록 완료. 3일 내로 답변 드리겠습니다.')");
			out.println("</script>");
			forward.setRedirect(true);
			forward.setPath("inquiry_main.do");
		}else {
			out.println("<script>");
			out.println("alert('등록 시류ㅐ..')");
			out.println("history.back()");
			out.println("</script>");
		}
		
		return forward;
		
		
	}

}
