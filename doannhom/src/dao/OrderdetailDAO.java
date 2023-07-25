package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import connect.DBPool;
import models.MyModel;
import models.Orderdetail;
import models.Thongke;


public class OrderdetailDAO implements IDAO {
	PreparedStatement ps;
	 ResultSet rs ;
	@Override
	public ArrayList<MyModel> getListModel() {


		Connection connection = DBPool.getConnection();
		String sql="SELECT * FROM orderdetail";
		ArrayList<MyModel> list = new ArrayList<>();
		 try {
			ps= connection.prepareCall(sql);
			 rs = ps.executeQuery();
				
				while(rs.next()){
			list.add(new Orderdetail(rs.getInt("orderdetailID"), rs.getInt("orderID"), rs.getInt("productID"), rs.getInt("quantity"), rs.getInt("price"),rs.getString("chatlieu"),rs.getString("mau"),rs.getString("kichthuoc")));
			
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
		Connection connection= DBPool.getConnection();
		String sql= "INSERT INTO orderdetail VALUE(?,?,?,?,?,?,?,?)";
		try {
			 ps= connection.prepareStatement(sql);
		Orderdetail o= (Orderdetail)model;
		ps.setInt(1, o.getOrderdetailID());
			ps.setInt(2, o.getOrderID());
			ps.setInt(3, o.getProductID());
			
		
			ps.setInt(4, o.getQuantity());
			ps.setInt(5, o.getUnitprice());
		ps.setString(6, o.getChatlieu());
		ps.setString(7, o.getMau());
		ps.setString(8, o.getKichthuoc());
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
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public MyModel getModel(int id) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}
	
	public  ArrayList<MyModel> getListOrderdetailByorderID(int orderID ) {
		
		

		 Connection connection = DBPool.getConnection();
		    String sql = "SELECT * FROM orderdetail WHERE orderID= '"+orderID+"'";
		    ArrayList<MyModel> list = new ArrayList<>();
	 try {
		ps = connection.prepareCall(sql);
		  rs = ps.executeQuery();
		   
		    while (rs.next()) {
		    	list.add(new Orderdetail(rs.getInt("orderdetailID"), rs.getInt("orderID"), rs.getInt("productID"), rs.getInt("quantity"), rs.getInt("price"),rs.getString("chatlieu"),rs.getString("mau"),rs.getString("kichthuoc")));
		    		 	    }
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}finally {
		   DBPool.releaseConnection(connection, ps, rs);
		  }

			
			    return list;
	
	}
	public  ArrayList<Thongke> sosanphammuatheo(int orderID ) {
		
		

		 Connection connection = DBPool.getConnection();
		    String sql = "SELECT SUM(quantity) as hi,productID  FROM orderdetail WHERE orderID="+orderID+" GROUP BY productID ";
		ArrayList<Thongke> ltk= new ArrayList<>();
		 
		 try {
		ps = connection.prepareCall(sql);
		  rs = ps.executeQuery();
		   
		    while (rs.next()) {
ltk.add(new Thongke(rs.getInt("productID")+"", rs.getInt("hi")));
             
		    }
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}finally {
		   DBPool.releaseConnection(connection, ps, rs);
		  }

			
			    return ltk;
	
	}
	
	public static void main(String[] args) {
		System.out.println(new OrderdetailDAO().sosanphammuatheo(1869676596));
	}
	
}
