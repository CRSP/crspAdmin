package dao;

import java.util.List;

import entity.Department;

public interface DepartmentDAO {

	public void saveDept(Department department);
	
	public boolean queryDeptName(String name);
	
	public void updateDept(Department department);
	
	public List<Department> queryDept(String name);
	
	public void deleteDept(int id);
}
