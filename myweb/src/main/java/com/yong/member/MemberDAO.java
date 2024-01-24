package com.yong.member;

import java.sql.*;
import java.util.*;

public class MemberDAO {
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	
	final public static int NOT_ID=1;	//상수 만들기
	final public static int NOT_PWD=2;
	final public static int LOGIN_OK=3;
	final public static int ERROR=-1;
	
	public MemberDAO() {
		System.out.println("DAO!!!");
	}
	
	public void dbConnect() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			String url="jdbc:oracle:thin:@localhost:1521:xe";
			String user= "scott";
			String pwd = "1234";
			conn = DriverManager.getConnection(url, user, pwd);		
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public int memberAdd(MemberDTO dto) {
		try {
			
			conn=com.yong.db.YongDB.getConn();
			String sql = "insert into jsp_member "
					+ "values(jsp_member_idx.nextval,?,?,?,?,?,?,sysdate)";
			ps = conn.prepareStatement(sql);
			ps.setString(1, dto.getId());
			ps.setString(2, dto.getName());
			ps.setString(3, dto.getPwd());
			ps.setString(4, dto.getEmail());
			ps.setString(5, dto.getAddr());
			ps.setString(6, dto.getTel());
			int count = ps.executeUpdate();
			return count;
		}catch(Exception e) {
			e.printStackTrace();
			return -1;
		}finally {
			try {
				if(ps!=null) ps.close();
				if(conn!=null) conn.close();				
			}catch(Exception e2) {
				e2.printStackTrace();
			}
		}
	}	
	
	public boolean idCheck(String id) {
		try {
			conn=com.yong.db.YongDB.getConn();
			String sql = "select id from jsp_member where id=?";
			ps= conn.prepareStatement(sql);
			ps.setString(1, id);
			rs= ps.executeQuery();
			return rs.next();	//참거짓만 보면 되나봄...
	
		}catch(Exception e) {
			e.printStackTrace();
			return false;
		}finally {
			try {
				if(rs!=null) rs.close();
				if(ps!=null) ps.close();
				if(conn!=null) conn.close();
			}catch(Exception e2) {
				e2.printStackTrace();
			}
		}
	}
	/**검색관련 메서드*/
	public ArrayList<MemberDTO> memberFind(String fkey, String fvalue){
		try {
			
			//dbConnect();
			conn=com.yong.db.YongDB.getConn();
			String sql="select * from jsp_member where "+fkey+"=?";
			ps= conn.prepareStatement(sql);
			ps.setString(1, fvalue);
			rs= ps.executeQuery();
			
			ArrayList<MemberDTO> arr = new ArrayList<MemberDTO>();
			while(rs.next()) {
				int idx=rs.getInt("idx");
				String id=rs.getString("id");
				String name=rs.getString("name");
				String pwd=rs.getString("pwd");
				String email=rs.getString("email");
				String addr=rs.getString("addr");
				String tel=rs.getString("tel");
				java.sql.Date joindate = rs.getDate("joindate");
				
				System.out.print(id+name+pwd+email+addr+tel+joindate);
				
				MemberDTO dto = new MemberDTO(idx, id, name, pwd, email, addr, tel, joindate);
				arr.add(dto);
			}
			return arr;
		}catch(Exception e) {
			e.printStackTrace();
			return null;
		}finally {
			try {
				if(rs!=null) rs.close();
				if(ps!=null) ps.close();
				if(conn!=null) conn.close();
			}catch(Exception e2) {
				e2.printStackTrace();
			}
		}
	}
	
	public int loginCheck(String userid, String userpwd) {
		try {
			conn=com.yong.db.YongDB.getConn();
			String sql="select pwd from jsp_member where id=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, userid);
			rs=ps.executeQuery();
			if(rs.next()) {
				String dbpwd=rs.getString(1);
				if(dbpwd.equals(userpwd)) {
					return LOGIN_OK;
				}else {
					return NOT_PWD;
				}
			}else {
				return NOT_ID;
			}
		}catch(Exception e) {
			e.printStackTrace();
			return ERROR;
		}finally {
			try {
				if(rs!=null) rs.close();
				if(ps!=null) ps.close();
				if(conn!=null) conn.close();				
			}catch(Exception e2) {
				e2.printStackTrace();
			}
		}
	}

	public String getUserInfo(String userid) {
		try {
			conn=com.yong.db.YongDB.getConn();
			String sql="select name from jsp_member where id=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, userid);
			rs=ps.executeQuery();
			rs.next();
			return rs.getString(1);
		}catch(Exception e) {
			e.printStackTrace();
			return null;
		}finally {
			try {
				if(rs!=null) rs.close();
				if(ps!=null) ps.close();
				if(conn!=null) conn.close();
			}catch(Exception e2) {
				e2.printStackTrace();
			}
		}
	}
	
}
