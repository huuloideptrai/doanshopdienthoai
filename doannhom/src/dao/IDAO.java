package dao;

import java.sql.SQLException;
import java.util.ArrayList;

import models.MyModel;

public interface IDAO {
	//lay danh sách theo model
	public ArrayList<MyModel> getListModel() throws SQLException;
		
	//thêm mới theo model
	public boolean insert(MyModel model);
   //cập nhật(sửa) theo model
	public boolean update(MyModel model);
  //xóa theo id
	public boolean delete(int id);
	//lấy model theo id
	public MyModel getModel(int id) throws SQLException ;
	
}
