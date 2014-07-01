package dao;

import java.util.List;

import entity.Comment;

public interface CommentDAO {

	public List<Comment> queryComment(String comResName,int currentPage,int size);
	
	public int cluPage(String comResName,int size);
}
