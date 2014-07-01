package dao;

import java.util.List;

import entity.School;

public interface SchoolDAO {

	public void saveSchool(School school);
	
	public boolean querySchoolName(String name);
	
	public void updateSchool(School school);
	
	public List<School> querySchool(String name,int currentPage,int size);
	
	public void deleteSchool(int id);
	
	public int cluPage(String name,int size);
	
	public void updateAvatar(School school);
}
