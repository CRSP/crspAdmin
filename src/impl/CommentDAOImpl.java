package impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import util.DBconn;

import dao.CommentDAO;
import entity.Comment;
import entity.Record;
import entity.Resource;
import entity.User;

public class CommentDAOImpl implements CommentDAO {

	@Override
	public List<Comment> queryComment(String comResName, int currentPage,
			int size) {
		// TODO Auto-generated method stub
		List<Comment> comments=new ArrayList<Comment>();
		Connection con=null;
		PreparedStatement pre=null;
		ResultSet rs=null;
		DBconn conn=new DBconn();
		con=conn.getConnection();
		int startRecord=size*(currentPage-1);
		String sql="SELECT * FROM (comment LEFT JOIN resource on comment.resource_id=resource.id) " +
						"LEFT JOIN user on comment.user_id=user.id WHERE resource.name LIKE ? LIMIT ?,?";
		try {
			pre=con.prepareStatement(sql);
			pre.setString(1, "%" + comResName + "%");
			pre.setInt(2, startRecord);
			pre.setInt(3, size);
			rs=pre.executeQuery();
			while(rs.next()){
				Comment comment=new Comment();
				comment.setId(rs.getInt("comment.id"));
				Resource res=new Resource();
				res.setId(rs.getInt("resource.id"));
				res.setName(rs.getString("name"));
				comment.setResource(res);
				User user=new User();
				user.setId(rs.getInt("user.id"));
				user.setUser_name(rs.getString("user_name"));
				comment.setUser(user);
				comment.setDate(rs.getString("comment.date"));
				comment.setContent(rs.getString("content"));
				comments.add(comment);
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
		return comments;
	}

	@Override
	public int cluPage(String comResName, int size) {
		// TODO Auto-generated method stub
		int countPage=0;//存储总页数
		Connection con=null;
		PreparedStatement pre=null;
		ResultSet rs=null;
		DBconn conn=new DBconn();
		con=conn.getConnection();
		try {
			pre=con.prepareStatement("SELECT COUNT(*) total FROM (comment LEFT JOIN resource on comment.resource_id=resource.id) " +
						"LEFT JOIN user on comment.user_id=user.id WHERE resource.name LIKE ?");
			pre.setString(1, "%" + comResName + "%");
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
