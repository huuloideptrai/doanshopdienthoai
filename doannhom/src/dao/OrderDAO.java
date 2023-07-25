package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import connect.DBPool;
import models.MyModel;
import models.Order;


public class OrderDAO implements IDAO{
	PreparedStatement ps;
	 ResultSet rs ;
	@Override
	public ArrayList<MyModel> getListModel() {


	Connection connection = DBPool.getConnection();
	String sql="SELECT * FROM orders";
	ArrayList<MyModel> list = new ArrayList<>();
	try {
		ps= connection.prepareCall(sql);
		 rs = ps.executeQuery();
			
			while(rs.next()){
		list.add(new Order(rs.getInt("orderID"), rs.getInt("userID"), rs.getDate("datecreate"), rs.getInt("status"), rs.getInt("total"), rs.getString("pay"), rs.getInt("hide")));
			}
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	finally {
		   DBPool.releaseConnection(connection, ps, rs);
		  }
		
		return list;
	}

	@Override
	public boolean insert(MyModel model) {
	
		Connection connection= DBPool.getConnection();
		String sql= "INSERT INTO orders VALUE(?,?,?,?,?,?,?)";
		try {
		 ps= connection.prepareStatement(sql);
		Order o= (Order)model;
			ps.setInt(1, o.getOrderID());
			ps.setInt(2, o.getUserID());
			
			ps.setDate(3,(Date)o.getDatecreate());;
			ps.setInt(4, o.getStatus());
			ps.setInt(5, o.getTotal());
			ps.setString(6, o.getPay());
			ps.setInt(7, o.getHide());
			
			System.out.println("da chen");
			return ps.executeUpdate()==1;
			
		} catch (Exception e) {
			// TODO: handle exception
		}finally {
			   DBPool.releaseConnection(connection, ps);
		  }
				return false;
	}

	@Override
	public boolean update(MyModel model) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean delete(int id) {

		Connection connection =DBPool.getConnection();
		String sql="DELETE from orders WHERE orderID=?";
		try {
			 ps= connection.prepareStatement(sql);
			ps.setInt(1, id);
			System.out.println("da xoa");
			return ps.executeUpdate()==1;
		} catch (Exception e) {
			// TODO: handle exception
		}
		finally {
			   DBPool.releaseConnection(connection, ps);
		  }
		return false;
		
	
		
		
	}

	@Override
	public MyModel getModel(int id) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	public static void main(String[] args) throws SQLException {
//		Date d= new Date(1923, 2, 23);
//	Order o=	new Order(12312, 123, d, 31, 12, "3123", 0) ;
//	new OrderDAO().insert(o);
//		ArrayList<MyModel> l= new OrderDAO().getListModel();
//	System.out.println(l.size());
//	
	}

	public boolean active(int id) {
		Connection connection = DBPool.getConnection();
		String sql="UPDATE orders SET hide=1 Where orderID = ? ";
		try {
	 ps= connection.prepareStatement(sql);

			
			ps.setInt(1,id);
			
			System.out.println("da xac nhan");
			
			return ps.executeUpdate()==1;
		} catch (Exception e) {
			// TODO: handle exception
		}
		finally {
			   DBPool.releaseConnection(connection, ps);
		  }
		return false;
	}

	public boolean danggiao(int id) {
		Connection connection = DBPool.getConnection();
		String sql="UPDATE orders SET hide=2 Where orderID = ? ";
		try {
	 ps= connection.prepareStatement(sql);

			
			ps.setInt(1,id);
			
			System.out.println("da xac nhan");
			
			return ps.executeUpdate()==1;
		} catch (Exception e) {
			// TODO: handle exception
		}
		finally {
			   DBPool.releaseConnection(connection, ps);
		  }
		return false;
	}


	public boolean  chuaxem(int id) {
		Connection connection = DBPool.getConnection();
		String sql="UPDATE orders SET hide=0 Where orderID = ? ";
		try {
	 ps= connection.prepareStatement(sql);

			
			ps.setInt(1,id);
			
			System.out.println("da xac nhan");
			
			return ps.executeUpdate()==1;
		} catch (Exception e) {
			// TODO: handle exception
		}
		finally {
			   DBPool.releaseConnection(connection, ps);
		  }
		return false;
	
}
	public boolean deletetheodonhang(int id) {

		Connection connection =DBPool.getConnection();
		String sql="DELETE from orderdetail WHERE orderID=?";
		try {
			 ps= connection.prepareStatement(sql);
			ps.setInt(1, id);
			System.out.println("da xoa");
			return ps.executeUpdate()==1;
		} catch (Exception e) {
			// TODO: handle exception
		}
		finally {
			   DBPool.releaseConnection(connection, ps);
		  }
		return false;
		
	
		
		
	}	
}
