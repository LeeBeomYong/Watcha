package com.wacha.profile.action;

import java.io.IOException;
import java.util.Date;
import java.util.Properties;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.wacha.controller.Action;
import com.wacha.controller.ActionForward;

public class SendAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		Properties props = System.getProperties();
        props.put("mail.smtp.user", "soopwe12@gmail.com"); // 서버 아이디만 쓰기
		props.put("mail.smtp.host", "smtp.gmail.com"); // 구글 SMTP
		props.put("mail.smtp.port", "587"); //465
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.debug", "true");
		props.put("mail.smtp.socketFactory.port", "587"); //465
		props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		props.put("mail.smtp.socketFactory.fallback", "true");
		props.put("mail.smtp.ssl.protocols", "TLSv1.2");
		
		Authenticator auth = new MyAuthentication();
		
        //session 생성 및  MimeMessage생성
        Session session = Session.getDefaultInstance(props, auth);
        MimeMessage msg = new MimeMessage(session);
        
        try{
            //편지보낸시간
            msg.setSentDate(new Date());
             
            InternetAddress from = new InternetAddress();             

            // 이메일 발신자
            msg.setFrom(from);           
             
            // 이메일 수신자
            String email = request.getParameter("receiver"); //사용자가 입력한 이메일 받아오기
            InternetAddress to = new InternetAddress(email);
            
            msg.setRecipient(Message.RecipientType.TO, to);
            
            // 이메일 제목
            msg.setSubject("왓챠피디아 탈퇴 인증번호", "UTF-8");
             
            // 이메일 내용 
            String code = request.getParameter("code_check"); //인증번호 값 받기
            
            request.setAttribute("code", code);
            msg.setText(code, "UTF-8");
             
            // 이메일 헤더 
            msg.setHeader("content-Type", "text/html");
             
            //메일보내기
            javax.mail.Transport.send(msg);
            
	        }catch (AddressException addr_e) {
	            addr_e.printStackTrace();
	        }catch (MessagingException msg_e) {
	            msg_e.printStackTrace();
	        }
	    	
	        ActionForward forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("lby/deletecheck.jsp");
			return forward;
        	
			}
	}

	class MyAuthentication extends Authenticator {
	    
	    PasswordAuthentication pa;
	    
	 
	    public MyAuthentication(){
	         
	        String id = "soopwe12@gmail.com";       // 구글 ID
	        String pw = "lgezfcfzoabqkbrg";          // 구글 비밀번호
	 
	        // ID와 비밀번호를 입력한다.
	        pa = new PasswordAuthentication(id, pw);
	      
	}
	    	// 시스템에서 사용하는 인증정보
		    public PasswordAuthentication getPasswordAuthentication() {
		        return pa;
		    }
	}
