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

import org.json.simple.JSONArray;

public class StarDAO {

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
			private static StarDAO instance;
			
			private StarDAO() {  }  // 기본 생성자
			
			
			// 3단계 : 기본 생성자 대신에 싱글턴 객체를 return 해 주는
			//        getInstance() 라는 메서드를 만들어서 해당
			//        getInstance() 라는 메서드를 외부에서 접근할 수
			//        있도록 해 주면 됨.
			public static StarDAO getInstance() {
				
				if(instance == null) {
					instance = new StarDAO();
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
						(DataSource)ctx.lookup("java:comp/env/jdbc/oracle");
					
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


			public StarDTO getStar(int movie_num, String member_id) {
				StarDTO dto=null;
				sql="select * from star where movie_num =? and member_id =?";
				openConn();
				try {
					pstmt=con.prepareStatement(sql);
					pstmt.setInt(1, movie_num);
					pstmt.setString(2, member_id);
					rs=pstmt.executeQuery();
					if(rs.next()) {
						dto= new StarDTO();
						dto.setMovie_num(rs.getInt("movie_num"));
						dto.setMember_id(rs.getString("member_id"));
						dto.setMovie_star(rs.getInt("movie_star"));
						dto.setMovie_heart(rs.getInt("movie_heart"));
						dto.setMovie_watch(rs.getInt("movie_watch"));
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}finally {
					closeConn(rs, pstmt, con);
				}
				return dto;
			}


			public double getStar(int movie_num) {
				openConn();
				double avgstar=0;
				sql="select round(avg(movie_star),1) from star where movie_num =? and movie_star != 0 ";
				try {
					pstmt=con.prepareStatement(sql);
					pstmt.setInt(1, movie_num);
					rs=pstmt.executeQuery();
					if(rs.next()) {
						avgstar=rs.getDouble(1);
					}
					System.out.println("영화 평점 평균 : "+avgstar);
					System.out.println(avgstar);
					
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				finally {
					closeConn(rs, pstmt, con);
				}
				return avgstar;
				
			}
			
			
			public String getEachStar(int movie_num) {
				
				openConn();
				sql="select movie_star from star where movie_num=? and movie_star !=0";
				
				int[] starList = new int[5];
				
				String rel = "";
				
				try {
					pstmt=con.prepareStatement(sql);
					pstmt.setInt(1, movie_num);
					
					rs=pstmt.executeQuery();
					
					while(rs.next()) {
						switch (rs.getInt(1)) {
						case 1:
							starList[0]++;				
							break;
						case 2:
							starList[1]++;					
							break;
						case 3:
							starList[2]++;						
							break;
						case 4:
							starList[3]++;	
							break;

						default:
							starList[4]++;
							break;
						}
					}
					rel +=starList[0]+",";
					rel +=starList[1]+",";
					rel +=starList[2]+",";
					rel +=starList[3]+",";
					rel +=starList[4];
					
					System.out.println(rel);
					
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}finally {
					closeConn(rs, pstmt, con);
				}
				
				return rel;
			}
			
			
			public void updateStar(String memberId,int movieNum,int star) {
				sql="update star set movie_star = ? where member_Id=? and movie_num=?";
				openConn();
				try {
					pstmt=con.prepareStatement(sql);
					pstmt.setInt(1, star);
					pstmt.setString(2, memberId);
					pstmt.setInt(3, movieNum);					
					pstmt.executeUpdate();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}finally {
					closeConn(rs, pstmt, con);
				}
				
			}
			
			public int reviewCheck(String id) {
				
				int count = 0;
				
				try {
					openConn();
					
					sql = "select count(movie_star) from star where member_id = ?";
					pstmt=con.prepareStatement(sql);
					pstmt.setString(1, id);
					rs=pstmt.executeQuery();
					
					if(rs.next()) {
						count = rs.getInt(1);
					}
					
					
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}finally {
					closeConn(rs, pstmt, con);
				}
				return count;
			}
			
			public int getMovieStarcount(int movie_num) {
				openConn();
				int count=0;
				sql="select count(movie_star) from star where movie_num=? and  movie_star != 0";			
				try {
					pstmt=con.prepareStatement(sql);
					pstmt.setInt(1, movie_num);
					rs=pstmt.executeQuery();
					
					if(rs.next()) {
						count=rs.getInt(1);
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}finally {
					closeConn(rs, pstmt, con);
				}
				return count;
				
			}
			public void updateWantSee(int movie_num,String member_Id,int countchk) {
				
				sql="update star set movie_heart = ? where movie_num=? and member_Id=?";
				openConn();
				try {
					pstmt=con.prepareStatement(sql);
					pstmt.setInt(1, countchk);
					pstmt.setInt(2, movie_num);
					pstmt.setString(3, member_Id);
					pstmt.executeUpdate();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}finally {
					closeConn(rs, pstmt, con);
				}
			}
			public void updateLooking(int movie_num,String member_Id,int lookchk) {
				if(lookchk==0) {
					sql="update star set movie_watch = ? where movie_num=? and member_Id=?";
				}else {
					sql="update star set movie_watch = ?, movie_heart=0 where movie_num=? and member_Id=?";
				}
				
				openConn();
				try {
					pstmt=con.prepareStatement(sql);
					pstmt.setInt(1, lookchk);
					pstmt.setInt(2, movie_num);
					pstmt.setString(3, member_Id);
					pstmt.executeUpdate();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}finally {
					closeConn(rs, pstmt, con);
				}
			}
			
			
			
			
			
			
			
			// 조장님 작업
			public List<MovieAndStarDTO> countryCheck(String id) {
				
				 List<MovieAndStarDTO> list = new ArrayList<MovieAndStarDTO>();

				 
				 try {
					openConn();
					 
					sql = "select movie_country, count(*) as movie_country_count from movie m, star s where m.movie_num = s.movie_num and member_id = ? group by movie_country";
					pstmt=con.prepareStatement(sql);
					pstmt.setString(1, id);
					rs=pstmt.executeQuery();
					
					while(rs.next()) {
						MovieAndStarDTO dto = new MovieAndStarDTO();
						
						dto.setMovie_country(rs.getString("movie_country"));
						dto.setMovie_country_count(rs.getInt("movie_country_count"));
						
						list.add(dto);
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} finally {
					closeConn(rs, pstmt, con);
				}
				return list;
			 }
			
			 public List<MovieAndStarDTO> genreCheck(String id) {
				 
				 List<MovieAndStarDTO> list = new ArrayList<MovieAndStarDTO>();
				 
				 try {
					 openConn();
					 sql = "select movie_genre, count(*) as movie_genre_count from movie m, star s where m.movie_num = s.movie_num and member_id = ? group by movie_genre";
					 pstmt = con.prepareStatement(sql);
					 pstmt.setString(1, id);
					 rs=pstmt.executeQuery();
					 
					 while(rs.next()) {
						 
						MovieAndStarDTO dto = new MovieAndStarDTO();
						
						dto.setMovie_genre(rs.getString("movie_genre"));
						dto.setMovie_genre_count(rs.getInt("movie_genre_count"));
							
						list.add(dto);
						 
					 }
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} finally {
					closeConn(rs, pstmt, con);
				}
				 return list;
			 }
			 
			 public int timeCheck(String id) {
				 
				 int sum = 0;
				 
				 try {
					 openConn();
					 sql="select movie_time from movie m, star s where m.movie_num = s.movie_num and member_id = ? group by movie_time";
					 pstmt=con.prepareStatement(sql);
					 pstmt.setString(1, id);
					 rs=pstmt.executeQuery();
					 
					 while(rs.next()) {
						 int temp = Integer.parseInt(rs.getString("movie_time").substring(0, 1));
						 sum += temp;
					 }
					 
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} finally {
					closeConn(rs, pstmt, con);
				}
				return sum;
			 }
			 	 
			 public JSONArray getUserStar(String id) {
				 
				 JSONArray jsonArray = new JSONArray();	
				 JSONArray colNameArray = new JSONArray();
				 
				 colNameArray.add("별점");
				 colNameArray.add("별점 준 수");
				 jsonArray.add(colNameArray);
				 
				 
				 try {
					openConn();
					sql="select movie_star, count(*) as star_count from star where member_id = ? group by movie_star";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, id);
					rs= pstmt.executeQuery();
					
					while(rs.next()) {
						JSONArray rowArray = new JSONArray();
						if(rs.getInt("movie_star") != 0) {
							rowArray.add(rs.getInt("movie_star"));
							rowArray.add(rs.getInt("star_count"));
							jsonArray.add(rowArray);
						}
						
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} finally {
					closeConn(rs, pstmt, con);
				}
				return jsonArray;
			 }
			 
			 // 별점준 평균보는 메서드
			 public double starAvg(String id) {
					
					double avg = 0;
					
					try {
						openConn();
						
						sql = "select round(avg(movie_star),1) from star where member_id = ?";
						pstmt=con.prepareStatement(sql);
						pstmt.setString(1, id);
						rs=pstmt.executeQuery();
						
						if(rs.next()) {
							avg = rs.getDouble(1);
						}
						
						
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}finally {
						closeConn(rs, pstmt, con);
					}
					return avg;
				}
			 
			 //별점준 영화가 몇개인지 확인하는 메서드
			 public int starCount(String id) {
					
					int count = 0;
					
					try {
						openConn();
						
						sql = "select count(movie_star) from star where member_id = ?";
						pstmt=con.prepareStatement(sql);
						pstmt.setString(1, id);
						rs=pstmt.executeQuery();
						
						if(rs.next()) {
							count = rs.getInt(1);
						}
						
						
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}finally {
						closeConn(rs, pstmt, con);
					}
					return count;
				}
			 
			 //평가한 영화중 별점을 가장 많이 준 별점이 몇개인지 확인하는 메서드
			 public int starMax(String id) {
					
					int star = 0;
					
					try {
						openConn();
						
						sql = "select movie_star, count(movie_star) as test from star where member_id = ? group by movie_star order by test desc";
						pstmt=con.prepareStatement(sql);
						pstmt.setString(1, id);
						rs=pstmt.executeQuery();
						
						if(rs.next()) {
							star=rs.getInt(1);
						}
						
						
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}finally {
						closeConn(rs, pstmt, con);
					}
					return star;
				}
			 //영화 찜하기 해놓은 목록 보는 메서드 
			 public int heartCount(String id) {
					
					int heart = 0;
					
					try {
						openConn();
						
						sql = "select count(movie_heart), member_id from star where member_id=? and movie_heart=1 group by member_id";
						pstmt=con.prepareStatement(sql);
						pstmt.setString(1, id);
						rs=pstmt.executeQuery();
						
						if(rs.next()) {
							heart=rs.getInt(1);
						}
						
						
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}finally {
						closeConn(rs, pstmt, con);
					}
					return heart;
				}
			 
			 // 영화 보는중 개수 확인하는 메서드
			 public int watchCount(String id) {
					
					int watch = 0;
					
					try {
						openConn();
						
						sql = "select count(movie_watch), member_id from star where member_id=? and movie_watch=1 group by member_id";
						pstmt=con.prepareStatement(sql);
						pstmt.setString(1, id);
						rs=pstmt.executeQuery();
						
						if(rs.next()) {
							watch=rs.getInt(1);
						}
						
						
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}finally {
						closeConn(rs, pstmt, con);
					}
					return watch;
				}
			 // 영화 평가한 목록 보는 메서드
			 public List<MovieTitleStarDTO> movieTitleStar(String id){
				 
				 List<MovieTitleStarDTO> list = new ArrayList<MovieTitleStarDTO>();
				 
				 
				 try {
					openConn();
					sql="select distinct m.movie_num as num, i.image_loc as img, m.movie_title as title, s.movie_star as star from star s, movie m, image i where s.movie_num = m.movie_num and s.movie_num = i.movie_num and movie_star > 0 and member_id=?";
					pstmt=con.prepareStatement(sql);
					pstmt.setString(1, id);
					rs=pstmt.executeQuery();
					
					while(rs.next()) {
						
						MovieTitleStarDTO dto = new MovieTitleStarDTO();
						
						dto.setMovie_num(rs.getInt("num"));
						dto.setImage_loc(rs.getString("img"));
						dto.setMovie_title(rs.getString("title"));
						dto.setMovie_star(rs.getString("star"));
						
						list.add(dto);
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} finally {
					closeConn(rs, pstmt, con);
				}
				return list;
				 
			 }
			 
			 //영화 보고싶어요 등록해놓은 영화 목록 보는 메서드
			 public List<MovieTitleStarDTO> movieTitleHeart(String id){
				 
				 List<MovieTitleStarDTO> list = new ArrayList<MovieTitleStarDTO>();
				 
				 
				 try {
					openConn();
					sql="select distinct m.movie_num as num, i.image_loc as img, m.movie_title as title from star s, movie m, image i where s.movie_num = m.movie_num and s.movie_num = i.movie_num and member_id=? and s.movie_heart = 1";
					pstmt=con.prepareStatement(sql);
					pstmt.setString(1, id);
					rs=pstmt.executeQuery();
					
					while(rs.next()) {
						
						MovieTitleStarDTO dto = new MovieTitleStarDTO();
						
						dto.setMovie_num(rs.getInt("num"));
						dto.setImage_loc(rs.getString("img"));
						dto.setMovie_title(rs.getString("title"));

						list.add(dto);
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} finally {
					closeConn(rs, pstmt, con);
				}
				return list;
				 
			 }
			 
			 //영화 보는중 등록해놓은 목록보는 메서드 
			 public List<MovieTitleStarDTO> movieTitleWatch(String id){
	 
				 List<MovieTitleStarDTO> list = new ArrayList<MovieTitleStarDTO>();
				 
				 
				 try {
					openConn();
					sql="select distinct m.movie_num as num, i.image_loc as img, m.movie_title as title from star s, movie m, image i where s.movie_num = m.movie_num and s.movie_num = i.movie_num and member_id=? and s.movie_watch = 1";
					pstmt=con.prepareStatement(sql);
					pstmt.setString(1, id);
					rs=pstmt.executeQuery();
					
					while(rs.next()) {
						
						MovieTitleStarDTO dto = new MovieTitleStarDTO();
						
						dto.setMovie_num(rs.getInt("num"));
						dto.setImage_loc(rs.getString("img"));
						dto.setMovie_title(rs.getString("title"));
						
						list.add(dto);
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} finally {
					closeConn(rs, pstmt, con);
				}
				return list;
			 }
			 
			 //영화 평가한 작품 년도순으로 정렬하는 메서드
			 public List<MovieTitleStarDTO> movieTitleStarYear(String id){
				 
				 List<MovieTitleStarDTO> list = new ArrayList<MovieTitleStarDTO>();
				 
				 
				 try {
					openConn();
					sql="select distinct m.movie_num as num, i.image_loc as img, m.movie_title as title, s.movie_star as star, m.movie_date as md from star s, movie m, image i where s.movie_num = m.movie_num and s.movie_num = i.movie_num and movie_star > 0 and member_id=? order by md";
					pstmt=con.prepareStatement(sql);
					pstmt.setString(1, id);
					rs=pstmt.executeQuery();
					
					while(rs.next()) {
						
						MovieTitleStarDTO dto = new MovieTitleStarDTO();
						
						dto.setMovie_num(rs.getInt("num"));
						dto.setImage_loc(rs.getString("img"));
						dto.setMovie_title(rs.getString("title"));
						dto.setMovie_star(rs.getString("star"));
						
						list.add(dto);
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} finally {
					closeConn(rs, pstmt, con);
				}
				return list;
				 
			 }
			 
			//영화 평가한 작품 제목순으로 정렬하는 메서드
			 public List<MovieTitleStarDTO> movieTitleStarTitle(String id){
				 
				 List<MovieTitleStarDTO> list = new ArrayList<MovieTitleStarDTO>();
				 
				 
				 try {
					openConn();
					sql="select distinct m.movie_num as num, i.image_loc as img, m.movie_title as title, s.movie_star as star, m.movie_date as md from star s, movie m, image i where s.movie_num = m.movie_num and s.movie_num = i.movie_num and movie_star > 0 and member_id=? order by title";
					pstmt=con.prepareStatement(sql);
					pstmt.setString(1, id);
					rs=pstmt.executeQuery();
					
					while(rs.next()) {
						
						MovieTitleStarDTO dto = new MovieTitleStarDTO();
						
						dto.setMovie_num(rs.getInt("num"));
						dto.setImage_loc(rs.getString("img"));
						dto.setMovie_title(rs.getString("title"));
						dto.setMovie_star(rs.getString("star"));
						
						list.add(dto);
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} finally {
					closeConn(rs, pstmt, con);
				}
				return list;
				 
			 }
			 
			//영화 평가한 작품 별점순으로 정렬하는 메서드
			 public List<MovieTitleStarDTO> movieTitleStar2(String id){
				 
				 List<MovieTitleStarDTO> list = new ArrayList<MovieTitleStarDTO>();
				 
				 
				 try {
					openConn();
					sql="select distinct m.movie_num as num, i.image_loc as img, m.movie_title as title, s.movie_star as star, m.movie_date as md from star s, movie m, image i where s.movie_num = m.movie_num and s.movie_num = i.movie_num and movie_star > 0 and member_id=? order by star desc";
					pstmt=con.prepareStatement(sql);
					pstmt.setString(1, id);
					rs=pstmt.executeQuery();
					
					while(rs.next()) {
						
						MovieTitleStarDTO dto = new MovieTitleStarDTO();
						
						dto.setMovie_num(rs.getInt("num"));
						dto.setImage_loc(rs.getString("img"));
						dto.setMovie_title(rs.getString("title"));
						dto.setMovie_star(rs.getString("star"));
						
						list.add(dto);
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} finally {
					closeConn(rs, pstmt, con);
				}
				return list;
			 }
			 
			//영화 보고싶어요 등록해놓은 영화 제목순으로 정렬하는 메서드
			 public List<MovieTitleStarDTO> movieTitleHeartTitle(String id){
				 
				 List<MovieTitleStarDTO> list = new ArrayList<MovieTitleStarDTO>();
				 
				 
				 try {
					openConn();
					sql="select distinct m.movie_num as num, i.image_loc as img, m.movie_title as title from star s, movie m, image i where s.movie_num = m.movie_num and s.movie_num = i.movie_num and member_id=? and s.movie_heart = 1 order by title";
					pstmt=con.prepareStatement(sql);
					pstmt.setString(1, id);
					rs=pstmt.executeQuery();
					
					while(rs.next()) {
						
						MovieTitleStarDTO dto = new MovieTitleStarDTO();
						
						dto.setMovie_num(rs.getInt("num"));
						dto.setImage_loc(rs.getString("img"));
						dto.setMovie_title(rs.getString("title"));

						list.add(dto);
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} finally {
					closeConn(rs, pstmt, con);
				}
				return list;
				 
			 }
			 //영화 보고싶어요 등록해놓은 영화 년도순으로 정렬하는 메서드
			 public List<MovieTitleStarDTO> movieTitleHeartYear(String id){
				 
				 List<MovieTitleStarDTO> list = new ArrayList<MovieTitleStarDTO>();
				 
				 
				 try {
					openConn();
					sql="select distinct m.movie_num as num, i.image_loc as img, m.movie_title as title, m.movie_date as md from star s, movie m, image i where s.movie_num = m.movie_num and s.movie_num = i.movie_num and member_id=? and s.movie_heart = 1 order by md desc";
					pstmt=con.prepareStatement(sql);
					pstmt.setString(1, id);
					rs=pstmt.executeQuery();
					
					while(rs.next()) {
						
						MovieTitleStarDTO dto = new MovieTitleStarDTO();
						
						dto.setMovie_num(rs.getInt("num"));
						dto.setImage_loc(rs.getString("img"));
						dto.setMovie_title(rs.getString("title"));
	
						list.add(dto);
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} finally {
					closeConn(rs, pstmt, con);
				}
				return list;
				 
			 }
			 
			 //영화 보는중 등록해놓은 목록 제목순으로 보는 메서드 
			 public List<MovieTitleStarDTO> movieTitleWatchTitle(String id){
	 
				 List<MovieTitleStarDTO> list = new ArrayList<MovieTitleStarDTO>();
				 
				 
				 try {
					openConn();
					sql="select distinct m.movie_num as num, i.image_loc as img, m.movie_title as title from star s, movie m, image i where s.movie_num = m.movie_num and s.movie_num = i.movie_num and member_id=? and s.movie_watch = 1 order by title";
					pstmt=con.prepareStatement(sql);
					pstmt.setString(1, id);
					rs=pstmt.executeQuery();
					
					while(rs.next()) {
						
						MovieTitleStarDTO dto = new MovieTitleStarDTO();
						
						dto.setMovie_num(rs.getInt("num"));
						dto.setImage_loc(rs.getString("img"));
						dto.setMovie_title(rs.getString("title"));
						
						list.add(dto);
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} finally {
					closeConn(rs, pstmt, con);
				}
				return list;
			 }
			 
			 //영화 보는중 등록해놓은 목록 제목순으로 보는 메서드 
			 public List<MovieTitleStarDTO> movieTitleWatchYear(String id){
	 
				 List<MovieTitleStarDTO> list = new ArrayList<MovieTitleStarDTO>();
				 
				 
				 try {
					openConn();
					sql="select distinct m.movie_num as num, i.image_loc as img, m.movie_title as title, m.movie_date as md from star s, movie m, image i where s.movie_num = m.movie_num and s.movie_num = i.movie_num and member_id=? and s.movie_watch = 1 order by md desc";
					pstmt=con.prepareStatement(sql);
					pstmt.setString(1, id);
					rs=pstmt.executeQuery();
					
					while(rs.next()) {
						
						MovieTitleStarDTO dto = new MovieTitleStarDTO();
						
						dto.setMovie_num(rs.getInt("num"));
						dto.setImage_loc(rs.getString("img"));
						dto.setMovie_title(rs.getString("title"));
						
						list.add(dto);
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} finally {
					closeConn(rs, pstmt, con);
				}
				return list;
			 }
			 
			// 메인 페이지 리스트 불러오기 (코멘트 TOP10)
				public List<StarDTO> getMainMovie_com() {
					
					List<StarDTO> list = new ArrayList<StarDTO>();
					
					try {
						openConn();
						
						sql = "select s.movie_num, avg(s.movie_star) avg, count(c.movie_coment) coments from star s, coment c where s.movie_num = c.movie_num group by s.movie_num order by coments desc, s.movie_num";
						
						pstmt = con.prepareStatement(sql);
						
						rs = pstmt.executeQuery();
						
						while(rs.next()) {
							StarDTO dto = new StarDTO();
							dto.setMovie_star(rs.getDouble("avg"));
							dto.setMovie_num(rs.getInt("movie_num"));
							
							list.add(dto);
						}
					} catch (SQLException e) {
						e.printStackTrace();
					} finally {
						closeConn(rs, pstmt, con);
					}
					return list;
				}	// getMainMovie_com() end
				
				// 메인 페이지 리스트 불러오기 (별점 TOP10)
				public List<StarDTO> getMainMovie_star() {
					List<StarDTO> list = new ArrayList<StarDTO>();
					
					try {
						openConn();
						
						sql = "select m.movie_num, m.movie_title, i.image_loc, avg(s.movie_star) avg from movie m, image i, star s where m.movie_num = i.movie_num and i.movie_num = s.movie_num group by m.movie_num, m.movie_title, i.image_loc order by avg desc, m.movie_num";
						
						pstmt = con.prepareStatement(sql);
						
						rs = pstmt.executeQuery();
						
						while(rs.next()) {
							StarDTO dto = new StarDTO();
							
							dto.setMovie_star(rs.getDouble("avg"));
							dto.setMovie_num(rs.getInt("movie_num"));
							
							list.add(dto);
						}
					} catch (SQLException e) {
						e.printStackTrace();
					} finally {
						closeConn(rs, pstmt, con);
					}
					return list;
				} // getMainMovie_star() end
				
				// 메인 페이지 리스트 불러오기 (찜하기 TOP10)
				public List<StarDTO> getMainMovie_heart() {
					
					List<StarDTO> list = new ArrayList<StarDTO>();
					
					try {
						openConn();
						
						sql = "select m.movie_num, avg(s.movie_star) as avg, sum(s.movie_heart) as heart from movie m, star s where m.movie_num = s.movie_num group by m.movie_num order by heart desc, m.movie_num";
						
						pstmt = con.prepareStatement(sql);
						
						rs = pstmt.executeQuery();
						
						while(rs.next()) {
							StarDTO dto = new StarDTO();
							
							dto.setMovie_num(rs.getInt("movie_num"));
							dto.setMovie_star(rs.getDouble("avg"));
							
							list.add(dto);
						}
					} catch (SQLException e) {
						e.printStackTrace();
					} finally {
						closeConn(rs, pstmt, con);
					}
					return list;
				} // getMainMovie_heart() end
				
				// 메인 - 실시간 급상승 TOP10 
				public List<StarDTO> getMainMovie_hit() {
					List<StarDTO> list = new ArrayList();
					
					try {
						openConn();
						
						sql = "select distinct m.movie_num, m.movie_title, i.image_loc, avg(s.movie_star) avg, sum(s.movie_watch) now from movie m, image i, star s where m.movie_num = i.movie_num and i.movie_num = s.movie_num group by m.movie_title, i.image_loc, m.movie_num order by now desc";
						
						pstmt = con.prepareStatement(sql);
						
						rs = pstmt.executeQuery();
						
						while(rs.next()) {
							
							StarDTO dto = new StarDTO();
							
							dto.setMovie_num(rs.getInt("movie_num"));
							dto.setMovie_star(rs.getDouble("avg"));
							dto.setMovie_watch(rs.getInt("now"));
							
							list.add(dto);
						}
					} catch (SQLException e) {
						e.printStackTrace();
					} finally {
						closeConn(rs, pstmt, con);
					}
					return list;
				}	
				
				
			public void chkId(int movie_num,String member_Id) {
				
				
				sql="select * from star where movie_num =? and member_Id=?";
				openConn();
				try {
					pstmt=con.prepareStatement(sql);
					pstmt.setInt(1, movie_num);
					pstmt.setString(2, member_Id);
					rs=pstmt.executeQuery();
					if(!rs.next()) {
						sql="insert into star values(?,?,0,default,default)";
						pstmt=con.prepareStatement(sql);
						pstmt.setInt(1, movie_num);
						pstmt.setString(2, member_Id);
						pstmt.executeUpdate();
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}finally {
					closeConn(rs, pstmt, con);
				}
			}
}


