package impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import util.DBconn;

import dao.SchoolDAO;
import entity.Department;
import entity.Province;
import entity.School;

public class SchoolDAOImpl implements SchoolDAO {

	@Override
	public void saveSchool(School school) {
		// TODO Auto-generated method stub

		Connection con=null;
		PreparedStatement pre=null;
		DBconn conn=new DBconn();
		con=conn.getConnection();
		try {
			pre=con.prepareStatement("INSERT INTO school(province_id,name,description,avatar) VALUES(?,?,?,?)");
			pre.setInt(1, school.getProvince().getId());
			pre.setString(2, school.getName());
			pre.setString(3, school.getDescription());
			pre.setString(4, school.getAvatar());
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
	public boolean querySchoolName(String name) {
		// TODO Auto-generated method stub
		Connection con=null;
		PreparedStatement pre=null;
		ResultSet rs=null;
		DBconn conn=new DBconn();
		con=conn.getConnection();
		try {
			pre=con.prepareStatement("SELECT * FROM school WHERE name=?");
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
	public void updateSchool(School school) {
		// TODO Auto-generated method stub
		Connection con=null;
		PreparedStatement pre=null;
		DBconn conn=new DBconn();
		con=conn.getConnection();
		try {
			pre=con.prepareStatement("UPDATE school SET province_id=?,name=?,description=? WHERE id=?");
			pre.setInt(1, school.getProvince().getId());
			pre.setString(2, school.getName());
			pre.setString(3, school.getDescription());
			//pre.setString(4, school.getAvatar());
			pre.setInt(4, school.getId());
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
	public List<School> querySchool(String name,int currentPage,int size) {
		// TODO Auto-generated method stub
		List<School> schools=new ArrayList<School>();
		Connection con=null;
		PreparedStatement pre=null;
		ResultSet rs=null;
		DBconn conn=new DBconn();
		con=conn.getConnection();
		int startRecord=size*(currentPage-1);
		String sql="SELECT * FROM school LEFT JOIN province ON school.province_id=province.id " +
				"WHERE school.name LIKE ? LIMIT ?,?";
		try {
			pre=con.prepareStatement(sql);
			pre.setString(1, "%" + name + "%");
			pre.setInt(2, startRecord);
			pre.setInt(3, size);
			rs=pre.executeQuery();
			while(rs.next()){
				School school=new School();
				school.setId(rs.getInt("school.id"));
				school.setName(rs.getString("school.name"));
				Province province=new Province();
				province.setId(rs.getInt("province.id"));
				province.setType(rs.getString("type"));
				province.setName(rs.getString("province.name"));
				school.setProvince(province);
				school.setDescription(rs.getString("description"));
				school.setAvatar(rs.getString("avatar"));
				school.setResource_count(rs.getInt("resource_count"));
				schools.add(school);
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
		return schools;
	}

	@Override
	public void deleteSchool(int id) {
		// TODO Auto-generated method stub
		Connection con=null;
		PreparedStatement pre=null;
		DBconn conn=new DBconn();
		con=conn.getConnection();
		try {
			pre=con.prepareStatement("DELETE FROM school WHERE id=?");
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
	public int cluPage(String name, int size) {
		// TODO Auto-generated method stub
		int countPage=0;//存储总页数
		Connection con=null;
		PreparedStatement pre=null;
		ResultSet rs=null;
		DBconn conn=new DBconn();
		con=conn.getConnection();
		try {
			pre=con.prepareStatement("SELECT COUNT(*) total FROM school LEFT JOIN province ON school.province_id=province.id " +
				"WHERE school.name LIKE ?");
			pre.setString(1, "%" + name + "%");
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

	@Override
	public void updateAvatar(School school) {
		// TODO Auto-generated method stub
		Connection con=null;
		PreparedStatement pre=null;
		DBconn conn=new DBconn();
		con=conn.getConnection();
		try {
			pre=con.prepareStatement("UPDATE school SET avatar=? WHERE id=?");
			pre.setString(1, school.getAvatar());
			pre.setInt(2, school.getId());
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
