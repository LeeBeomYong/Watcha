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

public class SingoDAO {
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
				private static SingoDAO instance;
				
				private SingoDAO() {  }  // 기본 생성자
				
				
				// 3단계 : 기본 생성자 대신에 싱글턴 객체를 return 해 주는
				//        getInstance() 라는 메서드를 만들어서 해당
				//        getInstance() 라는 메서드를 외부에서 접근할 수
				//        있도록 해 주면 됨.
				public static SingoDAO getInstance() {
					
					if(instance == null) {
						instance = new SingoDAO();
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
						if(con != null) con.close();
						if(pstmt != null) pstmt.close();
						if(rs != null) rs.close();
					}catch(Exception e) {
						e.printStackTrace();
					}
					
				}  // closeConn() 메서드 end


				public List<SingoDTO> getList() {
					sql="select * from singo  where singo_count !=0 order by member_id asc";
					openConn();
					List<SingoDTO> list = new ArrayList<SingoDTO>();
					try {
						pstmt=con.prepareStatement(sql);
						rs=pstmt.executeQuery();
						while(rs.next()) {
							SingoDTO dto = new SingoDTO();
							dto.setMember_Id(rs.getString("member_id"));
							dto.setSingo_Count(rs.getInt("singo_count"));
							list.add(dto);
						}
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}finally {
						closeConn(rs, pstmt, con);
					}
					return list;
				}


				public void updateSingo(String member_id,String session_id) {
					sql="select * from singo where member_id =?";
					System.out.println("여기여기여기>>>> "+session_id);
					String res="";
					String cur ="";
					String[] arr;
					int cnt=0;
					openConn();
					try {
						pstmt=con.prepareStatement(sql);
						pstmt.setString(1, member_id);
						rs=pstmt.executeQuery();
						
						if(!rs.next()) {
							sql="insert into singo values(?,default,'')";
							pstmt=con.prepareStatement(sql);
							pstmt.setString(1, member_id);
							pstmt.executeUpdate();
						}
						
						sql="select id_list from singo where member_id=?";
						pstmt=con.prepareStatement(sql);
						pstmt.setString(1, member_id);
						rs=pstmt.executeQuery();
						
						if(rs.next()) {
							if(rs.getString(1)!=null) {
								res+=rs.getString(1);
							}
						}
						System.out.println("여기여기 >>>> "+res);
						
						if(res!=null) {
							
							arr=res.split(",");
							
							for(String x : arr) {
								if(x.equals(session_id)) {
									cnt++;
									System.out.println("ㅇㅇ 들어옴");
								}
							}

						}
						
						if(cnt==0) {
							res+=session_id+",";
							System.out.println("업데이트 완완완완");
							sql="update singo set singo_count=singo_count+1, id_list = ?  where member_id=?";
							pstmt=con.prepareStatement(sql);
							pstmt.setString(1,res);
							pstmt.setString(2, member_id);
							pstmt.executeUpdate();
						}
						
						
						
						sql="select singo_count from singo where member_id=?";
						pstmt=con.prepareStatement(sql);
						pstmt.setString(1, member_id);
						rs=pstmt.executeQuery();
						if(rs.next()) {
							if(rs.getInt(1)>=5) {
								sql="update member set member_use = 0 where member_id=?";
								pstmt=con.prepareStatement(sql);
								pstmt.setString(1, member_id);
								pstmt.executeUpdate();
							}
						}
						
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}finally {
						closeConn(rs, pstmt, con);
					}
					
				}

}