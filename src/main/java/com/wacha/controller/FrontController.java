package com.wacha.controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.lang.reflect.Constructor;
import java.util.Properties;
import java.util.StringTokenizer;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class FrontController extends HttpServlet{

	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		String command = request.getRequestURI().substring(request.getContextPath().length()+1); 
		System.out.println(command);
		
		Action action =null;
		ActionForward forward = null;
		
		/*
		 * java.util.Properties 클래스
		 * - Properties 클래스는 HashTable의 하위 클래스
		 * - 보통은 환경변수 및 속성 값을 Properties 파일에 저장해 쉽게 접근할 수 있는 장점이 있음
		 * - Properties 파일은 일련의 키(key) - 값(value)의 한 쌍으로 이뤄져있음
		 * - 보통은 파일에 저장해 사용함. 파일 이름을 *.properties 이름으로 끝나게 함
		 * - FileInputStream 클래스에 Properties 파일을 인자로 넣어 그 스트림으로부터 파일을 읽게 됨
		 * - 읽어들일 때 사용하는 메서드는 load()라는 메서드를 이용해 파일을 읽어들이게 됨
		 * 
		 */
		
		Properties pro = new Properties();

		FileInputStream fis = new FileInputStream("C:\\Users\\user\\git\\Watcha\\src\\main\\java\\com\\wacha\\controller\\mapping.properties");

pro.load(fis);
		String value = pro.getProperty(command);
		System.out.println("value >>> "+value);
		
		if(value.substring(0,7).equals("execute")) {
			StringTokenizer str = new StringTokenizer(value,"|");
			
			String str1 = str.nextToken();
			String str2 = str.nextToken();
			
			System.out.println(str1);
			System.out.println(str2);
			
			try {
				Class<?> url = Class.forName(str2);
				
				Constructor<?> constructor = url.getConstructor();
				action = (Action) constructor.newInstance();
				
				forward = action.execute(request, response);
				
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} 
		}else {// value 값이 "execute"가 아닌 경우 view page로 이동
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath(value);
		}	
		
		if(forward !=null) {
			if(forward.isRedirect()) {	// true인 경우
				
				response.sendRedirect(forward.getPath()); // 재요청함
				
			}else {	// false인 경우 view page로 이동
				RequestDispatcher rd = request.getRequestDispatcher(forward.getPath());
				rd.forward(request, response);
			}
		}
		
	
		
	}
}
