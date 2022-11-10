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

public class FreeWriteDAO {

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
	private static FreeWriteDAO instance;
	
	private FreeWriteDAO() {  }  // 기본 생성자
	
	
	// 3단계 : 기본 생성자 대신에 싱글턴 객체를 return 해 주는
	//        getInstance() 라는 메서드를 만들어서 해당
	//        getInstance() 라는 메서드를 외부에서 접근할 수
	//        있도록 해 주면 됨.
	public static FreeWriteDAO getInstance() {
		
		if(instance == null) {
			instance = new FreeWriteDAO();
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
	
	
	public List<FreeWriteDTO> getFreeList(int page, int rowsize){
		
		List<FreeWriteDTO> list = new ArrayList<FreeWriteDTO>();
		
		// 해당 페이지에서 시작번호
		int startNo = (page * rowsize) - (rowsize - 1);
		
		// 해당 페이지에서 끝 번호
		int endNo = (page * rowsize);	
		
		openConn();
		
		try {
			sql = "select * from (select row_number() over(order by free_num desc) rnum, b.* from free_write b) where rnum >= ? and rnum <= ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startNo);
			pstmt.setInt(2, endNo);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				FreeWriteDTO dto = new FreeWriteDTO();
				
				dto.setFree_num(rs.getInt("free_num"));
				dto.setFree_title(rs.getString("free_title"));
				dto.setFree_cont(rs.getString("free_cont"));
				dto.setFree_hit(rs.getInt("free_hit"));
				dto.setFree_date(rs.getString("free_date"));
				dto.setFree_file(rs.getString("free_file"));
				dto.setFree_radio(rs.getInt("free_radio"));
				dto.setFree_reply_num(rs.getInt("free_reply_num"));
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
		
	}
	
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
	
	
	public int getFreeCount() {
		
		int count = 0;
		
		openConn();
				
		try {
			sql = "select count(*) from free_write";
			
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

	public FreeWriteDTO getFreeContent(int num) {
		
		FreeWriteDTO dto = null;
		
		openConn();
		
		try {
			
			sql = "select * from free_write where free_num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				dto = new FreeWriteDTO();
				
				dto.setFree_num(rs.getInt("free_num"));
				dto.setFree_title(rs.getString("free_title"));
				dto.setFree_cont(rs.getString("free_cont").replace("\r\n","<br>"));
				dto.setFree_hit(rs.getInt("free_hit"));
				dto.setFree_date(rs.getString("free_date"));
				dto.setFree_file(rs.getString("free_file"));
				dto.setFree_radio(rs.getInt("free_radio"));
				dto.setFree_reply_num(rs.getInt("free_reply_num"));
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
	public FreeWriteDTO getFreeContent1(int num) {
		
		FreeWriteDTO dto = null;
		
		openConn();
		
		try {
			
			sql = "select * from free_write where free_num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				dto = new FreeWriteDTO();
				
				dto.setFree_num(rs.getInt("free_num"));
				dto.setFree_title(rs.getString("free_title"));
				dto.setFree_cont(rs.getString("free_cont").replace("<br>","\r\n"));
				dto.setFree_hit(rs.getInt("free_hit"));
				dto.setFree_date(rs.getString("free_date"));
				dto.setFree_file(rs.getString("free_file"));
				dto.setFree_radio(rs.getInt("free_radio"));
				dto.setFree_reply_num(rs.getInt("free_reply_num"));
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
	
	
	public void freeHit(int num) {
		
		openConn();
					
		try {
			sql = "update free_write set free_hit = free_hit + 1 where free_num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			closeConn(rs, pstmt, con);
		}
		
	}
	
	// 댓글 숫자.
	public void freeReplyCount(int num) {
		
		openConn();
		
		try {
			sql = "update free_write set free_reply_num = free_reply_num + 1 where free_num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			closeConn(rs, pstmt, con);
		}
	}
	
	public int insertFreeUpload(FreeWriteDTO dto) {
		
		int result = 0, count = 0;
		
		openConn();
		
		try {
			sql = "select max(free_num) from free_write";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				count = rs.getInt(1)+1;
			}
			
			sql = "insert into free_write values(?, ?, ?, 0, sysdate, ?, ?, 0, ?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, count);
			pstmt.setString(2, dto.getFree_title());
			pstmt.setString(3, dto.getFree_cont());
			pstmt.setString(4, dto.getFree_file());
			pstmt.setInt(5, dto.getFree_radio());
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
	
	
	public int freeDelete(int num) {
		
		int result = 0;
		
		openConn();
				
		try {
			sql = "delete from free_write where free_num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			result = pstmt.executeUpdate();
			
			sql = "update free_write set free_num = free_num - 1 where free_num > ?";
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
	
	public int freeModify(FreeWriteDTO dto) {
		
		int result = 0;
		
		openConn();
				
		try {
			sql = "select * from free_write where free_num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, dto.getFree_num());
			rs = pstmt.executeQuery();
			
			sql = "update free_write set free_title = ?, free_cont = ?, free_file = ? where free_num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getFree_title());
			pstmt.setString(2, dto.getFree_cont());
			pstmt.setString(3, dto.getFree_file());
			pstmt.setInt(4, dto.getFree_num());
			
			result = pstmt.executeUpdate();
		
			
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			closeConn(rs, pstmt, con);
		}
		return result;
		
	}
	
	
	// 글번호에 해당하는 댓글 리스트를 조회하는 메서드.--------------------------------
	// 답변글을 tbl_reply 테이블에 저장하는 메서드.
	public int replyInsert(FreeReplyDTO dto) {
		
		int result = 0, count = 0;
		
		openConn();
				
		try {
			sql = "select max(r_free_num) from free_reply";	//여기서 rno란 답변 글 번호이다.
			
			pstmt = con.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				count = rs.getInt(1) + 1;
			}
			
			sql = "insert into free_reply values(?, ?, sysdate, ?, ?)";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, count);
			pstmt.setString(2, dto.getR_free_cont()); 	// 여기서 Bno란 원글의 글번호
			pstmt.setInt(3, dto.getFree_num());
			pstmt.setString(4, dto.getMember_id());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			closeConn(rs, pstmt, con);
		}
		return result;
		
	} // replyInsert() 메서드 end
		
	
	// 글번호에 해당하는 댓글 리스트를 조회하는 메서드.
	public String getReplyList(int no) {
		
		String result = "";
		
		openConn();
				
		try {
			sql = "select * from free_reply where free_num = ? order by r_free_date desc";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, no);
			
			rs = pstmt.executeQuery();
			
			result += "<replys>";
			
			while(rs.next()) {
				
				result += "<reply>";
				result += "<r_free_num>" + rs.getInt("r_free_num") + "</r_free_num>";
				result += "<free_num>" + rs.getInt("free_num") + "</free_num>";
				result += "<member_id>" + rs.getString("member_id") + "</member_id>";
				result += "<r_free_cont>" + rs.getString("r_free_cont") + "</r_free_cont>";
				result += "<r_free_date>" + rs.getString("r_free_date") + "</r_free_date>";
				result += "</reply>";
			}
			
			result += "</replys>";
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			closeConn(rs, pstmt, con);
		}
		return result;

		
	} // getReplyList() 메서드 end

	public String getReplyNum(int no) {
		
		String result = "";
		
		openConn();
		
		try {
			sql = "select free_reply_num from free_write where free_num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, no);
			rs = pstmt.executeQuery();
			
			result += "<replys>";
			
			while(rs.next()) {
				
				result += "<reply>";
				result += "<free_reply_num>" + rs.getInt("free_reply_num") + "</free_reply_num>";
				result += "</reply>";
			}
			
			result += "</replys>";
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			closeConn(rs, pstmt, con);
		}
		return result;
		
	}
	

	public int deleteReplyList(int no) {
		
		int result = 0;
		
		openConn();
		
		try {			
			sql = "delete from free_reply where r_free_num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, no);
			result = pstmt.executeUpdate();

			sql = "update free_reply set r_free_num = r_free_num - 1 where r_free_num > ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, no);
			pstmt.executeUpdate();
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			closeConn(rs, pstmt, con);
		}
		return result;

	}
	
	public void deleteReplyCount(int no) {
		
		openConn();
		
		try {
			sql = "update free_write set free_reply_num = free_reply_num - 1 where free_num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, no);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			closeConn(rs, pstmt, con);
		}
		
		
	}
	
// ------------------------------------------------------------------------------------
	// 검색 시작.
	
	// board 테이블에서 검색어에 해당하는 게시물의 수를 조회하는 메서드.
	public int searchListCount(String field, String keyword) {
		
		int count = 0;
		
		openConn();
		
		if(field.equals("title")) {
			
			try {
				sql = "select count(*) from free_write where free_title like ?";
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
					sql = "select count(*) from free_write where free_cont like ?";
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
					sql = "select count(*) from free_write where free_title like ? free_cont like ?";
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
					sql = "select count(*) from free_write where member_id like ?";
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
	public List<FreeWriteDTO> searchBoardList(String field, String keyword, int page, int rowsize){
		
		List<FreeWriteDTO> list = new ArrayList<FreeWriteDTO>();
		
		// 해당 페이지에서 시작 번호.
		int startNo = (page * rowsize) - (rowsize - 1);
		
		// 해당 페이지에서 마지막 번호.
		int endNo = (page * rowsize);
		
		openConn();
		
		if(field.equals("title")) {
			
			try {
				sql = "select * from (select row_number() over(order by free_num desc) rnum,"
						+ " b.* from free_write b where free_title like ?) where rnum >= ? and rnum <= ?";				
				
				pstmt = con.prepareStatement(sql);
				
				pstmt.setString(1, "%"+keyword+"%");
				pstmt.setInt(2, startNo);
				pstmt.setInt(3, endNo);
				
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					
					FreeWriteDTO dto = new FreeWriteDTO();
					
					dto.setFree_num(rs.getInt("free_num"));
					dto.setFree_title(rs.getString("free_title"));
					dto.setFree_cont(rs.getString("free_cont"));
					dto.setFree_hit(rs.getInt("free_hit"));
					dto.setFree_date(rs.getString("free_date"));
					dto.setFree_file(rs.getString("free_file"));
					dto.setFree_radio(rs.getInt("free_radio"));
					dto.setFree_reply_num(rs.getInt("free_reply_num"));
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
				sql = "select * from (select row_number() over(order by free_num desc) rnum,"
						+ " b.* from free_write b where free_cont like ?) where rnum >= ? and rnum <= ?";				
				
				pstmt = con.prepareStatement(sql);
				
				pstmt.setString(1, "%"+keyword+"%");
				pstmt.setInt(2, startNo);
				pstmt.setInt(3, endNo);
				
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					
					FreeWriteDTO dto = new FreeWriteDTO();
					
					dto.setFree_num(rs.getInt("free_num"));
					dto.setFree_title(rs.getString("free_title"));
					dto.setFree_cont(rs.getString("free_cont"));
					dto.setFree_hit(rs.getInt("free_hit"));
					dto.setFree_date(rs.getString("free_date"));
					dto.setFree_file(rs.getString("free_file"));
					dto.setFree_radio(rs.getInt("free_radio"));
					dto.setFree_reply_num(rs.getInt("free_reply_num"));
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
				sql = "select * from (select row_number() over(order by free_num desc) rnum,"
						+ " b.* from free_write b where free_title like ? or free_cont like ?) where rnum >= ? and rnum <= ?";				
				
				pstmt = con.prepareStatement(sql);
				
				pstmt.setString(1, "%"+keyword+"%");
				pstmt.setString(2, "%"+keyword+"%");
				pstmt.setInt(2, startNo);
				pstmt.setInt(3, endNo);
				
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					
					FreeWriteDTO dto = new FreeWriteDTO();
					
					dto.setFree_num(rs.getInt("free_num"));
					dto.setFree_title(rs.getString("free_title"));
					dto.setFree_cont(rs.getString("free_cont"));
					dto.setFree_hit(rs.getInt("free_hit"));
					dto.setFree_date(rs.getString("free_date"));
					dto.setFree_file(rs.getString("free_file"));
					dto.setFree_radio(rs.getInt("free_radio"));
					dto.setFree_reply_num(rs.getInt("free_reply_num"));
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
				sql = "select * from (select row_number() over(order by free_num desc) rnum,"
						+ " b.* from free_write b where member_id like ?) where rnum >= ? and rnum <= ?";				
				
				pstmt = con.prepareStatement(sql);
				
				pstmt.setString(1, "%"+keyword+"%");
				pstmt.setInt(2, startNo);
				pstmt.setInt(3, endNo);
				
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					
					FreeWriteDTO dto = new FreeWriteDTO();
					
					dto.setFree_num(rs.getInt("free_num"));
					dto.setFree_title(rs.getString("free_title"));
					dto.setFree_cont(rs.getString("free_cont"));
					dto.setFree_hit(rs.getInt("free_hit"));
					dto.setFree_date(rs.getString("free_date"));
					dto.setFree_file(rs.getString("free_file"));
					dto.setFree_radio(rs.getInt("free_radio"));
					dto.setFree_reply_num(rs.getInt("free_reply_num"));
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


	public void updateWriteToAdmin(int freeNum) {
		sql="update free_write set free_cont = ? where freeNum = ?";
		try {
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, "관리자가 블라인드 처리한 댓글입니다.");
			pstmt.setInt(2, freeNum);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			closeConn(rs, pstmt, con);
		}
		
	}
	public List<FreeWriteDTO> getFreeList(int page){
		int count=1;
		sql="select * from free_write order by free_num asc";
		List<FreeWriteDTO> free_list = new ArrayList<FreeWriteDTO>();
		openConn();
		try {
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				FreeWriteDTO dto = new FreeWriteDTO();
				
				dto.setFree_num(rs.getInt("free_num"));
				dto.setFree_title(rs.getString("free_title"));
				dto.setFree_cont(rs.getString("free_cont"));
				dto.setFree_hit(rs.getInt("free_hit"));
				dto.setFree_date(rs.getString("free_date"));
				dto.setFree_file(rs.getString("free_file"));
				dto.setFree_reply_num(rs.getInt("free_reply_num"));
				dto.setMember_id(rs.getString("member_id"));
				
				if(count>=((page-1)*10)+1 && count <=10*page) {
					free_list.add(dto);
				}
				count++;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			closeConn(rs, pstmt, con);
		}
		return free_list;
	}

}
