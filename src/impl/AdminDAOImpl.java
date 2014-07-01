package impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import util.DBconn;

import dao.AdminDAO;

import entity.Admin;

public class AdminDAOImpl implements AdminDAO {

	@Override
	public void save(Admin admin) {
		// TODO Auto-generated method stub
		Connection con=null;
		PreparedStatement pre=null;
		DBconn conn=new DBconn();
		con=conn.getConnection();
		try {
			pre=con.prepareStatement("INSERT INTO admin (user_name,user_pwd) VALUES(?,?)");
			pre.setString(1, admin.getUser_name());
			pre.setString(2, admin.getUser_pwd());
			pre.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			try {
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	@Override
	public boolean changePwd(String user_name,String user_pwd1,String user_pwd2) {
		// TODO Auto-generated method stub
		if(user_pwd1==""||!(user_pwd1.equals(user_pwd2))){
			return false;
		}else{
			Connection con=null;
			PreparedStatement pre=null;
			DBconn conn=new DBconn();
			con=conn.getConnection();
			try {
				pre=con.prepareStatement("UPDATE admin SET user_pwd=? WHERE user_name=?");
				pre.setString(1, user_pwd1);
				pre.setString(2, user_name);
				pre.executeUpdate();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally{
				try {
					con.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			return true;
		}
		
	}

	@Override
	public void delete(int id) {
		// TODO Auto-generated method stub
		Connection con=null;
		PreparedStatement pre=null;
		DBconn conn=new DBconn();
		con=conn.getConnection();
		try {
			pre=con.prepareStatement("DELETE FROM admin WHERE id=?");
			pre.setInt(1, id);
			pre.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			try {
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	@Override
	public Admin findById(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Admin> findByName(String user_name) {
		// TODO Auto-generated method stub
		List<Admin> admins=new ArrayList<Admin>();
		Connection con=null;
		PreparedStatement pre=null;
		ResultSet rs=null;
		DBconn conn=new DBconn();
		con=conn.getConnection();
		try {
			pre=con.prepareStatement("SELECT * FROM admin WHERE user_name LIKE ?");
			pre.setString(1, "%" + user_name + "%");
			rs=pre.executeQuery();
			while(rs.next()){
				Admin admin=new Admin();
				admin.setId(rs.getInt("id"));
				admin.setUser_name(rs.getString("user_name"));
				admin.setUser_pwd(rs.getString("user_pwd"));
				admins.add(admin);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			try {
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return admins;
	}

	@Override
	public int queryCount(String hql) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Admin loginCheck(Admin admin) {
		// TODO Auto-generated method stub
		Admin temp=null;
		Connection con=null;
		PreparedStatement pre=null;
		ResultSet rs=null;
		DBconn conn=new DBconn();
		con=conn.getConnection();
		try {
			pre=con.prepareStatement("SELECT * FROM admin WHERE user_name=? AND user_pwd=?");
			pre.setString(1, admin.getUser_name());
			pre.setString(2, admin.getUser_pwd());
			rs=pre.executeQuery();
			if(rs.next()){
				temp=new Admin();
				temp.setId(rs.getInt("id"));
				temp.setUser_name(rs.getString("user_name"));
				temp.setUser_pwd(rs.getString("user_pwd"));
				temp.setType(rs.getInt("type"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			try {
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return temp;
	}

	@Override
	public boolean queryUserName(String user_name) {
		// TODO Auto-generated method stub
		Connection con=null;
		PreparedStatement pre=null;
		ResultSet rs=null;
		DBconn conn=new DBconn();
		con=conn.getConnection();
		try {
			pre=con.prepareStatement("SELECT * FROM admin WHERE user_name=?");
			pre.setString(1, user_name);
			rs=pre.executeQuery();
			if(rs.next()){
				return true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			try {
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return false;
	}

	@Override
	public boolean queryUserName(String user_name, String user_pwd,
			String user_pwd2) {
		// TODO Auto-generated method stub
		if(user_name==""||user_pwd==""||!(user_pwd.equals(user_pwd2))){
			return false;
		}else{
			Connection con=null;
			PreparedStatement pre=null;
			ResultSet rs=null;
			DBconn conn=new DBconn();
			con=conn.getConnection();
			try {
				pre=con.prepareStatement("SELECT * FROM admin WHERE user_name=?");
				pre.setString(1, user_name);
				rs=pre.executeQuery();
				if(rs.next()){
					return false;
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally{
				try {
					con.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			return true;
		}
		
	}

}
