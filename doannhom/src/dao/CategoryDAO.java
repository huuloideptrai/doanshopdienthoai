package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import connect.DBPool;
import models.Category;
import models.MyModel;
import models.Product;

public class CategoryDAO implements IDAO{
	PreparedStatement ps;
	 ResultSet rs ;
	@Override
	public boolean insert(MyModel model) {
Connection connection= DBPool.getConnection();
String sql= "INSERT INTO category VALUE(?,?,?,?)";
try {
	 ps= connection.prepareStatement(sql);
	Category c= (Category)model;
	ps.setInt(1, c.getCategoryID());
	ps.setString(2, c.getCategoryName());
	ps.setString(3, c.getDiscription());
	ps.setInt(4, c.getHide());
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
		Connection connection = DBPool.getConnection();
		String sql="UPDATE category SET categoryName =? ,discription=?,hide=? Where categoryID = ? ";
		try {
		 ps= connection.prepareStatement(sql);
			Category c= (Category)model;
			
			ps.setString(1, c.getCategoryName());
			ps.setString(2, c.getDiscription());
			ps.setInt(3, c.getHide());
			ps.setInt(4, c.getCategoryID());
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
		Connection connection =DBPool.getConnection();
		String sql="DELETE from category WHERE categoryID=?";
		try {
	 ps= connection.prepareStatement(sql);
			ps.setInt(1, id);
			System.out.println("da xoa");
			return ps.executeUpdate()==1;
		} catch (Exception e) {
			// TODO: handle exception
		}finally {
			   DBPool.releaseConnection(connection, ps);
		  }
		
		return false;
	}
public static void main(String[] args) throws SQLException {
CategoryDAO dao= new CategoryDAO();
ArrayList<Product> listsale= new ProductDAO().getListSpGiamGianhieunhat();
//	for (int i = 0; i < 15; i++) {
//		dao.insert(new Category(i, "category"+i, "discription"+i, 1));
//	
//	}
//dao.update(new Category(3, "truyen tranh", "doc chu chi", 0));
	//dao.delete(5);
	ArrayList<MyModel> l= new CategoryDAO().getListModel();
	System.out.println(l.size());
//	
//	System.out.println(dao.getModel(541));
}

@Override
public ArrayList<MyModel> getListModel()   {
	// TODO Auto-generated method stub
	
    Connection connection = DBPool.getConnection();
    String sql = "SELECT * FROM category";
    ArrayList<MyModel> list = new ArrayList<>();
 try {
	ps = connection.prepareCall(sql);
	  rs = ps.executeQuery();
	   
	    while (rs.next()) {
	   
	        list.add(new Category(rs.getInt("categoryID"), rs.getString("categoryName"), rs.getString("discription"), rs.getInt("hide")));
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
public ArrayList<MyModel> getListModel1()   {
	// TODO Auto-generated method stub
	
    Connection connection = DBPool.getConnection();
    String sql = "SELECT categoryID,categoryName FROM category";
    ArrayList<MyModel> list = new ArrayList<>();
 try {
	ps = connection.prepareCall(sql);
	  rs = ps.executeQuery();
	   
	    while (rs.next()) {
	   Category c= new Category();
	   c.setCategoryID(rs.getInt("categoryID"));
	   c.setCategoryName(rs.getString("categoryName"));
//	        list.add(new Category(rs.getInt("categoryID"), rs.getString("categoryName"), rs.getString("discription"), rs.getInt("hide")));
	   list.add(c);
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
public MyModel getModel(int id)   {

	 Connection connection = DBPool.getConnection();
	    String sql = "SELECT * FROM category WHERE categoryID=?";
	 try {
		ps = connection.prepareCall(sql);
	ps.setInt(1, id);
		
	    ResultSet rs = ps.executeQuery();
	    while (rs.next()){
	    MyModel c= new Category(rs.getInt("categoryID"), rs.getString("categoryName"), rs.getString("discription"), rs.getInt("hide"));
	    System.out.println(rs.getInt("categoryID"));
	    System.out.println(rs.getString("categoryName"));
	    System.out.println("da lấy");
	    return c;
}
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} finally {
		   DBPool.releaseConnection(connection, ps, rs);
	  }
	
		return null;
}
}
