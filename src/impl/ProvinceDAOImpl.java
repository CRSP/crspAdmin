package impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import util.DBconn;

import dao.ProvinceDAO;
import entity.Department;
import entity.Province;
import entity.School;
import entity.User;

public class ProvinceDAOImpl implements ProvinceDAO {

	@Override
	public List<Province> queryProvince(String name) {
		// TODO Auto-generated method stub
		List<Province> provinces=new ArrayList<Province>();
		Connection con=null;
		PreparedStatement pre=null;
		ResultSet rs=null;
		DBconn conn=new DBconn();
		con=conn.getConnection();
		String sql="SELECT * FROM province WHERE name LIKE ?";
		try {
			pre=con.prepareStatement(sql);
			pre.setString(1, "%" + name + "%");
			rs=pre.executeQuery();
			while(rs.next()){
				Province province=new Province();
				province.setId(rs.getInt("id"));
				province.setType(rs.getString("type"));
				province.setName(rs.getString("name"));
				provinces.add(province);
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
		return provinces;
	}

}
