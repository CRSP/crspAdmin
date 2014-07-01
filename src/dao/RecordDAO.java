package dao;

import java.util.List;

import entity.Record;
import entity.User;

public interface RecordDAO {

	public List<Record> queryRecord(String res_name,int currentPage,int size);
	
	public int cluPage(String res_name,int size);
}
