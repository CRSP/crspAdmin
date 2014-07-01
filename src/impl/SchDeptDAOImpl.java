package impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import util.DBconn;
import dao.SchDeptDAO;
import entity.Department;
import entity.Province;
import entity.SchDept;
import entity.School;

public class SchDeptDAOImpl implements SchDeptDAO {

	@Override
	public boolean querySchDept(int schoolId, int deptId) {
		// TODO Auto-generated method stub
		Connection con=null;
		PreparedStatement pre=null;
		ResultSet rs=null;
		DBconn conn=new DBconn();
		con=conn.getConnection();
		try {
			pre=con.prepareStatement("SELECT * FROM school_department WHERE school_id=? AND department_id=?");
			pre.setInt(1, schoolId);
			pre.setInt(2, deptId);
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
	public void saveSchDept(SchDept schDept) {
		// TODO Auto-generated method stub
		Connection con=null;
		PreparedStatement pre=null;
		DBconn conn=new DBconn();
		con=conn.getConnection();
		try {
			pre=con.prepareStatement("INSERT INTO school_department(school_id,department_id) VALUES(?,?)");
			pre.setInt(1, schDept.getSchool().getId());
			pre.setInt(2, schDept.getDepartment().getId());
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
	public List<SchDept> querySchDeptName(String schoolName,int currentPage,int size) {
		// TODO Auto-generated method stub
		List<SchDept> schDepts=new ArrayList<SchDept>();
		Connection con=null;
		PreparedStatement pre=null;
		ResultSet rs=null;
		DBconn conn=new DBconn();
		con=conn.getConnection();
		int startRecord=size*(currentPage-1);
		String sql="SELECT * FROM (school_department LEFT JOIN school ON school_department.school_id=school.id) " +
				"LEFT JOIN department ON school_department.department_id=department.id WHERE school.name LIKE ? LIMIT ?,?";
		try {
			pre=con.prepareStatement(sql);
			pre.setString(1, "%" + schoolName + "%");
			pre.setInt(2, startRecord);
			pre.setInt(3, size);
			rs=pre.executeQuery();
			while(rs.next()){
				SchDept schDept=new SchDept();
				schDept.setId(rs.getInt("school_department.id"));
				School school=new School();
				school.setId(rs.getInt("school.id"));
				school.setName(rs.getString("school.name"));
				Department department=new Department();
				department.setId(rs.getInt("department.id"));
				department.setName(rs.getString("department.name"));
				schDept.setSchool(school);
				schDept.setDepartment(department);
				schDepts.add(schDept);
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
		return schDepts;
	}

	@Override
	public void updateSchDept(int id, int schoolId, int departmentId) {
		// TODO Auto-generated method stub
		Connection con=null;
		PreparedStatement pre=null;
		DBconn conn=new DBconn();
		con=conn.getConnection();
		try {
			pre=con.prepareStatement("UPDATE school_department SET school_id=?,department_id=? WHERE id=?");
			pre.setInt(1, schoolId);
			pre.setInt(2, departmentId);
			pre.setInt(3, id);
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
	public void deleteSchDept(int id) {
		// TODO Auto-generated method stub
		Connection con=null;
		PreparedStatement pre=null;
		DBconn conn=new DBconn();
		con=conn.getConnection();
		try {
			pre=con.prepareStatement("DELETE FROM school_department WHERE id=?");
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
	public int cluPage(String schoolName, int size) {
		// TODO Auto-generated method stub
		int countPage=0;//存储总页数
		Connection con=null;
		PreparedStatement pre=null;
		ResultSet rs=null;
		DBconn conn=new DBconn();
		con=conn.getConnection();
		try {
			pre=con.prepareStatement("SELECT COUNT(*) total FROM (school_department LEFT JOIN school ON " +
					"school_department.school_id=school.id) LEFT JOIN department ON " +
					"school_department.department_id=department.id WHERE school.name LIKE ?");
			pre.setString(1, "%" + schoolName + "%");
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
