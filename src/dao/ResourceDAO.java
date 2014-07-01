package dao;

import java.util.List;

import entity.Resource;

public interface ResourceDAO {

	public List<Resource> queryRes(String resourceName,int currentPage,int size);
	
	public int cluPage(String resourceName,int size);
	
	public List<Resource> checkRes(String checkResName,int currentPage,int size);
	
	public int cluPage1(String checkResName,int size);
	
	public void updateResStatus(int id,int status);
}
