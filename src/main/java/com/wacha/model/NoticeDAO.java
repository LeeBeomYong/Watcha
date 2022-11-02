package com.wacha.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


public class NoticeDAO {

	// DB와 연동하는 객체.
		Connection con = null;
		
		// DB에 SQL문을 전송하는 객체
		PreparedStatement pstmt = null;
		
		// SQL문을 실행한 후에 결과 값을 가지고 있는 객체.
		ResultSet rs = null;
		
		// 쿼리문을 저장할 변수
		String sql = null;
		
		
		// 1단계 : 싱글턴 방식으로 객체를 만들기 위해서는 우선적으로
		//        기본생성자의 접근제어자를 public이 아닌 private
		//        으로 바꾸어 주어야 한다.
		//        즉, 외부에서 직접적으로 기본생성자를 호출하지
		//        못하게 하는 방법이다.
		
		// 2단계 : ProductDAO 객체를 정적(static) 멤버로 선언을 
		//        해 주어야 한다.
		private static NoticeDAO instance;
		
		private NoticeDAO() {  }  // 기본 생성자
		
		
		// 3단계 : 기본 생성자 대신에 싱글턴 객체를 return 해 주는
		//        getInstance() 라는 메서드를 만들어서 해당
		//        getInstance() 라는 메서드를 외부에서 접근할 수
		//        있도록 해 주면 됨.
		public static NoticeDAO getInstance() {
			
			if(instance == null) {
				instance = new NoticeDAO();
			}
			
			return instance;
		}
		
		
		// DB를 연동하는 작업을 진행하는 메서드.
		public void openConn() {
			
			try {
				// 1단계 : JNDI 서버 객체 생성
				Context ctx = new InitialContext();
				
				// 2단계 : lookup() 메서드를 이용하여 매칭되는
				//        커넥션을 찾는다.
				DataSource ds =
					(DataSource)ctx.lookup("java:comp/env/jdbc/myoracle");
				
				// 3단계 : DataSource 객체를 이용하여
				//        커넥션을 하나 가져온다.
				con = ds.getConnection();
				
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			
		}  // openConn() 메서드 end
		
		
		// DB에 연결된 자원 종료하는 메서드.
		public void closeConn(ResultSet rs,
				PreparedStatement pstmt, Connection con) {
			
			try {
				if(rs != null) rs.close();
				
				if(pstmt != null) pstmt.close();
				
				if(con != null) con.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
			
		}  // closeConn() 메서드 end
		public List<NoticeDTO>getnoticeList(){
			
			List<NoticeDTO>list = new ArrayList<NoticeDTO>();
			
			
			try {
				openConn();
					
				sql="select * from notice order by notice_num desc";
				
				pstmt=con.prepareStatement(sql);
				
				rs=pstmt.executeQuery();
				
				while(rs.next()) {
					
					NoticeDTO dto = new NoticeDTO();
					
					dto.setNotice_num(rs.getInt("notice_num"));
					
					dto.setNotice_title(rs.getString("notice_title"));
					
					dto.setNotice_content(rs.getString("notice_content"));
					
					dto.setNotice_hit(rs.getInt("notice_hit"));
					
					dto.setNotice_date(rs.getString("notice_date"));
					
					list.add(dto);
				}
				
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				closeConn(rs, pstmt, con);
			}return list;
			
			
			
		}//getnoticeList 메서드끝
			
		public int isertNotice(NoticeDTO dto) {
		int result=0 , count=0;
		
		try {
			
			openConn();
			
			sql="select max(notice_num) from notice";
			
			pstmt=con.prepareStatement(sql);
			
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				count=rs.getInt(1)+1;
				
			}
			
			sql="insert into notice values(?,?,?,default,sysdate)";
			
			pstmt=con.prepareStatement(sql);
			
			pstmt.setInt(1, count);
			
			pstmt.setString(2, dto.getNotice_title());
			
			pstmt.setString(3, dto.getNotice_content());
			
			result=pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			closeConn(rs, pstmt, con);
		}return result;
		
		
		}//isertNotice()끝
		
		public void noticeHit(int num) {
			
			
			try {
				openConn();
				
				sql="update notice set notice_hit = notice_hit+1  where notice_num=?";
				
				pstmt=con.prepareStatement(sql);
				
				pstmt.setInt(1, num);
				
				pstmt.executeUpdate();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				closeConn(rs, pstmt, con);
			}
			
			
			
		}//조회수 증가 메서드 끝
		
		public NoticeDTO noticeContent(int num) {
			NoticeDTO dto = null;
			
			try {
				
				openConn();
				
				sql="select * from notice where notice_num=?";
				
				pstmt=con.prepareStatement(sql);
				
				pstmt.setInt(1, num);
				
				rs=pstmt.executeQuery();
				
				if(rs.next()) {
					dto= new NoticeDTO();
					
					dto.setNotice_num(rs.getInt("notice_num"));
				
					dto.setNotice_title(rs.getString("notice_title"));
		
					dto.setNotice_content(rs.getString("notice_content"));
					
					dto.setNotice_hit(rs.getInt("notice_hit"));
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				closeConn(rs, pstmt, con);
			}return dto;
			
			
		}//end
		
		public int deleteNotice(int num){
			int result=0;
			
			
			try {
				openConn();
				
				sql="delete from notice where notice_num=?";
				
				pstmt=con.prepareStatement(sql);
				
				pstmt.setInt(1, num);
				
				result=pstmt.executeUpdate();
				
				sql="update notice set notice_num = notice_num-1 where notice_num>?";
				
				pstmt=con.prepareStatement(sql);
				
				pstmt.setInt(1, num);
				
				pstmt.executeUpdate();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				closeConn(rs, pstmt, con);
			}return result;
			
		}//end
			
		public int updateNotice(NoticeDTO dto) {
			
			int result=0;
			
			
			try {
				openConn();
				
				sql="update notice set notice_title=?,notice_content=? where notice_num=?";
				
				pstmt=con.prepareStatement(sql);
				
				pstmt.setString(1, dto.getNotice_title());
				
				pstmt.setString(2, dto.getNotice_content());
				
				pstmt.setInt(3, dto.getNotice_num());
				
				result = pstmt.executeUpdate();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				
				closeConn(rs, pstmt, con);
			}return result;
		}
	}


