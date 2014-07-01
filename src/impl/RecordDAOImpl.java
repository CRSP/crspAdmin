package impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import util.DBconn;

import dao.RecordDAO;
import entity.Department;
import entity.Record;
import entity.Resource;
import entity.User;

public class RecordDAOImpl implements RecordDAO {

	@Override
	public List<Record> queryRecord(String res_name,int currentPage,int size) {
		// TODO Auto-generated method stub
		List<Record> records=new ArrayList<Record>();
		Connection con=null;
		PreparedStatement pre=null;
		ResultSet rs=null;
		DBconn conn=new DBconn();
		con=conn.getConnection();
		int startRecord=size*(currentPage-1);
		String sql="SELECT * FROM ((record LEFT JOIN resource on record.resource_id=resource.id) " +
						"LEFT JOIN user user1 on record.upload_user_id=user1.id)" +
						"LEFT JOIN user user2 on record.download_user_id=user2.id WHERE name LIKE ? LIMIT ?,?";
		try {
			pre=con.prepareStatement(sql);
			pre.setString(1, "%" + res_name + "%");
			pre.setInt(2, startRecord);
			pre.setInt(3, size);
			rs=pre.executeQuery();
			while(rs.next()){
				Record record=new Record();
				record.setId(rs.getInt("id"));
				Resource res=new Resource();
				res.setId(rs.getInt("id"));
				res.setName(rs.getString("name"));
				record.setResource(res);
				User uploadUser=new User();
				uploadUser.setId(rs.getInt("id"));
				uploadUser.setUser_name(rs.getString("user_name"));
				record.setUploadUser(uploadUser);
				User downloadUser=new User();
				downloadUser.setId(rs.getInt("id"));
				downloadUser.setUser_name(rs.getString("user_name"));
				record.setDownloadUser(downloadUser);
				record.setDelta(rs.getInt("delta"));
				record.setTime(rs.getString("time"));
				records.add(record);
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
		return records;
	}

	@Override
	public int cluPage(String res_name, int size) {
		// TODO Auto-generated method stub
		int countPage=0;//存储总页数
		Connection con=null;
		PreparedStatement pre=null;
		ResultSet rs=null;
		DBconn conn=new DBconn();
		con=conn.getConnection();
		try {
			pre=con.prepareStatement("SELECT COUNT(*) total FROM ((record LEFT JOIN resource on record.resource_id=resource.id) " +
						"LEFT JOIN user user1 on record.upload_user_id=user1.id)" +
						"LEFT JOIN user user2 on record.download_user_id=user2.id WHERE name LIKE ?");
			pre.setString(1, "%" + res_name + "%");
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
