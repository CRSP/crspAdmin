package dao;

import java.util.List;

import entity.SchDept;

public interface SchDeptDAO {

	public boolean querySchDept(int schoolId,int deptId);
	
	public void saveSchDept(SchDept schDept);
	
	public List<SchDept> querySchDeptName(String schoolName,int currentPage,int size);
	
	public void updateSchDept(int id,int schoolId,int departmentId);
	
	public void deleteSchDept(int id);
	
	public int cluPage(String schoolName,int size);
}
