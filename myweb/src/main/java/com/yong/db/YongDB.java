package com.yong.db;

import java.sql.*;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class YongDB {
   static DataSource ds;//스태틱 블록에 쓰이는 변수들도 스태틱 변수로 해줘야됨
   
   static{
      try {
         Context initContext = new InitialContext();
         Context envContext  = (Context)initContext.lookup("java:/comp/env");
         ds = (DataSource)envContext.lookup("jdbc/myoracle");
      } catch (Exception e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }
      
   }//static block 프로그램이 시작될때 무조건 정적메모리에 올림
   
   public static Connection getConn() throws Exception{
      return ds.getConnection();
   }

}