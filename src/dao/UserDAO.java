package dao;

import java.util.List;

import entity.User;

public interface UserDAO {

	public List<User> queryUser(String user_id,int currentPage,int size);
	
	public void updatePoints(int id,int points);
	
	public int cluPage(String user_id,int size);
}
