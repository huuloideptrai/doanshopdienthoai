package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import connect.DBPool;
import models.MyModel;
import models.Product;

public class ProductDAO implements IDAO {
	PreparedStatement ps;
	 ResultSet rs ;
	@Override
	public ArrayList<MyModel> getListModel()  {
	    Connection connection = DBPool.getConnection();
	    String sql = "SELECT * FROM products ";
	    ArrayList<MyModel> list = new ArrayList<>();
	  try {
		ps = connection.prepareCall(sql);
		 rs = ps.executeQuery();
		   
		    while (rs.next()) {
		    list.add(new Product(rs.getInt("productID"), rs.getString("productName"), rs.getInt("categoryID"), rs.getInt("priority"), rs.getInt("price"), rs.getDate("lastupdate"), rs.getInt("hide"), rs.getString("description"),rs.getString("material"),rs.getString("size"),rs.getInt("total"),rs.getString("color"),rs.getInt("makerID")));
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
	public ArrayList<Product> getListModel1()  {
	    Connection connection = DBPool.getConnection();
	    String sql = "SELECT productID,categoryID FROM products ";
	    ArrayList<Product> list = new ArrayList<>();
	  try {
		ps = connection.prepareCall(sql);
		 rs = ps.executeQuery();
		 
		    while (rs.next()) {
		    	  Product p= new Product();
		    	  p.setProductID(rs.getInt("productID"));
		    	  p.setCategoryID(rs.getInt("categoryID"));
		    list.add(p);
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
		String sql= "INSERT INTO products VALUE(?,?,?,?,?,?,?,?,?,?,?,?,?)";
		try {
			ps= connection.prepareStatement(sql);
		Product p= (Product)model;
			ps.setInt(1, p.getProductID());
			ps.setString(2, p.getProductName());
			ps.setInt(3,p.getCategoryID());
			ps.setInt(4, p.getPriority());
			ps.setInt(5, p.getPrice());
			ps.setDate(6, (Date) p.getLastupdate());
			ps.setInt(7, p.getHide());
			ps.setString(8, p.getDescription());
			ps.setString(9, p.getMaterial());
			ps.setString(10,p.getSize());
			ps.setInt(11, p.getTotal());
			
			ps.setString(12, p.getColor());
			ps.setInt(13, p.getMakerID());
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
	String sql="UPDATE products SET productName=? ,categoryID=? ,priority=? ,price=? ,lastupdate=? ,hide=? ,description=?,material=? ,size=? ,total=?, color=?, makerID=? Where productID=?";
		try {
			 ps= connection.prepareStatement(sql);
			Product p= (Product)model;
			ps.setString(1, p.getProductName());
			ps.setInt(2,p.getCategoryID());
			ps.setInt(3, p.getPriority());
			ps.setInt(4, p.getPrice());
			ps.setDate(5, (Date) p.getLastupdate());
			ps.setInt(6, p.getHide());
			ps.setString(7, p.getDescription());
			ps.setString(8, p.getMaterial());
			ps.setString(9,p.getSize());
			ps.setInt(10, p.getTotal());
			ps.setString(11, p.getColor());
			ps.setInt(12, p.getMakerID());
			ps.setInt(13, p.getProductID());
			
			System.out.println("da up");
			System.out.println(p.toString());
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
		String sql="DELETE from products WHERE productID=?";
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
	public static void main(String[] args) throws SQLException {
	ProductDAO dao= new ProductDAO();
//Date d= new Date(1996, 3, 25);
//	int i=1825743691;
//		for (int i = 0; i < 15; i++) {
//			dao.insert(new Product(0, "nhất yêu dấu"+i, i, i, i,d,1, "description","ahihi","to",10,"den"));
		
//		}
//		int i=5;
//System.out.println(dao.update(new Product(i, "vãi"+i, i, 1, i,d,1, "descri","ahihi","to",10,"den",1)));
	//	dao.delete(5);
//		ArrayList<MyModel> l= new ProductDAO().getListModel();
//		System.out.println(l.size());
	
	//System.out.println(dao.getModel(3).toString());
	
System.out.println( dao.tinhtongsanpham(1947345739));
	//System.out.println(dao.tinhtongsanpham(816));
	//System.out.println(dao.tinhtongsanpham(816));
//	System.out.println(dao.getListProductByCategoryID(1).size());
//	System.out.println(dao.getListSpmuaNhieutheoCategoryID(1).size());
//	ArrayList<Product> listsale= dao.getListSpGiamGianhieunhat();
	//System.out.println(listsale.size());
//	ImageDAO idao= new ImageDAO();
//	ProductDAO pdao= new ProductDAO();
//	String l0="",l1="",l2="",l3="",l4="";
//	int idcate0=0, idcate1=0,idcate2=0,idcate3=0,idcate4=0;
//	ArrayList<Product> lpd=pdao.getListModel1();
//	ArrayList<Product> listsale= pdao.getListSpGiamGianhieunhat();
//	for(int k=0;k<lpd.size();k++){
//	Product pp=	(Product) lpd.get(k);
//		if(pp.getProductID()==listsale.get(0).getProductID()){
//			idcate0=pp.getCategoryID();
//			
//		}else if(pp.getProductID()==listsale.get(1).getProductID()){
//			idcate1=pp.getCategoryID();
//		}else if(pp.getProductID()==listsale.get(2).getProductID()){
//			idcate2=pp.getCategoryID();
//		}else if(pp.getProductID()==listsale.get(3).getProductID()){
//			idcate3=pp.getCategoryID();
//		}else if(pp.getProductID()==listsale.get(4).getProductID()){
//			idcate4=pp.getCategoryID();
//		}
//		
//	}
//		
//	
//
//
//	ArrayList<Images> imadao= new ImageDAO().getListImage();
//	for(int g=0;g<imadao.size();g++){
//	Images ima=	 imadao.get(g);
//		if(ima.getProductID()==listsale.get(0).getProductID()){
//			l0=ima.getLink();
//		}
//		else if(ima.getProductID()==listsale.get(1).getProductID()){
//			l1=ima.getLink();
//		}
//		else	if(ima.getProductID()==listsale.get(2).getProductID()){
//			l2=ima.getLink();
//		}
//		else	if(ima.getProductID()==listsale.get(3).getProductID()){
//			l3=ima.getLink();
//		}else if(ima.getProductID()==listsale.get(4).getProductID()){
//			l4=ima.getLink();
//		}
//		
//	}
//	System.out.println(idcate0);
//	System.out.println(idcate1);
//	System.out.println(idcate2);
//	System.out.println(idcate3);
//	System.out.println(idcate4);
//			
//	
//	System.out.println(l0);
//	System.out.println(l1);
//	System.out.println(l2);
//	System.out.println(l3);
//	System.out.println(l4);
			
	
	
			
	}

	@Override
	public MyModel getModel(int id)  {
		
		 Connection connection = DBPool.getConnection();
		    String sql = "SELECT * FROM products WHERE productID=?";
		 try {
			ps = connection.prepareCall(sql);
ps.setInt(1, id);
			
		    ResultSet rs = ps.executeQuery();
		    while (rs.next()){
		    MyModel p=new Product(rs.getInt("productID"), rs.getString("productName"), rs.getInt("categoryID"), rs.getInt("priority"), rs.getInt("price"), rs.getDate("lastupdate"), rs.getInt("hide"), rs.getString("description"),rs.getString("material"),rs.getString("size"),rs.getInt("total"),rs.getString("color"),rs.getInt("makerID"));
		    System.out.println(rs.getInt("productID"));
		    System.out.println(rs.getInt("categoryID"));
		    System.out.println("da lấy");
		    return p;
	}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 finally {
			   DBPool.releaseConnection(connection, ps, rs);
			  }
			return null;}

	public  ArrayList<MyModel> getListProductByCategoryID(int categoryID ) {
		
		

		 Connection connection = DBPool.getConnection();
		    String sql = "SELECT * FROM products WHERE categoryID= '"+categoryID+"'  and hide=1   " ;
		    ArrayList<MyModel> list = new ArrayList<>();
		 try {
			ps = connection.prepareCall(sql);
			rs = ps.executeQuery();
			   
		    while (rs.next()) {
		   
		    	   list.add(new Product(rs.getInt("productID"), rs.getString("productName"), rs.getInt("categoryID"), rs.getInt("priority"), rs.getInt("price"), rs.getDate("lastupdate"), rs.getInt("hide"), rs.getString("description"),rs.getString("material"),rs.getString("size"),rs.getInt("total"),rs.getString("color"),rs.getInt("makerID")));
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

	public  ArrayList<MyModel> getListProductBypage(int categoryID,int gtbatdau,int soluong ) {
		
		

		 Connection connection = DBPool.getConnection();
		    String sql = "SELECT * FROM products WHERE categoryID= '"+categoryID+"' and hide=1 limit ?,?";
		    ArrayList<MyModel> list = new ArrayList<>();
		    try {
				ps = connection.prepareCall(sql);
				 ps.setInt(1, gtbatdau);
	              ps.setInt(2, soluong);
				   ResultSet rs = ps.executeQuery();
				  
				    while (rs.next()) {
				   
				    	   list.add(new Product(rs.getInt("productID"), rs.getString("productName"), rs.getInt("categoryID"), rs.getInt("priority"), rs.getInt("price"), rs.getDate("lastupdate"), rs.getInt("hide"), rs.getString("description"),rs.getString("material"),rs.getString("size"),rs.getInt("total"),rs.getString("color"),rs.getInt("makerID")));
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
	public int tinhtongsanpham(int categoryID){

		

		 Connection connection = DBPool.getConnection();
		    String sql = "SELECT count(productID) FROM products WHERE categoryID= '"+categoryID+"'";
		    int dem=0;
		     try {
				ps = connection.prepareCall(sql);
				 rs = ps.executeQuery();
				  
				    while (rs.next()){
				    	dem= rs.getInt(1);
				    }
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		     finally {
				   DBPool.releaseConnection(connection, ps, rs);
				  }
		return dem;
		
	}
	public ArrayList<MyModel> getListSpmuaNhieutheoCategoryID(int categoryID)  {
		// TODO Auto-generated method stub
		 Connection connection = DBPool.getConnection();
		   String sql = "SELECT o.productID,p.productName,p.priority,p.price,p.description,p.hide, p.categoryID ,p.lastupdate, p.material,p.size , p.total, p.color,p.makerID FROM orderdetail o JOIN products p ON o.productID=p.productID WHERE p.categoryID="+categoryID+" and p.hide=1 GROUP BY o.productID ORDER BY SUM(quantity) DESC";
		   ArrayList<MyModel> list = new ArrayList<>();
		   try {
			ps = connection.prepareCall(sql);

		     rs = ps.executeQuery();
		   
		    while (rs.next()) {

		    	   list.add(new Product(rs.getInt("productID"), rs.getString("productName"), rs.getInt("categoryID"), rs.getInt("priority"), rs.getInt("price"), rs.getDate("lastupdate"), rs.getInt("hide"), rs.getString("description"),rs.getString("material"),rs.getString("size"),rs.getInt("total"),rs.getString("color"),rs.getInt("makerID")));
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
	
	public ArrayList<MyModel> getListSpmuaNhieu()  {
		// TODO Auto-generated method stub
		 Connection connection = DBPool.getConnection();
		   String sql = "SELECT o.productID,p.productName,p.priority,p.price,p.description,p.hide, p.categoryID ,p.lastupdate, p.material,p.size , p.total, p.color,p.makerID FROM orderdetail o JOIN products p ON o.productID=p.productID WHERE p.hide=1 GROUP BY o.productID ORDER BY SUM(quantity) DESC";
		   ArrayList<MyModel> list = new ArrayList<>();
		   try {
			ps = connection.prepareCall(sql);

		     rs = ps.executeQuery();
		   
		    while (rs.next()) {

		    	   list.add(new Product(rs.getInt("productID"), rs.getString("productName"), rs.getInt("categoryID"), rs.getInt("priority"), rs.getInt("price"), rs.getDate("lastupdate"), rs.getInt("hide"), rs.getString("description"),rs.getString("material"),rs.getString("size"),rs.getInt("total"),rs.getString("color"),rs.getInt("makerID")));
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
	
	
	
	public ArrayList<Product> getListSpGiamGianhieunhat()  {
		// TODO Auto-generated method stub
		 Connection connection = DBPool.getConnection();
		   String sql = "SELECT productID,productName,priority FROM products  WHERE  hide=1 GROUP BY productID ORDER BY priority DESC limit 5";
		   ArrayList<Product> list = new ArrayList<>();
		   try {
			ps = connection.prepareCall(sql);

		     rs = ps.executeQuery();
		   
		    while (rs.next()) {
Product p= new Product();
p.setProductID(rs.getInt("productID"));
p.setProductName(rs.getString("productName"));
p.setPriority(rs.getInt("priority"));
		    	   list.add(p);
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
	
	
	public String getName(int id)  {
		
		 Connection connection = DBPool.getConnection();
		    String sql = "SELECT productName FROM products WHERE productID=?";
		    try {
				ps = connection.prepareCall(sql);
				ps.setInt(1, id);
				
			    rs = ps.executeQuery();
			    while (rs.next()){
			    	
			    	String ten=rs.getString("productName");
			    //  System.out.println(rs.getInt("productID"));
			   System.out.println("da lấy");
			    return ten;
		}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				   DBPool.releaseConnection(connection, ps, rs);
				  }
			
			return null;}
	public String gettennsx(int id) {

		Connection connection = DBPool.getConnection();
		String sql = "SELECT makerName FROM maker WHERE makerID=?";
		String ten="";
		try {
			ps = connection.prepareCall(sql);
			ps.setInt(1, id);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				ten= rs.getString("makerName");
						
				
				System.out.println(rs.getString("makerName"));
				System.out.println("da lấy");
				return ten;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBPool.releaseConnection(connection, ps, rs);
		}

		return null;
	}
	public int getCategoryID(int id) {

		Connection connection = DBPool.getConnection();
		String sql = "SELECT categoryID FROM products WHERE productID=?";
		int ma=0;
		try {
			ps = connection.prepareCall(sql);
			ps.setInt(1, id);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				ma= rs.getInt("categoryID");
						
				
				System.out.println(rs.getString("categoryID"));
				System.out.println("da lấy");
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBPool.releaseConnection(connection, ps, rs);
		}
		return ma;

		
	}
	public boolean updatesoluong(int ma,int soluong) {
		Connection connection = DBPool.getConnection();
	String sql="UPDATE products SET total=? Where productID=?";
		try {
			 ps= connection.prepareStatement(sql);
			
			ps.setInt(1,soluong);
			ps.setInt(2, ma);
			
			
			System.out.println("da up");
			
			return ps.executeUpdate()==1;
		} catch (Exception e) {
			// TODO: handle exception
		}finally {
			   DBPool.releaseConnection(connection, ps);
			  }
		return false;
	}
	public ArrayList<MyModel> timkiem(String chuoi)  {
	    Connection connection = DBPool.getConnection();
	    String sql = "SELECT * FROM products  WHERE productName LIKE '%"+chuoi+"%' ";
	    ArrayList<MyModel> list = new ArrayList<>();
	  try {
		ps = connection.prepareCall(sql);
		 rs = ps.executeQuery();
		   
		    while (rs.next()) {
		    list.add(new Product(rs.getInt("productID"), rs.getString("productName"), rs.getInt("categoryID"), rs.getInt("priority"), rs.getInt("price"), rs.getDate("lastupdate"), rs.getInt("hide"), rs.getString("description"),rs.getString("material"),rs.getString("size"),rs.getInt("total"),rs.getString("color"),rs.getInt("makerID")));
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
	
}
