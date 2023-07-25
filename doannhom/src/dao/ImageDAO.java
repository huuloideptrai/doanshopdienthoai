package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import connect.DBPool;
import models.Images;
import models.MyModel;


public class ImageDAO implements IDAO{
	PreparedStatement ps;
	 ResultSet rs ;
	@Override
	public ArrayList<MyModel> getListModel(){
		return null;
//		Connection connection =  DBPool.getConnection();
//		String sql="SELECT link,productID FROM images where type=1 ";
//		  ArrayList<MyModel> list = new ArrayList<>();
//		// TODO Auto-generated method stub
//		  try {
//			ps = connection.prepareCall(sql);
//			  rs = ps.executeQuery();
//			  
//			    while (rs.next()) {
//			    	Images images= new Images();
//			    	images.setLink(rs.getString("link"));
//			    	images.setProductID(rs.getInt("productID"));
////			   list.add(new Images(rs.getInt("imageID"), rs.getInt("productID"), rs.getString("link"), rs.getInt("type"), rs.getInt("thumbnail")));
////			        list.add(new Product(rs.getInt("productID"), rs.getString("productName"), rs.getInt("categoryID"), rs.getInt("priority"), rs.getInt("price"), rs.getDate("lastupdate"), rs.getInt("hide"), rs.getString("description")));
//			    }
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		  finally {
//			   DBPool.releaseConnection(connection, ps, rs);
//			  }
//		    return list;
		}
	@Override
	public boolean insert(MyModel model) {
		// TODO Auto-generated method stub
		Connection connection= DBPool.getConnection();
		String sql = "INSERT INTO images VALUES(?,?,?,?,?)";
		try {
			PreparedStatement ps= connection.prepareStatement(sql);
			Images i =(Images) model;
		ps.setInt(1, 0);
		ps.setInt(2, i.getProductID());
		ps.setString(3, i.getLink());
		ps.setInt(4, i.getType());
		ps.setInt(5,i.getThumbnail());
		 System.out.println("da chen ảnh");
		return ps.executeUpdate()==1;
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
		}
		finally {
			   DBPool.releaseConnection(connection, ps);
			  }
		return false;
	}

	@Override
	public boolean update(MyModel model) {
		Connection connection = DBPool.getConnection();
		String sql="UPDATE images SET productID =? ,link=? ,thumbnail=? Where imageID = ? ";
		try {
		 ps= connection.prepareStatement(sql);
			Images c= (Images)model;
			
			ps.setInt(1, c.getProductID());
			ps.setString(2, c.getLink());
	
			ps.setInt(3, c.getThumbnail());
			ps.setInt(4, c.getImagesID());
			System.out.println("da up");
			System.out.println(c.toString());
			return ps.executeUpdate()==1;
		} catch (Exception e) {
			// TODO: handle exception
		}finally {
			   DBPool.releaseConnection(connection, ps);
		  }
		return false;
	}
	
	public boolean update1(MyModel model) {
		Connection connection = DBPool.getConnection();
		String sql="UPDATE images SET link=? ,thumbnail=? Where imageID = ? ";
		try {
		 ps= connection.prepareStatement(sql);
			Images c= (Images)model;
			
		
			ps.setString(1, c.getLink());
	
			ps.setInt(2, c.getThumbnail());
			ps.setInt(3, c.getImagesID());
			System.out.println("da up");
			System.out.println(c.toString());
			return ps.executeUpdate()==1;
		} catch (Exception e) {
			// TODO: handle exception
		}finally {
			   DBPool.releaseConnection(connection, ps);
		  }
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
	public  ArrayList<MyModel> getListImageByProductID(int productID ){
		
		

		 Connection connection = DBPool.getConnection();
		    String sql = "SELECT * FROM images WHERE productID= ?";
		    ArrayList<MyModel> list = new ArrayList<>();
		   try {
			ps = connection.prepareCall(sql);
			ps.setInt(1, productID);
			
			
			  rs = ps.executeQuery();
			 
			    while (rs.next()) {
			    	  list.add(new Images(rs.getInt("imageID"), rs.getInt("productID"), rs.getString("link"), rs.getInt("type"), rs.getInt("thumbnail")));
			       
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
	public ArrayList<Images> getListImage(){
		Connection connection =  DBPool.getConnection();
		String sql="SELECT link,productID FROM images where type=1 ";
		  ArrayList<Images> list = new ArrayList<Images>();
		// TODO Auto-generated method stub
		  try {
			ps = connection.prepareCall(sql);
			  rs = ps.executeQuery();
			  
			    while (rs.next()) {
			    	Images images= new Images();
			    	images.setLink(rs.getString("link"));
			    	images.setProductID(rs.getInt("productID"));
//			   list.add(new Images(rs.getInt("imageID"), rs.getInt("productID"), rs.getString("link"), rs.getInt("type"), rs.getInt("thumbnail")));
//			        list.add(new Product(rs.getInt("productID"), rs.getString("productName"), rs.getInt("categoryID"), rs.getInt("priority"), rs.getInt("price"), rs.getDate("lastupdate"), rs.getInt("hide"), rs.getString("description")));
			   list.add(images);
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
	
	public ArrayList<Images> getListImage1(){
		Connection connection =  DBPool.getConnection();
		String sql="SELECT link,productID,type,imageID FROM images where type=2 or type=3 ";
		  ArrayList<Images> list = new ArrayList<Images>();
		// TODO Auto-generated method stub
		  try {
			ps = connection.prepareCall(sql);
			  rs = ps.executeQuery();
			  
			    while (rs.next()) {
			    	Images images= new Images();
			    	images.setLink(rs.getString("link"));
			    	images.setProductID(rs.getInt("productID"));
			    	images.setType(rs.getInt("type"));
			    	images.setImagesID(rs.getInt("imageID"));
//			   list.add(new Images(rs.getInt("imageID"), rs.getInt("productID"), rs.getString("link"), rs.getInt("type"), rs.getInt("thumbnail")));
//			        list.add(new Product(rs.getInt("productID"), rs.getString("productName"), rs.getInt("categoryID"), rs.getInt("priority"), rs.getInt("price"), rs.getDate("lastupdate"), rs.getInt("hide"), rs.getString("description")));
			   list.add(images);
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
	
	public String getanhbaner()  {
		
		 Connection connection = DBPool.getConnection();
		    String sql = "SELECT link FROM images WHERE type=2";
		    String anh="";
		 try {
			ps = connection.prepareCall(sql);

			
		    ResultSet rs = ps.executeQuery();
		    while (rs.next()){
		   anh=rs.getString("link");
		    System.out.println("da lấy");
		    return anh;
	}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 finally {
			   DBPool.releaseConnection(connection, ps, rs);
			  }
			return null;}
	public String getanhlogo()  {
		
		 Connection connection = DBPool.getConnection();
		    String sql = "SELECT link FROM images WHERE type=3";
		    String anh="";
		 try {
			ps = connection.prepareCall(sql);

			
		    ResultSet rs = ps.executeQuery();
		    while (rs.next()){
		   anh=rs.getString("link");
		    System.out.println("da lấy");
		    return anh;
	}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 finally {
			   DBPool.releaseConnection(connection, ps, rs);
			  }
			return null;}

	public String getlinktheoProductID(int id)  {
		
		 Connection connection = DBPool.getConnection();
		    String sql = "SELECT link FROM images WHERE productID=?";
		    String link="";
		 try {
			ps = connection.prepareCall(sql);
ps.setInt(1, id);
			
		    ResultSet rs = ps.executeQuery();
		    while (rs.next()){
		   link=rs.getString("link");
		    System.out.println("da lấy");
		    return link;
	}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 finally {
			   DBPool.releaseConnection(connection, ps, rs);
			  }
			return null;}

	public static void main(String[] args) {
		ImageDAO i= new ImageDAO();
//		i.insert(new Images(0, 123, "link", 1, 1));
		ArrayList <Images> listhinh=i.getListImage();
		System.out.println(listhinh.size());
	}
	
	
	
}
