package dao;

import java.util.List;

import entity.Department;
import entity.ResType;

public interface ResTypeDAO {

	public boolean queryResType(String name);
	
	public void saveResType(String name);
	
	public List<ResType> queryResTypeName(String name);
	
	public void updateResType(ResType resType);
	
	public void deleteResType(int id);
}
