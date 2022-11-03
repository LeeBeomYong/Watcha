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


public class UserDAO {

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
		private static UserDAO instance;
		
		private UserDAO() {  }  // 기본 생성자
		
		
		// 3단계 : 기본 생성자 대신에 싱글턴 객체를 return 해 주는
		//        getInstance() 라는 메서드를 만들어서 해당
		//        getInstance() 라는 메서드를 외부에서 접근할 수
		//        있도록 해 주면 됨.
		public static UserDAO getInstance() {
			
			if(instance == null) {
				instance = new UserDAO();
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

	public int getMemberCount() {
		int count=0;
		
		
		try {
			
			openConn();
			
			sql="select count(*) from member";
			
			pstmt=con.prepareStatement(sql);
			
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				count=rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			closeConn(rs, pstmt, con);
		}return count;
		
	}
		
		
	


	public List<UserDTO>getmemberList(int page,int rowsize){

		List<UserDTO>list= new ArrayList<UserDTO>();
		int startNo = (page*rowsize)-(rowsize-1);
		
		//해당페이지 끝 번호
		int endNo=(page*rowsize);
		
		try {
			openConn();
			
			sql="select * from(select row_number() over(order by member_num ) rnum, b.* from member b) where member_num>=? and member_num<= ? ";
			
			pstmt=con.prepareStatement(sql);
			
			pstmt.setInt(1, startNo);
			
			pstmt.setInt(2, endNo);
			
			rs= pstmt.executeQuery();
			
			while(rs.next()) {
				
				UserDTO dto = new UserDTO();
				
				dto.setMember_num(rs.getInt("member_num"));
				
				dto.setMember_name(rs.getString("member_name"));
				
				dto.setMember_id(rs.getString("member_id"));
				
				dto.setMember_pwd(rs.getString("member_pwd"));
				
				dto.setMember_profile(rs.getString("member_profile"));
				
				dto.setMember_birth(rs.getString("member_birth"));
			
				dto.setMember_regdate(rs.getString("member_regdate"));

				dto.setMember_image(rs.getString("member_image"));

				
				list.add(dto);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			closeConn(rs, pstmt, con);
		}return list;
	}

		
		public int userDelete(String id, String pwd) {
			
			int result = 0;
			
			try {
				openConn();
				
				sql="select * from member where member_id='test1'";
				pstmt=con.prepareStatement(sql);
				//pstmt.setString(1, id);
				rs=pstmt.executeQuery();
				
				if(rs.next()) {
					if(pwd.equals(rs.getString("member_pwd"))) {
						sql="delete from member where member_id = 'test1'";
						pstmt=con.prepareStatement(sql);
						//pstmt.setString(1, id);
						result = pstmt.executeUpdate();
					}else {
						result = -1;
					}
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				closeConn(rs, pstmt, con);
			}
			return result;
		}
		
		public void starDelete(String id, String pwd) {
			
			
			try {
				openConn();
				
				sql="select * from member where member_id='test1'";
				pstmt=con.prepareStatement(sql);
				//pstmt.setString(1, id);
				rs=pstmt.executeQuery();
				
				if(rs.next()) {
					if(pwd.equals(rs.getString("member_pwd"))) {
						sql="delete from star where member_id = 'test1'";
						pstmt=con.prepareStatement(sql);
						//pstmt.setString(1, id);
						pstmt.executeUpdate();
					}
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				closeConn(rs, pstmt, con);
			}
		}
		
		public void writeDelete(String id, String pwd) {
			
			
			try {
				openConn();
				
				sql="select * from member where member_id='test1'";
				pstmt=con.prepareStatement(sql);
				//pstmt.setString(1, id);
				rs=pstmt.executeQuery();
				
				if(rs.next()) {
					if(pwd.equals(rs.getString("member_pwd"))) {
						sql="delete from write where member_id = 'test1'";
						pstmt=con.prepareStatement(sql);
						//pstmt.setString(1, id);
						pstmt.executeUpdate();
					}
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				closeConn(rs, pstmt, con);
			}
		}
		
		public void comentDelete(String id, String pwd) {
			
			try {
				openConn();
				
				sql="select * from member where member_id='test1'";
				pstmt=con.prepareStatement(sql);
				//pstmt.setString(1, id);
				rs=pstmt.executeQuery();
				
				if(rs.next()) {
					if(pwd.equals(rs.getString("member_pwd"))) {
						sql="delete from coment where member_id = 'test1'";
						pstmt=con.prepareStatement(sql);
						//pstmt.setString(1, id);
						pstmt.executeUpdate();
					}
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				closeConn(rs, pstmt, con);
			}
		}
		
		public void replyDelete(String id, String pwd) {
			
			try {
				openConn();
				
				sql="select * from member where member_id='test1'";
				pstmt=con.prepareStatement(sql);
				//pstmt.setString(1, id);
				rs=pstmt.executeQuery();
				
				if(rs.next()) {
					if(pwd.equals(rs.getString("member_pwd"))) {
						sql="delete from reply where member_id = 'test1'";
						pstmt=con.prepareStatement(sql);
						//pstmt.setString(1, id);
						pstmt.executeUpdate();
					}
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				closeConn(rs, pstmt, con);
			}
		}
		
		public void w_writeDelete(String id, String pwd) {
			
			
			try {
				openConn();
				
				sql="select * from member where member_id='test1'";
				pstmt=con.prepareStatement(sql);
				//pstmt.setString(1, id);
				rs=pstmt.executeQuery();
				
				if(rs.next()) {
					if(pwd.equals(rs.getString("member_pwd"))) {
						sql="delete from w_write where member_id = 'test1'";
						pstmt=con.prepareStatement(sql);
						//pstmt.setString(1, id);
						pstmt.executeUpdate();
					}
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				closeConn(rs, pstmt, con);
			}
		}
		
		public UserDTO profileUpdate(String id) {
			
			UserDTO dto = new UserDTO();
			
			try {
				openConn();
				sql="select * from member where member_id = 'test1'";
				pstmt = con.prepareStatement(sql);
				//pstmt.setString(1, id);
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					
					
					
					dto.setMember_id(rs.getString("member_id"));
					dto.setMember_name(rs.getString("member_name"));
					dto.setMember_pwd(rs.getString("member_pwd"));
					dto.setMember_profile(rs.getString("member_profile"));
					dto.setMember_birth(rs.getString("member_birth"));
					dto.setMember_image(rs.getString("member_image"));
				
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				closeConn(rs, pstmt, con);
			}
		return dto;
			
		}

		public UserDTO UserContent(String id) {
			UserDTO dto = null;
			
			try {
				openConn();
				
				sql="select * from member where member_id=?";
				
				pstmt=con.prepareStatement(sql);
				
				pstmt.setString(1, id);
				
				rs=pstmt.executeQuery();
				
				if(rs.next()) {
					dto=new UserDTO();
					
					dto.setMember_num(rs.getInt("member_num"));
					
					dto.setMember_name(rs.getString("member_name"));
					
					dto.setMember_id(rs.getString("member_id"));
					
					dto.setMember_pwd(rs.getString("member_pwd"));
					
					dto.setMember_birth(rs.getString("member_birth"));
					
					dto.setMember_profile(rs.getString("member_profile"));
					
					dto.setMember_image(rs.getString("member_image"));
					
					dto.setMember_regdate(rs.getString("member_regdate"));
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				closeConn(rs, pstmt, con);
			}return dto;
		}

		
		public int updateUser(UserDTO dto) {
			
			int result = 0;
			
			
			try {
				openConn();
				sql="update member set member_name=?, member_pwd=?, member_profile=?, member_birth = ?, member_image=? where member_id = ?";
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1, dto.getMember_name());
				pstmt.setString(2, dto.getMember_pwd());
				pstmt.setString(3, dto.getMember_profile());
				pstmt.setString(4, dto.getMember_birth());
				pstmt.setString(5, dto.getMember_image());
				pstmt.setString(6, dto.getMember_id());
				result = pstmt.executeUpdate();
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				closeConn(rs, pstmt, con);
			}
			return result;
		}

		// 키워드 검색 : 회원(유저) 이름 검색
		public List<UserDTO> getUserKeywordList(String keyword) {
		
		List<UserDTO> list = new ArrayList<UserDTO>();
		
		try {
			openConn();
			
			sql = "select * from member where member_name like ? and member_id not in('admin')";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, "%"+keyword+"%");
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				UserDTO dto = new UserDTO();
				
				dto.setMember_id(rs.getString("member_id"));
				dto.setMember_name(rs.getString("member_name"));
				dto.setMember_profile(rs.getString("member_profile"));
				dto.setMember_image(rs.getString("member_image"));
				
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeConn(rs, pstmt, con);
		}			
		return list;
	}// getUserKeywordList() end


		// 로그인 메서드
		public int LoginCheck(String member_id, String member_pwd) {
			
			int res = 0;
			
			try {
				openConn();
				
				sql = "select * from member where member_id = ?";
				
				pstmt = con.prepareStatement(sql);
				
				pstmt.setString(1, member_id);
				
				rs = pstmt.executeQuery();

				if(rs.next()) {	// 아이디 O 
					if(rs.getString("member_id").equals("admin")) {
						if(member_pwd.equals(rs.getString("member_pwd"))) {
							res = 2;	// 관리자
						}else {
							res = -1;	// 관리자 아이디 O, 비번 X
						}
					}else {
						if(member_pwd.equals(rs.getString("member_pwd"))) {
							res = 1;	// 회원
						}else {
							res = -1;	// 회원 아이디 O, 비번 X
						}
					}
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return res;
		}


				// 로그인 성공 시 회원 정보 불러오기
				public UserDTO getMember(String member_id) {
					UserDTO dto = null;
					
					try {
						openConn();
						
						sql = "select * from member where member_id = ?";
						
						pstmt = con.prepareStatement(sql);
						
						pstmt.setString(1, member_id);
						
						rs = pstmt.executeQuery();
						
						if(rs.next()) {

							dto = new UserDTO();
							
							dto.setMember_id(rs.getString("member_id"));
							dto.setMember_image(rs.getString("member_image"));
							
						}
					} catch (SQLException e) {
						e.printStackTrace();
					}
					return dto;
				}
	

				// 키워드 회원 검색 -> 회원 페이지 이동
				public UserDTO getMemberProfile(String member_id) {
					UserDTO dto = null;
					
					try {
						openConn();
						
						sql = "select * from member where member_id = ?";
						
						pstmt = con.prepareStatement(sql);
						
						pstmt.setString(1, member_id);
						
						rs = pstmt.executeQuery();
						
						if(rs.next()) {
							dto = new UserDTO();
							
							dto.setMember_num(rs.getInt("member_num"));
							dto.setMember_id(rs.getString("member_id"));
							dto.setMember_name(rs.getString("member_name"));
							dto.setMember_pwd(rs.getString("member_pwd"));
							dto.setMember_profile(rs.getString("member_profile"));
							dto.setMember_birth(rs.getString("member_birth"));
							dto.setMember_regdate(rs.getString("member_regdate"));
							dto.setMember_image(rs.getString("member_image"));
						}
					} catch (SQLException e) {
						e.printStackTrace();
					}
					return dto;
				}

				// 회원가입 메서드
				public int insertMember(String name, String id, String pwd) {
					int result = 0, count = 0;
					
					try {
						openConn();
						
						sql = "select max(member_num) from member";
						
						pstmt = con.prepareStatement(sql);
						
						rs = pstmt.executeQuery();
						
						if(rs.next()) {
							count = rs.getInt(1) + 1;
						}
						
						sql = "insert into member values(?,?,?,?,'','',sysdate,default)";
						
						pstmt = con.prepareStatement(sql);
						
						pstmt.setInt(1, count);
						pstmt.setString(2, id);
						pstmt.setString(3, name);
						pstmt.setString(4, pwd);
						
						result = pstmt.executeUpdate();
						
					} catch (SQLException e) {
						e.printStackTrace();
					} finally {
						closeConn(rs, pstmt, con);
					}					
					return result;
				}


				// 회원가입 - 아이디 중복 체크
				public int checkMemberId(String id) {
					int res = 0;
					
					try {
						openConn();
						
						sql = "select member_id from member where member_id = ?";
						
						pstmt = con.prepareStatement(sql);
						
						pstmt.setString(1, id);
						
						rs = pstmt.executeQuery();
						
						if(rs.next()) {
							res = 1;
						}else {
							res = 0;
						}
					} catch (SQLException e) {
						e.printStackTrace();
					} finally {
						closeConn(rs, pstmt, con);
					}
					return res;
				}
	
				// 비밀번호 찾기
    public String findIdforPwd(String mem_id) {

      String res = "";

      try {
        openConn();

        sql = "select member_pwd from member where member_id = ?";

        pstmt = con.prepareStatement(sql);

        pstmt.setString(1, mem_id);

        rs = pstmt.executeQuery();

        if(rs.next()) {
          res = rs.getString(1);
        }
      } catch (SQLException e) {
        e.printStackTrace();
      } finally {
        closeConn(rs, pstmt, con);
      }
      return res;
    }	// findIdforPwd() end
    
    
  }

