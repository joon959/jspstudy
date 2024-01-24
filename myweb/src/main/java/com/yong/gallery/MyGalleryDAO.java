package com.yong.gallery;

import java.io.*;
import java.util.*;
import java.sql.*;
public class MyGalleryDAO {
	public final static String USER_HOME=
			"C:\\java_student\\jspstudy\\"
			+ ".metadata\\.plugins\\org.eclipse.wst.server.core\\"
			+ "tmp0\\wtpwebapps\\myweb\\gallery\\img";
	
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	
	public MyGalleryDAO() {
	
	}
	
	/**사용자 폴더 생성관련 메서드*/
	public void makeDirectory(String id) {
		File f = new File(USER_HOME+"/"+id);
		if(!f.exists()) {
			f.mkdir();
		}
	}
	/**정보입력*/
	public int insertImg(String id, File f) {
		try {
			conn=com.yong.db.YongDB.getConn();
			String sql="insert into mygallery values(mygallery_idx.nextval,?,?,?)";
			ps=conn.prepareStatement(sql);
			ps.setString(1, id);
			ps.setString(2, f.getName());
			ps.setInt(3, (int)f.length());
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
	
	/**목록 출력*/
	public ArrayList<MyGalleryDTO> imgList(String id){
		try {
			conn=com.yong.db.YongDB.getConn();
			String sql="select * from mygallery where id=? order by idx desc";
			ps=conn.prepareStatement(sql);
			ps.setString(1, id);
			rs=ps.executeQuery();
			ArrayList<MyGalleryDTO> arr = new ArrayList<MyGalleryDTO>();
			while(rs.next()) {
				int idx = rs.getInt("idx");
				String filename = rs.getString("filename");
				int filesize = rs.getInt("filesize");
				MyGalleryDTO dto = new MyGalleryDTO(idx, id, filename, filesize);
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
	
	public int deleteImg(String id) {
		try {
			conn=com.yong.db.YongDB.getConn();
			String sql="delete from mygallery where id=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, id);
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
