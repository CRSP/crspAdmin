package impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import util.DBconn;

import dao.MockDAO;
import entity.Comment;
import entity.Feature;
import entity.Mock;
import entity.Resource;
import entity.User;

public class MockDAOImpl implements MockDAO {

	@Override
	public List<Mock> queryMock(String mockResName, int currentPage, int size) {
		// TODO Auto-generated method stub
		List<Mock> mocks=new ArrayList<Mock>();
		Connection con=null;
		PreparedStatement pre=null;
		ResultSet rs=null;
		DBconn conn=new DBconn();
		con=conn.getConnection();
		int startRecord=size*(currentPage-1);
		String sql="SELECT * FROM (((mock LEFT JOIN user user1 on mock.user_id=user1.id) " +
						"LEFT JOIN resource on mock.resource_id=resource.id)" +
						"LEFT JOIN user user2 on resource.user_id=user2.id)" +
						"LEFT JOIN feature on resource.feature_id=feature.id" +
						" WHERE mock.status=0 AND resource.name LIKE ? LIMIT ?,?";
		try {
			pre=con.prepareStatement(sql);
			pre.setString(1, "%" + mockResName + "%");
			pre.setInt(2, startRecord);
			pre.setInt(3, size);
			rs=pre.executeQuery();
			while(rs.next()){
				Mock mock=new Mock();
				mock.setId(rs.getInt("mock.id"));
				mock.setContent(rs.getString("mock.content"));
				mock.setStatus(rs.getInt("mock.status"));
				User user1=new User();
				user1.setId(rs.getInt("user1.id"));
				user1.setUser_id(rs.getString("user1.user_id"));
				user1.setUser_name(rs.getString("user1.user_name"));
				mock.setUser(user1);
				Resource resource=new Resource();
				resource.setId(rs.getInt("resource.id"));
				resource.setName(rs.getString("name"));
				User user2=new User();
				user2.setId(rs.getInt("user2.id"));
				user2.setUser_name(rs.getString("user2.user_name"));
				resource.setUserId(user2);
				Feature feature=new Feature();
				feature.setId(rs.getInt("feature.id"));
				feature.setPath(rs.getString("feature.path"));
				resource.setFeature(feature);
				mock.setResource(resource);
				mocks.add(mock);
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
		return mocks;
	}

	@Override
	public int cluPage(String mockResName, int size) {
		// TODO Auto-generated method stub
		int countPage=0;//存储总页数
		Connection con=null;
		PreparedStatement pre=null;
		ResultSet rs=null;
		DBconn conn=new DBconn();
		con=conn.getConnection();
		try {
			pre=con.prepareStatement("SELECT COUNT(*) total FROM (((mock LEFT JOIN user user1 on mock.user_id=user1.id) " +
						"LEFT JOIN resource on mock.resource_id=resource.id)" +
						"LEFT JOIN user user2 on resource.user_id=user2.id)" +
						"LEFT JOIN feature on resource.feature_id=feature.id" +
						" WHERE mock.status=0 AND resource.name LIKE ?");
			pre.setString(1, "%" + mockResName + "%");
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
	public void freezeRes(int res_id, int mock_status, int res_status) {
		// TODO Auto-generated method stub
		Connection con=null;
		PreparedStatement pre=null;
		DBconn conn=new DBconn();
		con=conn.getConnection();
		try {
			pre=con.prepareStatement("UPDATE (mock LEFT JOIN resource on mock.resource_id=resource.id)" +
					" SET mock.status=?,resource.status=? WHERE mock.resource_id=?");
			pre.setInt(1, mock_status);
			pre.setInt(2, res_status);
			pre.setInt(3, res_id);
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
	public void repealMock(int id,int mock_status) {
		// TODO Auto-generated method stub
		Connection con=null;
		PreparedStatement pre=null;
		DBconn conn=new DBconn();
		con=conn.getConnection();
		try {
			pre=con.prepareStatement("UPDATE mock SET status=? WHERE id=?");
			pre.setInt(1, mock_status);
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
