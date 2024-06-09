package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import ConnectDB.ConnectDatabase;
import entity.Account;
import entity.GioHang;


public class DAO {
	Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

 
    
	
    public Account login(String user, String pass ) {
    	String query = "select * from Account\n"
    			+"where [user] = ?\n" 
    			+"and pass = ?";
    	try {
    		conn = new ConnectDatabase().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, user);
            ps.setString(2, pass);
            rs = ps.executeQuery();
            while(rs.next()) {
            	
            	return new Account(rs.getInt(1),
            			rs.getString(2), 
            			rs.getString(3),
            			rs.getInt(4));
            }
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		return null;
    	
    }
    
    public Account checkAccountExit(String user ) {
    	String query = "select * from Account\n"
    			+"where [user] = ?\n";
    			
    	try {
    		conn = new ConnectDatabase().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, user);
            rs = ps.executeQuery();
            while(rs.next()) {
            	
            	return new Account(rs.getInt(1),
            			rs.getString(2), 
            			rs.getString(3),
            			rs.getInt(4));
            }
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		return null;
    	
    }
    
//    public void signUp(String user, String pass) {
//    	String query ="insert into Account\n"+ "values(?,?,0,0)";
//    	try {
//    		conn = new ConnectDatabase().getConnection();//mo ket noi voi sql
//            ps = conn.prepareStatement(query);
//            ps.setString(1, user);
//            ps.setString(2, pass);
//            ps.executeUpdate();
//		} catch (Exception e) {
//			// TODO: handle exception
//		}
//    }
    
//    public void signUp(String user, String pass) {
//    	String query = "insert into Account values (?, ?, ?, ?)";
//
//        try {
//            conn = new ConnectDatabase().getConnection(); // Mở kết nối đến SQL
//            ps = conn.prepareStatement(query);
//            ps.setString(1, user);
//            ps.setString(2, pass);
//            ps.executeUpdate();
//            
//        } catch (Exception e) {
//            e.printStackTrace(); // In lỗi để kiểm tra vấn đề
//        } finally {
//            // Đóng tất cả các resource (ResultSet, PreparedStatement, Connection) ở đây nếu cần
//            try {
//                if (ps != null) {
//                    ps.close();
//                }
//                if (conn != null) {
//                    conn.close();
//                }
//            } catch (SQLException e) {
//                e.printStackTrace();
//            }
//        }
//    }
    
    public void signUp(String user, String pass) {
        String query = "insert into Account values (?, ?, ?)";
        try {
            conn = new ConnectDatabase().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, user);
            ps.setString(2, pass);
            ps.setInt(3, 0); // Giả sử giá trị mặc định cho cột thứ 3 là 0
           // ps.setInt(4, 0); // Giả sử giá trị mặc định cho cột thứ 4 là 0
            ps.executeUpdate();

            System.out.println("Đăng ký thành công!");
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (ps != null) {
                    ps.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

   
  

}

