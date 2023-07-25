package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import connect.DBPool;
import models.MyModel;
import models.User;

public class UserDAO implements IDAO {
	PreparedStatement ps;
	 ResultSet rs ;
	 //lay danh danh user thuong
	@Override
	public ArrayList<MyModel> getListModel()  {
		Connection connection = DBPool.getConnection();
		String sql = "SELECT * FROM user where admin=0";
		ArrayList<MyModel> list = new ArrayList<>();
		 try {
			ps = connection.prepareCall(sql);
			rs = ps.executeQuery();
			
			while (rs.next()) {

				list.add(new User(rs.getInt("userID"), rs.getString("username"), rs.getString("email"),
						rs.getString("password"), rs.getString("address"), rs.getInt("sex"), rs.getString("phone"),
						rs.getInt("active"),rs.getInt("admin")));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			   DBPool.releaseConnection(connection, ps, rs);
			  }
		   
		 
		return list;
	}
	public ArrayList<MyModel> getListadmin()  {
		Connection connection = DBPool.getConnection();
		String sql = "SELECT * FROM user where admin=1";
		ArrayList<MyModel> list = new ArrayList<>();
		 try {
			ps = connection.prepareCall(sql);
			rs = ps.executeQuery();
			
			while (rs.next()) {

				list.add(new User(rs.getInt("userID"), rs.getString("username"), rs.getString("email"),
						rs.getString("password"), rs.getString("address"), rs.getInt("sex"), rs.getString("phone"),
						rs.getInt("active"),rs.getInt("admin")));
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
		Connection connection = DBPool.getConnection();
		String sql = "INSERT INTO user VALUE(?,?,?,?,?,?,?,?,?)";
		try {
			 ps = connection.prepareStatement(sql);
			User u = (User) model;
			ps.setInt(1, u.getUserID());
			ps.setString(2, u.getUsername());
			ps.setString(3, u.getEmail());
			ps.setString(4, u.getPassword());
			ps.setString(5, u.getAddress());
			ps.setInt(6, u.getSex());
			ps.setString(7, u.getPhone());
			ps.setInt(8, 1);
			ps.setInt(9, u.getAdmin());

			System.out.println("da chen");
			return ps.executeUpdate() == 1;

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
		String sql = "UPDATE user SET username=?,email=? ,password=? ,address=?, sex=?  ,phone=?,active=?,admin=? Where userID = ? ";
		try {
			 ps = connection.prepareStatement(sql);
			User u = (User) model;
			ps.setString(1, u.getUsername());
			ps.setString(2, u.getEmail());
			ps.setString(3, u.getPassword());
			ps.setString(4, u.getAddress());
			ps.setInt(5, u.getSex());
			ps.setString(6, u.getPhone());
			ps.setInt(7, u.getActive());
			ps.setInt(8, u.getAdmin());
			ps.setInt(9, u.getUserID());
			System.out.println("da up");
			System.out.println(u.toString());
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
		Connection connection = DBPool.getConnection();
		String sql = "DELETE from user WHERE `userID`=?";
		try {
			 ps = connection.prepareStatement(sql);
			ps.setInt(1, id);
			System.out.println("da xoa");
			return ps.executeUpdate() == 1;
		} catch (Exception e) {
			// TODO: handle exception
		}
		finally {
			   DBPool.releaseConnection(connection, ps);
			  }
		return false;
	}

	@Override
	public MyModel getModel(int id)  {
		Connection connection = DBPool.getConnection();
		String sql = "SELECT * FROM user WHERE `userID`=?";
		try {
			ps = connection.prepareCall(sql);
			ps.setInt(1, id);

			 rs = ps.executeQuery();
			while (rs.next()) {
				MyModel u = new User(rs.getInt("userID"), rs.getString("username"), rs.getString("email"),
						rs.getString("password"), rs.getString("address"), rs.getInt("sex"), rs.getString("phone"),
						rs.getInt("active"),rs.getInt("admin"));
				System.out.println(rs.getInt("userID"));

				System.out.println("da lấy");
				return u;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			   DBPool.releaseConnection(connection, ps, rs);
			  }
		
		
		return null;
	}

	// kiem tra email ton tai chua
	public boolean checkEmail(String email)  {
		Connection connection = DBPool.getConnection();
		String sql = "SELECT email FROM user where `email`='" + email + "'";
		 try {
			ps = connection.prepareCall(sql);
			 rs = ps.executeQuery();
				while (rs.next()) {
					connection.close();
					return true;
				}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 finally {
			   DBPool.releaseConnection(connection, ps, rs);
			  }
		
		return false;

	}

	public boolean active(int id) {
		Connection connection = DBPool.getConnection();
		String sql = "UPDATE user SET active=1 Where `userID` = ? ";
		try {
			 ps = connection.prepareStatement(sql);

			ps.setInt(1, id);

			System.out.println("da xac nhan");

			return ps.executeUpdate() == 1;
		} catch (Exception e) {
			// TODO: handle exception
		}finally {
			   DBPool.releaseConnection(connection, ps);
			  }
		return false;
	}
//kiemr tra email ddung id ko
	public boolean ck(int id, String email) {
		Connection connection = DBPool.getConnection();
		String sql = "SELECT * FROM user WHERE `userID`=" + id + " AND `email`='" + email + "'";
		try {
			ps = connection.prepareStatement(sql);
		 rs = ps.executeQuery();
			while (rs.next()) {
				// ps.setInt(1,id);

				return true;
			}
		} catch (Exception e) {
			// TODO: handle exception

		}finally {
			   DBPool.releaseConnection(connection, ps, rs);
			  }
		
		return false;

	}

	// kiem tra tai khoan
	public User login(String email, String pw) {
		Connection connection = DBPool.getConnection();
		String sql = "SELECT * FROM user WHERE `email`='" + email + "' AND `password`='" + pw + "' AND `active`=1";
		 try {
			ps = connection.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				User u = new User(rs.getInt("userID"), rs.getString("username"), rs.getString("email"),
						rs.getString("password"), rs.getString("address"), rs.getInt("sex"), rs.getString("phone"),
						rs.getInt("active"),rs.getInt("admin"));
				connection.close();
				return u;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 finally {
			   DBPool.releaseConnection(connection, ps, rs);
			  }
		  
		return null;

	}

	// lay pass ma hoa theo email
	public String resetpass(String email) {
		Connection connection = DBPool.getConnection();
		String sql = "SELECT password FROM user WHERE email='" + email + "' AND `active`=1";
		 try {
			ps = connection.prepareStatement(sql);
			 rs = ps.executeQuery();
				while (rs.next()) {
					String pass = rs.getString("password");

					return pass;
				}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 finally {
			   DBPool.releaseConnection(connection, ps, rs);
			  }
		  
		return null;

	}
	
	public boolean checkuseradmin(User u)  {
		Connection connection = DBPool.getConnection();
		String sql = "SELECT * FROM user WHERE userID=? AND password=? AND active=1 AND admin>0";
		 try {
			ps = connection.prepareStatement(sql);
			
			ps.setString(2, u.getPassword());
			
			
			ps.setInt(1, u.getUserID());
			
			 rs = ps.executeQuery();
				while (rs.next()) {

					return true;
				}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 finally {
			   DBPool.releaseConnection(connection, ps, rs);
			  }
		    
		return false;

	}
	
	
//kt cho phep doi pass
	public boolean login1(String userID, String pw)  {
		Connection connection = DBPool.getConnection();
		String sql = "SELECT * FROM user WHERE userID='" + userID + "' AND `password`='" + pw + "' AND `active`=1";
		 try {
			ps = connection.prepareStatement(sql);
			 rs = ps.executeQuery();
				while (rs.next()) {

					return true;
				}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 finally {
			   DBPool.releaseConnection(connection, ps, rs);
			  }
		    
		return false;

	}
	public boolean updateadmin(MyModel model) {
		Connection connection = DBPool.getConnection();
		String sql = "UPDATE user SET username=?,email=? ,address=?, sex=?  ,phone=?,active=?,admin=? Where userID = ? ";
		try {
			 ps = connection.prepareStatement(sql);
			User u = (User) model;
			ps.setString(1, u.getUsername());
			ps.setString(2, u.getEmail());
			ps.setString(3, u.getAddress());
			ps.setInt(4, u.getSex());
			ps.setString(5, u.getPhone());
			ps.setInt(6, u.getActive());
			ps.setInt(7, u.getAdmin());
			ps.setInt(8, u.getUserID());
			System.out.println("da up admin");
			System.out.println(u.toString());
			return ps.executeUpdate() == 1;
		} catch (Exception e) {
			// TODO: handle exception
		}finally {
			   DBPool.releaseConnection(connection, ps);
			  }
		return false;
	}

	public static void main(String[] args) throws SQLException {
	UserDAO u = new UserDAO();
//		User user = u.login("anhiuem.iuem@gmail.com", "2246fe63d80f2ce93d4f73771da7cdf8");
//		System.out.println(user.toString());
		// u.update(new User(4, "nhatnhatminh", "anhiuem@gmail.com", "password",
		// "address", 0,"0987654", 0));
		// System.out.println(u.ck(65496,"anhiuem.iuem@gmail.com"));
		// System.out.println(u.resetpass("anhiuem.iuem@gmail.com"));
//System.out.println(u.active(25263));
		// System.out.println(u.checkEmail("anhiuem.iuem@gmail.com11"));
	// System.out.println(u.ck(25263, "anhiuem96it@gmail.com"));
//	 System.out.println(u.update(new User(25263, "nhất",  "anhiuem96it@gmail.com", "vainoi", "vai chou", 1, "0345678", 1,0)));
	User uu= new User();
	uu.setUserID(77988);
	uu.setPassword("4297f44b13955235245b2497399d7a93");
	System.out.println(u.checkuseradmin(uu));
	}

}
