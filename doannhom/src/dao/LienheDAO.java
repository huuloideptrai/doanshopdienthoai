package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import connect.DBPool;
import models.LienHe;
import models.MyModel;

public class LienheDAO implements IDAO {
	PreparedStatement ps;
	 ResultSet rs ;
	 //lay danh danh 
	@Override
	public ArrayList<MyModel> getListModel()  {
		Connection connection = DBPool.getConnection();
		String sql = "SELECT * FROM lienhe";
		ArrayList<MyModel> list = new ArrayList<>();
		 try {
			ps = connection.prepareCall(sql);
			rs = ps.executeQuery();
			
			while (rs.next()) {

				list.add(new LienHe(rs.getString("ten"), rs.getString("dc"), rs.getInt("sdt"), rs.getString("bando"), rs.getString("chitiet"), rs.getString("cachthuc"), rs.getString("dichvu"), rs.getString("email")));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			   DBPool.releaseConnection(connection, ps, rs);
			  }
		   
		 
		return list;
	}
	
	@Override
	public boolean insert(MyModel model) {
//		Connection connection = DBPool.getConnection();
//		String sql = "INSERT INTO lienhe VALUE(?,?,?,?,?,?,?,?,?)";
//		try {
//			 ps = connection.prepareStatement(sql);
//			LienHe l = (LienHe) model;
//			
//			ps.setString(1, l.getTen());
//			ps.setString(2, l.getDc());
//			ps.setInt(3, l.getSdt());
//			ps.setString(4,l.getBando());
//			ps.setString(5,l.getChitet());
//			
//			ps.setString(6, l.getCachthuc());
//			ps.setString(7, l.getDichvu());
//			ps.setString(8, l.getEmail());
//
//			System.out.println("da chen");
//			return ps.executeUpdate() == 1;
//
//		} catch (Exception e) {
//			// TODO: handle exception
//		}finally {
//			   DBPool.releaseConnection(connection, ps);
//			  }
	return false;
	}

	@Override
	public boolean update(MyModel model) {
		Connection connection = DBPool.getConnection();
		String sql = "UPDATE lienhe SET ten=?,dc=? ,sdt=? ,bando=?, chitiet=? ,cachthuc=?,dichvu=?,email=? ";
		try {
			 ps = connection.prepareStatement(sql);
			 LienHe l = (LienHe) model;
			ps.setString(1, l.getTen());
			ps.setString(2, l.getDc());
			ps.setInt(3, l.getSdt());
			ps.setString(4,l.getBando());
			ps.setString(5,l.getChitet());
			
			ps.setString(6, l.getCachthuc());
			ps.setString(7, l.getDichvu());
			ps.setString(8, l.getEmail());
			System.out.println("da up");
			System.out.println(l.toString());
			return ps.executeUpdate() == 1;
		} catch (Exception e) {
			// TODO: handle exception
		}finally {
			   DBPool.releaseConnection(connection, ps);
			  }
		return false;
	}

	@Override
	public boolean delete(int id) {
//		Connection connection = DBPool.getConnection();
//		String sql = "DELETE from user WHERE `userID`=?";
//		try {
//			 ps = connection.prepareStatement(sql);
//			ps.setInt(1, id);
//			System.out.println("da xoa");
//			return ps.executeUpdate() == 1;
//		} catch (Exception e) {
//			// TODO: handle exception
//		}
//		finally {
//			   DBPool.releaseConnection(connection, ps);
//			  }
	return false;
	}

	@Override
	public MyModel getModel(int id)  {
//		Connection connection = DBPool.getConnection();
//		String sql = "SELECT * FROM user WHERE `userID`=?";
//		try {
//			ps = connection.prepareCall(sql);
//			ps.setInt(1, id);
//
//			 rs = ps.executeQuery();
//			while (rs.next()) {
//				MyModel u = new User(rs.getInt("userID"), rs.getString("username"), rs.getString("email"),
//						rs.getString("password"), rs.getString("address"), rs.getInt("sex"), rs.getString("phone"),
//						rs.getInt("active"),rs.getInt("admin"));
//				System.out.println(rs.getInt("userID"));
//
//				System.out.println("da lấy");
//				return u;
//			}
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}finally {
//			   DBPool.releaseConnection(connection, ps, rs);
//			  }
//		
		
		return null;
	}

	public LienHe getlienhe()  {
		Connection connection = DBPool.getConnection();
		String sql = "SELECT * FROM lienhe";
		LienHe l = null;
		 try {
			ps = connection.prepareCall(sql);
			rs = ps.executeQuery();
			
			while (rs.next()) {

				 l=new LienHe(rs.getString("ten"), rs.getString("dc"), rs.getInt("sdt"), rs.getString("bando"), rs.getString("chitiet"), rs.getString("cachthuc"), rs.getString("dichvu"), rs.getString("email"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			   DBPool.releaseConnection(connection, ps, rs);
			  }
		   
		 
		return l;
	}

	public static void main(String[] args) throws SQLException {
	LienheDAO l = new LienheDAO();
//System.out.println(l.update(new LienHe("nhât nhât", "nhà tui", 143, "aihi do ngu", "asd", "asd", "asd", "asd")));

	System.out.println(l.getlienhe().getTen());
	}

}
