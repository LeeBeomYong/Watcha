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


import com.wacha.model.ImageDTO;

public class ImageDAO {

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
			private static ImageDAO instance;
			
			private ImageDAO() {  }  // 기본 생성자
			
			
			// 3단계 : 기본 생성자 대신에 싱글턴 객체를 return 해 주는
			//        getInstance() 라는 메서드를 만들어서 해당
			//        getInstance() 라는 메서드를 외부에서 접근할 수
			//        있도록 해 주면 됨.
			public static ImageDAO getInstance() {
				
				if(instance == null) {
					instance = new ImageDAO();
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
	
			// 메인 페이지 영화 리스트 불러오기 (코멘트 TOP10)
			public List<ImageDTO> getMainMovie_com() {
				
				List<ImageDTO> list = new ArrayList<ImageDTO>();
				
				try {
					openConn();
					
					sql = "select i.movie_num, i.image_loc, count(c.movie_coment) as coments from image i, coment c where i.movie_num = c.movie_num group by i.movie_num, i.image_loc order by coments desc, i.movie_num";
					
					pstmt = con.prepareStatement(sql);
					
					rs = pstmt.executeQuery();
					
					while(rs.next()) {
						ImageDTO dto = new ImageDTO();
						
						dto.setMovie_num(rs.getInt("movie_num"));
						dto.setImage_loc(rs.getString("image_loc"));
						
						list.add(dto);
					}
				} catch (SQLException e) {
					e.printStackTrace();
				} finally {
					closeConn(rs, pstmt, con);
				}
				return list;
			}	// getMainMovie_com() end
			
			// 메인 페이지 영화 리스트 불러오기 (별점 TOP10)
			public List<ImageDTO> getMainMovie_star() {
				
				List<ImageDTO> list = new ArrayList<ImageDTO>();
				
				try {
					openConn();
					
					sql = "select m.movie_num, m.movie_title, i.image_loc, avg(s.movie_star) avg from movie m, image i, star s where m.movie_num = i.movie_num and i.movie_num = s.movie_num group by m.movie_num, m.movie_title, i.image_loc order by avg desc, m.movie_num";
					
					pstmt = con.prepareStatement(sql);
					
					rs = pstmt.executeQuery();
					
					while(rs.next()) {
						ImageDTO dto = new ImageDTO();
						
						dto.setMovie_num(rs.getInt("movie_num"));
						dto.setImage_loc(rs.getString("image_loc"));
						
						list.add(dto);
					}
				} catch (SQLException e) {
					e.printStackTrace();
				} finally {
					closeConn(rs, pstmt, con);
				}
				return list;
			}	// getMainMovie_star() end
			
			// 메인 페이지 영화 리스트 불러오기 (찜하기 TOP10)
			public List<ImageDTO> getMainMovie_heart() {
				
				List<ImageDTO> list = new ArrayList<ImageDTO>();
				
				try {
					openConn();
					
					sql = "select m.movie_num, m.movie_title, i.image_loc, sum(s.movie_heart) as heart from movie m, image i, star s where m.movie_num = s.movie_num and s.movie_num = i.movie_num group by m.movie_num, m.movie_title, i.image_loc order by heart desc, m.movie_num";
					
					pstmt = con.prepareStatement(sql);
					
					rs = pstmt.executeQuery();
					
					while(rs.next()) {
						ImageDTO dto = new ImageDTO();
						
						dto.setImage_loc(rs.getString("image_loc"));
						
						list.add(dto);
					}
				} catch (SQLException e) {
					e.printStackTrace();
				} finally {
					closeConn(rs, pstmt, con);
				}
				return list;
			}	// getMainMovie_heart() end
			
			// 메인 - 영화 리스트 불러오기 (실시간 급상승 TOP10)
			public List<ImageDTO> getMainMovie_hit() {
				
				List<ImageDTO> list = new ArrayList<ImageDTO>();
				
				try {
					openConn();
					
					sql = "select distinct m.movie_num, m.movie_title, i.image_loc, avg(s.movie_star) avg, sum(s.movie_watch) now from movie m, image i, star s where m.movie_num = i.movie_num and i.movie_num = s.movie_num group by m.movie_title, i.image_loc, m.movie_num order by now desc";
					
					pstmt = con.prepareStatement(sql);
					
					rs = pstmt.executeQuery();
					
					while(rs.next()) {
						
						ImageDTO dto = new ImageDTO();
						
						dto.setMovie_num(rs.getInt("movie_num"));
						dto.setImage_loc(rs.getString("image_loc"));
						
						list.add(dto);
					}			
				} catch (SQLException e) {
					e.printStackTrace();
				} finally {

					closeConn(rs, pstmt, con);
				}
				return list;
			}	// getMainMovie_hit() end	
			
			// 키워드에 해당하는 감독 이미지, 회원 프로필 가져오기
			public List<ImageDTO> getImageKeywordList(String keyword) {
				
				List<ImageDTO> list = new ArrayList<ImageDTO>();
				
				try {
					openConn();
					
					sql = "select i.movie_num, i.image_loc, i.director_image, i.image_temp from image i, (select movie_num from movie where movie_title like ? or movie_director like ?) m where m.movie_num = i.movie_num";
					
					pstmt = con.prepareStatement(sql);
					
					pstmt.setString(1, "%"+keyword+"%");
					pstmt.setString(2, "%"+keyword+"%");
					
					rs = pstmt.executeQuery();
					
					while(rs.next()) {
						
						ImageDTO dto = new ImageDTO();
						dto.setMovie_num(rs.getInt("movie_num"));
						//dto.setDirector_image(rs.getString("director_image"));
						dto.setImage_loc(rs.getString("image_loc"));
						dto.setImage_temp(rs.getString("image_temp"));
						dto.setDirector_image(rs.getString("director_image"));
						System.out.println("감독 이미지 : "+dto.getDirector_image());
						
						list.add(dto);
					}
				} catch (SQLException e) {
					e.printStackTrace();
				} finally {
					closeConn(rs, pstmt, con);
				}
				return list;
				
			}
			
			// 영화별 메인 이미지 및 갤러리 이미지 출력
			public String getMovieImage(int movie_num) {
				String res="";
				sql="select image_temp from image where movie_num=?";
				openConn();
				try {
					pstmt=con.prepareStatement(sql);
					pstmt.setInt(1, movie_num);
					rs=pstmt.executeQuery();
					if(rs.next()) {
						res=rs.getString(1);
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}finally {
					closeConn(rs, pstmt, con);
				}
				
				return res;
			}

			// 해당 번호 영화 dto 가져오자자
			public ImageDTO getMovie(int movie_num) {
				ImageDTO image_dto=null;
				sql="select * from image where movie_num=?";
				openConn();
				try {
					pstmt=con.prepareStatement(sql);
					pstmt.setInt(1, movie_num);
					rs=pstmt.executeQuery();
					if(rs.next()) {
						image_dto=new ImageDTO();
						image_dto.setDirector_image("director_image");
						image_dto.setImage_loc("image_loc");
						image_dto.setImage_temp("image_temp");
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}finally {
					closeConn(rs, pstmt, con);
				}
				
				return image_dto;
			}



}
