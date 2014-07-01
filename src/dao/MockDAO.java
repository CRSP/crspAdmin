package dao;

import java.util.List;

import entity.Mock;

public interface MockDAO {

	public List<Mock> queryMock(String mockResName,int currentPage,int size);
	
	public int cluPage(String mockResName,int size);
	
	public void freezeRes(int res_id,int mock_status,int res_status);
	
	public void repealMock(int id,int mock_status);
}
