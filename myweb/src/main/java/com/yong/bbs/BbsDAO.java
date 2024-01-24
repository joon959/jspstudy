package com.yong.bbs;

import java.sql.*;
import java.util.*;

public class BbsDAO {
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	
	public BbsDAO() {

	}
	
	/**마지막 ref 관련*/
	public int getMaxRef() {
		try {
			String sql="select max(ref) from jsp_bbs";
			ps=conn.prepareStatement(sql);
			rs=ps.executeQuery();
			int max = 0;
			if(rs.next()) {
				max = rs.getInt(1);
			}
			return max;
		}catch(Exception e) {
			e.printStackTrace();
			return 0;
		}finally {
			try {
				if(rs!=null) rs.close();
				if(ps!=null) ps.close();
				
			}catch(Exception e2) {
				e2.printStackTrace();
			}
		}
	}
	/**게시판 글쓰기*/
	public int bbsWrite(BbsDTO dto) {
		try {
			conn=com.yong.db.YongDB.getConn();
			int ref = getMaxRef();
			String sql="insert into jsp_bbs "
					+ "values(jsp_bbs_idx.nextval,?,?,?,?,"
					+ "sysdate,0,?,0,0)";
			ps=conn.prepareStatement(sql);
			ps.setString(1, dto.getWriter());
			ps.setString(2, dto.getPwd());
			ps.setString(3, dto.getTitle());
			ps.setString(4, dto.getContent());
			ps.setInt(5, ref+1);
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
	
	/**순서 업데이트 관련 3번*/
	public void updateSun(int ref, int sunbun) {
		try {
			String sql="update jsp_bbs set sunbun=sunbun+1 where ref=? and sunbun>=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, ref);
			ps.setInt(2, sunbun);
			ps.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(ps!=null) ps.close();
			}catch(Exception e2) {
				e2.printStackTrace();
			}
		}
		
	}
	/**답변글쓰기*/
	public int bbsReWrite(BbsDTO dto) {
		try {
			conn = com.yong.db.YongDB.getConn();
			updateSun(dto.getRef(), dto.getSunbun()+1);
			String sql = "insert into jsp_bbs values(jsp_bbs_idx.nextval,?,?,?,?,sysdate,0,?,?,?)";
			ps=conn.prepareStatement(sql);
			ps.setString(1, dto.getWriter());
			ps.setString(2, dto.getPwd());
			ps.setString(3, dto.getTitle());
			ps.setString(4, dto.getContent());
			ps.setInt(5, dto.getRef());
			ps.setInt(6, dto.getLev()+1);
			ps.setInt(7, dto.getSunbun()+1);
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
	
	/**총게시글수*/
	public int getTotalCnt() {
		try {
			conn=com.yong.db.YongDB.getConn();
			String sql ="select count(*) from jsp_bbs";
			ps=conn.prepareStatement(sql);
			rs=ps.executeQuery();
			rs.next();
			int count = rs.getInt(1);
			return count==0?1:count;
		}catch(Exception e) {
			e.printStackTrace();
			return 1;
		}finally{
			try {
				if(rs!=null) rs.close();
				if(ps!=null) ps.close();
				if(conn!=null) conn.close();
			}catch(Exception e2) {
				e2.printStackTrace();
			}
		}	
	}
	/**목록 보기 관련 메서드*/
	public ArrayList<BbsDTO> bbsList(int cp, int ls){
		try {
			conn=com.yong.db.YongDB.getConn();
			//String sql = "select * from jsp_bbs order by idx desc";
			int start = (cp-1)*ls+1;
			int end = cp*ls;
			String sql="select * from "
					+ "(select rownum as rnum, a.* from "
					+ "(select * from jsp_bbs order by ref desc, sunbun asc)a)b "
					+ "where rnum>=? and rnum<=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, start);
			ps.setInt(2, end);
			rs=ps.executeQuery();
			
			ArrayList<BbsDTO> arr = new ArrayList<BbsDTO>();
			while(rs.next()) {
				int idx=rs.getInt("idx");
				String writer =rs.getString("writer");
				String pwd=rs.getString("pwd");
				String title=rs.getString("title");
				String content=rs.getString("content");
				java.sql.Date writedate=rs.getDate("writedate");
				int readnum = rs.getInt("readnum");
				int ref = rs.getInt("ref");
				int lev = rs.getInt("lev");
				int sunbun = rs.getInt("sunbun");
				BbsDTO dto = new BbsDTO(idx, writer, pwd, title, content, writedate, readnum, ref, lev, sunbun);
				arr.add(dto);
			}
			return arr;
		}catch(Exception e) {
			e.printStackTrace();
			return null;
		}finally{
			try {
				if(rs!=null) rs.close();
				if(ps!=null) ps.close();
				if(conn!=null) conn.close();
			}catch(Exception e2) {
				e2.printStackTrace();
			}
		}
	}
	
	/**본문보기 관련*/
	public BbsDTO bbsContent(int idx) {
		try {
			conn=com.yong.db.YongDB.getConn();
			String sql = "select * from jsp_bbs where idx=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, idx);
			rs=ps.executeQuery();
			
			BbsDTO dto = null;
			if(rs.next()) {
				String writer=rs.getString("writer");
				String pwd=rs.getString("pwd");
				String title=rs.getString("title");
				String content=rs.getString("content");
				java.sql.Date writedate=rs.getDate("writedate");
				int readnum = rs.getInt("readnum");
				int ref = rs.getInt("ref");
				int lev = rs.getInt("lev");
				int sunbun = rs.getInt("sunbun");
				dto = new BbsDTO(idx, writer, pwd, title, content, writedate, readnum, ref, lev, sunbun);
			}
			return dto;
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
