package impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import util.DBconn;

import dao.UserDAO;
import entity.Admin;
import entity.Department;
import entity.School;
import entity.User;

public class UserDAOImpl implements UserDAO {

	@Override
	public List<User> queryUser(String user_id,int currentPage,int size) {
		// TODO Auto-generated method stub
		List<User> users=new ArrayList<User>();
		Connection con=null;
		PreparedStatement pre=null;
		ResultSet rs=null;
		DBconn conn=new DBconn();
		con=conn.getConnection();
		int startRecord=size*(currentPage-1);
		String sql="SELECT * FROM (user LEFT JOIN school on user.school_id=school.id) " +
				"LEFT JOIN department on user.department_id=department.id WHERE user_id LIKE ? LIMIT ?,?";
		try {
			pre=con.prepareStatement(sql);
			pre.setString(1, "%" + user_id + "%");
			pre.setInt(2, startRecord);
			pre.setInt(3, size);
			rs=pre.executeQuery();
			while(rs.next()){
				User user=new User();
				user.setId(rs.getInt("id"));
				user.setUser_id(rs.getString("user_id"));
				user.setUser_name(rs.getString("user_name"));
				user.setAvatar(rs.getString("avatar"));
				user.setPoints(rs.getInt("points"));
				user.setEmail(rs.getString("email"));
				School school=new School();
				school.setId(rs.getInt("id"));
				school.setName(rs.getString("name"));
				school.setDescription(rs.getString("description"));
				school.setAvatar(rs.getString("avatar"));
				school.setResource_count(rs.getInt("resource_count"));
				user.setSchool(school);
				Department dept=new Department();
				dept.setId(rs.getInt("id"));
				dept.setName(rs.getString("name"));
				dept.setAvatar(rs.getString("avatar"));
				dept.setDescription(rs.getString("description"));
				dept.setResource_count(rs.getInt("resource_count"));
				user.setDepartment(dept);
				users.add(user);
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
		return users;
	}

	

	@Override
	public void updatePoints(int id, int points) {
		// TODO Auto-generated method stub
		Connection con=null;
		PreparedStatement pre=null;
		DBconn conn=new DBconn();
		con=conn.getConnection();
		String sql="UPDATE user SET points=? WHERE id=?";
		try {
			pre=con.prepareStatement(sql);
			pre.setInt(1, points);
			pre.setInt(2, id);
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
	public int cluPage(String user_id,int size) {
		// TODO Auto-generated method stub
		int countPage=0;//存储总页数
		Connection con=null;
		PreparedStatement pre=null;
		ResultSet rs=null;
		DBconn conn=new DBconn();
		con=conn.getConnection();
		try {
			pre=con.prepareStatement("SELECT COUNT(*) total FROM user WHERE user_id LIKE ?");
			pre.setString(1, "%" + user_id + "%");
			rs=pre.executeQuery();
			if(rs.next()){
				int total=Integer.parseInt(rs.getString("total"));
				countPage=(total%size==0)?(total/size):(total/size+1);
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
		return countPage;
	}

}
