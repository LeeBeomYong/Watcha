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


public class WriteDAO {

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
		private static WriteDAO instance;
		
		private WriteDAO() {  }  // 기본 생성자
		
		
		// 3단계 : 기본 생성자 대신에 싱글턴 객체를 return 해 주는
		//        getInstance() 라는 메서드를 만들어서 해당
		//        getInstance() 라는 메서드를 외부에서 접근할 수
		//        있도록 해 주면 됨.
		public static WriteDAO getInstance() {
			
			if(instance == null) {
				instance = new WriteDAO();
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
				if(rs != null) rs.close();
				
				if(pstmt != null) pstmt.close();
				
				if(con != null) con.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
			
		}  // closeConn() 메서드 end
		
		public int loginCheck(String id, String pwd) {
			
			int result = 0;
			
			openConn();
						
			try {
				sql = "select * from member where member_id = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, id);
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					if(pwd.equals(rs.getString("member_pwd"))) {
					result = 1;
					}else {
						result = -1;
					}
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				closeConn(rs, pstmt, con);
			}
			return result;
		}
		
		
		public UserDTO getMember(String id) {
			
			UserDTO dto = null;
			
			openConn();

				try {
					sql = "select * from member where member_id = ?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, id);
					
					rs = pstmt.executeQuery();
					
					if(rs.next()) {
						
						dto = new UserDTO();
						
						dto.setMember_name(rs.getString("member_name"));
						dto.setMember_id(rs.getString("member_id"));
						dto.setMember_pwd(rs.getString("member_pwd"));
						dto.setMember_profile(rs.getString("member_profile"));
						dto.setMember_birth(rs.getString("member_birth"));
						dto.setMember_image(rs.getString("member_img"));
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}finally {
					closeConn(rs, pstmt, con);
					
				}
				return dto;
				
		}
		
	
		
		// write 테이블에서 전체 리스트 조회하는 메서드,
		public List<WriteDTO> getWriteList(int page, int rowsize){
			
			List<WriteDTO> list = new ArrayList<WriteDTO>();
			
			// 해당 페이지에서 시작번호
			int startNo = (page * rowsize) - (rowsize - 1);
			
			// 해당 페이지에서 끝 번호
			int endNo = (page * rowsize);		
			
			
			openConn();
						
			try {
				sql = "select * from (select row_number() over(order by write_num desc) rnum, b.* from write b) where rnum >=? and rnum <= ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, startNo);
				pstmt.setInt(2, endNo);				
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					
					WriteDTO dto = new WriteDTO();
					
					dto.setWrite_num(rs.getInt("write_num"));
					dto.setWrite_title(rs.getString("write_title"));
					dto.setWrite_cont(rs.getString("write_cont"));
					dto.setWrite_pwd(rs.getString("write_pwd"));
					dto.setWrite_hit(rs.getInt("write_hit"));
					dto.setWrite_date(rs.getString("write_date"));
					dto.setWrite_radio(rs.getString("write_radio"));
					dto.setWrite_reply(rs.getString("write_reply"));
					dto.setMember_id(rs.getString("member_id"));
					
					list.add(dto);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				closeConn(rs, pstmt, con);
			}
			return list;

		} // getWriteList() end 부분
		
		
		// 공지사항 뽑아오기.
		public List<NoticeDTO> getNoticeList(){
			
			List<NoticeDTO> list = new ArrayList<NoticeDTO>();
			
			openConn();
			
			try {
				sql = "select * from notice order by notice_num desc";
				pstmt = con.prepareStatement(sql);
				rs = pstmt.executeQuery();
				
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
				
			}
			return list;
		}
		
		
		// write 테이블에서 전체 리스트 조회하는 메서드,
		public List<WriteDTO> getWriteList1(){
			
			List<WriteDTO> list = new ArrayList<WriteDTO>();		
			
			openConn();
			
			try {
				sql = "select * from write order by write_num desc";
				pstmt = con.prepareStatement(sql);			
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					
					WriteDTO dto = new WriteDTO();
					
					dto.setWrite_num(rs.getInt("write_num"));
					dto.setWrite_cont(rs.getString("write_cont"));
					dto.setWrite_title(rs.getString("write_title"));
					dto.setWrite_pwd(rs.getString("write_pwd"));
					dto.setWrite_hit(rs.getInt("write_hit"));
					dto.setWrite_date(rs.getString("write_date"));
					dto.setWrite_radio(rs.getString("write_radio"));
					dto.setWrite_reply(rs.getString("write_reply"));
					dto.setMember_id(rs.getString("member_id"));
					
					list.add(dto);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				closeConn(rs, pstmt, con);
			}
			return list;
			
		} // getWriteList() end 부분
		
		
		
		
		// write 테이블에 데이터를 작성해서 추가하는 메서드.
		public int insertWrite(WriteDTO dto) {
			
			int result = 0, count = 0 ;
			
			openConn();
			
			try {
				sql = "select max(write_num) from write";
				pstmt = con.prepareStatement(sql);
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					count = rs.getInt(1) + 1;
				}
				
				sql = "insert into write values(?, ?, ?, ?, default, sysdate, ?, 0, ?)";
				
				pstmt = con.prepareStatement(sql);
				
				pstmt.setInt(1, count);
				pstmt.setString(2, dto.getWrite_title());
				pstmt.setString(3, dto.getWrite_cont());
				pstmt.setString(4, dto.getWrite_pwd());
				pstmt.setString(5, dto.getWrite_radio());
				pstmt.setString(6, dto.getMember_id());
				
				result = pstmt.executeUpdate();
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				closeConn(rs, pstmt, con);
			}
			return result;
		}
		
		
		public void writeHit(int num) {
			
			openConn();
						
			try {
				sql = "update write set write_hit = write_hit + 1 where write_num = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, num);
				pstmt.executeUpdate();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}closeConn(rs, pstmt, con);
			
		}
		
		
		
		public WriteDTO writeContent(int num) {
			
			WriteDTO dto = null;
			
			openConn();
			
			
			try {
				sql = "select * from write where write_num = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, num);
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					
					dto = new WriteDTO();
					
					dto.setWrite_num(rs.getInt("write_num"));
					dto.setWrite_title(rs.getString("write_title"));
					dto.setWrite_cont(rs.getString("write_cont"));
					dto.setWrite_pwd(rs.getString("write_pwd"));
					dto.setWrite_hit(rs.getInt("write_hit"));
					dto.setWrite_date(rs.getString("write_date"));
					dto.setWrite_reply(rs.getString("write_reply"));
					dto.setMember_id(rs.getString("member_id"));
					
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				closeConn(rs, pstmt, con);
			}
			return dto;


		}
		
		public int writeModify(WriteDTO dto) {
			
			int result = 0;
			
			openConn();
			
			try {
				sql = "select * from write where write_num = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, dto.getWrite_num());
				rs = pstmt.executeQuery();
				
				sql = "update write set write_title = ?, write_cont = ? where write_num = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, dto.getWrite_title());
				pstmt.setString(2, dto.getWrite_cont());
				pstmt.setInt(3, dto.getWrite_num());
				
				result = pstmt.executeUpdate();
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				closeConn(rs, pstmt, con);
			}
			return result;
		}
		
		public int writeDelete(int num) {
			
			int result = 0;
			
			openConn();
						
			try {
				sql = "delete from write where write_num = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, num);
				result = pstmt.executeUpdate();
				
				sql = "update write set write_num = write_num - 1 where write_num > ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, num);
				pstmt.executeUpdate();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}closeConn(rs, pstmt, con);
			
			return result;
			
		}


		
		public List<WriteDTO> userContentWrite(String id) {
			List<WriteDTO>list= new ArrayList<WriteDTO>();
			
			try {
				openConn();
				
				sql="select * from write where member_id=? order by write_num desc";
								
				pstmt=con.prepareStatement(sql);
				
				pstmt.setString(1, id);
				
				rs= pstmt.executeQuery();
				
				while(rs.next()) {
					WriteDTO dto=new WriteDTO();
					
					dto.setWrite_num(rs.getInt("write_num"));
					dto.setWrite_cont(rs.getString("write_cont"));
					dto.setWrite_title(rs.getString("write_title"));
					dto.setWrite_pwd(rs.getString("write_pwd"));
					dto.setWrite_hit(rs.getInt("write_hit"));
					dto.setWrite_date(rs.getString("write_date"));
					dto.setMember_id(rs.getString("member_id"));
					
					list.add(dto);
				}
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				closeConn(rs, pstmt, con);
			}return list;
		}

		// board 테이블의 전체 게시물의 수를 확인하는 메서드.
		public int getWriteCount() {
			
			int count = 0;
			
			openConn();
					
			try {
				sql = "select count(*) from write";
				
				pstmt = con.prepareStatement(sql);
				
				rs = pstmt.executeQuery();
				
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

		
		
		
		
		
		// =======================================================================================
		// 검색 시작.
		
		// board 테이블에서 검색어에 해당하는 게시물의 수를 조회하는 메서드.
		public int searchListCount(String field, String keyword) {
			
			int count = 0;
			
			openConn();
			
			if(field.equals("title")) {
				
				try {
					sql = "select count(*) from write where write_title like ?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, "%"+keyword+"%");
					rs = pstmt.executeQuery();
					
					if(rs.next()) {
						count = rs.getInt(1);
					}
					
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}else if(field.equals("cont")) {
					
					try {
						sql = "select count(*) from write where write_cont like ?";
						pstmt = con.prepareStatement(sql);
						pstmt.setString(1, "%"+keyword+"%");
						rs = pstmt.executeQuery();
						
						if(rs.next()) {
							count = rs.getInt(1);
						}
						
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
			}else if(field.equals("title_cont")) {
					
					try {
						sql = "select count(*) from board where write_title like ? write_cont like ?";
						pstmt = con.prepareStatement(sql);
						pstmt.setString(1, "%"+keyword+"%");
						pstmt.setString(2, "%"+keyword+"%");
						rs = pstmt.executeQuery();
						
						if(rs.next()) {
							count = rs.getInt(1);
						}
						
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					
			}else if(field.equals("writer")) {
					
					try {
						sql = "select count(*) from board where write_writer like ?";
						pstmt = con.prepareStatement(sql);
						pstmt.setString(1, "%"+keyword+"%");
						rs = pstmt.executeQuery();
						
						if(rs.next()) {
							count = rs.getInt(1);
						}
						
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
			return count;

		} // searchListCount() 메서드 end
		
		
		
		// board 테이블에서 검색한 내용을 가지고 페이징 처리를 하는 메서드.
		public List<WriteDTO> searchBoardList(String field, String keyword, int page, int rowsize){
			
			List<WriteDTO> list = new ArrayList<WriteDTO>();
			
			// 해당 페이지에서 시작 번호.
			int startNo = (page * rowsize) - (rowsize - 1);
			
			// 해당 페이지에서 마지막 번호.
			int endNo = (page * rowsize);
			
			openConn();
			
			if(field.equals("title")) {
				
				try {
					sql = "select * from (select row_number() over(order by write_num desc) rnum,"
							+ " b.* from write b where write_title like ?) where rnum >= ? and rnum <= ?";				
					
					pstmt = con.prepareStatement(sql);
					
					pstmt.setString(1, "%"+keyword+"%");
					pstmt.setInt(2, startNo);
					pstmt.setInt(3, endNo);
					
					rs = pstmt.executeQuery();
					
					while(rs.next()) {
						
						WriteDTO dto = new WriteDTO();
						
						dto.setWrite_num(rs.getInt("write_num"));
						dto.setWrite_title(rs.getString("write_title"));
						dto.setWrite_cont(rs.getString("write_cont"));
						dto.setWrite_pwd(rs.getString("write_pwd"));
						dto.setWrite_hit(rs.getInt("write_hit"));
						dto.setWrite_date(rs.getString("write_date"));
						dto.setWrite_radio(rs.getString("write_radio"));
						dto.setWrite_reply(rs.getString("write_reply"));
						dto.setMember_id(rs.getString("member_id"));
						
						list.add(dto);
					}
					
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}finally {
					closeConn(rs, pstmt, con);
				}
				
			}else if(field.equals("cont")) {
				
				try {
					sql = "select * from (select row_number() over(order by write_num desc) rnum,"
							+ " b.* from write b where write_cont like ?) where rnum >= ? and rnum <= ?";				
					
					pstmt = con.prepareStatement(sql);
					
					pstmt.setString(1, "%"+keyword+"%");
					pstmt.setInt(2, startNo);
					pstmt.setInt(3, endNo);
					
					rs = pstmt.executeQuery();
					
					while(rs.next()) {
						
						WriteDTO dto = new WriteDTO();
						
						dto.setWrite_num(rs.getInt("write_num"));
						dto.setWrite_title(rs.getString("write_title"));
						dto.setWrite_cont(rs.getString("write_cont"));
						dto.setWrite_pwd(rs.getString("write_pwd"));
						dto.setWrite_hit(rs.getInt("write_hit"));
						dto.setWrite_date(rs.getString("write_date"));
						dto.setWrite_radio(rs.getString("write_radio"));
						dto.setWrite_reply(rs.getString("write_reply"));
						dto.setMember_id(rs.getString("member_id"));
						
						list.add(dto);
					}
					
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}finally {
					closeConn(rs, pstmt, con);
				}
				
			}else if(field.equals("title_cont")) {
				
				try {
					sql = "select * from (select row_number() over(order by write_num desc) rnum,"
							+ " b.* from board b where write_title like ? or write_cont like ?) where rnum >= ? and rnum <= ?";				
					
					pstmt = con.prepareStatement(sql);
					
					pstmt.setString(1, "%"+keyword+"%");
					pstmt.setString(2, "%"+keyword+"%");
					pstmt.setInt(2, startNo);
					pstmt.setInt(3, endNo);
					
					rs = pstmt.executeQuery();
					
					while(rs.next()) {
						
						WriteDTO dto = new WriteDTO();
						
						dto.setWrite_num(rs.getInt("write_num"));
						dto.setWrite_title(rs.getString("write_title"));
						dto.setWrite_cont(rs.getString("write_cont"));
						dto.setWrite_pwd(rs.getString("write_pwd"));
						dto.setWrite_hit(rs.getInt("write_hit"));
						dto.setWrite_date(rs.getString("write_date"));
						dto.setWrite_radio(rs.getString("write_radio"));
						dto.setWrite_reply(rs.getString("write_reply"));
						dto.setMember_id(rs.getString("member_id"));
						
						list.add(dto);
					}
					
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}finally {
					closeConn(rs, pstmt, con);
				}
				
			}else if(field.equals("writer")) {
				
				try {
					sql = "select * from (select row_number() over(order by write_num desc) rnum,"
							+ " b.* from write b where member_id like ?) where rnum >= ? and rnum <= ?";				
					
					pstmt = con.prepareStatement(sql);
					
					pstmt.setString(1, "%"+keyword+"%");
					pstmt.setInt(2, startNo);
					pstmt.setInt(3, endNo);
					
					rs = pstmt.executeQuery();
					
					while(rs.next()) {
						
						WriteDTO dto = new WriteDTO();
						
						dto.setWrite_num(rs.getInt("write_num"));
						dto.setWrite_title(rs.getString("write_title"));
						dto.setWrite_cont(rs.getString("write_cont"));
						dto.setWrite_pwd(rs.getString("write_pwd"));
						dto.setWrite_hit(rs.getInt("write_hit"));
						dto.setWrite_date(rs.getString("write_date"));
						dto.setWrite_radio(rs.getString("write_radio"));
						dto.setWrite_reply(rs.getString("write_reply"));
						dto.setMember_id(rs.getString("member_id"));
						
						list.add(dto);
					}
					
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}finally {
					closeConn(rs, pstmt, con);
				}
			}
			return list;
		
		} // seacrhListBoard() 메서드 end		
		
		
		
// -------------------------이 부분은 1:1 게시판 부분 --------------------------------------------------------------------
		
		public int insertW_Write(W_WriteDTO dto) {
			
			int result = 0, count = 0;
			
			openConn();
						
			try {
				sql = "select max(w_num) from w_write";
				pstmt = con.prepareStatement(sql);
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					count = rs.getInt(1) + 1;
				}
				
				sql = "insert into w_write values(?, ?, sysdate, ?, '', ?)";
				pstmt = con.prepareStatement(sql);
				
				pstmt.setInt(1, count);
				pstmt.setString(2, dto.getW_cont());
				pstmt.setString(3, dto.getW_file());
				pstmt.setString(4, dto.getW_id());
				
				result = pstmt.executeUpdate();
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				closeConn(rs, pstmt, con);
			}
			return result;
		}
		
		
		public List<W_WriteDTO> getW_WriteList(){
			
			List<W_WriteDTO> list = new ArrayList<W_WriteDTO>();
			
			openConn();
						
			try {
				sql = "select * from w_write order by w_num desc";
				pstmt = con.prepareStatement(sql);
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					
					W_WriteDTO dto = new W_WriteDTO();
					
					dto.setW_num(rs.getInt("w_num"));
					dto.setW_cont(rs.getString("w_cont"));
					dto.setW_date(rs.getString("w_date"));
					dto.setW_file(rs.getString("w_file"));
					dto.setW_reply(rs.getString("w_reply"));
					dto.setW_id(rs.getString("member_id"));
					
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
		

		
		
		public W_WriteDTO w_writeContent(int num) {
			
			W_WriteDTO dto = null;
			
			openConn();
			
			try {
				sql = "select * from w_write where w_num = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, num);
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					
					dto = new W_WriteDTO();
					
					dto.setW_num(rs.getInt("w_num"));
					dto.setW_cont(rs.getString("w_cont"));
					dto.setW_date(rs.getString("w_date"));
					dto.setW_file(rs.getString("w_file"));
					dto.setW_reply(rs.getString("w_reply"));
					dto.setW_id(rs.getString("member_id"));
					
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				closeConn(rs, pstmt, con);
			}
			return dto;
		}
		
		
		public int w_writeDelete(int num) {
			
			int result = 0;
			
			openConn();
			
			try {
				sql = "delete from w_write where w_num = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, num);
				result = pstmt.executeUpdate();
				
				sql = "update w_write set w_num = w_num - 1 where w_num > ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, num);
				pstmt.executeUpdate();
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				closeConn(rs, pstmt, con);
			}
			return result;
		}
		
		
// -----------------이 부분은 문의 내역 게시판 부분 ------------------------
		
// -----------------공지사항 부분 ------------------------------------
	
	public void noticeHit(int no) {
		
		openConn();
		
		try {
			sql = "update notice set notice_hit = notice_hit + 1 where notice_num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, no);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}closeConn(rs, pstmt, con);		
		
	}
	
	
	public NoticeDTO noticeContent(int no) {
		
		NoticeDTO dto = null;
		
		openConn();
		
		try {
			sql = "select * from notice where notice_num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, no);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				dto = new NoticeDTO();
				
				dto.setNotice_num(rs.getInt("notice_num"));
				dto.setNotice_title(rs.getString("notice_title"));
				dto.setNotice_content(rs.getString("notice_content"));
				dto.setNotice_hit(rs.getInt("notice_hit"));
				dto.setNotice_date(rs.getString("notice_date"));
				
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			closeConn(rs, pstmt, con);
		}
		return dto;
		
	}
	
	
// ------------- 게시판 글 에 대한 답변 부분 ---------------------------------------
	
	public ReplyDTO writeReply(int num) {
		
		ReplyDTO dto = null;
		
		openConn();
		
		try {
			sql = "select * from reply where write_num = ? order by reply_num desc";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				dto = new ReplyDTO();
				
				dto.setReply_num(rs.getInt("reply_num"));
				dto.setReply_cont(rs.getString("reply_cont"));
				dto.setReply_date(rs.getString("reply_date"));
				dto.setWrite_num(rs.getInt("write_num"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			closeConn(rs, pstmt, con);
		}
		return dto;
	}
	
	
	public W_ReplyDTO w_replyContent(int num) {
		
		W_ReplyDTO dto = null;
		
		openConn();
		
		try {
			sql = "select * from w_reply where w_num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dto = new W_ReplyDTO();
				
				dto.setR_num(rs.getInt("r_num"));
				dto.setR_cont(rs.getString("r_cont"));
				dto.setR_date(rs.getString("r_date"));
				dto.setW_num(rs.getInt("w_num"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			closeConn(rs, pstmt, con);
		}
		return dto;
	}
	
	
	
	
	public int insertReply(ReplyDTO dto) {
		
		int result = 0, count = 0;
		
		openConn();
		
		try {
			sql = "select max(reply_num) from reply"; 
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				count = rs.getInt(1) + 1;
			}
			
			sql = "insert into reply values(?, ?, sysdate, ?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, count);
			pstmt.setString(2, dto.getReply_cont());
			pstmt.setInt(3, dto.getWrite_num());
			
			result = pstmt.executeUpdate();
			
			sql = "update write set write_reply = 1 where write_num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, dto.getWrite_num());
			pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			closeConn(rs, pstmt, con);
		}
		return result;
		
	}

	
	
	
	
}
