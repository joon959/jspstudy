package com.yong.emp2;

import java.sql.*;
import java.util.*;

public class EmpDAO {
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	
	public EmpDAO() {
		System.out.println("EmpDAO()객체 생성됨");
	}
	
	
	/**사원 등록 관련 메서드*/
	public int empAdd(EmpDTO dto) {
		try {
			String sql = "insert into employee values(employee_idx.nextval,?,?,?)";
			ps = conn.prepareStatement(sql);
			ps.setString(1, dto.getName());
			ps.setString(2, dto.getEmail());
			ps.setString(3, dto.getDept());
			int count = ps.executeUpdate();
			return count;
		}catch(Exception e) {
			e.printStackTrace();
			return -1;
		}finally {
			try {
				ps.close();
				conn.close();
			}catch(Exception e2) {
				e2.printStackTrace();
			}
		}
	}

	public int empDel(EmpDTO dto) {
		try {
			String sql = "delete from employee where name=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, dto.getName());
			int count = ps.executeUpdate();
			return count;
		}catch(Exception e) {
			e.printStackTrace();
			return -1;
		}finally {
			try {
				if(ps!=null)	ps.close();
				if(conn!=null)	conn.close();
			}catch(Exception e2) {
				e2.printStackTrace();
			}
		}
	}
	
	
	public ArrayList<EmpDTO> empList() {
		try {
			
			conn = com.yong.db.YongDB.getConn();
			
			String sql = "select * from employee order by idx desc";
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			
			ArrayList<EmpDTO> arr = new ArrayList<EmpDTO>();
			while(rs.next()) {
				int idx = rs.getInt("idx");
				String name = rs.getString("name");
				String email = rs.getString("email");
				String dept = rs.getString("dept");
				
				EmpDTO dto = new EmpDTO(idx, name, email, dept);
				arr.add(dto);
			}
			
			return arr;
			
		}catch(Exception e) {
			e.printStackTrace();
			return null;
		}finally {
			try {				
				if(rs!=null)	rs.close();
				if(ps!=null)	ps.close();
				if(conn!=null)	conn.close();
			}catch(Exception e2) {
				e2.printStackTrace();
			}
		}
	}
	
	public EmpDTO empUpdateForm(int idx) {
		try {
			String sql = "select * from employee where idx=?";
			ps= conn.prepareStatement(sql);
			ps.setInt(1, idx);
			rs= ps.executeQuery();
			
			EmpDTO dto = null;
			if(rs.next()) {
				String name=rs.getString("name");
				String email=rs.getString("email");
				String dept=rs.getString("dept");
				dto=new EmpDTO(idx, name, email, dept);
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
	
	public int empUpdateSubmit(EmpDTO dto) {
		try {
			String sql="update employee set name=?,email=?,dept=? where idx=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, dto.getName());
			ps.setString(2, dto.getEmail());
			ps.setString(3, dto.getDept());
			ps.setInt(4, dto.getIdx());
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
	
}
