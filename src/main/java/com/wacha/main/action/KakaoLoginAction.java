package com.wacha.main.action;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.URL;

import javax.net.ssl.HttpsURLConnection;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.json.JSONParser;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;

import com.wacha.controller.Action;
import com.wacha.controller.ActionForward;

public class KakaoLoginAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		final String AUTH_HOST = "https://kauth.kakao.com";
	    final String tokenRequestUrl = AUTH_HOST + "/oauth/token";

	    String CLIENT_ID = "f106a112e059bfa2a2f1faeb9614402b"; // 해당 앱의 REST API KEY 정보. 개발자 웹사이트의 대쉬보드에서 확인 가능
	    String REDIRECT_URI = "http://localhost:8282/WatchaProject/kakao_login.do"; // 해당 앱의 설정된 uri. 개발자 웹사이트의 대쉬보드에서 확인 및 설정 가능
	    String code = request.getParameter("code"); // 로그인 과정중 얻은 authorization code 값
	    String client_secret = "DeYzztDpaObJ6RYsOzG4zCfduV2Y58FP";
	    
	    System.out.println(code);

	    HttpsURLConnection conn = null;
	    OutputStreamWriter writer = null;
	    BufferedReader reader = null;
	    InputStreamReader isr= null;

	    try {
	      final String params = String.format("grant_type=authorization_code&client_id=%s&redirect_uri=%s&code=%s&client_secret=%s", CLIENT_ID, REDIRECT_URI, code, client_secret);

	      final URL url = new URL(tokenRequestUrl);

	      conn = (HttpsURLConnection) url.openConnection();
	      conn.setRequestMethod("POST");
	      conn.setDoOutput(true);

	      writer = new OutputStreamWriter(conn.getOutputStream());
	      writer.write(params);
	      writer.flush();
	   
	      final int responseCode = conn.getResponseCode();
	      System.out.println("\nSending 'POST' request to URL : " + tokenRequestUrl);
	      System.out.println("Post parameters : " + params);
	      System.out.println("Response Code : " + responseCode);

	      isr = new InputStreamReader(conn.getInputStream());
	      reader = new BufferedReader(isr);
	      final StringBuffer buffer = new StringBuffer();
	      String line;
	      while ((line = reader.readLine()) != null) {
	        buffer.append(line);
	      }
	     
	      System.out.println(buffer.toString());
	      
	      JSONParser jsonParser = new JSONParser(buffer.toString());
	      
	      Object objBuffer = JSONValue.parse(buffer.toString());
	      
	      JSONObject jsonObj = (JSONObject) objBuffer;
	      
	      System.out.println("access_token : "+jsonObj.get("access_token"));
	      System.out.println("id_token : "+jsonObj.get("id_token"));
	      
	      //profile 받기(Resource Server)
			String endpoint2="https://kapi.kakao.com/v2/user/me";
			URL url2 =new URL(endpoint2);
			
			HttpsURLConnection conn2=(HttpsURLConnection)url2.openConnection();
			
			//header 값 넣기
			conn2.setRequestProperty("Authorization", "Bearer "+jsonObj.get("access_token"));
			conn2.setDoOutput(true);
			
			//request 하기
			BufferedReader br2=new BufferedReader(new InputStreamReader(conn2.getInputStream(),"UTF-8"));
			String input2="";
			StringBuilder sb2=new StringBuilder();
			while((input2=br2.readLine())!=null) {
				sb2.append(input2);
			}
			
			System.out.println("sb2.toString() : "+sb2.toString());
			
			JSONParser jsonParser2 = new JSONParser(sb2.toString());
		      
		    Object objBuffer2 = JSONValue.parse(sb2.toString());
		      
		    JSONObject jsonObj2 = (JSONObject) objBuffer2;
		    
		   //JSONArray arr = (JSONArray) jsonObj2.get("kakao_account");
		   
		    //System.out.println("arr : "+arr.get(7));
		    System.out.println("id : "+jsonObj2.get("id"));
		    
		    request.setAttribute("k_id", "k"+jsonObj2.get("id"));
		    
		    request.setAttribute("access_token", jsonObj.get("access_token"));
		    
	    } catch (IOException e) {
	      e.printStackTrace();
	    } finally {
	        // clear resources
	        if (writer != null) {
	          try {
	              writer.close();
	           } catch(Exception ignore) {
	           }
	        }
	        if (reader != null) {
	          try {
	              reader.close();
	          } catch(Exception ignore) {
	          }
	        }
	        if (isr != null) {
	            try {
	                isr.close();
	            } catch(Exception ignore) {
	            }
	         }
	    }
	    ActionForward forward = new ActionForward();
	    
	    forward.setRedirect(true);
	    forward.setPath("k_login.do");
		
	    
		return forward;
	}

}
