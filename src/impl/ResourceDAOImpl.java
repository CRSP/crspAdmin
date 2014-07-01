package impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import util.DBconn;

import dao.ResourceDAO;
import entity.Department;
import entity.Feature;
import entity.ResType;
import entity.Resource;
import entity.School;
import entity.User;

public class ResourceDAOImpl implements ResourceDAO {

	@Override
	public List<Resource> queryRes(String resourceName,int currentPage,int size) {
		// TODO Auto-generated method stub
		List<Resource> resources=new ArrayList<Resource>();
		Connection con=null;
		PreparedStatement pre=null;
		ResultSet rs=null;
		DBconn conn=new DBconn();
		con=conn.getConnection();
		int startRes=size*(currentPage-1);
		String sql="SELECT * FROM (((resource LEFT JOIN resource_type on resource.type_id=resource_type.id) " +
						"LEFT JOIN user on resource.user_id=user.id)" +
						"LEFT JOIN school on resource.school_id=school.id)" +
						"LEFT JOIN department on resource.department_id=department.id " +
						"WHERE resource.status not in (0,2) AND resource.name LIKE ? LIMIT ?,?";
		try {
			pre=con.prepareStatement(sql);
			pre.setString(1, "%" + resourceName + "%");
			pre.setInt(2, startRes);
			pre.setInt(3, size);
			rs=pre.executeQuery();
			while(rs.next()){
				Resource resource=new Resource();
				resource.setId(rs.getInt("id"));
				ResType resType=new ResType();
				resType.setName(rs.getString("resource_type.name"));
				resource.setResType(resType);
				User user=new User();
				user.setUser_name(rs.getString("user_name"));
				resource.setUserName(user);
				School school=new School();
				school.setName(rs.getString("school.name"));
				resource.setSchool(school);
				Department department=new Department();
				department.setName(rs.getString("department.name"));
				resource.setDepartment(department);
				resource.setName(rs.getString("resource.name"));
				resource.setTime(rs.getString("time"));
				resource.setPrice(rs.getInt("price"));
				resource.setDownload_count(rs.getInt("download_count"));
				resource.setStatus(rs.getInt("status"));
				resources.add(resource);
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
		return resources;
	}

	@Override
	public int cluPage(String resourceName, int size) {
		// TODO Auto-generated method stub
		int countPage=0;//存储总页数
		Connection con=null;
		PreparedStatement pre=null;
		ResultSet rs=null;
		DBconn conn=new DBconn();
		con=conn.getConnection();
		try {
			pre=con.prepareStatement("SELECT COUNT(*) total FROM " +
						"(((resource LEFT JOIN resource_type on resource.type_id=resource_type.id) " +
						"LEFT JOIN user on resource.user_id=user.id)" +
						"LEFT JOIN school on resource.school_id=school.id)" +
						"LEFT JOIN department on resource.department_id=department.id " +
						"WHERE resource.status not in (0,2) AND resource.name LIKE ?");
			pre.setString(1, "%" + resourceName + "%");
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
	public List<Resource> checkRes(String checkResName, int currentPage,
			int size) {
		// TODO Auto-generated method stub
		List<Resource> resources=new ArrayList<Resource>();
		Connection con=null;
		PreparedStatement pre=null;
		ResultSet rs=null;
		DBconn conn=new DBconn();
		con=conn.getConnection();
		int startRes=size*(currentPage-1);
		String sql="SELECT * FROM ((((resource LEFT JOIN resource_type on resource.type_id=resource_type.id) " +
						"LEFT JOIN user on resource.user_id=user.id)" +
						"LEFT JOIN school on resource.school_id=school.id)" +
						"LEFT JOIN department on resource.department_id=department.id)" +
						"LEFT JOIN feature on resource.feature_id=feature.id " +
						"WHERE resource.status=0 AND resource.name LIKE ? LIMIT ?,?";
		try {
			pre=con.prepareStatement(sql);
			pre.setString(1, "%" + checkResName + "%");
			pre.setInt(2, startRes);
			pre.setInt(3, size);
			rs=pre.executeQuery();
			while(rs.next()){
				Resource resource=new Resource();
				resource.setId(rs.getInt("id"));
				ResType resType=new ResType();
				resType.setName(rs.getString("resource_type.name"));
				resource.setResType(resType);
				User user=new User();
				user.setUser_name(rs.getString("user_name"));
				resource.setUserName(user);
				School school=new School();
				school.setName(rs.getString("school.name"));
				resource.setSchool(school);
				Department department=new Department();
				department.setName(rs.getString("department.name"));
				resource.setDepartment(department);
				resource.setName(rs.getString("resource.name"));
				resource.setTime(rs.getString("time"));
				resource.setPrice(rs.getInt("price"));
				resource.setDownload_count(rs.getInt("download_count"));
				Feature feature=new Feature();
				feature.setPath(rs.getString("path"));
				feature.setCode(rs.getString("code"));
				feature.setAmount(rs.getInt("amount"));
				feature.setSize(rs.getInt("size"));
				resource.setFeature(feature);
				resources.add(resource);
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
		return resources;
	}

	@Override
	public int cluPage1(String checkResName, int size) {
		// TODO Auto-generated method stub
		int countPage=0;//存储总页数
		Connection con=null;
		PreparedStatement pre=null;
		ResultSet rs=null;
		DBconn conn=new DBconn();
		con=conn.getConnection();
		try {
			pre=con.prepareStatement("SELECT COUNT(*) total FROM " +
						"(((resource LEFT JOIN resource_type on resource.type_id=resource_type.id) " +
						"LEFT JOIN user on resource.user_id=user.id)" +
						"LEFT JOIN school on resource.school_id=school.id)" +
						"LEFT JOIN department on resource.department_id=department.id " +
						"WHERE resource.status=0 AND resource.name LIKE ?");
			pre.setString(1, "%" + checkResName + "%");
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
	public void updateResStatus(int id, int status) {
		// TODO Auto-generated method stub
		Connection con=null;
		PreparedStatement pre=null;
		DBconn conn=new DBconn();
		con=conn.getConnection();
		String sql="UPDATE resource SET status=? WHERE id=?";
		try {
			pre=con.prepareStatement(sql);
			pre.setInt(1, status);
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

}
