package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import connect.DBPool;
import models.Category;
import models.MyModel;
import models.Thongke;

public class ChartDAO implements IDAO{
	PreparedStatement ps;
	 ResultSet rs ;
	@Override
	public ArrayList<MyModel> getListModel() throws SQLException {
   try {
	IDAO categoryDAO= new CategoryDAO();
	ProductDAO productDAO= new ProductDAO();
	ArrayList<MyModel> list= new ArrayList<MyModel>();
	
	

	for (int i = 0; i < categoryDAO.getListModel().size(); i++) {
		Category c=(Category)categoryDAO.getListModel().get(i) ;
		
		
		list.add(new Thongke(c.getCategoryName(), productDAO.getListProductByCategoryID(c.getCategoryID()).size()));
		
		
	
	}
	
	return list;
	
} catch (Exception e) {
	// TODO: handle exception
}
		return null;
	}

	@Override
	public boolean insert(MyModel model) {
		// TODO Auto-generated method stub
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
public static void main(String[] args) throws SQLException {
//	ChartDAO chartDAO= new ChartDAO();
//	//System.out.println(in(chartDAO.getListModel()));
//	int year= new Date().getYear();
//	
//	int m= new java.sql.Date(new Date().getTime()).getDay();
//	int d= new Date().getDay();
//	java.sql.Date k= new java.sql.Date(new Date().getTime());
//	 Calendar c = Calendar.getInstance();
//     int nam = c.get(Calendar.YEAR);
//
//     // Trả về giá trị từ 0 - 11
//     int thag = c.get(Calendar.MONTH);
//	
//	//System.out.println(year);
//	
//    System.out.println(chartDAO.doanhThuTheoThang(12, 2016)); 
     
     
//	System.out.println(nam);	System.out.println(thag+1);
}


public static String in(ArrayList<MyModel>list) {
	String s= "";
	
	for (int i = 0; i < list.size(); i++) {
		s+=list.get(i).toString()+",";
	}
	return 
	
        
       s.substring(0, s.length()-1);
}


public int doanhThuTheoThang(int thang,int nam) {

	Connection connection = DBPool.getConnection();
	String sql="SELECT SUM(total)  from orders WHERE hide=1 AND MONTH(datecreate) ="+thang+" AND YEAR(datecreate)="+nam+"";
	PreparedStatement ps;
	int tien=0;
	try {
		ps = connection.prepareCall(sql);
		ResultSet rs = ps.executeQuery();
		
			while(rs.next()){
		tien=rs.getInt(1);
			}
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	
		
	
	
	return tien;
	
}
}
