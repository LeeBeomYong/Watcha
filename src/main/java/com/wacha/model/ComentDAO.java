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

public class ComentDAO {

	// DB와 연동하는 객체.
		Connection con = null;
		
		// DB에 SQL문을 전송하는 객체
		PreparedStatement pstmt = null;
		PreparedStatement pstmt2 = null;
		
		// SQL문을 실행한 후에 결과 값을 가지고 있는 객체.
		ResultSet rs = null;
		ResultSet rs2 = null;
		
		// 쿼리문을 저장할 변수
		String sql = null;
		
		
		// 1단계 : 싱글턴 방식으로 객체를 만들기 위해서는 우선적으로
		//        기본생성자의 접근제어자를 public이 아닌 private
		//        으로 바꾸어 주어야 한다.
		//        즉, 외부에서 직접적으로 기본생성자를 호출하지
		//        못하게 하는 방법이다.
		
		// 2단계 : ProductDAO 객체를 정적(static) 멤버로 선언을 
		//        해 주어야 한다.
		private static ComentDAO instance;
		
		private ComentDAO() {  }  // 기본 생성자
		
		
		// 3단계 : 기본 생성자 대신에 싱글턴 객체를 return 해 주는
		//        getInstance() 라는 메서드를 만들어서 해당
		//        getInstance() 라는 메서드를 외부에서 접근할 수
		//        있도록 해 주면 됨.
		public static ComentDAO getInstance() {
			
			if(instance == null) {
				instance = new ComentDAO();
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


		public List<ComentDTO> getComentList(int movie_num) {
			
			List<ComentDTO> list = new ArrayList<ComentDTO>();
			sql="select * from coment where movie_num=? and coment_num_son is null order by coment_hit desc";
			openConn();
			try {
				pstmt=con.prepareStatement(sql);
				pstmt.setInt(1, movie_num);
				rs=pstmt.executeQuery();
				while(rs.next()) {
					ComentDTO dto = new ComentDTO();
					dto.setComent_num(rs.getInt("coment_num"));
					dto.setMovie_num(rs.getInt("movie_num"));
					dto.setMember_id(rs.getString("member_id"));
					dto.setMovie_coment(rs.getString("movie_coment"));
					dto.setComent_num_son(rs.getInt("coment_num_son"));
					dto.setComent_hit(rs.getInt("coment_hit"));
					dto.setComent_nohit(rs.getInt("coment_nohit"));
					
					sql="select count(coment_num_son) from coment where movie_num=? and coment_num=?";
					pstmt2=con.prepareStatement(sql);
					pstmt2.setInt(1, movie_num);
					pstmt2.setInt(2, dto.getComent_num());
					rs2=pstmt2.executeQuery();
					if(rs2.next()) {
						dto.setCocoment_count(rs2.getInt(1));
					}
				
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


		public ComentDTO getComentInfo(int movie_num, int coment_num) {
			
			ComentDTO dto = null;
			
			sql="select * from coment where coment_num = ? and movie_num=? and coment_num_son is null";
			openConn();
			try {
				pstmt=con.prepareStatement(sql);
				pstmt.setInt(1, coment_num);
				pstmt.setInt(2, movie_num);
				rs=pstmt.executeQuery();
				if(rs.next()) {
					dto = new ComentDTO();
					
					dto.setComent_num(rs.getInt("coment_num"));
					dto.setMovie_num(rs.getInt("movie_num"));
					dto.setMember_id(rs.getString("member_id"));
					dto.setMovie_coment(rs.getString("movie_coment"));
					dto.setComent_num_son(rs.getInt("coment_num_son"));
					dto.setComent_hit(rs.getInt("coment_hit"));
					dto.setComent_nohit(rs.getInt("coment_nohit"));
				}
			}catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				closeConn(rs, pstmt, con);
			}
			
			
			return dto;
		}
		
		// 게시글 별 해당 로그인 회원 작성 게시글 확인 메서드
		public ComentDTO getComentInfo(int movie_num, String member_Id) {
			ComentDTO dto = null;
			
			sql="select * from coment where movie_num=? and member_Id =? and coment_num_son is null";
			openConn();
			try {
				pstmt=con.prepareStatement(sql);
				pstmt.setInt(1, movie_num);
				pstmt.setString(2, member_Id);
				
				rs=pstmt.executeQuery();
				if(rs.next()) {
					dto = new ComentDTO();
					
					dto.setComent_num(rs.getInt("coment_num"));
					dto.setMovie_num(rs.getInt("movie_num"));
					dto.setMember_id(rs.getString("member_id"));
					dto.setMovie_coment(rs.getString("movie_coment"));
					dto.setComent_num_son(rs.getInt("coment_num_son"));
					dto.setComent_hit(rs.getInt("coment_hit"));
					dto.setComent_nohit(rs.getInt("coment_nohit"));
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				closeConn(rs, pstmt, con);
			}
			return dto;
		}
		
		
		// 댓글 달기 조회 기능
		public String getMoviecoComent(int movie_num,int coment_num){
			
			//List<ComentDTO> cocoment_list = new ArrayList<ComentDTO>();
			
			sql="select * from coment "
					+ "where movie_num=? and coment_num=? "
					+ "and coment_num_son is not null order by coment_num_son desc";
			openConn();
			String res="<coments> ";
	
			try {
				pstmt=con.prepareStatement(sql);
				pstmt.setInt(1, movie_num);
				pstmt.setInt(2, coment_num);
				rs=pstmt.executeQuery();
				while(rs.next()) {
					res+="<coment>";
					//ComentDTO dto = new ComentDTO();
					res+="<coment_num>"+rs.getInt("coment_num")+"</coment_num> ";
					res+="<movie_num>"+rs.getInt("movie_num")+"</movie_num>";
					res+="<member_id>"+rs.getString("member_id")+"</member_id>";
					res+="<movie_coment>"+rs.getString("movie_coment")+"</movie_coment>";
					res+="<coment_num_son>"+rs.getString("coment_num_son")+"</coment_num_son>";
					res+="<coment_hit>"+rs.getInt("coment_hit")+"</coment_hit>";
					res+="<coment_nohit>"+rs.getInt("coment_nohit")+"</coment_nohit>";
					res+="</coment>";
	
					System.out.println("댓글이 있어요");
					//cocoment_list.add(dto);
				}
				res+="</coments>";
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				closeConn(rs, pstmt, con);
			}
			
			return res;
		}
		
		public void addcoComent(int movie_num,int coment_num,String member_Id ,String cocoment) {
			
			sql="select max(coment_num_son) from coment where movie_num=? and coment_num = ?";
			int count=0;
			openConn();
			try {
				pstmt=con.prepareStatement(sql);
				pstmt.setInt(1, movie_num);
				pstmt.setInt(2, coment_num);
				rs=pstmt.executeQuery();
				if(rs.next()) {
					count=rs.getInt(1)+1;
				}
				System.out.println("해당 게시글 댓글 count 값 : "+count);
				sql="insert into coment values(?,?,?,?,?,0,0,'','')";
				pstmt=con.prepareStatement(sql);
				pstmt.setInt(1, coment_num);
				pstmt.setInt(2, movie_num);
				pstmt.setString(3, member_Id);
				pstmt.setString(4, cocoment);
				pstmt.setInt(5, count);
				pstmt.executeUpdate();
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				closeConn(rs, pstmt, con);
			}
			
			
			
		}


		public int addComent(String member_Id, String content, int movie_num) {
			openConn();
			int counting=0;

			try {
				sql="select * from coment where movie_num=? and member_id =? and coment_num_son is null";
				pstmt=con.prepareStatement(sql);
				pstmt.setInt(1, movie_num);
				pstmt.setString(2, member_Id);
				rs=pstmt.executeQuery();
				
				if(rs.next()) {
					System.out.println("해당 게시글이 존재함");
					
					counting=rs.getInt("coment_num");
					
					sql="update coment set movie_coment=? where movie_num=? and member_id=? and coment_num_son is null";
					pstmt=con.prepareStatement(sql);
					pstmt.setString(1, content);
					pstmt.setInt(2, movie_num);
					pstmt.setString(3, member_Id);
					pstmt.executeUpdate();
					
					
				}else {
					sql="select max(coment_num) from coment where movie_num=?";
					int count=1;
					
					pstmt=con.prepareStatement(sql);
					pstmt.setInt(1, movie_num);
					rs=pstmt.executeQuery();
					if(rs.next()) {
						count=rs.getInt(1)+1;
					}
					sql="insert into coment values(?,?,?,?,'',default,default,'','')";
					pstmt=con.prepareStatement(sql);
					pstmt.setInt(1, count);
					pstmt.setInt(2, movie_num);
					pstmt.setString(3, member_Id);
					pstmt.setString(4, content);
					pstmt.executeUpdate();
					
					counting=count;
				}
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				closeConn(rs, pstmt, con);
			}
			return counting;	
		}
		public void likeThis(int movie_num,int coment_num,int coment_num_son,String session_Id) {
			
			String res=""; int chk=0;
			String current="";
			String[] result;
			sql="select cocoment_likelist from coment where movie_num=? and coment_num=? and coment_num_son=?";
			openConn();
			try {
				pstmt=con.prepareStatement(sql);
				pstmt.setInt(1, movie_num);
				pstmt.setInt(2, coment_num);
				pstmt.setInt(3, coment_num_son);
				
				rs=pstmt.executeQuery();
				if(rs.next()) {
					res=rs.getString(1);
				}
				if(res!=null) {
					result=res.split(",");
				}else {
					res="";
					result=null;
				}
			
			System.out.println("===리스트===");
			if(result!=null) {
				for(int i=0;i<result.length;i++)	{
					System.out.println(result[i]);
					if(result[i].equals(session_Id)) {
						chk++;
					}else {
						current+=result[i]+",";
					}
						
				}
			}
			
			System.out.println("chk 값 : "+chk);
			
			if(chk>0) {
				sql="update coment set coment_hit=coment_hit-1, cocoment_likelist =?  where movie_num=? and coment_num=? and coment_num_son=?";
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1, current);
				pstmt.setInt(2, movie_num);
				pstmt.setInt(3, coment_num);
				pstmt.setInt(4, coment_num_son);
				pstmt.executeUpdate();			
			}else {
				sql="update coment set coment_hit=coment_hit+1, cocoment_likelist =? where movie_num=? and coment_num=? and coment_num_son=?";
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1, res+session_Id+",");
				pstmt.setInt(2, movie_num);
				pstmt.setInt(3, coment_num);
				pstmt.setInt(4, coment_num_son);
				pstmt.executeUpdate();
			}
			
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				closeConn(rs, pstmt, con);
			}
			
		}
		
		public void deleteCoComent(int movie_num,int coment_num,int coment_num_son,String member_id) {
			
			sql="delete from coment where movie_num=? and coment_num=? and coment_num_son =? and member_id=?";
			openConn();
			try {
				pstmt=con.prepareStatement(sql);
				pstmt.setInt(1, movie_num);
				pstmt.setInt(2, coment_num);
				pstmt.setInt(3, coment_num_son);
				pstmt.setString(4, member_id);
				pstmt.executeUpdate();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				closeConn(rs, pstmt, con);
			}
		}
		
		public void likeComent(int movie_num,int coment_num,String member_Id) {
			String res=""; int chk=0;
			String current="";
			String[] result;
			sql="select cocoment_likelist from coment where movie_num=? and coment_num=? and coment_num_son is null";
			openConn();
			try {
				pstmt=con.prepareStatement(sql);
				pstmt.setInt(1, movie_num);
				pstmt.setInt(2, coment_num);
				rs=pstmt.executeQuery();
				if(rs.next()) {
					res=rs.getString(1);
				}
				if(res!=null) {
					result=res.split(",");
				}else {
					res="";
					result=null;
				}
				System.out.println("===리스트===");
				if(result!=null) {
					for(int i=0;i<result.length;i++)	{
						System.out.println(result[i]);
						if(result[i].equals(member_Id)) {
							chk++;
						}else {
							current+=result[i]+",";
						}
							
					}
				}
				System.out.println("chk 값 : "+chk);
				
				if(chk>0) {
					sql="update coment set coment_hit=coment_hit-1, cocoment_likelist =?  where movie_num=? and coment_num=? and coment_num_son is null";
					pstmt=con.prepareStatement(sql);
					pstmt.setString(1, current);
					pstmt.setInt(2, movie_num);
					pstmt.setInt(3, coment_num);
					pstmt.executeUpdate();			
				}else {
					sql="update coment set coment_hit=coment_hit+1, cocoment_likelist =? where movie_num=? and coment_num=? and coment_num_son is null";
					pstmt=con.prepareStatement(sql);
					pstmt.setString(1, res+member_Id+",");
					pstmt.setInt(2, movie_num);
					pstmt.setInt(3, coment_num);
					pstmt.executeUpdate();
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				closeConn(rs, pstmt, con);
			}
		}
		
		public void HateComent(int movie_num,int coment_num,String member_Id){
			String res=""; int chk=0;
			String current="";
			String[] result;
			sql="select cocoment_hatelist from coment where movie_num=? and coment_num=? and coment_num_son is null";
			openConn();
			try {
				pstmt=con.prepareStatement(sql);
				pstmt.setInt(1, movie_num);
				pstmt.setInt(2, coment_num);
				rs=pstmt.executeQuery();
				if(rs.next()) {
					res=rs.getString(1);
				}
				if(res!=null) {
					result=res.split(",");
				}else {
					res="";
					result=null;
				}
				
				System.out.println("===리스트===");
				if(result!=null) {
					for(int i=0;i<result.length;i++)	{
						System.out.println(result[i]);
						if(result[i].equals(member_Id)) {
							chk++;
						}else {
							current+=result[i]+",";
						}
							
					}
				}
				
				System.out.println("chk 값 : "+chk);
				
				if(chk>0) {
					sql="update coment set coment_nohit=coment_nohit-1, cocoment_hatelist =?  where movie_num=? and coment_num=? and coment_num_son is null";
					pstmt=con.prepareStatement(sql);
					pstmt.setString(1, current);
					pstmt.setInt(2, movie_num);
					pstmt.setInt(3, coment_num);
					pstmt.executeUpdate();			
				}else {
					sql="update coment set coment_nohit=coment_nohit+1, cocoment_hatelist =? where movie_num=? and coment_num=? and coment_num_son is null";
					pstmt=con.prepareStatement(sql);
					pstmt.setString(1, res+member_Id+",");
					pstmt.setInt(2, movie_num);
					pstmt.setInt(3, coment_num);
					pstmt.executeUpdate();
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				closeConn(rs, pstmt, con);
			}
			
		}

		
		//관리자 상세보기에서 코멘트 조회
		
		public List<ContentDTO> userContentComentList(String id) {
			List<ContentDTO> list = new ArrayList<ContentDTO>();
		
			
			try {
				
				openConn();
				
				sql="select m.movie_title ,c.movie_num, c.coment_num, c.coment_num_son, c.movie_coment ,c.member_id, c.coment_hit, c.coment_nohit from coment c, movie m where m.movie_num = c.movie_num and member_id =?";
				
				
				pstmt=con.prepareStatement(sql);
				
				pstmt.setString(1, id);
				
				rs=pstmt.executeQuery();
				
				while(rs.next()) {
				ContentDTO dto =new ContentDTO();
				
				dto.setMovie_title(rs.getString("movie_title"));
				
				dto.setMovie_num(rs.getInt("movie_num"));
				
				dto.setComent_num(rs.getInt("coment_num"));
				
				dto.setComent_num_son(rs.getInt("coment_num_son"));
				
				dto.setMovie_coment(rs.getString("movie_coment"));
				
				dto.setMember_id(rs.getString("member_id"));
				
				dto.setComent_hit(rs.getInt("coment_hit"));
				
				dto.setComent_nohit(rs.getInt("coment_nohit"));
				
				list.add(dto);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				closeConn(rs, pstmt, con);
			}return list;
			
		
			
			
		}
		



		public int[] getComentInfo(int movie_num, int coment_num, String member_id) {
			String res1=""; String res2="";
			
			String[] result2 =null;
			String[] result3 =null;
			
			int[] result = new int[2];
			sql="select cocoment_likelist,cocoment_hatelist from coment where movie_num =? and coment_num=? and coment_num_son is null";
			openConn();
			System.out.println("세션 좋아요 싫어요 확인 리스틑 : "+ movie_num +", "+coment_num +", "+member_id);
			try {
				pstmt=con.prepareStatement(sql);
				pstmt.setInt(1, movie_num);
				pstmt.setInt(2, coment_num);
				rs=pstmt.executeQuery();
				if(rs.next()) {
					res1=rs.getString(1);
					res2=rs.getString(2);
				}
				System.out.println("res 값들 :::   " + res1+"  ||  "+res2);
				if(res1!=null) {
					result2=res1.split(",");
					System.out.println("result 값들 :::   " + result2[0]+"  || ");
				}
				if(res2!=null) {
					result3=res2.split(",");
					System.out.println("result 값들 :::   " + "  ||  "+result3[0]);
				}
				
				if(result2!=null) {
					for(int i=0; i<result2.length; i++) {
						if(result2[i].equals(member_id)) result[0]++;
					}
				}
				if(result3!=null) {
					for(int i=0;i<result3.length;i++) {
						if(result3[i].equals(member_id)) result[1]++;
					}
				}
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				closeConn(rs, pstmt, con);
			}
			return	result;
		}


		public void deleteComent(int movie_num, int coment_num) {
			sql="delete from coment where movie_num=? and member_Id =?";
			try {
				pstmt=con.prepareStatement(sql);
				pstmt.setInt(1, movie_num);
				pstmt.setInt(2, coment_num);
				pstmt.executeUpdate();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				closeConn(rs, pstmt, con);
			}
			
		}

		public int getComentcount(String member_Id) {
			int count=0;
			sql="select count(*) from coment  where member_Id =? and coment_num_son is not null";
			openConn();
			try {
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1, member_Id);
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
		
public List<ComentDTO>getComentcontent(int num,String id,int no){
			
			List<ComentDTO>list = new ArrayList<ComentDTO>();
					
			try {
				
				openConn();
				
				sql="select * from coment where movie_num=? and member_id=? and coment_num=?";
				
				pstmt=con.prepareStatement(sql);
				
				pstmt.setInt(1, num);
				
				pstmt.setString(2, id);
				
				pstmt.setInt(3, no);
				
				rs=pstmt.executeQuery();
				
				while(rs.next()) {
					ComentDTO dto = new ComentDTO();
					
					dto.setComent_num(rs.getInt("coment_num"));
					
					dto.setMovie_num(rs.getInt("movie_num"));
					
					dto.setMember_id(rs.getString("member_id"));
					
					dto.setMovie_coment(rs.getString("movie_coment"));
					
					dto.setComent_num_son(rs.getInt("coment_num_son"));
					
					dto.setComent_hit(rs.getInt("coment_hit"));
					
					dto.setComent_nohit(rs.getInt("coment_nohit"));
					
					list.add(dto);
				}
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				closeConn(rs, pstmt, con);
			}return list;
		}
		
public List<ComentDTO>getComentcontentson(int num,String id,int no){
			
			List<ComentDTO>list = new ArrayList<ComentDTO>();
					
			try {
				
				openConn();
				
				sql="select * from coment where movie_num=? and coment_num_son is not null and coment_num =?";
				
				pstmt=con.prepareStatement(sql);
				
				pstmt.setInt(1, num);
				pstmt.setInt(2, no);
				
				
				
				rs=pstmt.executeQuery();
				
				while(rs.next()) {
					ComentDTO dto = new ComentDTO();
					
					dto.setComent_num(rs.getInt("coment_num"));
					
					dto.setMovie_num(rs.getInt("movie_num"));
					
					dto.setMember_id(rs.getString("member_id"));
					
					dto.setMovie_coment(rs.getString("movie_coment"));
					
					dto.setComent_num_son(rs.getInt("coment_num_son"));
					
					dto.setComent_hit(rs.getInt("coment_hit"));
					
					dto.setComent_nohit(rs.getInt("coment_nohit"));
					
					list.add(dto);
				}
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				closeConn(rs, pstmt, con);
			}return list;
		}
public int ComentDelete(int num) {
	
	int result = 0;
	
	openConn();
				
	try {
		sql = "delete from coment where coment_num = ?";
		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, num);
		result = pstmt.executeUpdate();
		
		sql = "update coment set coment_num = coment_num - 1 where coment_num > ?";
		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, num);
		pstmt.executeUpdate();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}closeConn(rs, pstmt, con);
	
	return result;
	
}
}
