package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import connect.DBPool;
import models.Maker;
import models.MyModel;

public class MakerDAO implements IDAO {
	PreparedStatement ps;
	ResultSet rs;

	@Override
	public boolean insert(MyModel model) {
		Connection connection = DBPool.getConnection();
		String sql = "INSERT INTO maker VALUE(?,?,?,?,?)";
		try {
			ps = connection.prepareStatement(sql);
			Maker c = (Maker) model;
			ps.setInt(1,c.getMakerID());
			ps.setString(2, c.getName());
			ps.setInt(3, c.getPhone());
			ps.setString(4, c.getEmail());
			ps.setString(5, c.getAddress());
			System.out.println("da chen");
			return ps.executeUpdate() == 1;

		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			DBPool.releaseConnection(connection, ps);
		}
		return false;
	}

	@Override
	public boolean update(MyModel model) {
		Connection connection = DBPool.getConnection();
		String sql = "UPDATE maker SET makerName =? ,phone=?,email=? ,address=? Where makerID=? ";
		try {
			ps = connection.prepareStatement(sql);
			Maker c = (Maker) model;

		ps.setInt(5,c.getMakerID());
			ps.setString(1, c.getName());
			ps.setInt(2, c.getPhone());
			ps.setString(3, c.getEmail());
			ps.setString(4, c.getAddress());
			System.out.println("da up");
			System.out.println(c.toString());
			return ps.executeUpdate() == 1;
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			DBPool.releaseConnection(connection, ps);
		}
		return false;
	}

	@Override
	public boolean delete(int id) {
		Connection connection = DBPool.getConnection();
		String sql = "DELETE from maker WHERE makerID=?";
		try {
			ps = connection.prepareStatement(sql);
			ps.setInt(1, id);
			System.out.println("da xoa");
			return ps.executeUpdate() == 1;
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			DBPool.releaseConnection(connection, ps);
		}

		return false;
	}

	public static void main(String[] args) throws SQLException {
	MakerDAO makerDAO = new MakerDAO();
//		 for (int i = 0; i < 15; i++) {
//			 makerDAO.insert(new Maker(i, "ten"+i, 12312312+i, "mail"+i,"ad"+i));
//		
//		 }
		// dao.update(new Category(3, "truyen tranh", "doc chu chi", 0));
		// dao.delete(5);
		ArrayList<MyModel> l = new MakerDAO().getListModel();
		System.out.println(makerDAO.getModel(3).toString());
		//
		// System.out.println(dao.getModel(541));
	}

	@Override
	public ArrayList<MyModel> getListModel() {
		// TODO Auto-generated method stub

		Connection connection = DBPool.getConnection();
		String sql = "SELECT * FROM maker";
		ArrayList<MyModel> list = new ArrayList<>();
		try {
			ps = connection.prepareCall(sql);
			rs = ps.executeQuery();

			while (rs.next()) {
				list.add(new Maker(rs.getInt("makerID"), rs.getString("makerName"), rs.getInt("phone"),
						rs.getString("email"), rs.getString("address")));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBPool.releaseConnection(connection, ps, rs);
		}

		return list;
	}

	@Override
	public MyModel getModel(int id) {

		Connection connection = DBPool.getConnection();
		String sql = "SELECT * FROM maker WHERE makerID=?";
		try {
			ps = connection.prepareCall(sql);
			ps.setInt(1, id);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				MyModel c = new Maker(rs.getInt("makerID"), rs.getString("makerName"), rs.getInt("phone"),
						rs.getString("email"), rs.getString("address"));
				System.out.println(rs.getInt("makerID"));
				System.out.println(rs.getString("makerName"));
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
