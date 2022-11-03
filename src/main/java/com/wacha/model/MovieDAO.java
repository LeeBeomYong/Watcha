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

import com.wacha.model.MovieDTO;


public class MovieDAO {
	

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
		private static MovieDAO instance;
		
		private MovieDAO() {  }  // 기본 생성자
		
		
		// 3단계 : 기본 생성자 대신에 싱글턴 객체를 return 해 주는
		//        getInstance() 라는 메서드를 만들어서 해당
		//        getInstance() 라는 메서드를 외부에서 접근할 수
		//        있도록 해 주면 됨.
		public static MovieDAO getInstance() {
			
			if(instance == null) {
				instance = new MovieDAO();
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


		// Content 상세페이지 번호별 내용 DTO 출력부 
		/**
		 * @param movie_num
		 * @return
		 */
		public MovieDTO getContentInfo(int movie_num) {
			MovieDTO dto=null;
			sql="select * from movie where movie_num=?";
			openConn();
			try {
				pstmt=con.prepareStatement(sql);
				pstmt.setInt(1, movie_num);
				rs=pstmt.executeQuery();
				if(rs.next()) {
					dto=new MovieDTO();
					dto.setMovie_num(rs.getInt("movie_num"));
					dto.setMovie_title(rs.getString("movie_title"));
					dto.setMovie_cont(rs.getString("movie_cont"));
					dto.setMovie_time(rs.getString("movie_time"));
					dto.setMovie_date(rs.getString("movie_date"));
					dto.setMovie_age(rs.getString("movie_age"));
					dto.setMovie_genre(rs.getString("movie_genre"));
					dto.setMovie_country(rs.getString("movie_country"));
					dto.setMovie_director(rs.getString("movie_director"));
					dto.setMovie_video(rs.getString("movie_video"));
				
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				closeConn(rs, pstmt, con);
			}
			
			return dto;
		}
		//
		public List<MovieDTO>getmovieList(){
			List<MovieDTO>list= new ArrayList<MovieDTO>();
			
			try {
				openConn();
				
				sql="select * from movie order by movie_num desc";
				
				pstmt=con.prepareStatement(sql);
				
				rs=pstmt.executeQuery();
				
				while(rs.next()) {
					MovieDTO dto = new MovieDTO();
					
					dto.setMovie_num(rs.getInt("movie_num"));
					
					dto.setMovie_title(rs.getString("movie_title"));
					
					dto.setMovie_cont(rs.getString("movie_cont"));
				
					dto.setMovie_time(rs.getString("movie_time"));
					
					dto.setMovie_date(rs.getString("movie_date"));
					
					dto.setMovie_age(rs.getString("movie_age"));
					
					dto.setMovie_genre(rs.getString("movie_genre"));
				
					dto.setMovie_director(rs.getString("movie_director"));	
					
					dto.setMovie_country(rs.getString("movie_country"));
					
					dto.setMovie_video(rs.getString("movie_video"));
					
			
					list.add(dto);
					
				
				
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				closeConn(rs, pstmt, con);
			}
			
			return list;
			
		
		}//end
		
		public int insertMovie(MovieDTO dto) {
			int result=0,count=0;
		
			
			try {
				openConn();
				
				sql="select max(movie_num) from movie";
			
				pstmt=con.prepareStatement(sql);
				
				rs=pstmt.executeQuery();
				
				if(rs.next()) {
					count=rs.getInt(1)+1;
				}
				sql="insert into movie values(?,?,?,?,?,?,?,?,?,?,?,?)";
				
				pstmt=con.prepareStatement(sql);
				
				pstmt.setInt(1, count);
				
				pstmt.setString(2, dto.getMovie_title());
				
				pstmt.setString(3, dto.getMovie_cont());
				
				pstmt.setString(4, dto.getMovie_time());
				
				pstmt.setString(5, dto.getMovie_date());
				
				pstmt.setString(6, dto.getMovie_age());
				
				pstmt.setString( 7, dto.getMovie_genre());
			
				pstmt.setString(8, dto.getMovie_country());
				
				pstmt.setString(9, dto.getMovie_director());
				
				pstmt.setString(10, dto.getMovie_video());
					
				pstmt.setInt(11, dto.getMovie_count());
				
				pstmt.setInt(12, dto.getMovie_hit());
				
				result=pstmt.executeUpdate();                               
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				closeConn(rs, pstmt, con);
				
			}
			return result;
			}//end
	
		public MovieDTO movieContent(int num) {
			MovieDTO dto = null;
			
			try {
				openConn();
				
				sql="select * from movie where movie_num = ?";
				
				pstmt=con.prepareStatement(sql);
				
				pstmt.setInt(1, num);
				
				rs=pstmt.executeQuery();
				
				if(rs.next()) {
					dto= new MovieDTO();
					
					dto.setMovie_num(rs.getInt("movie_num"));
					
					dto.setMovie_title(rs.getString("movie_title"));
					
					dto.setMovie_cont(rs.getString("movie_cont"));
				
					dto.setMovie_time(rs.getString("movie_time"));
					
					dto.setMovie_date(rs.getString("movie_date"));
					
					dto.setMovie_age(rs.getString("movie_age"));
					
					dto.setMovie_genre(rs.getString("movie_genre"));
				
					dto.setMovie_director(rs.getString("movie_director"));	
					
					dto.setMovie_country(rs.getString("movie_country"));
					
					dto.setMovie_video(rs.getString("movie_video"));
					
				}
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				closeConn(rs, pstmt, con);
			}return dto;
		}
		
		public int updateMovie(MovieDTO dto) {
			
			int result=0;
			
			try {
				openConn();
				
				sql="update movie set movie_video=?, movie_title=?, movie_cont=?, movie_time=?, movie_date=?, movie_age=?, movie_genre=?, movie_director=?, movie_country=? where movie_num=?";
				
				pstmt=con.prepareStatement(sql);
				
				pstmt.setString(1, dto.getMovie_video());
				
				pstmt.setString(2, dto.getMovie_title());
				
				pstmt.setString(3, dto.getMovie_cont());
				
				pstmt.setString(4, dto.getMovie_time());
				
				pstmt.setString(5, dto.getMovie_date());
				
				pstmt.setString(6, dto.getMovie_age());
				
				pstmt.setString(7, dto.getMovie_genre());
				
				pstmt.setString(8, dto.getMovie_director());
				
				pstmt.setString(9, dto.getMovie_country());
				
				pstmt.setInt(10, dto.getMovie_num());
				
				result=pstmt.executeUpdate();
				
				System.out.println("result>>"+result);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				closeConn(rs, pstmt, con);
			}
			return result;
		}
		
		// 메인 페이지 영화 제목 불러오기 (코멘트 TOP10)
		public List<MovieDTO> getMainMovie_com() {
			
			List<MovieDTO> list = new ArrayList<MovieDTO>();
			
			try {
				openConn();
				
				sql = "select m.movie_num, m.movie_title, count(c.movie_coment) as coments from movie m, coment c where m.movie_num = c.movie_num group by m.movie_title, m.movie_num order by coments desc, m.movie_num";
				
				pstmt = con.prepareStatement(sql);
				
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					MovieDTO dto = new MovieDTO();
					
					dto.setMovie_num(rs.getInt("movie_num"));
					dto.setMovie_title(rs.getString("movie_title"));
					
					list.add(dto);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				closeConn(rs, pstmt, con);
			}
			return list;
		}	// getMainMovie_com() end
		
		// 메인 페이지 영화 제목 불러오기 (별점 TOP10)
		public List<MovieDTO> getMainMovie_star() {
			
			List<MovieDTO> list = new ArrayList<MovieDTO>();
			
			try {
				openConn();
				
				sql = "select m.movie_num, m.movie_title, i.image_loc, avg(s.movie_star) avg from movie m, image i, star s where m.movie_num = i.movie_num and i.movie_num = s.movie_num group by m.movie_num, m.movie_title, i.image_loc order by avg desc, m.movie_num";
				
				pstmt = con.prepareStatement(sql);
				
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					MovieDTO dto = new MovieDTO();
					
					dto.setMovie_num(rs.getInt("movie_num"));
					dto.setMovie_title(rs.getString("movie_title"));
					
					list.add(dto);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				closeConn(rs, pstmt, con);
			}
			return list;
		}	// getMainMovie_star() end
		
		// 메인 페이지 영화 제목 불러오기 (찜하기 TOP10)
		public List<MovieDTO> getMainMovie_heart() {
			
			List<MovieDTO> list = new ArrayList<MovieDTO>();
			
			try {
				openConn();
				
				sql = "select m.movie_num, m.movie_title, i.image_loc, sum(s.movie_heart) as heart from movie m, image i, star s where m.movie_num = s.movie_num and s.movie_num = i.movie_num group by m.movie_num, m.movie_title, i.image_loc order by heart desc, m.movie_num";
				
				pstmt = con.prepareStatement(sql);
				
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					MovieDTO dto = new MovieDTO();
					
					dto.setMovie_title(rs.getString("movie_title"));
					
					list.add(dto);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				closeConn(rs, pstmt, con);
			}
			return list;
		}	// getMainMovie_heart() end
		
		// 메인 - 실시간 급상승 TOP10 
		public List<MovieDTO> getMainMovie_hit() {
			
			List<MovieDTO> list = new ArrayList();
			
			try {
				openConn();
				
				sql = "select distinct m.movie_num, m.movie_title, i.image_loc, avg(s.movie_star) avg, sum(s.movie_watch) now from movie m, image i, star s where m.movie_num = i.movie_num and i.movie_num = s.movie_num group by m.movie_title, i.image_loc, m.movie_num order by now desc";
				
				pstmt = con.prepareStatement(sql);
				
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					MovieDTO dto = new MovieDTO();
					
					dto.setMovie_num(rs.getInt("movie_num"));
					dto.setMovie_title(rs.getString("movie_title"));
					
					list.add(dto);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				closeConn(rs, pstmt, con);
			}
			return list;
		}	// getMainMovie_hit() end
	
		// 키워드 : 영화 제목,감독 검색 메서드
		public List<MovieDTO> getMovieKeywordList(String keyword) {
			
			List<MovieDTO> list = new ArrayList<MovieDTO>();

			try {
				openConn();
				
				sql = "select movie_num, movie_title, movie_director, movie_country from movie where movie_title like ? order by movie_num";
				
				pstmt = con.prepareStatement(sql);
				
				pstmt.setString(1, "%"+keyword+"%");
				
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					
					MovieDTO dto = new MovieDTO();
					
					dto.setMovie_num(rs.getInt("movie_num"));
					dto.setMovie_title(rs.getString("movie_title"));
					dto.setMovie_director(rs.getString("movie_director"));
					dto.setMovie_country(rs.getString("movie_country"));
					
					list.add(dto);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				closeConn(rs, pstmt, con);
			}
			return list;
		}	// getMovieKeywordList() end

		// 메인 -> 영화 페이지 넘겨주는 메서드
		public MovieDTO getMovie_info(int movie_num) {
			MovieDTO dto = null;
			
			try {
				openConn();
				
				sql = "select * from movie where movie_num = ?";
				
				pstmt = con.prepareStatement(sql);
				
				pstmt.setInt(1, movie_num);
				
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					dto = new MovieDTO();
					
					dto.setMovie_num(rs.getInt("movie_num"));
					dto.setMovie_title(rs.getString("movie_title"));
					dto.setMovie_cont(rs.getString("movie_cont"));
					dto.setMovie_time(rs.getString("movie_time"));
					dto.setMovie_date(rs.getString("movie_date"));
					dto.setMovie_age(rs.getString("movie_age"));
					dto.setMovie_genre(rs.getString("movie_genre"));
					dto.setMovie_country(rs.getString("movie_country"));
					dto.setMovie_director(rs.getString("movie_director"));
					dto.setMovie_video(rs.getString("movie_video"));
					dto.setMovie_count(rs.getInt("movie_count"));
					dto.setMovie_hit(rs.getInt("movie_hit"));

				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				closeConn(rs, pstmt, con);
			}
			return dto;
		}

		// 감독별 영화 리스트
		public List<MovieAndStarDTO> getMovieList(String director) {
			openConn();
			
			String sql2="";
			PreparedStatement pstmt2=null;
			ResultSet rs2=null;
			
			List<MovieAndStarDTO> list = new ArrayList<MovieAndStarDTO>();
			sql="select m.movie_num, m.movie_date, m.movie_title, m.movie_director,i.image_loc "
					+ "from movie m,image i "
					+ "where m.movie_num = i.movie_num and m.movie_director = ? "
					+ "group by m.movie_num, m.movie_date, m.movie_title, m.movie_director, i.image_loc";
			try {
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1, director);
				rs=pstmt.executeQuery();
				while(rs.next()) {
					MovieAndStarDTO movie_star_dto = new MovieAndStarDTO();
					movie_star_dto.setMovie_date(rs.getString(2));
					movie_star_dto.setMovie_title(rs.getString(3));
					movie_star_dto.setMovie_director(rs.getString(4));
					movie_star_dto.setMovie_imageloc(rs.getString(5));
					
					sql2="select round(avg(movie_star),1) from star where movie_num = ?";
					
					pstmt2=con.prepareStatement(sql2);
					pstmt2.setInt(1, rs.getInt(1));
					rs2=pstmt2.executeQuery();
					if(rs2.next()) {
						movie_star_dto.setMovie_avgstar(rs2.getDouble(1));
					}
					
					list.add(movie_star_dto);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				closeConn(rs, pstmt, con);
				closeConn(rs2, pstmt2, con);
			}
			
			return list;
			
		}


		public List<MovieImageDTO> getMovie_genre(String movie_genre) {
			
			List<MovieImageDTO> list = new ArrayList<MovieImageDTO>();
			String sql2="";
			PreparedStatement pstmt2=null;
			ResultSet rs2=null;
			sql="select m.movie_num,i.image_loc,m.movie_title,m.movie_genre "
					+ "from movie m, image i "
					+ "where m.movie_num = i.movie_num and m.movie_genre =? "
					+ "group by m.movie_num,i.image_loc,m.movie_title,m.movie_genre";
			openConn();
			try {
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1, movie_genre);
				rs=pstmt.executeQuery();
				
				while(rs.next()) {
					MovieImageDTO dto = new MovieImageDTO();
					dto.setMovie_num(rs.getInt("movie_num"));
					dto.setMovie_title(rs.getString("movie_title"));
					dto.setMovie_genre(rs.getString("movie_genre"));
					dto.setMovie_imgloc(rs.getString("image_loc"));
					
					sql2="select round(avg(movie_star),1) from star where movie_num = ?";
					pstmt2=con.prepareStatement(sql2);
					pstmt2.setInt(1, dto.getMovie_num());
					rs2=pstmt2.executeQuery();
					if(rs2.next()) {
						dto.setMovie_avgstar(rs.getDouble(1));
					}
					
					list.add(dto);
				}
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				closeConn(rs, pstmt, con);
				closeConn(rs2, pstmt2, con);

			}
			
			return list;
		}
}

