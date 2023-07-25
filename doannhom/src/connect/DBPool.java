package connect;

import java.io.IOException;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Iterator;
import java.util.LinkedList;


public class DBPool {
    private static Logger logger = new Logger("DBPool"); // biến logger của lớp Logger trên
    private static LinkedList<Connection> pool = new LinkedList<Connection>(); // pool để chứa các connections
    public final static int MAX_CONNECTIONS = 10;  // số connection tối đa trong pool là 10, tuỳ ý!!
    public final static int INI_CONNECTIONS = 3; // số connection khi bắt đầu khởi tạo là 3
    //tao mot kết nối
    public static Connection makeDBConnection() throws SQLException {
        Connection conn = null;
       
        try {
        
        	
            Class.forName("com.mysql.jdbc.Driver");
//            logger.log("URL:" +"jdbc:mysql://localhost:3306/manga?useUnicode=true&characterEncoding=UTF-8&characterSetResults=UTF-8");LNTvkf92134
//            logger.log("User:" + "root");jdbc:mysql://node40684-shoptaothu.jelastic.skali.net/manga?useUnicode=true&characterEncoding=UTF-8&characterSetResults=UTF-8
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/doandienthoai?useUnicode=true&characterEncoding=UTF-8&characterSetResults=UTF-8", "root", "");
          
        } catch (ClassNotFoundException ex) {
            throw new SQLException(ex.getMessage());
        }catch (Exception e) {
   // TODO: handle exception
  }
        return conn;
    }
    //tao so connect cho phep
   public static void build(int number) {
        logger.log("thiết lập " + number + " ketnoi...");
        Connection conn = null;
        release();
        for (int i = 0; i < number; i++) {
            try {
                conn = makeDBConnection();
            } catch (SQLException ex) {
                logger.log("Error: " + ex.getMessage());                
            }
            if (conn != null) {
                pool.addLast(conn);
            }
        }
        logger.log("số kết nối trong pool " + pool.size());
    }
    //Phương thức lấy về connection, khi các class khác cần connect DB, thì chỉ cần gọi phương thức này là được: 
    public static Connection getConnection() {
        Connection conn = null;
        try{
         synchronized (pool) {
             conn = (Connection) pool.removeFirst();
         }
         if (conn == null) {
          conn = makeDBConnection();
         }
         try {
             conn.setAutoCommit(true);
         } catch (Exception ex) {}
          
        } catch(Exception e){            
//            logger.error("Method getConnection(): Error executing >>>" + e.toString());
            try {
//             logger.log("Make connection again.");
//        	release();
  //	build(INI_CONNECTIONS);
 conn = makeDBConnection();
//  build(pool.size());
    conn.setAutoCommit(true);
   } catch (SQLException e1) {
   }
   logger.log(""+conn);
        }
        return conn;
    }
   
    //Phương thức đóng và xoá tất cả connection trong pool:
    public static void release() {
        logger.log("đóng hết hết nối trong pool");
        synchronized (pool) {
            for (Iterator<Connection> it = pool.iterator(); it.hasNext(); ) {
                Connection conn = (Connection) it.next();
                try {
                    conn.close();
                }
                catch (SQLException e) {
                    logger.error(
                        "release: Cannot close connection! (maybe closed?)");
                }
            }
            pool.clear();
        }
        logger.log("xóa OK");
    }
//  phương thức close một connection và preparedStatement
public static void releaseConnection(Connection conn, PreparedStatement preStmt) {       
        putConnection(conn);
        try {
            if (preStmt != null) {
                preStmt.close();
            }
        } catch (SQLException e) {}
    }
 
    public static void releaseConnection(Connection conn, PreparedStatement preStmt, ResultSet rs) {
        releaseConnection(conn, preStmt);
        try {
            if (rs != null) {
                rs.close();
            }
        } catch (SQLException e) {}
    }
 
    public static void releaseConnection(Connection conn, PreparedStatement preStmt, Statement stmt, ResultSet rs) {
        releaseConnection(conn, preStmt, rs);
        try {
            if (stmt != null) {
                stmt.close();
            }
        } catch (SQLException e) {}
    }
    public static void releaseConnection(Connection conn, CallableStatement cs, ResultSet rs) {
     putConnection(conn);
        try {
            if (cs != null) {
             cs.close();
            }
            if(rs!=null){
             rs.close();
            }
        } catch (SQLException e) {}
    }
    
    //Phương thức đóng một kết nối có trong pool:
    
    public static void putConnection(Connection conn) {
    	
   	 
    	try {
			if(conn==null||conn.isClosed()){
				logger.log("đã đóng connect nay r " + conn);
				return;
			}
			if(pool.size()>=MAX_CONNECTIONS){
				conn.close();
			return;
			}
			
			
		} catch (Exception e) {
			// TODO: handle exception
			synchronized(pool){
				pool.addLast(conn);
				pool.notify();
				build(pool.size());
			}
		}
    }
    public static void main(String[] args) throws SQLException, IOException {
    	DBPool p= new DBPool();
   	System.out.println(p.makeDBConnection());
//        System.out.println(p.getConnection());
//    	   Properties DBConfig= new Properties();
//    	   DBConfig.load(Thread.currentThread().getContextClassLoader().getResourceAsStream("DBConfig.properties"));
//    System.out.println(DBConfig.getProperty("URL"));	
//    System.out.println(DBConfig.getProperty("USER"));
//    		 System.out.println(DBConfig.getProperty("PASSWORD"));
    }
    
    
}