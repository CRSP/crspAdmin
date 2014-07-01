package impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import util.DBconn;
import dao.DepartmentDAO;
import entity.Department;
import entity.School;
import entity.User;

public class DepartmentDAOImpl implements DepartmentDAO {

	@Override
	public void saveDept(Department department) {
		// TODO Auto-generated method stub

		Connection con=null;
		PreparedStatement pre=null;
		DBconn conn=new DBconn();
		con=conn.getConnection();
		try {
			pre=con.prepareStatement("INSERT INTO department(id,name,description,avatar) VALUES(?,?,?,?)");
			pre.setInt(1, department.getId());
			pre.setString(2, department.getName());
			pre.setString(3, department.getDescription());
			pre.setString(4, department.getAvatar());
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
	public boolean queryDeptName(String name) {
		// TODO Auto-generated method stub
		Connection con=null;
		PreparedStatement pre=null;
		ResultSet rs=null;
		DBconn conn=new DBconn();
		con=conn.getConnection();
		try {
			pre=con.prepareStatement("SELECT * FROM department WHERE name=?");
			pre.setString(1, name);
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
	public void updateDept(Department department) {
		// TODO Auto-generated method stub
		Connection con=null;
		PreparedStatement pre=null;
		DBconn conn=new DBconn();
		con=conn.getConnection();
		try {
			pre=con.prepareStatement("UPDATE department SET name=?,description=?,avatar=? WHERE id=?");
			pre.setString(1, department.getName());
			pre.setString(2, department.getDescription());
			pre.setString(3, department.getAvatar());
			pre.setInt(4, department.getId());
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
	public List<Department> queryDept(String name) {
		// TODO Auto-generated method stub
		List<Department> departments=new ArrayList<Department>();
		Connection con=null;
		PreparedStatement pre=null;
		ResultSet rs=null;
		DBconn conn=new DBconn();
		con=conn.getConnection();
		String sql="SELECT * FROM department WHERE name LIKE ?";
		try {
			pre=con.prepareStatement(sql);
			pre.setString(1, "%" + name + "%");
			rs=pre.executeQuery();
			while(rs.next()){
				Department dept=new Department();
				dept.setId(rs.getInt("id"));
				dept.setName(rs.getString("name"));
				dept.setAvatar(rs.getString("avatar"));
				dept.setDescription(rs.getString("description"));
				dept.setResource_count(rs.getInt("resource_count"));
				departments.add(dept);
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
		return departments;
	}

	@Override
	public void deleteDept(int id) {
		// TODO Auto-generated method stub
		Connection con=null;
		PreparedStatement pre=null;
		DBconn conn=new DBconn();
		con=conn.getConnection();
		try {
			pre=con.prepareStatement("DELETE FROM department WHERE id=?");
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

}
