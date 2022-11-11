<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.OutputStreamWriter"%>
<%@page import="java.io.BufferedWriter"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.net.HttpURLConnection"%>
<%@page import="java.net.URL"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	/* 
	@ API LIST ~
	
	getUltraSrtNcst 초단기실황조회 
	getUltraSrtFcst 초단기예보조회 
	getVilageFcst 동네예보조회 
	getFcstVersion 예보버전조회
	*/
	String url = "http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getVilageFcst"
	+ "?serviceKey=일반인증키"
	+ "&dataType=JSON"            // JSON, XML
	+ "&numOfRows=10"             // 페이지 ROWS
	+ "&pageNo=1"                 // 페이지 번호
	+ "&base_date=20210517"       // 발표일자
	+ "&base_time=0800"           // 발표시각
	+ "&nx=60"                    // 예보지점 X 좌표
	+ "&ny=127";                  // 예보지점 Y 좌표
	
    
    url = "".equals("") ? url : url + "?request=" + "";
    
    
    URL apiURL = new URL(url);

    HttpURLConnection conn = null;
    BufferedReader br = null;
    BufferedWriter bw = null;

    HashMap<String, Object> resultMap = new HashMap<String, Object>();

    try {
        conn = (HttpURLConnection) apiURL.openConnection();
        conn.setConnectTimeout(5000);
        conn.setReadTimeout(5000);
        conn.setDoOutput(true);

        if (false) {
            conn.setRequestMethod("POST");
            conn.setRequestProperty("Content-Type", "application/json");
            conn.setRequestProperty("Accept", "*/*");
        } else {
            conn.setRequestMethod("GET");
        }

        conn.connect();

        if (false) {
            bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream(), "UTF-8"));
            bw.write("");
            bw.flush();
            bw = null;
        }

        br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));

        String line = null;

        StringBuffer result = new StringBuffer();

        while ((line=br.readLine()) != null) result.append(line);

       // ObjectMapper mapper = new ObjectMapper`();

      //  resultMap = mapper.readValue(result.toString(), HashMap.class);
    } catch (Exception e) {
        e.printStackTrace();
        throw new Exception(url + " interface failed" + e.toString());
    } finally {
        if (conn != null) conn.disconnect();
        if (br != null) br.close();
        if (bw != null) bw.close();
    }




%>